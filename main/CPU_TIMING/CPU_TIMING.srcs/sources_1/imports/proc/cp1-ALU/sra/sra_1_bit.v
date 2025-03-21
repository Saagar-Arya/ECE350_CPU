module sra_1_bit (data_operandA, shift, out);
    input [31:0] data_operandA;
    input shift;
    output [31:0] out;
    
    assign out[31] = shift ? data_operandA[31] : data_operandA[31];
    assign out[30:0] = shift ? data_operandA[31:1]:data_operandA[30:0];
endmodule