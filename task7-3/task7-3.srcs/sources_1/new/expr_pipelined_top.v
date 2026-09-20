`timescale 1ns / 1ps

module expr_pipelined_top(
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  a,
    input  wire [7:0]  b,
    input  wire [7:0]  c,
    input  wire [7:0]  d,
    output reg  [15:0] result
);

    // ---- Stage 0: registered inputs (this is what fixes it) ----
    reg [7:0] a_reg, b_reg, c_reg, d_reg;
    reg [15:0] state_result1;
    reg [15:0] state_result2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg <= 8'd0;
            b_reg <= 8'd0;
            c_reg <= 8'd0;
            d_reg <= 8'd0;
        end else begin
            a_reg <= a;
            b_reg <= b;
            c_reg <= c;
            d_reg <= d;
        end
    end

    // ---- Stage 1: the long combinational path + registered output ----
    always @(posedge clk or posedge rst) begin
        if (rst)
            begin
                result <= 16'd0;
                state_result1 <= 16'd0;
                state_result2 <= 16'd0;
            end
        else
            begin
                state_result1  <= (a_reg + b_reg);
                state_result2  <= state_result1 * c_reg;
                result <= state_result2 - d_reg;
            end
    end

endmodule
