`timescale 1ns / 1ps

module decoder_top
//parameters
#(
    parameter IN_SIZE = 8,
    parameter OUT_SIZE = 1<<IN_SIZE // Number of output combinations: 2^IN_SIZE
)
//inputs,outputs
(
    input  [IN_SIZE - 1 : 0] binary_in,
    output [OUT_SIZE-1:0]    decoder_out
);
genvar i;
generate
		for (i=0; i<OUT_SIZE; i=i+1) 
		begin : gen
			assign decoder_out[i] = binary_in==i ? 1'b1 : 1'b0;
		end
endgenerate
endmodule