`timescale 1ns/1ps

module tb1;
    reg [31:0] in1;
    reg clk;
    reg load;
    wire [31:0] out1;

    main _q1 (
        .in1 (in1),
        .load(load),
        .clk (clk),
        .out1(out1)
    );

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    reg [31:0] reference_res;
    integer all_tests, success_count;

    initial begin
        load = 0;
        in1 = 0;
        all_tests = 0;
        success_count = 0;

        repeat (200) begin
            @(negedge clk);
            load = 1;
            in1 = $urandom();

            @(negedge clk);
            load = 0;

            repeat (4) @(posedge clk);
            #1;

            reference_res = -((in1 << 1) ^ in1);

            if (reference_res !== out1)
                $display("failed => in1: %b out1: %b expected: %b",
                         in1, out1, reference_res);
            else
                success_count = success_count + 1;

            all_tests = all_tests + 1;
        end

        if (all_tests == success_count)
            $display("ACCEPTED");
        else
            $display("FAILED");

        $display("%0d / %0d", success_count, all_tests);
        $finish;
    end
endmodule

