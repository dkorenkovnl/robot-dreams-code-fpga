`timescale 1ns / 1ps

module design_1_wrapper_tb;

// ***************************************************************
// inputs/outputs

reg [3:0]btns_4bits_tri_i;
reg [7:0]byte_base_in_0;
reg sys_clock;
reg use_template_0;

wire done_0;
wire busy_0;

// ***************************************************************
// localparam

// 50 MHz clock: period = 20 ns
localparam integer CLK_PERIOD = 20;

// ***************************************************************
// functions&tasks

// ***************************************************************

// UUT
design_1_wrapper uut
   (.btns_4bits_tri_i(btns_4bits_tri_i),
    .byte_base_in_0(byte_base_in_0),
    .sys_clock(sys_clock),
    .use_template_0(use_template_0),
    .done_0(done_0),
    .busy_0(busy_0));

// ***************************************************************
// init

initial
begin
	sys_clock = 1'b0;
	use_template_0 = 1'b0;
end
// ***************************************************************
// clock 50MHz period 20ns
initial begin
    sys_clock = 1'b0;

    forever #(CLK_PERIOD / 2)
        sys_clock = ~sys_clock;
end
// ***************************************************************
// test logic
initial
begin
$display("[%0d ns] START", $time);
use_template_0 = 1'b1;
// ***************************************************************
    #5000000 //5ms = 5000us = 5_000_000ns
// ***************************************************************
$display("[%0d ns] FINISH", $time);
$finish;
end


endmodule
