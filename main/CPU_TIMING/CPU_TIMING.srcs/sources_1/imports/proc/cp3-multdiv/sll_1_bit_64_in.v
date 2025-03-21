module sll_1_bit_64_in (data_operandA, shift, out);
    input [63:0] data_operandA;
    input shift;
    output [63:0] out;
    
    assign out[0] = shift ? 0:data_operandA[0];
    assign out[63:1] = shift ? data_operandA[62:0]:data_operandA[63:1];
endmodule