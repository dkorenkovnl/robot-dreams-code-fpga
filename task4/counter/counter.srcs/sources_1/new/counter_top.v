`timescale 1ns / 1ps

module counter_top (
    input            clk,
    input            rst_n,
    output reg [3:0] cnt
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        cnt <= 4'b0000;
    else
        cnt <= cnt + 1'b1;
end

endmodule
