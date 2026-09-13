`timescale 1 ns / 1 ps

module tb2;
    reg clk;
    reg rst_n;
    reg start;
    wire done;

    parameter N = 32;

    reg  [N-1:0] a;
    reg  [N-1:0] b;
    reg  [2*N-1:0] exp;
    wire [N-1:0] res_hi;
    wire [N-1:0] res_lo;

    main _main (
        .clk    (clk),
        .rst_n  (rst_n),
        .start  (start),
        .done   (done),
        .a      (a),
        .b      (b),
        .res_hi (res_hi),
        .res_lo(res_lo)
    );

    // Clock: period = 2 ns
    always #1 clk = ~clk;

    integer all_tests, success_count;
    integer timeout_count;

    initial begin
        clk = 0;
        rst_n = 0;
        start = 0;
        a = 0;
        b = 0;

        // Release reset after 4 clocks
        repeat (4) @(posedge clk);
        rst_n = 1;

        all_tests = 0;
        success_count = 0;

        repeat (200) begin
            a = $urandom();
            b = $urandom();

            @(posedge clk);
            start = 1;
            @(posedge clk);
            start = 0;

            // Wait for done, but timeout after 20 cycles
            timeout_count = 0;
            while (done !== 1 && timeout_count < 20) begin
                @(posedge clk);
                timeout_count = timeout_count + 1;
            end

            if (timeout_count >= 20) begin
                $display("ERROR: Timeout - done not asserted within 20 cycles");
                $finish;
            end

            // Wait one extra clock for stable outputs
            @(posedge clk);
            exp = a * b;
            if ({res_hi, res_lo} !== exp) begin
                $display("ERROR: %0d * %0d = %0d (expected %0d)",
                         a, b, {res_hi, res_lo}, exp);
            end else begin
                success_count = success_count + 1;
            end
            all_tests = all_tests + 1;
        end

        if (all_tests == success_count)
            $display("ACCEPTED: %0d / %0d tests passed", success_count, all_tests);
        else
            $display("FAILED: %0d / %0d tests passed", success_count, all_tests);
        $finish;
    end
endmodule