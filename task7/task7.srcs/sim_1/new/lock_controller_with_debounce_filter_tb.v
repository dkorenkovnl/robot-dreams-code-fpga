`timescale 1ns / 1ps

module lock_controller_with_debounce_filter_tb();

// ***************************************************************
// inputs
reg clk;
reg rst;
reg [3:0] digit_in;
// ***************************************************************
// outputs
wire unlocked_led;

// ***************************************************************
// parameters
localparam [1:0] LOCKED   = 2'd0;
localparam [1:0] WAIT_D2  = 2'd1;
localparam [1:0] WAIT_D3  = 2'd2;
localparam [1:0] UNLOCKED = 2'd3;

// 50 MHz clock: period = 20 ns
localparam integer CLK_PERIOD = 20;
// ***************************************************************
// functions
function [8*8-1:0] state_name;
    input [1:0] value;
    begin
        case (value)
            LOCKED:   state_name = "LOCKED";
            WAIT_D2:  state_name = "WAIT_D2";
            WAIT_D3:  state_name = "WAIT_D3";
            UNLOCKED: state_name = "UNLOCKED";
            default:  state_name = "UNKNOWN";
        endcase
    end
endfunction
// ***************************************************************
// tasks
task automatic check_fsm;
    input [1:0] current_state;
    input [1:0] expected_state;
    input [256-1:0] msg;
    
    begin
        if (current_state === expected_state)
            $display("[%0d ns] PASS %0s : -> result=%0s", $time, msg, state_name(current_state));
        else 
            $display("[%0d ns] FAIL %0s : -> had to be %0s, got %0s", $time, msg, state_name(expected_state), state_name(current_state));   
    end
endtask

task automatic display_fsm_states;
    input [1:0] state;
    input [1:0] next_state;
    input [256-1:0] msg;

    begin
        $display(
            "[%0d ns] DEBUG %0s state=%0s, next_state=%0s",
            $time,
            msg,
            state_name(state),
            state_name(next_state)
        );
    end
endtask
// ***************************************************************
// UUT
lock_controller_with_debounce_filter_top uut(
    .clk(clk),
    .rst(rst),
    .digit_in(digit_in),
    .unlocked_led(unlocked_led)
);
// ***************************************************************
// init
initial
begin
	clk = 1'b0;
	rst = 1'b0;
	digit_in = 4'd0;
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
initial
begin
    $display("[%0d ns] START", $time);
    // skip 3 clocks 
    repeat (3)@(posedge clk);
    // reset up/down
    rst = 1'b1;
    @(posedge clk);
    rst = 0'b0;
// ***************************************************************
    $display("[%0d ns] Corrent sequence", $time);
    check_fsm(uut.state, uut.LOCKED, "expected state LOCKED");
    
    digit_in = 4'd1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    check_fsm(uut.next_state, uut.WAIT_D2, "expected next_state WAIT_D2");
// ***************************************************************    
    digit_in = 4'd6;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    check_fsm(uut.next_state, uut.WAIT_D3, "expected next_state WAIT_D3");
// ***************************************************************    
    digit_in = 4'd8;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    check_fsm(uut.next_state, uut.UNLOCKED, "expected next_state UNLOCKED");
    
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    check_fsm(uut.state, uut.UNLOCKED, "expected state UNLOCKED");
    
// ***************************************************************   
// ***************************************************************   
    $display("[%0d ns] FINISH", $time);
    $finish;

end
endmodule