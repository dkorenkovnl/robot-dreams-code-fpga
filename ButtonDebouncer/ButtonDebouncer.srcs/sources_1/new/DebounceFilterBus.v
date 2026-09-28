`timescale 1ns / 1ps

module DebounceFilterBus();
endmodule
module DebounceFilterBus #(
    parameter integer WIDTH = 4,
    parameter integer DEBOUNCE_CYCLES = 500_000
)(
    input  wire             clk,
    input  wire             a_rst,  // Active-low reset
    input  wire [WIDTH-1:0]  btn_pin,
    output wire [WIDTH-1:0]  btn_filtered
);

    localparam integer COUNTER_WIDTH = (DEBOUNCE_CYCLES > 1) ? $clog2(DEBOUNCE_CYCLES) : 1;
    wire rst = ~a_rst;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_buttons

            debounce_filter #(
                .DEBOUNCE_CYCLES(DEBOUNCE_CYCLES),
                .COUNTER_WIDTH(COUNTER_WIDTH)
            ) filter_inst (
                .clk(clk),
                .rst(rst),
                .btn_pin(btn_pin[i]),
                .btn_filtered(btn_filtered[i])
            );

        end
    endgenerate

endmodule

module debounce_filter #(
    // 500_000 for 50MHz clk and 10ms debounce delay
    parameter integer DEBOUNCE_CYCLES = 500_000, 
    parameter integer COUNTER_WIDTH = $clog2(DEBOUNCE_CYCLES)
)(
    input  wire clk,
    input  wire rst,
    input  wire btn_pin,       // 1 = pressed, 0 = released
    output reg  btn_filtered
);

    reg btn_sync1;
    reg btn_sync2;

    reg [COUNTER_WIDTH-1:0] debounce_cnt;

    wire btn_pressed = btn_sync2;

    // synchronize the asynchronous button input
    always @(posedge clk or posedge rst) 
    begin
        if (rst) 
        begin
            btn_sync1 <= 1'b0;
            btn_sync2 <= 1'b0;
        end
        else 
        begin
            btn_sync1 <= btn_pin;
            btn_sync2 <= btn_sync1;
        end
    end

    // up/down-counter debounce filter
    always @(posedge clk or posedge rst) 
    begin
        if (rst) 
        begin
            debounce_cnt <= {COUNTER_WIDTH{1'b0}};
            btn_filtered <= 1'b0;
        end
        else 
        begin
            if (btn_pressed) 
            begin
                if (debounce_cnt < DEBOUNCE_CYCLES - 1) 
                begin
                    debounce_cnt <= debounce_cnt + 1'b1;
                end
                else 
                begin
                    debounce_cnt <= debounce_cnt;
                    btn_filtered <= 1'b1;
                end
            end
            else 
            begin
                if (debounce_cnt > 0) 
                begin
                    debounce_cnt <= debounce_cnt - 1'b1;
                end
                else 
                begin
                    debounce_cnt <= debounce_cnt;
                    btn_filtered <= 1'b0;
                end
            end
        end
    end

endmodule
