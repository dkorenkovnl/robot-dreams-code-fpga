`timescale 1ns / 1ps
`timescale 1ns / 1ps

module ButtonDebouncer #(
    parameter DELAY = 500_000    // cycles required for stable state
)(
    input  wire CLK50MHZ,
    input  wire BUTTON,
    output wire RISING_EDGE_PULSE,
    output wire FALLING_EDGE_PULSE
);
    // 1. Synchronize asynchronous button input
    reg [1:0] button_sync_raw = 2'b00;
    always @(posedge CLK50MHZ) button_sync_raw <= {button_sync_raw[0], BUTTON};

    // 2. Debounce logic (filters contact bounce)
    wire BUTTON_DEBOUNCED;
    noise_remover #(DELAY) IN0 (
        .clk(CLK50MHZ),
        .debouncer_input(button_sync_raw[1]),
        .debouncer_output(BUTTON_DEBOUNCED)
    );

    // 3. Edge detection (1-cycle pulses)
    reg [1:0] button_sync = 2'b00;
    always @(posedge CLK50MHZ)button_sync <= {button_sync[0], BUTTON_DEBOUNCED};

    assign RISING_EDGE_PULSE  = (button_sync == 2'b01);
    assign FALLING_EDGE_PULSE = (button_sync == 2'b10);

endmodule

module noise_remover #(
    parameter DELAY = 500_000
)(
    input  wire clk,
    input  wire debouncer_input,
    output reg debouncer_output = 0
);
    localparam COUNTER_BITS = $clog2(DELAY);
    reg [COUNTER_BITS:0] counter = 0;  

    always @(posedge clk) begin
        // Input changed - start counting stable cycles
        if (debouncer_input != debouncer_output) begin       
            if (counter < (DELAY-2))counter <= counter + 1'b1;
            if (counter >= (DELAY-2)) begin
                debouncer_output <= debouncer_input;
                counter  <= 0;
            end 
        end
        // Input matches current output - reset counter
        if (debouncer_input == debouncer_output) counter <= 0; 
    end
endmodule
