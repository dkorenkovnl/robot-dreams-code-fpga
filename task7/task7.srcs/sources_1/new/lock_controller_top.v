`timescale 1ns / 1ps

`include "debounce_filter.v"

module lock_controller_top(
    input clk,
    input rst,
    input [3:0] digit_in,
    output reg unlocked_led
    );
    
    localparam [3:0] CODE0 = 4'd1;
    localparam [3:0] CODE1 = 4'd6;
    localparam [3:0] CODE2 = 4'd8;

    // States
    localparam [1:0] LOCKED   = 2'd0;
    localparam [1:0] WAIT_D2  = 2'd1;
    localparam [1:0] WAIT_D3  = 2'd2;
    localparam [1:0] UNLOCKED = 2'd3;
    
    reg [1:0] state, next_state;
      
    always @(posedge clk or posedge rst) 
    begin
        if (rst) 
        begin
            state <= LOCKED;
        end
        else 
        begin
            state <= next_state;
        end
    end

    always @(*)
    begin
        next_state = state;
        case (state)
            LOCKED:
                if (digit_in == CODE0) next_state = WAIT_D2;
                else                   next_state = LOCKED;
            WAIT_D2:
                if (digit_in == CODE1) next_state = WAIT_D3;
                else                   next_state = LOCKED;
            WAIT_D3:
                if (digit_in == CODE2) next_state = UNLOCKED;
                else                   next_state = LOCKED;
            UNLOCKED:
                next_state = UNLOCKED;
            default:
                next_state = LOCKED;
        endcase
    end

    always @(*) 
    begin
        unlocked_led = (state == UNLOCKED);
    end

    
endmodule
