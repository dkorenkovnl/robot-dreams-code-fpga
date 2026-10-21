`timescale 1ns / 1ps
`default_nettype none

// Plain Verilog-2001 testbench for the AXI-Lite version of audio_filter_hls_0.
// Add this file as a SIMULATION source in Vivado, select this module as top,
// and include the generated audio_filter_hls_0 IP simulation sources.
// Do not add it as an HLS C/C++ testbench or as a synthesis source.
//
// Assumed HLS implementation: signed 24-bit, 8-tap moving average, AES word
// format, 3-bit channel ID, invalid (V=1) words passed through unchanged.
// Register offsets: control=0x00, bypass=0x20. Verify the exported *_hw.h.
// AXI_ADDR_WIDTH is normally 6 with these registers; adjust to the actual IP.
// The AXI master presents register OFFSETS: the MicroBlaze base address
// 0x00020000 is NOT included when directly driving this IP in simulation.
//
// Test 1: bypass=0, compare every output with independent FIR reference.
// Test 2: bypass=1, compare every output bit-for-bit with its input.
// A hardware reset separates cases. Both cases include input gaps and sink
// backpressure. The scoreboard also checks TID, sample count, and stalled
// output stability. This does not test changing bypass during live traffic.

module tb_audio_filter_hls_0;
    parameter integer AXI_ADDR_WIDTH = 6;
    localparam integer CLK_PERIOD_NS = 10;
    localparam integer NUM_WORDS = 256; // 128 stereo frames per test
    localparam integer AXI_TIMEOUT = 1000;
    localparam integer STREAM_TIMEOUT = 10000;

    reg ap_clk;
    reg ap_rst_n;

    initial begin
        ap_clk = 1'b0;
        forever #(CLK_PERIOD_NS / 2) ap_clk = ~ap_clk;
    end

    reg [AXI_ADDR_WIDTH-1:0] araddr = 0;
    reg arvalid = 0;
    wire arready;
    wire [31:0] rdata;
    wire [1:0] rresp;
    wire rvalid;
    reg rready = 0;

    reg [AXI_ADDR_WIDTH-1:0] awaddr = 0;
    reg awvalid = 0;
    wire awready;
    reg [31:0] wdata = 0;
    reg [3:0] wstrb = 0;
    reg wvalid = 0;
    wire wready;
    wire [1:0] bresp;
    wire bvalid;
    reg bready = 0;
    wire interrupt;

    reg [31:0] s_data = 0;
    reg [2:0] s_id = 0;
    reg s_valid = 0;
    wire s_ready;
    wire [31:0] m_data;
    wire [2:0] m_id;
    wire m_valid;
    reg m_ready = 0;

    audio_filter_hls_0 dut (
        .s_axi_control_ARADDR(araddr),
        .s_axi_control_ARREADY(arready),
        .s_axi_control_ARVALID(arvalid),
        .s_axi_control_AWADDR(awaddr),
        .s_axi_control_AWREADY(awready),
        .s_axi_control_AWVALID(awvalid),
        .s_axi_control_BREADY(bready),
        .s_axi_control_BRESP(bresp),
        .s_axi_control_BVALID(bvalid),
        .s_axi_control_RDATA(rdata),
        .s_axi_control_RREADY(rready),
        .s_axi_control_RRESP(rresp),
        .s_axi_control_RVALID(rvalid),
        .s_axi_control_WDATA(wdata),
        .s_axi_control_WREADY(wready),
        .s_axi_control_WSTRB(wstrb),
        .s_axi_control_WVALID(wvalid),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .interrupt(interrupt),
        .s_axis_TDATA(s_data),
        .s_axis_TID(s_id),
        .s_axis_TREADY(s_ready),
        .s_axis_TVALID(s_valid),
        .m_axis_TDATA(m_data),
        .m_axis_TID(m_id),
        .m_axis_TREADY(m_ready),
        .m_axis_TVALID(m_valid)
    );


    // Independent AXI-Lite address and data handshakes.
    // Keep BREADY low until both requests have been accepted.
    task axi_write;
        input [AXI_ADDR_WIDTH-1:0] address;
        input [31:0] value;
        integer a, w, b;
        begin
            fork
                begin
                    @(negedge ap_clk);
                    awaddr = address;
                    awvalid = 1;
                    begin : wait_aw
                        for (a = 0; a < AXI_TIMEOUT; a = a + 1) begin
                            @(posedge ap_clk);
                            if (awready === 1'b1) disable wait_aw;
                        end
                        $display("FAIL: AXI AW timeout"); $finish;
                    end
                    @(negedge ap_clk);
                    awvalid = 0;
                end
                begin
                    @(negedge ap_clk);
                    wdata = value;
                    wstrb = 4'hF;
                    wvalid = 1;
                    begin : wait_w
                        for (w = 0; w < AXI_TIMEOUT; w = w + 1) begin
                            @(posedge ap_clk);
                            if (wready === 1'b1) disable wait_w;
                        end
                        $display("FAIL: AXI W timeout"); $finish;
                    end
                    @(negedge ap_clk);
                    wvalid = 0;
                end
            join
            @(negedge ap_clk);
            bready = 1;
            begin : wait_b
                for (b = 0; b < AXI_TIMEOUT; b = b + 1) begin
                    @(posedge ap_clk);
                    if (bvalid === 1'b1) begin
                        if (bresp !== 2'b00) begin
                            $display("FAIL: BRESP=%b", bresp); $finish;
                        end
                        disable wait_b;
                    end
                end
                $display("FAIL: AXI B timeout"); $finish;
            end
            @(negedge ap_clk);
            bready = 0;
            $display("AXI WRITE offset=%h data=%08h", address, value);
        end
    endtask

    task axi_read;
        input [AXI_ADDR_WIDTH-1:0] address;
        output [31:0] value;
        integer a, r;
        begin
            @(negedge ap_clk);
            araddr = address;
            arvalid = 1;
            begin : wait_ar
                for (a = 0; a < AXI_TIMEOUT; a = a + 1) begin
                    @(posedge ap_clk);
                    if (arready === 1'b1) disable wait_ar;
                end
                $display("FAIL: AXI AR timeout"); $finish;
            end
            @(negedge ap_clk);
            arvalid = 0;
            rready = 1;
            begin : wait_r
                for (r = 0; r < AXI_TIMEOUT; r = r + 1) begin
                    @(posedge ap_clk);
                    if (rvalid === 1'b1) begin
                        if (rresp !== 2'b00) begin
                            $display("FAIL: RRESP=%b", rresp); $finish;
                        end
                        value = rdata;
                        disable wait_r;
                    end
                end
                $display("FAIL: AXI R timeout"); $finish;
            end
            @(negedge ap_clk);
            rready = 0;
        end
    endtask

    function [31:0] make_word;
        input integer n;
        integer sample;
        reg [31:0] word;
        begin
            case ((n / 2) % 4)
                0: sample = (n % 2 == 0) ? 8388607 : -8388608;
                1: sample = (n % 2 == 0) ? 4000000 : 0;
                2: sample = (n % 2 == 0) ? -1000000 : 2000000;
                default: sample = (n * 123457) % 16000000 - 8000000;
            endcase
            word = 0;
            word[27:4] = sample[23:0];
            word[3:0] = (n % 2) ? 4'h3 : ((n == 0) ? 4'h1 : 4'h2);
            word[30] = (n / 8) % 2;
            word[29] = (n / 4) % 2;
            word[28] = (n % 23 == 22);
            word[31] = ^word[30:4];
            make_word = word;
        end
    endfunction

    task send_word;
        input [31:0] value;
        input [2:0] id;
        integer c;
        begin
            @(negedge ap_clk);
            s_data = value;
            s_id = id;
            s_valid = 1;
            begin : wait_stream
                for (c = 0; c < STREAM_TIMEOUT; c = c + 1) begin
                    @(posedge ap_clk);
                    if (s_ready === 1'b1) disable wait_stream;
                end
                $display("FAIL: input timeout; check start/auto-restart"); $finish;
            end
            @(negedge ap_clk);
            s_valid = 0;
        end
    endtask

    // Output backpressure: four cycles stalled out of every eleven.
    integer sink_cycle = 0;
    always @(negedge ap_clk) begin
        if (!ap_rst_n) begin
            sink_cycle = 0;
            m_ready = 0;
        end else begin
            sink_cycle = sink_cycle + 1;
            m_ready = ((sink_cycle % 11) >= 4);
        end
    end

    reg case_bypass = 0;
    integer sent = 0;
    integer received = 0;
    integer filtered_differences = 0;
    reg [31:0] expected_data [0:NUM_WORDS-1];
    reg [2:0] expected_id [0:NUM_WORDS-1];
    // Flattened array: history[channel*7 + sample_index].
    reg signed [31:0] history [0:55];
    reg was_stalled = 0;
    reg [31:0] stalled_data;
    reg [2:0] stalled_id;

    reg [31:0] expected;
    integer ch, k;
    reg signed [31:0] x, y;
    reg signed [63:0] sum;

    // Independent signed reference for the 8-tap moving average.
    always @(posedge ap_clk) begin
        if (!ap_rst_n) begin
            sent = 0;
            received = 0;
            filtered_differences = 0;
            was_stalled = 0;
            for (k = 0; k < 56; k = k + 1) history[k] = 0;
        end else begin
            if (was_stalled &&
                (m_valid !== 1'b1 || m_data !== stalled_data || m_id !== stalled_id)) begin
                $display("FAIL: output changed while stalled"); $finish;
            end

            if (s_valid === 1'b1 && s_ready === 1'b1) begin
                if (sent >= NUM_WORDS) begin
                    $display("FAIL: too many inputs"); $finish;
                end
                if ((^s_id) === 1'bx) begin
                    $display("FAIL: unknown input TID"); $finish;
                end
                ch = s_id;
                expected = s_data;
                // Invalid audio (V=1) passes through and does not update state.
                if (!s_data[28]) begin
                    x = {{8{s_data[27]}}, s_data[27:4]};
                    sum = x;
                    for (k = 0; k < 7; k = k + 1)
                        sum = sum + history[ch*7 + k];
                    y = sum >>> 3;
                    for (k = 6; k > 0; k = k - 1)
                        history[ch*7 + k] = history[ch*7 + k - 1];
                    history[ch*7] = x;
                    if (!case_bypass) begin
                        expected[27:4] = y[23:0];
                        expected[31] = ^expected[30:4];
                    end
                end
                if (expected !== s_data)
                    filtered_differences = filtered_differences + 1;
                expected_data[sent] = expected;
                expected_id[sent] = s_id;
                sent = sent + 1;
            end

            if (m_valid === 1'b1 && m_ready === 1'b1) begin
                if (received >= sent) begin
                    $display("FAIL: unexpected/duplicate output"); $finish;
                end else if (m_data !== expected_data[received] ||
                             m_id !== expected_id[received]) begin
                    $display("FAIL: bypass=%0d word=%0d", case_bypass, received);
                    $display("Expected data=%08h ID=%0d", expected_data[received], expected_id[received]);
                    $display("Actual   data=%08h ID=%0d", m_data, m_id);
                    $finish;
                end
                received = received + 1;
            end
            was_stalled = (m_valid === 1'b1 && m_ready === 1'b0);
            stalled_data = m_data;
            stalled_id = m_id;
        end
    end

    task run_case;
        input bypass_value;
        reg [31:0] readback;
        integer n, c;
        begin
            case_bypass = bypass_value;
            $display("\nTEST bypass=%0d (0=filter, 1=unchanged)", bypass_value);
            @(negedge ap_clk);
            ap_rst_n = 0;
            repeat (8) @(posedge ap_clk);
            @(negedge ap_clk);
            ap_rst_n = 1;
            repeat (4) @(posedge ap_clk);

            axi_write(32'h20, bypass_value ? 32'h1 : 32'h0);
            axi_read(32'h20, readback);
            if (readback[0] !== bypass_value) begin
                $display("FAIL: bypass readback=%08h", readback); $finish;
            end
            // Bit 7 auto_restart, bit 0 ap_start.
            axi_write(32'h00, 32'h00000081);
            axi_read(32'h00, readback);
            if (readback[7] !== 1'b1) begin
                $display("FAIL: auto-restart readback=%08h", readback); $finish;
            end
            for (n = 0; n < NUM_WORDS; n = n + 1) begin
                if (n % 3 == 0) repeat (2) @(negedge ap_clk);
                send_word(make_word(n), (n % 2 == 0) ? 3'd0 : 3'd1);
            end
            begin : drain_outputs
                for (c = 0; c < STREAM_TIMEOUT; c = c + 1) begin
                    @(negedge ap_clk);
                    if (received == NUM_WORDS) disable drain_outputs;
                end
                $display("FAIL: output timeout sent=%0d received=%0d", sent, received);
                $finish;
            end
            repeat (32) @(negedge ap_clk);
            if (sent != NUM_WORDS || received != NUM_WORDS) 
            begin
                //$display("FAIL: incorrect word count"); $finish;
                    $display(
                    "FAIL: incorrect word count: bypass=%0d sent=%0d received=%0d expected=%0d",
                    case_bypass, sent, received, NUM_WORDS
                    );
                    $finish;
            end
            if (!bypass_value && filtered_differences == 0) begin
                $display("FAIL: filter test never changed audio"); $finish;
            end
            $display("PASS bypass=%0d: %0d words checked", bypass_value, received);
        end
    endtask

    initial begin
        ap_rst_n = 0;
        run_case(0);
        run_case(1);
        $display("\nPASS: BOTH BYPASS SCENARIOS");
        $finish;
    end

    initial begin
        #(CLK_PERIOD_NS * 1000000);
        $display("FAIL: global timeout");
        $finish;
    end
endmodule

`default_nettype wire