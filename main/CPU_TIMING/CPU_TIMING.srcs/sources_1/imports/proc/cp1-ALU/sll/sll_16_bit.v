module sll_16_bit (data_operandA, shift, out);
    input [31:0] data_operandA;
    input shift;
    output [31:0] out;

    assign out[0] = shift ? 0:data_operandA[0];
    assign out[1] = shift ? 0:data_operandA[1];
    assign out[2] = shift ? 0:data_operandA[2];
    assign out[3] = shift ? 0:data_operandA[3];
    assign out[4] = shift ? 0:data_operandA[4];
    assign out[5] = shift ? 0:data_operandA[5];
    assign out[6] = shift ? 0:data_operandA[6];
    assign out[7] = shift ? 0:data_operandA[7];
    assign out[8] = shift ? 0:data_operandA[8];
    assign out[9] = shift ? 0:data_operandA[9];
    assign out[10] = shift ? 0:data_operandA[10];
    assign out[11] = shift ? 0:data_operandA[11];
    assign out[12] = shift ? 0:data_operandA[12];
    assign out[13] = shift ? 0:data_operandA[13];
    assign out[14] = shift ? 0:data_operandA[14];
    assign out[15] = shift ? 0:data_operandA[15];
    assign out[31:16] = shift ? data_operandA[15:0]:data_operandA[31:16];
endmodule