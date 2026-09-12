`timescale 1ns / 1ps


module tb_counter();

//inputs
reg clk, rst, load, en, up_down;
//outputs
reg [3:0] data_in;
wire [3:0] count;
reg  [3:0] prev_count;


task automatic check_count;
    input [3:0] result;
    input [3:0] expected;
    input [128-1:0] name;
    
    begin
        if (result === expected)
            $display("[%0d ns] %0s PASS: -> result=%0d (0x%h, %b)", $time, name, result,result,result);
        else 
            $display("[%0d ns] %0s FAIL: -> had to be %0d, got %0d (0x%h, %b)", $time, name, expected, result, result,result);   
    end
endtask

counter_top uut(
    .clk(clk),
    .rst(rst),
    .load(load),
    .data_in(data_in),
    .en(en),
    .up_down(up_down),
    .count(count)
);

initial
begin
	clk = 1'b0;
	rst = 1'b0;
	load = 1'b0;
	data_in = 4'b0;
	en = 1'b0;
	up_down = 1'b0;
	prev_count = 4'b0;
end

initial
begin
	clk = 0;
	forever
	#10 clk = ~clk;
	//period 20ns
end

//test itself
initial
begin
    $display("[%0d ns] START", $time);
    //Part 2 of the task
    #10 rst = 1'b1;
    #10 rst = 1'b0;

    #20 en = 1'b1;
    up_down = 1'b1;
    #100
    
    //Part 3 of the task
    @(posedge clk);
    rst = 1'b1;
    @(posedge clk);
    rst = 1'b0;
    load = 1'b1;
    data_in = 4'd10;
    @(posedge clk);
    load = 1'b0;
    check_count(count,4'd10,"Part 3 task");
    
    //Part 4 of the task
    en = 1'b1;
    up_down = 1'b1;
    repeat (3) @(posedge clk);
    check_count(count,4'd13,"Part 4 task");
    repeat (3) @(posedge clk);
    check_count(count,4'd0,"Part 4 task");  
        
    //Part 5 of the task
    en = 1'b0;
    prev_count = count;
    $display("[%0d ns] stop counting, store count %0d (0x%h, %b)", $time, 4'd0, prev_count, prev_count,prev_count);  
    repeat (3) @(posedge clk);
    
    check_count(count,prev_count,"Part 5 task");  
    //Part 6 of the task
    en = 1'b1; 
    up_down = 1'b0;
    @(posedge clk);
    check_count(count,4'd15,"Part 6 task"); 
    
    //Part 7 of the task  
    en = 1'b1; 
    up_down = 1'b1;
    load = 1'b1;
    data_in = 4'd5;
    @(posedge clk);
  
    check_count(count,4'd5,"Part 7 task");    
    
    //Part 9 of the task
    //ANSWER: because count was not yet initialized 
    
    //Part 10 of the task
    //the result could be found in folder task5/counter/console_test
    
    //Extra task
    data_in = 4'd8;
    up_down = 1'b0;
    @(posedge clk);
    load = 1'b0;
    @(posedge clk);
    check_count(count,4'd7,"Part extra ");
      
    $display("[%0d ns] FINISH", $time);
    $finish;

end
endmodule
