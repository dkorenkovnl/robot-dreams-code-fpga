`timescale 1ns / 1ps

module latch_test_top(
input in0,
input in1, 
input sel, 
output logic out);


    always_comb 
    begin
    if(sel)
        out = in1;
    //else
        //out = in0;
    end

endmodule
