`timescale 1ns / 1ps

module ButtonDebouncerBus #(
    parameter integer WIDTH = 4,
    parameter integer DELAY = 500_000 // 10 ms at 50 MHz
)(
    input  wire             CLK50MHZ,
    input  wire [WIDTH-1:0]  BUTTON,
    output wire [WIDTH-1:0]  BUTTON_DEBOUNCED,
    output wire [WIDTH-1:0]  RISING_EDGE_PULSE,
    output wire [WIDTH-1:0]  FALLING_EDGE_PULSE
);

    // Two-stage synchronizer for each independent button.
    (* ASYNC_REG = "TRUE" *)
    reg [WIDTH-1:0] button_sync1 = {WIDTH{1'b0}};

    (* ASYNC_REG = "TRUE" *)
    reg [WIDTH-1:0] button_sync2 = {WIDTH{1'b0}};

    always @(posedge CLK50MHZ) begin
        button_sync1 <= BUTTON;
        button_sync2 <= button_sync1;
    end

    // Each button has its own debounce counter.
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_debounce
            noise_remover #(
                .DELAY(DELAY)
            ) filter (
                .clk(CLK50MHZ),
                .debouncer_input(button_sync2[i]),
                .debouncer_output(BUTTON_DEBOUNCED[i])
            );
        end
    endgenerate

    // Preserve the original edge-detection behavior per bit.
    reg [WIDTH-1:0] button_sample = {WIDTH{1'b0}};
    reg [WIDTH-1:0] button_previous = {WIDTH{1'b0}};

    always @(posedge CLK50MHZ) begin
        button_sample   <= BUTTON_DEBOUNCED;
        button_previous <= button_sample;
    end

    assign RISING_EDGE_PULSE  =  button_sample & ~button_previous;
    assign FALLING_EDGE_PULSE = ~button_sample &  button_previous;

endmodule


module noise_remover #(
    parameter integer DELAY = 500_000
)(
    input  wire clk,
    input  wire debouncer_input,
    output reg  debouncer_output = 1'b0
);

    localparam integer COUNTER_BITS =
        (DELAY > 1) ? $clog2(DELAY) : 1;

    reg [COUNTER_BITS-1:0] counter = 0;

    always @(posedge clk) begin
        if (debouncer_input == debouncer_output) begin
            counter <= 0;
        end
        else if (counter == DELAY - 1) begin
            debouncer_output <= debouncer_input;
            counter <= 0;
        end
        else begin
            counter <= counter + 1'b1;
        end
    end

endmodule
