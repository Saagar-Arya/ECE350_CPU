module sll_4_bit (data_operandA, shift, out);
    input [31:0] data_operandA;
    input shift;
    output [31:0] out;

    assign out[0] = shift ? 0:data_operandA[0];
    assign out[1] = shift ? 0:data_operandA[1];
    assign out[2] = shift ? 0:data_operandA[2];
    assign out[3] = shift ? 0:data_operandA[3];
    assign out[31:4] = shift ? data_operandA[27:0]:data_operandA[31:4];
endmodule