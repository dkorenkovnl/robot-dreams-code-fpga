`timescale 1ns / 1ps
`default_nettype none

// Verilog-2001 whole-design I2S testbench. Firmware must be loaded separately
// through Vivado's Simulation Sources ELF association for MicroBlaze.
module tb_design_1_i2s;
    // MUST match the input-clock frequency expected by your block design.
    parameter real SYS_CLK_HZ = 100000000.0;
    parameter real FS_HZ = 48000.0;
    parameter EXPECT_BYPASS = 0; // Must match firmware: 0=8-tap filter, 1=bypass
    parameter CHECK_AUDIO = 1;
    parameter CAPTURE_FRAMES = 512;
    parameter real BOOT_TIMEOUT_NS = 1000000000.0; // 1 second simulated time
    localparam real SYS_HALF_NS = 1.0e9 / (2.0 * SYS_CLK_HZ);
    localparam real BCLK_HALF_NS = 1.0e9 / (2.0 * FS_HZ * 64.0);

    reg sys_clk=0;
    reg au_bclk_r=0;
    reg au_wclk_r=1;
    reg au_dout_r=0; // TB -> FPGA (codec ADC data)
    wire au_din_r;  // FPGA -> TB (codec DAC data)
    wire au_mclk_r; // FPGA output: observe, never drive from TB
    tri audio_i2c_scl_io;
    tri audio_i2c_sda_io;
    reg codec_reset_n=0;
    pullup(audio_i2c_scl_io);
    pullup(audio_i2c_sda_io);

    design_1_wrapper dut (
        .au_bclk_r(au_bclk_r), .au_din_r(au_din_r),
        .au_dout_r(au_dout_r), .au_mclk_r(au_mclk_r),
        .au_wclk_r(au_wclk_r),
        .audio_i2c_scl_io(audio_i2c_scl_io),
        .audio_i2c_sda_io(audio_i2c_sda_io), .sys_clk(sys_clk)
    );

    initial begin
        sys_clk=0;
        forever #(SYS_HALF_NS) sys_clk=~sys_clk;
    end
    initial begin
        au_bclk_r=0;
        #2000;
        forever #(BCLK_HALF_NS) au_bclk_r=~au_bclk_r;
    end
    initial begin #100; codec_reset_n=1; end

    // Periodic PCM stimulus: left 1 kHz, right 8 kHz at FS=48 kHz.
    // Frequencies scale with FS_HZ. Exact sequence repeats every 48 frames.
    function integer stimulus;
        input integer frame;
        input integer channel;
        real angle;
        integer phase;
        begin
            phase=frame % 48;
            if (phase < 0) phase=phase+48;
            angle=6.283185307179586 * phase * (channel == 0 ? 1.0 : 8.0) / 48.0;
            stimulus=$rtoi(4000000.0 * $sin(angle));
        end
    endfunction

    integer bit_index=0;
    integer input_frame=0;
    integer slot_bit;
    reg [23:0] left_word=0, right_word=0;
    integer stimulus_fd, capture_fd;
    initial begin
        stimulus_fd=$fopen("i2s_input.csv","w");
        capture_fd=$fopen("i2s_output.csv","w");
        if (!stimulus_fd || !capture_fd) begin
            $display("FAIL: cannot open CSV output files"); $finish;
        end
        $fwrite(stimulus_fd,"time_ns,frame,left,right\n");
        $fwrite(capture_fd,"time_ns,frame,left,right\n");
        $display("Whole-design test: sys_clk=%0f Hz, Fs=%0f Hz, expected bypass=%0d",
                 SYS_CLK_HZ,FS_HZ,EXPECT_BYPASS);
    end

    // I2S master: change data/LRCLK on falling BCLK, sample on rising BCLK.
    // Each half-frame is 32 BCLK cycles. MSB appears ONE clock after LR edge.
    always @(negedge au_bclk_r) begin
        slot_bit=bit_index % 32;
        if (bit_index == 0) begin
            au_wclk_r=0;
            left_word=stimulus(input_frame,0);
            right_word=stimulus(input_frame,1);
            $fwrite(stimulus_fd,"%0.3f,%0d,%0d,%0d\n",$realtime,input_frame,
                    $signed(left_word),$signed(right_word));
        end
        if (bit_index == 32) au_wclk_r=1;
        if (slot_bit >= 1 && slot_bit <= 24) begin
            if (bit_index < 32) au_dout_r=left_word[24-slot_bit];
            else au_dout_r=right_word[24-slot_bit];
        end else au_dout_r=0;
        if (bit_index == 63) begin bit_index=0; input_frame=input_frame+1; end
        else bit_index=bit_index+1;
    end

    // Periodic golden waveforms. This models ONE 8-tap moving-average filter
    // at steady state, or pure bypass. It searches for the unknown BRAM delay.
    integer golden_l [0:47];
    integer golden_r [0:47];
    integer match_run [0:47];
    integer p,j;
    reg signed [63:0] sum_l,sum_r;
    initial begin
        for (p=0; p<48; p=p+1) begin
            if (EXPECT_BYPASS) begin
                golden_l[p]=stimulus(p,0); golden_r[p]=stimulus(p,1);
            end else begin
                sum_l=0; sum_r=0;
                for (j=0; j<8; j=j+1) begin
                    sum_l=sum_l+stimulus(p-j,0);
                    sum_r=sum_r+stimulus(p-j,1);
                end
                golden_l[p]=sum_l >>> 3;
                golden_r[p]=sum_r >>> 3;
            end
            match_run[p]=0;
        end
    end

    function integer near_sample;
        input integer actual;
        input integer expected;
        integer difference;
        begin
            difference=actual-expected;
            // Allow one LSB of rounding difference.
            near_sample=(difference >= -1 && difference <= 1);
        end
    endfunction

    integer total_output_frames=0;
    integer captured_frames=0;
    integer checked_frames=0;
    integer locked_phase=-1;
    integer c,idx;
    reg capture_started=0;
    task record_frame;
        input signed [23:0] left;
        input signed [23:0] right;
        begin
            $fwrite(capture_fd,"%0.3f,%0d,%0d,%0d\n",$realtime,
                    total_output_frames,left,right);
            total_output_frames=total_output_frames+1;
            // Disabled I2S TX normally outputs zeros. Wait for returned audio.
            if (!capture_started && ((left != 0) || (right != 0))) begin
                capture_started=1;
                $display("Returned audio starts at %0.3f ns",$realtime);
            end
            if (capture_started) begin
                if (captured_frames < 8)
                    $display("OUT[%0d] left=%0d right=%0d",captured_frames,left,right);
                if (CHECK_AUDIO && captured_frames >= 16) begin
                    if (locked_phase < 0) begin
                        for (c=0; c<48; c=c+1) begin
                            idx=(captured_frames+c)%48;
                            if (near_sample(left,golden_l[idx]) &&
                                near_sample(right,golden_r[idx]))
                                match_run[c]=match_run[c]+1;
                            else match_run[c]=0;
                            if (match_run[c] >= 16) locked_phase=c;
                        end
                        if (locked_phase >= 0)
                            $display("Golden sequence aligned: phase=%0d",locked_phase);
                        else if (captured_frames >= 256) begin
                            $display("FAIL: returned audio does not match expected mode");
                            $display("Check firmware bypass, I2S format, DMA layout, and channel order");
                            $fclose(stimulus_fd); $fclose(capture_fd); $finish;
                        end
                    end else begin
                        idx=(captured_frames+locked_phase)%48;
                        if (!near_sample(left,golden_l[idx]) ||
                            !near_sample(right,golden_r[idx])) begin
                            $display("FAIL frame=%0d: actual L=%0d R=%0d expected L=%0d R=%0d",
                                captured_frames,left,right,golden_l[idx],golden_r[idx]);
                            $fclose(stimulus_fd); $fclose(capture_fd); $finish;
                        end
                        checked_frames=checked_frames+1;
                    end
                end
                captured_frames=captured_frames+1;
                if (captured_frames >= CAPTURE_FRAMES) begin
                    if (CHECK_AUDIO && (locked_phase < 0 || checked_frames == 0))
                        $display("FAIL: insufficient matched frames; increase CAPTURE_FRAMES");
                    else if (CHECK_AUDIO)
                        $display("PASS: returned audio checked for %0d stereo frames",checked_frames);
                    else
                        $display("CAPTURE COMPLETE: checking disabled, inspect i2s_output.csv");
                    $fclose(stimulus_fd); $fclose(capture_fd); $finish;
                end
            end
        end
    endtask

    reg last_lr=1;
    reg have_left=0;
    integer rx_bits=24;
    reg [23:0] shift_word=0;
    reg signed [23:0] decoded_left=0;
    reg [23:0] completed_word;
    // Decoder intentionally uses LR transitions rather than source bit_index.
    always @(posedge au_bclk_r) begin
        if (au_wclk_r != last_lr) begin
            last_lr=au_wclk_r;
            rx_bits=0;
            shift_word=0;
        end else if (rx_bits < 24) begin
            shift_word={shift_word[22:0],au_din_r};
            rx_bits=rx_bits+1;
            if (rx_bits == 24) begin
                completed_word=shift_word;
                if ((^completed_word) === 1'bx) begin
                    have_left=0;
                    if (capture_started) begin
                        $display("FAIL: X/Z on returned audio after capture began"); $finish;
                    end
                end else if (!au_wclk_r) begin
                    decoded_left=completed_word; have_left=1;
                end else if (have_left) begin
                    record_frame(decoded_left,completed_word);
                    have_left=0;
                end
            end
        end
    end

    initial begin
        #(BOOT_TIMEOUT_NS);
        $display("FAIL: whole-design timeout; captured=%0d, input frames=%0d",
                 captured_frames,input_frame);
        $display("Check Simulation ELF association, CPU reset/clock, I2C ACKs, DMA initialization");
        $fclose(stimulus_fd); $fclose(capture_fd); $finish;
    end
endmodule
`default_nettype wire