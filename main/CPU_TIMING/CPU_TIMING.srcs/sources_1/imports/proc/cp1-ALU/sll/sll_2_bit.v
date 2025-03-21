module sll_2_bit (data_operandA, shift, out);
    input [31:0] data_operandA;
    input shift;
    output [31:0] out;

    assign out[0] = shift ? 0:data_operandA[0];
    assign out[1] = shift ? 0:data_operandA[1];
    assign out[31:2] = shift ? data_operandA[29:0]:data_operandA[31:2];
endmodule