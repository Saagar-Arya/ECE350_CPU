module divider(data_A, data_B, clock, ctrl_DIV, data_result, data_exception, data_resultRDY);
    input [31:0] data_A;
    input [31:0] data_B;
    input clock, ctrl_DIV;
    output [31:0] data_result; 
    output data_exception;
    output data_resultRDY;

    wire[5:0] counter;
    TFF_6 TFF_6_1(.clock(clock), .en(1'b1), .clr(ctrl_DIV), .q(counter));
    wire signA, signB;
    assign data_exception = ~(|data_B);
    wire counter_done;
    assign counter_done = counter[0]&~counter[1]&~counter[2]&~counter[3]&~counter[4]&counter[5] | data_exception;

    wire neg_result;
    assign neg_result = data_A[31]^data_B[31];
    
    wire counter_neg;
    assign counter_neg = counter_done & neg_result;

    wire first;
    assign first = ~(|counter);

    // Setup for first loop
    wire[63:0] first_reg;
    assign first_reg[63:32] = 32'd0;
    assign first_reg[31:0] = data_A;

    wire[63:0] data_in_reg;
    assign data_in_reg = first ? first_reg : end_loop;
    wire[63:0] reg_out;

    wire[63:0] data_in_reg_adjusted;
    assign data_in_reg_adjusted[63:32] = data_in_reg[63:32];
    assign data_in_reg_adjusted[31:0] = (first&data_A[31]) ? add_sub_out : data_in_reg[31:0];

    register_32_bit highReg(.q(reg_out[63:32]), .d(data_in_reg_adjusted[63:32]), .clk(clock), .en(1'd1), .clr(1'd0));
    register_32_bit lowReg(.q(reg_out[31:0]), .d(data_in_reg_adjusted[31:0]), .clk(clock), .en(1'd1), .clr(1'd0));

    // Shifted
    wire [63:0] reg_shift;
    sll_1_bit_64_in step1(.data_operandA(reg_out), .shift(1'd1), .out(reg_shift));

    //Subtract or add
    wire[31:0] add_sub_out;
    wire[31:0] sub_A_out;

    wire q;
    assign q = reg_out[63];

    wire q_neg_b;
    assign q_neg_b = data_B[31] ? ~q : q;

    wire[31:0] add_or_sub;
    assign add_or_sub = q_neg_b ? data_B:~data_B;

    wire q_adjusted;
    assign q_adjusted = first ? 1'd0 : q_neg_b;
    wire [31:0]in1, in2;
    assign in1 = first ? 32'd0 : reg_shift[63:32];
    assign in2 = first ? ~data_A : add_or_sub;

    wire [31:0]in1_last, in2_last;
    wire q_adjusted_last;

    assign in1_last = counter_neg ? 32'd0 : in1;
    assign in2_last = counter_neg ? ~reg_out[31:0] : in2; 
    assign q_adjusted_last = counter_neg ? 1'd0 : q_adjusted;

    sum sum_sub(.in1(in1_last), .in2(in2_last), .cin(~q_adjusted_last), .out(add_sub_out), .overflow(), .cout());

    wire[63:0] end_loop;
    assign end_loop[63:32] = add_sub_out;
    assign end_loop[31:1] = reg_shift[31:1];
    assign end_loop[0] = ~add_sub_out[31];
    //store in register

    //Set output
    wire[31:0] data_result_no_exception;
    assign data_result_no_exception = neg_result ? add_sub_out : reg_out[31:0];
    assign data_result = data_exception ? 32'd0 : data_result_no_exception;
    assign data_resultRDY = counter_done | data_exception;

endmodule