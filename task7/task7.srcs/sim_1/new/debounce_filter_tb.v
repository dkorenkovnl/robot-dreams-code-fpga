`timescale 1ns / 1ps

module debounce_filter_tb();

// ***************************************************************
// inputs
reg  clk;
reg  rst;
reg  btn_pin;
// ***************************************************************
// outputs
wire btn_filtered;

// ***************************************************************
// parameters
// 50 MHz clock: period = 20 ns
localparam integer CLK_PERIOD = 20;

// small value to make simulation fast
localparam integer TEST_DEBOUNCE_CYCLES = 5;

// ***************************************************************
// tasks
task apply_reset;
    begin
        rst     = 1'b1;
        btn_pin = 1'b0;  // Button released

        repeat (2) @(posedge clk);

        rst = 1'b0;
        @(posedge clk);
        #1;
    end
endtask

integer error_count;
task check_output;
    input expected_value;
    input [8*64-1:0] test_name;

    begin
        #1;

        if (btn_filtered === expected_value) begin
            $display(
                "[%0d ns] PASS: %0s, btn_filtered=%b",
                $time,
                test_name,
                btn_filtered
            );
        end
        else begin
            error_count = error_count + 1;

            $display(
                "[%0d ns] FAIL: %0s, expected=%b, actual=%b",
                $time,
                test_name,
                expected_value,
                btn_filtered
            );
        end
    end
endtask
// ***************************************************************
// UUT
debounce_filter #(
    .DEBOUNCE_CYCLES(TEST_DEBOUNCE_CYCLES),
    .COUNTER_WIDTH($clog2(TEST_DEBOUNCE_CYCLES))
) dut (
    .clk          (clk),
    .rst          (rst),
    .btn_pin      (btn_pin),
    .btn_filtered (btn_filtered)
);

// ***************************************************************
// init
initial
begin
	clk = 1'b0;
	rst = 1'b0;
	btn_pin = 4'd0;
end
// ***************************************************************
// clock 50MHz period 20ns
initial begin
    clk = 1'b0;

    forever #(CLK_PERIOD / 2)
        clk = ~clk;
end
// ***************************************************************
// test logic
    initial begin
        $display("Starting debounce-filter testbench");

        apply_reset();

        /*
         * Test 1: output should be 0 after reset.
         */
        check_output(1'b0, "Output inactive after reset");

        /*
         * Test 2: short button press.
         *
         * The press lasts less than DEBOUNCE_CYCLES,
         * so it must not be accepted.
         */
        btn_pin = 1'b1;  // Press button

        repeat (3) @(posedge clk);

        btn_pin = 1'b0;  // Release button

        // Wait for synchronizer and counter recovery
        repeat (7) @(posedge clk);

        check_output(1'b0, "Short press rejected");

        /*
         * Test 3: stable button press.
         *
         * Additional cycles are included for the
         * two-flip-flop synchronizer.
         */
        btn_pin = 1'b1;

        repeat (TEST_DEBOUNCE_CYCLES + 3)
            @(posedge clk);

        check_output(1'b1, "Stable press detected");

        /*
         * Test 4: short release should not immediately
         * deactivate the filtered output.
         */
        btn_pin = 1'b0;

        repeat (2) @(posedge clk);

        btn_pin = 1'b1;

        repeat (3) @(posedge clk);

        check_output(1'b1, "Short release rejected");

        /*
         * Test 5: stable release.
         */
        btn_pin = 1'b0;

        repeat (TEST_DEBOUNCE_CYCLES + 3)
            @(posedge clk);

        check_output(1'b0, "Stable release detected");

        $display("Debounce-filter simulation completed");
        $finish;
    end

    /*
     * Safety timeout in case the testbench hangs.
     */
    initial begin
        #5000;

        $error("Simulation timeout");
        $finish;
    end

endmodule
