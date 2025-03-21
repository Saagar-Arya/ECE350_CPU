module sra_8_bit (data_operandA, shift, out);
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

    assign out[23:0] = shift ? data_operandA[31:8]:data_operandA[23:0];
endmodule