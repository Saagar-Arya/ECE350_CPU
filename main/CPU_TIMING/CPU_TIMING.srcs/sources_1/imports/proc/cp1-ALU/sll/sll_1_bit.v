module sll_1_bit (data_operandA, shift, out);
    input [31:0] data_operandA;
    input shift;
    output [31:0] out;
    
    assign out[0] = shift ? 0:data_operandA[0];
    assign out[31:1] = shift ? data_operandA[30:0]:data_operandA[31:1];
endmodule