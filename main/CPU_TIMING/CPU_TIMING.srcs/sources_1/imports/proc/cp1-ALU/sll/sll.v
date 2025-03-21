module sll (data_operandA, ctrl_shiftamt, out);

    input [31:0] data_operandA;
    input [4:0] ctrl_shiftamt;
    output [31:0] out;
    wire[31:0] w1,w2,w3,w4;

    sll_1_bit sll1(.data_operandA(data_operandA),.shift(ctrl_shiftamt[0]),.out(w1));
    sll_2_bit sll2(.data_operandA(w1),.shift(ctrl_shiftamt[1]),.out(w2));
    sll_4_bit sll4(.data_operandA(w2),.shift(ctrl_shiftamt[2]),.out(w3));
    sll_8_bit sll8(.data_operandA(w3),.shift(ctrl_shiftamt[3]),.out(w4));
    sll_16_bit sll16(.data_operandA(w4),.shift(ctrl_shiftamt[4]),.out(out));

endmodule