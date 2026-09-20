`timescale 1ns / 1ps

`include "debounce_filter.v"

module lock_controller_with_debounce_filter_top(
    input clk,
    input rst,
    input [3:0] digit_in,
    output reg unlocked_led
    );
    
    // current code
    localparam [3:0] CODE0 = 4'd1;
    localparam [3:0] CODE1 = 4'd6;
    localparam [3:0] CODE2 = 4'd8;

    // states
    localparam [1:0] LOCKED   = 2'd0;
    localparam [1:0] WAIT_D2  = 2'd1;
    localparam [1:0] WAIT_D3  = 2'd2;
    localparam [1:0] UNLOCKED = 2'd3;
    
    // parameter for UUT
    localparam integer TEST_DEBOUNCE_CYCLES = 5;

    reg [1:0] state, next_state;
    
    // debounce_filter vars
    wire [3:0] digit_debounced;
    reg [3:0] previous_digit;
    wire digit_changed;
    // debounce_filter logic
    assign digit_changed = (digit_debounced != previous_digit);

    debounce_filter 
    #(
        .DEBOUNCE_CYCLES(TEST_DEBOUNCE_CYCLES),
        .COUNTER_WIDTH($clog2(TEST_DEBOUNCE_CYCLES))
    )
    dbf0(
        .clk(clk), 
        .rst(rst),
        .btn_pin(digit_in[0]),
        .btn_filtered(digit_debounced[0])
    );
    
    debounce_filter 
    #(
        .DEBOUNCE_CYCLES(TEST_DEBOUNCE_CYCLES),
        .COUNTER_WIDTH($clog2(TEST_DEBOUNCE_CYCLES))
    )
    dbf1 (
        .clk(clk), 
        .rst(rst),
        .btn_pin(digit_in[1]),
        .btn_filtered(digit_debounced[1])
    );
    
    debounce_filter 
    #(
        .DEBOUNCE_CYCLES(TEST_DEBOUNCE_CYCLES),
        .COUNTER_WIDTH($clog2(TEST_DEBOUNCE_CYCLES))
    )
    dbf2 (
        .clk(clk), 
        .rst(rst),
        .btn_pin(digit_in[2]),
        .btn_filtered(digit_debounced[2])
    );
    
    debounce_filter 
    #(
        .DEBOUNCE_CYCLES(TEST_DEBOUNCE_CYCLES),
        .COUNTER_WIDTH($clog2(TEST_DEBOUNCE_CYCLES))
    )
    dbf3 (
        .clk(clk), 
        .rst(rst),
        .btn_pin(digit_in[3]),
        .btn_filtered(digit_debounced[3])
    );
    
    
    always @(posedge clk or posedge rst) 
    begin
        if (rst) 
        begin
            state          <= LOCKED;
            previous_digit <= 4'd0;
        end
        else 
        begin
            previous_digit <= digit_debounced;
            if (digit_changed)
                state <= next_state;
        end
    end

    always @(*) 
    begin
        next_state = state;
        case (state)
            LOCKED:
                if (digit_debounced == CODE0) next_state = WAIT_D2;
                else                   next_state = LOCKED;
            WAIT_D2:
                if (digit_debounced == CODE1) next_state = WAIT_D3;
                else                   next_state = LOCKED;
            WAIT_D3:
                if (digit_debounced == CODE2) next_state = UNLOCKED;
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
