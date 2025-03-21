module sra_16_bit (data_operandA, shift, out);
    input [31:0] data_operandA;
    input shift;
    output [31:0] out;
    
    assign out[31] = shift ? data_operandA[31] : data_operandA[31];
    assign out[30] = shift ? data_operandA[31] : data_operandA[30];
    assign out[29] = shift ? data_operandA[31] : data_operandA[29];
    assign out[28] = shift ? data_operandA[31] : data_operandA[28];
    assign out[27] = shift ? data_operandA[31] : data_operandA[27];
    assign out[26] = shift ? data_operandA[31] : data_operandA[26];
    assign out[25] = shift ? data_operandA[31] : data_operandA[25];
    assign out[24] = shift ? data_operandA[31] : data_operandA[24];
    assign out[23] = shift ? data_operandA[31] : data_operandA[23];
    assign out[22] = shift ? data_operandA[31] : data_operandA[22];
    assign out[21] = shift ? data_operandA[31] : data_operandA[21];
    assign out[20] = shift ? data_operandA[31] : data_operandA[20];
    assign out[19] = shift ? data_operandA[31] : data_operandA[19];
    assign out[18] = shift ? data_operandA[31] : data_operandA[18];
    assign out[17] = shift ? data_operandA[31] : data_operandA[17];
    assign out[16] = shift ? data_operandA[31] : data_operandA[16];

    assign out[15:0] = shift ? data_operandA[31:16]:data_operandA[15:0];
endmodule