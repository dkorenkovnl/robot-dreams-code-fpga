`timescale 1ns / 1ps

module task10_microblaze_tb();

// ***************************************************************
// inputs
reg sysclk;
reg [3:0] btns_4bits_tri_i;
reg [1:0] sws_2bits_tri_i;
wire [3:0] leds_4bits_tri_io;
// ***************************************************************
// outputs

// ***************************************************************
// localparam

// 100 MHz clock: period = 10 ns
localparam integer CLK_PERIOD = 8;

// ***************************************************************
// functions&tasks

// ***************************************************************
// UUT

design_1_wrapper UUT
   (.btns_4bits_tri_i   (btns_4bits_tri_i),
    .leds_4bits_tri_io  (leds_4bits_tri_io),
    .sws_2bits_tri_i    (sws_2bits_tri_i),
    .sysclk             (sysclk));

// ***************************************************************
// init

initial
begin
	sysclk = 1'b0;	
	btns_4bits_tri_i = 4'b0000;
    sws_2bits_tri_i = 4'b0000;
	
end
// ***************************************************************
// clock 100MHz period 10ns
initial begin
    sysclk = 1'b0;

    forever #(CLK_PERIOD / 2)
        sysclk = ~sysclk;
end
// ***************************************************************
// test logic
initial
begin
    $display("[%0d ns] START", $time);
    #100000;
    btns_4bits_tri_i = 4'b0000;
    sws_2bits_tri_i = 4'b0000;
    $display("[%0d ns] move LEFT test", $time);    
// ***************************************************************
// give the system some time to init 
// since sws_2bits_tri_i = 4'b0000; the shift direction for leds now is LEFT!
// based on vitis code #define TIMER_TICK (0.000100)  /* 10 us */
// every 10 us axi timer is clocking and move our led to next position
#120000; // 120,000 ns = 120 us = 0.12 ms
// for 120 us it would be moved 12 times LEFT
// it is requered to have 0 value on the bus for impl blink functionality
// so expected result here is 1,0,2,0,4,0,8,0,1,0 in wafeform for wire [3:0] leds_4bits_tri_io;
// ***************************************************************
$display("[%0d ns] move RIGHT test", $time);
btns_4bits_tri_i = 4'b0000;
//4'b0001 or 4'b0010 - move RIGHT
//4'b0000 or 4'b0011 - move LEFT
sws_2bits_tri_i = 4'b0001;
#120000; // 120,000 ns = 120 us = 0.12 ms
// for 120 us it would be moved 12 times RIGHT
// so expected result here is 8,0,4,0,2,0,1,0,8,0, in wafeform for wire [3:0] leds_4bits_tri_io;

// ***************************************************************
// btns_4bits_tri_i[3] - start
// btns_4bits_tri_i[2] - stop
// btns_4bits_tri_i[1] - up speed
// btns_4bits_tri_i[0] - down speed
btns_4bits_tri_i = 4'b0000;
sws_2bits_tri_i = 4'b0000;  // moving left
btns_4bits_tri_i[2] = 1'b1; // press stop
#12000;
btns_4bits_tri_i[2] = 1'b0; // release stop
$display("[%0d ns] button STOP pressed test", $time); 
#120000; // 120,000 ns = 120 us = 0.12 ms

// ***************************************************************
btns_4bits_tri_i = 4'b0000;
sws_2bits_tri_i = 4'b0000;  // moving left
btns_4bits_tri_i[3] = 1'b1; // press start
#12000;
btns_4bits_tri_i[3] = 1'b0; // release start
$display("[%0d ns] button START pressed test", $time); 
#120000; // 120,000 ns = 120 us = 0.12 ms
// ***************************************************************
    $display("[%0d ns] FINISH", $time);
    $finish;
end
endmodule
