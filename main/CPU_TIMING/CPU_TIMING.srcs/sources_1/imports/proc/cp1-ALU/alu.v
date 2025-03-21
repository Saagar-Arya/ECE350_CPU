module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;

    wire [31:0] w0,w1,w2,w3,w4,w5,eWire;
    wire overflowadd, overflowsub;
    assign eWire = 32'd0;

    sum sumBlock(.in1(data_operandA), .in2(data_operandB), .cin(1'd0),.out(w0), .overflow(overflowadd));
    sub subBlock(.in1(data_operandA), .in2(data_operandB), .cin(1'd1),.out(w1), .overflow(overflowsub), .isNotEqual(isNotEqual),.isLessThan(isLessThan));
    and_32_bit and_32_bit1(.in1(data_operandA), .in2(data_operandB), .out(w2));
    or_32_bit or_32_bit1(.in1(data_operandA), .in2(data_operandB), .out(w3));
    sll sll1(.data_operandA(data_operandA), .ctrl_shiftamt(ctrl_shiftamt), .out(w4));
    sra sra1(.data_operandA(data_operandA), .ctrl_shiftamt(ctrl_shiftamt), .out(w5));

    mux_8 mux8(.out(data_result),.select(ctrl_ALUopcode[2:0]),.in0(w0),.in1(w1),.in2(w2),.in3(w3),.in4(w4),.in5(w5),.in6(eWire),.in7(eWire));
    
    assign overflow = ctrl_ALUopcode[0] ? overflowsub:overflowadd;
endmodule