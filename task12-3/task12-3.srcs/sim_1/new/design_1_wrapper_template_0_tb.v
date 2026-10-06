`timescale 1ns / 1ps

module design_1_wrapper_template_0_tb();

// ***************************************************************
// inputs/outputs

reg [3:0]btns_4bits_tri_i;
reg sys_clock;
reg use_template_0;

wire done_0;
wire busy_0;

reg clk_20mhz;
reg [7:0] sample = 0;
integer   sample_index = 0;
// ***************************************************************
// localparam

localparam CLK_PERIOD_100M = 10; // 10 ns = 100 MHz
localparam CLK_PERIOD_20M = 50; // 50 ns = 20 MHz
localparam SAMPLE_COUNT  = 300 * 200;
// ***************************************************************
// functions&tasks

// ***************************************************************

// UUT
design_1_wrapper uut
   (.btns_4bits_tri_i(btns_4bits_tri_i),
    .byte_base_in_0(sample),
    .sys_clock(sys_clock),
    .use_template_0(use_template_0),
    .done_0(done_0),
    .busy_0(busy_0));

// ***************************************************************
// init

initial
begin
	sys_clock = 1'b0;
	clk_20mhz = 1'b0;
	use_template_0 = 1'b0;
end
// ***************************************************************
// clock 100MHz period 10ns
initial begin
    sys_clock = 1'b0;
    forever #(CLK_PERIOD_100M / 2)
        sys_clock = ~sys_clock;
end

// clock 20MHz period 50ns
initial begin
    clk_20mhz = 1'b0;
    forever #(CLK_PERIOD_20M / 2)
        clk_20mhz = ~clk_20mhz;
end
// ***************************************************************
// test logic

initial begin
    forever begin
        @(posedge clk_20mhz);

        sample <= sample_index % 256;

        if (sample_index == SAMPLE_COUNT - 1)
            sample_index = 0;
        else
            sample_index = sample_index + 1;
    end
end

initial
begin
$display("[%0d ns] START", $time);
use_template_0 = 1'b0;
// ***************************************************************
    #5000000 //5ms = 5000us = 5_000_000ns
// ***************************************************************
$display("[%0d ns] FINISH", $time);
$finish;
end

endmodule
