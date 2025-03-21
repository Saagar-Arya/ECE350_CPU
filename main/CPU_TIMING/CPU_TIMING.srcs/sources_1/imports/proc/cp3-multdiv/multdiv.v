module multdiv(
	data_operandA, data_operandB, 
	ctrl_MULT, ctrl_DIV, 
	clock, 
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT, ctrl_DIV, clock;

    output [31:0] data_result;
    output data_exception, data_resultRDY;
    
    // Data to Busses
    wire [31:0] mult_out, div_out;
    wire mult_exception, div_exception;
    wire mult_ready, div_ready;

    wire div_or_mult;
    dffe_ref div_mult(.q(div_or_mult), .d(ctrl_DIV), .clk(clock), .en(ctrl_DIV), .clr(ctrl_MULT));


    mult multWallace(.data_A(data_operandA),.data_B(data_operandB),.data_result(mult_out),.data_exception(mult_exception),.data_resultRDY(mult_ready), .ctrl_MULT(ctrl_MULT), .clock(clock));
    divider div(.data_A(data_operandA),.data_B(data_operandB), .data_result(div_out), .data_exception(div_exception), .data_resultRDY(div_ready), .clock(clock), .ctrl_DIV(ctrl_DIV));
    
    assign data_result = div_or_mult ? div_out : mult_out ;
    assign data_exception = div_or_mult ? div_exception : mult_exception;
    assign data_resultRDY = div_or_mult ? div_ready : mult_ready;

endmodule