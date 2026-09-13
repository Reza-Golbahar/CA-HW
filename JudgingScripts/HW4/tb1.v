`timescale 1ns/1ps

module tb1;

    reg clk, rst;
    reg [4:0] Read0, Read1, Write;
    reg [31:0] Data;
    reg WriteReg;
    wire [31:0] RegOut1, RegOut2;

    main _regfile (
        .clk(clk),
        .rst(rst),
        .Read0(Read0),
        .Read1(Read1),
        .Write(Write),
        .Data(Data),
        .WriteReg(WriteReg),
        .RegOut1(RegOut1),
        .RegOut2(RegOut2)
    );

    initial begin
        clk = 0;
        forever #1 clk = ~clk;   // period = 2
    end

    reg [31:0] status [0:31];
    integer i;

    task automatic clear_status;
        begin
            for (i = 0; i < 32; i = i + 1)
                status[i] = 32'b0;
        end
    endtask

    task automatic check_outputs;
        begin
            assert (RegOut1 === status[Read0])
                else $fatal(1, "FAILED: Wrong RegOut1: Read0=%0d expected=%h got=%h",
                            Read0, status[Read0], RegOut1);

            assert (RegOut2 === status[Read1])
                else $fatal(1, "FAILED: Wrong RegOut2: Read1=%0d expected=%h got=%h",
                            Read1, status[Read1], RegOut2);
        end
    endtask

    initial begin
        rst = 0;
        WriteReg = 0;
        Write = 0;
        Data = 0;
        Read0 = 0;
        Read1 = 0;
        clear_status();

        #2;
        assert (RegOut1 === 32'b0)
            else $fatal(1, "FAILED: Register zero must always be zero on RegOut1");
        assert (RegOut2 === 32'b0)
            else $fatal(1, "FAILED: Register zero must always be zero on RegOut2");

        // reset test
        rst = 1;
        WriteReg = 0;
        clear_status();
        #2;

        rst = 0;
        #2;

        // after reset all registers must be zero
        for (i = 0; i < 32; i = i + 1) begin
            Read0 = i[4:0];
            Read1 = 31 - i;
            WriteReg = 0;
            #2;
            check_outputs();
        end

        // writing to register zero must not change it
        WriteReg = 1;
        Write = 5'd0;
        Data = 32'hFFFFFFFF;
        Read0 = 5'd0;
        Read1 = 5'd0;
        #2;

        status[0] = 32'b0;
        check_outputs();

        // deterministic writes
        for (i = 0; i < 32; i = i + 1) begin
            WriteReg = 1;
            Write = i[4:0];
            Data = 32'h10000000 + i;
            Read0 = i[4:0];
            Read1 = 5'd0;

            if (Write != 5'd0)
                status[Write] = Data;
            status[0] = 32'b0;

            #2;
            check_outputs();
        end

        // random test
        for (i = 0; i < 1000; i = i + 1) begin
            Write = $urandom;
            Data = $urandom;
            Read0 = $urandom;
            Read1 = $urandom;
            WriteReg = $urandom;

            if (WriteReg && Write != 5'd0)
                status[Write] = Data;
            status[0] = 32'b0;

            #2;
            check_outputs();
        end

        // reset while write is active
        rst = 1;
        WriteReg = 1;
        Write = 5'd31;
        Data = 32'hDEADBEEF;
        clear_status();
        #2;

        rst = 0;
        WriteReg = 0;
        #2;

        for (i = 0; i < 32; i = i + 1) begin
            Read0 = i[4:0];
            Read1 = 31 - i;
            #2;
            check_outputs();
        end

        // random test again after reset
        for (i = 0; i < 1000; i = i + 1) begin
            Write = $urandom;
            Data = $urandom;
            Read0 = $urandom;
            Read1 = $urandom;
            WriteReg = $urandom;

            if (WriteReg && Write != 5'd0)
                status[Write] = Data;
            status[0] = 32'b0;

            #2;
            check_outputs();
        end

        $display("ACCEPTED");
        $finish(0);
    end

endmodule

