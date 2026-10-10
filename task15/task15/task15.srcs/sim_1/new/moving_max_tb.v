`timescale 1ns / 1ps


module moving_max_tb();

 
// ***************************************************************
// parameter/localparam

    parameter N_SAMPLES   = 64;
    parameter WINDOW      = 8;
    parameter ADDR_W      = 6;      // ceil(log2(N_SAMPLES))
    parameter DATA_W      = 32;
    parameter CLK_PERIOD  = 10;     // ns
    parameter MEM_LATENCY = 1;      // BRAM read latency the HLS core expects
    parameter TIMEOUT_CYC = 100000; // per run
    parameter CHECK_SINGLE_READ = 1;// spec: each in_data[n] read exactly once
 
    localparam signed [DATA_W-1:0] INT_MIN = {1'b1, {(DATA_W-1){1'b0}}};
    localparam signed [DATA_W-1:0] INT_MAX = {1'b0, {(DATA_W-1){1'b1}}};
 
// ***************************************************************
// inputs/outputs

    reg                  ap_clk = 1'b0;
    reg                  ap_rst = 1'b1;
    reg                  ap_start = 1'b0;
    wire                 ap_done;
    wire                 ap_idle;
    wire                 ap_ready;
 
    wire [ADDR_W-1:0]    in_data_address0;
    wire                 in_data_ce0;
    reg  [DATA_W-1:0]    in_data_q0;
 
    wire [ADDR_W-1:0]    out_data_address0;
    wire                 out_data_ce0;
    wire                 out_data_we0;
    wire [DATA_W-1:0]    out_data_d0;

// ***************************************************************
// functions&tasks

task compute_ref;
    integer n, k, start;
    reg signed [DATA_W-1:0] m;
    begin
        for (n = 0; n < N_SAMPLES; n = n + 1) 
        begin
            start = (n - WINDOW + 1 < 0) ? 0 : n - WINDOW + 1;
            m = in_mem[start];
            for (k = start + 1; k <= n; k = k + 1)
                if (in_mem[k] > m) m = in_mem[k];
            ref_mem[n] = m;
        end
    end
endtask

integer total_errors = 0;
integer last_latency;

task run_case;
    input [8*24-1:0] name;
    integer n, errs, cyc;
    begin
        for (n = 0; n < N_SAMPLES; n = n + 1) 
        begin
            out_mem[n]  = {DATA_W{1'bx}};
            written[n]  = 1'b0;
            rd_count[n] = 0;
        end
        compute_ref;

        // wait until idle, then start
        while (!ap_idle) @(posedge ap_clk);
        @(negedge ap_clk) ap_start = 1'b1;

        // ap_start must stay high until ap_ready
        cyc = 0;
        @(posedge ap_clk);
        while (!ap_ready && cyc < TIMEOUT_CYC) 
        begin
            @(posedge ap_clk); cyc = cyc + 1;
        end
        @(negedge ap_clk) ap_start = 1'b0;

        // wait for ap_done
        while (!ap_done && cyc < TIMEOUT_CYC) 
        begin
            @(posedge ap_clk); cyc = cyc + 1;
        end
        last_latency = cyc + 1;
        @(posedge ap_clk); // let the last write settle

        errs = 0;
        if (cyc >= TIMEOUT_CYC) 
        begin
            $display("  [%0s] TIMEOUT: ap_done never asserted", name);
            errs = errs + 1;
        end

        for (n = 0; n < N_SAMPLES; n = n + 1) 
        begin
            if (!written[n]) 
            begin
                if (errs < 10) $display("  [%0s] out_data[%0d] never written", name, n);
                errs = errs + 1;
            end else if (out_mem[n] !== ref_mem[n]) 
            begin
                if (errs < 10)
                    $display("  [%0s] mismatch at n=%0d: in=%0d dut=%0d ref=%0d",
                             name, n, in_mem[n], out_mem[n], ref_mem[n]);
                errs = errs + 1;
            end
            if (CHECK_SINGLE_READ && rd_count[n] != 1) 
            begin
                if (errs < 10)
                    $display("  [%0s] in_data[%0d] read %0d times (expected 1)",
                             name, n, rd_count[n]);
                errs = errs + 1;
            end
        end

        $display("%-22s : %s (%0d errors, %0d cycles)",
                 name, errs ? "FAIL" : "PASS", errs, last_latency);
        total_errors = total_errors + errs;
    end
endtask
// ***************************************************************
// clock 100MHz period 10ns
    always #(CLK_PERIOD/2) ap_clk = ~ap_clk;
    
// ***************************************************************
// UUT

    moving_max_0 dut (
        .ap_clk            (ap_clk),
        .ap_rst            (ap_rst),
        .ap_start          (ap_start),
        .ap_done           (ap_done),
        .ap_idle           (ap_idle),
        .ap_ready          (ap_ready),
        .in_data_address0  (in_data_address0),
        .in_data_ce0       (in_data_ce0),
        .in_data_q0        (in_data_q0),
        .out_data_address0 (out_data_address0),
        .out_data_ce0      (out_data_ce0),
        .out_data_we0      (out_data_we0),
        .out_data_d0       (out_data_d0)
    );
 
// ***************************************************************
    reg signed [DATA_W-1:0] in_mem   [0:N_SAMPLES-1];
    reg signed [DATA_W-1:0] out_mem  [0:N_SAMPLES-1];
    reg signed [DATA_W-1:0] ref_mem  [0:N_SAMPLES-1];
    reg                     written  [0:N_SAMPLES-1];
    integer                 rd_count [0:N_SAMPLES-1];
 
    integer bus_errors = 0;
 
    // in_data: read port with MEM_LATENCY cycles of latency
    reg [DATA_W-1:0] rd_pipe [0:7];
    integer p;
    always @(posedge ap_clk) 
    begin
        if (in_data_ce0) 
        begin
            if (in_data_address0 >= N_SAMPLES) begin
                $display("  ERROR: in_data read out of range, addr=%0d", in_data_address0);
                bus_errors = bus_errors + 1;
                rd_pipe[0] <= {DATA_W{1'bx}};
            end else 
            begin
                rd_pipe[0] <= in_mem[in_data_address0];
                rd_count[in_data_address0] = rd_count[in_data_address0] + 1;
            end
        end
        for (p = 1; p < 8; p = p + 1) rd_pipe[p] <= rd_pipe[p-1];
    end
    always @(*) in_data_q0 = rd_pipe[MEM_LATENCY-1];
 
    // out_data: write port
    always @(posedge ap_clk) 
    begin
        if (out_data_ce0 && out_data_we0) 
        begin
            if (out_data_address0 >= N_SAMPLES) 
            begin
                $display("  ERROR: out_data write out of range, addr=%0d", out_data_address0);
                bus_errors = bus_errors + 1;
            end else 
            begin
                out_mem[out_data_address0] <= out_data_d0;
                written[out_data_address0] <= 1'b1;
            end
        end
    end
 
// ***************************************************************
// test logic

    integer n, seed, s;
    reg [8*24-1:0] rname;
 
    initial 
    begin
        $display("moving_max_0 RTL testbench: N_SAMPLES=%0d, WINDOW=%0d\n",
                 N_SAMPLES, WINDOW);
 
        repeat (5) @(posedge ap_clk);
        @(negedge ap_clk) ap_rst = 1'b0;
        repeat (2) @(posedge ap_clk);
 
        for (n = 0; n < N_SAMPLES; n = n + 1) in_mem[n] = n;
        run_case("increasing ramp");
 
        for (n = 0; n < N_SAMPLES; n = n + 1) in_mem[n] = 1000 - n;
        run_case("decreasing ramp");
 
        for (n = 0; n < N_SAMPLES; n = n + 1) in_mem[n] = -1000 - (n * 7) % 50;
        run_case("all negative");
 
        for (n = 0; n < N_SAMPLES; n = n + 1) in_mem[n] = 0;
        in_mem[N_SAMPLES/4] = 12345;
        run_case("single impulse");
 
        for (n = 0; n < N_SAMPLES; n = n + 1) in_mem[n] = -5;
        in_mem[0] = 99;
        run_case("impulse at start");
 
        for (n = 0; n < N_SAMPLES; n = n + 1)
            in_mem[n] = (n % 3 == 0) ? INT_MAX : INT_MIN;
        run_case("INT_MIN/INT_MAX mix");
 
        for (n = 0; n < N_SAMPLES; n = n + 1) in_mem[n] = INT_MIN;
        run_case("all INT_MIN");
 
        for (s = 1; s <= 5; s = s + 1) 
        begin
            seed = s;
            for (n = 0; n < N_SAMPLES; n = n + 1)
                in_mem[n] = $random(seed) % 10001;   // -10000 .. 10000
            rname = {"random seed ", 8'h30 + s[7:0]};
            run_case(rname);
        end
 
        // Back-to-back run without reset: state must be re-initialised
        for (n = 0; n < N_SAMPLES; n = n + 1) in_mem[n] = -7;
        run_case("rerun, no reset");
 
        total_errors = total_errors + bus_errors;
        $display("\n%0s: %0d total errors",
                 total_errors ? "TEST FAILED" : "TEST PASSED", total_errors);
        $finish;
    end
 
    // Optional waveform dump (comment out in Vivado if not needed)
    initial 
    begin
        $dumpfile("moving_max_tb.vcd");
        $dumpvars(0, moving_max_tb);
    end

endmodule
