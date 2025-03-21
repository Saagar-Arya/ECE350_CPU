module sra (data_operandA, ctrl_shiftamt, out);

    input [31:0] data_operandA;
    input [4:0] ctrl_shiftamt;
    output [31:0] out;
    wire[31:0] w1,w2,w3,w4;

    sra_1_bit sra1(.data_operandA(data_operandA),.shift(ctrl_shiftamt[0]),.out(w1));
    sra_2_bit sra2(.data_operandA(w1),.shift(ctrl_shiftamt[1]),.out(w2));
    sra_4_bit sra4(.data_operandA(w2),.shift(ctrl_shiftamt[2]),.out(w3));
    sra_8_bit sra8(.data_operandA(w3),.shift(ctrl_shiftamt[3]),.out(w4));
    sra_16_bit sra16(.data_operandA(w4),.shift(ctrl_shiftamt[4]),.out(out));

endmodule