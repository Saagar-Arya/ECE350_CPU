module regfile (
	clock,
	ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg,
	data_readRegA, data_readRegB
);

	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;

	output [31:0] data_readRegA, data_readRegB;

	wire [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31;
	wire [31:0] regAsel, regBsel, writeSel;
	
	assign writeSel = ctrl_writeEnable ? (32'b1 << ctrl_writeReg) : 32'b0;
	assign regAsel = (32'b1 << ctrl_readRegA);
	assign regBsel = (32'b1 << ctrl_readRegB);

	register_32_bit reg0(.q(r0), .d(data_writeReg), .clk(clock), .en(1'd0), .clr(ctrl_reset));
	register_32_bit reg1(.q(r1), .d(data_writeReg), .clk(clock), .en(writeSel[1]), .clr(ctrl_reset));
    register_32_bit reg2(.q(r2), .d(data_writeReg), .clk(clock), .en(writeSel[2]), .clr(ctrl_reset));
    register_32_bit reg3(.q(r3), .d(data_writeReg), .clk(clock), .en(writeSel[3]), .clr(ctrl_reset));
    register_32_bit reg4(.q(r4), .d(data_writeReg), .clk(clock), .en(writeSel[4]), .clr(ctrl_reset));
    register_32_bit reg5(.q(r5), .d(data_writeReg), .clk(clock), .en(writeSel[5]), .clr(ctrl_reset));
    register_32_bit reg6(.q(r6), .d(data_writeReg), .clk(clock), .en(writeSel[6]), .clr(ctrl_reset));
    register_32_bit reg7(.q(r7), .d(data_writeReg), .clk(clock), .en(writeSel[7]), .clr(ctrl_reset));
    register_32_bit reg8(.q(r8), .d(data_writeReg), .clk(clock), .en(writeSel[8]), .clr(ctrl_reset));
    register_32_bit reg9(.q(r9), .d(data_writeReg), .clk(clock), .en(writeSel[9]), .clr(ctrl_reset));
    register_32_bit reg10(.q(r10), .d(data_writeReg), .clk(clock), .en(writeSel[10]), .clr(ctrl_reset));
    register_32_bit reg11(.q(r11), .d(data_writeReg), .clk(clock), .en(writeSel[11]), .clr(ctrl_reset));
    register_32_bit reg12(.q(r12), .d(data_writeReg), .clk(clock), .en(writeSel[12]), .clr(ctrl_reset));
    register_32_bit reg13(.q(r13), .d(data_writeReg), .clk(clock), .en(writeSel[13]), .clr(ctrl_reset));
    register_32_bit reg14(.q(r14), .d(data_writeReg), .clk(clock), .en(writeSel[14]), .clr(ctrl_reset));
    register_32_bit reg15(.q(r15), .d(data_writeReg), .clk(clock), .en(writeSel[15]), .clr(ctrl_reset));
    register_32_bit reg16(.q(r16), .d(data_writeReg), .clk(clock), .en(writeSel[16]), .clr(ctrl_reset));
    register_32_bit reg17(.q(r17), .d(data_writeReg), .clk(clock), .en(writeSel[17]), .clr(ctrl_reset));
    register_32_bit reg18(.q(r18), .d(data_writeReg), .clk(clock), .en(writeSel[18]), .clr(ctrl_reset));
    register_32_bit reg19(.q(r19), .d(data_writeReg), .clk(clock), .en(writeSel[19]), .clr(ctrl_reset));
    register_32_bit reg20(.q(r20), .d(data_writeReg), .clk(clock), .en(writeSel[20]), .clr(ctrl_reset));
    register_32_bit reg21(.q(r21), .d(data_writeReg), .clk(clock), .en(writeSel[21]), .clr(ctrl_reset));
    register_32_bit reg22(.q(r22), .d(data_writeReg), .clk(clock), .en(writeSel[22]), .clr(ctrl_reset));
    register_32_bit reg23(.q(r23), .d(data_writeReg), .clk(clock), .en(writeSel[23]), .clr(ctrl_reset));
    register_32_bit reg24(.q(r24), .d(data_writeReg), .clk(clock), .en(writeSel[24]), .clr(ctrl_reset));
    register_32_bit reg25(.q(r25), .d(data_writeReg), .clk(clock), .en(writeSel[25]), .clr(ctrl_reset));
    register_32_bit reg26(.q(r26), .d(data_writeReg), .clk(clock), .en(writeSel[26]), .clr(ctrl_reset));
    register_32_bit reg27(.q(r27), .d(data_writeReg), .clk(clock), .en(writeSel[27]), .clr(ctrl_reset));
    register_32_bit reg28(.q(r28), .d(data_writeReg), .clk(clock), .en(writeSel[28]), .clr(ctrl_reset));
    register_32_bit reg29(.q(r29), .d(data_writeReg), .clk(clock), .en(writeSel[29]), .clr(ctrl_reset));
    register_32_bit reg30(.q(r30), .d(data_writeReg), .clk(clock), .en(writeSel[30]), .clr(ctrl_reset));
    register_32_bit reg31(.q(r31), .d(data_writeReg), .clk(clock), .en(writeSel[31]), .clr(ctrl_reset));

	assign data_readRegA = regAsel[0] ? r0 : 32'bz;
	assign data_readRegA = regAsel[1] ? r1 : 32'bz;
	assign data_readRegA = regAsel[2] ? r2 : 32'bz;
	assign data_readRegA = regAsel[3] ? r3 : 32'bz;
	assign data_readRegA = regAsel[4] ? r4 : 32'bz;
	assign data_readRegA = regAsel[5] ? r5 : 32'bz;
	assign data_readRegA = regAsel[6] ? r6 : 32'bz;
	assign data_readRegA = regAsel[7] ? r7 : 32'bz;
	assign data_readRegA = regAsel[8] ? r8 : 32'bz;
	assign data_readRegA = regAsel[9] ? r9 : 32'bz;
	assign data_readRegA = regAsel[10] ? r10 : 32'bz;
	assign data_readRegA = regAsel[11] ? r11 : 32'bz;
	assign data_readRegA = regAsel[12] ? r12 : 32'bz;
	assign data_readRegA = regAsel[13] ? r13 : 32'bz;
	assign data_readRegA = regAsel[14] ? r14 : 32'bz;
	assign data_readRegA = regAsel[15] ? r15 : 32'bz;
	assign data_readRegA = regAsel[16] ? r16 : 32'bz;
	assign data_readRegA = regAsel[17] ? r17 : 32'bz;
	assign data_readRegA = regAsel[18] ? r18 : 32'bz;
	assign data_readRegA = regAsel[19] ? r19 : 32'bz;
	assign data_readRegA = regAsel[20] ? r20 : 32'bz;
	assign data_readRegA = regAsel[21] ? r21 : 32'bz;
	assign data_readRegA = regAsel[22] ? r22 : 32'bz;
	assign data_readRegA = regAsel[23] ? r23 : 32'bz;
	assign data_readRegA = regAsel[24] ? r24 : 32'bz;
	assign data_readRegA = regAsel[25] ? r25 : 32'bz;
	assign data_readRegA = regAsel[26] ? r26 : 32'bz;
	assign data_readRegA = regAsel[27] ? r27 : 32'bz;
	assign data_readRegA = regAsel[28] ? r28 : 32'bz;
	assign data_readRegA = regAsel[29] ? r29 : 32'bz;
	assign data_readRegA = regAsel[30] ? r30 : 32'bz;
	assign data_readRegA = regAsel[31] ? r31 : 32'bz;

	assign data_readRegB = regBsel[0] ? r0 : 32'bz;
	assign data_readRegB = regBsel[1] ? r1 : 32'bz;
	assign data_readRegB = regBsel[2] ? r2 : 32'bz;
	assign data_readRegB = regBsel[3] ? r3 : 32'bz;
	assign data_readRegB = regBsel[4] ? r4 : 32'bz;
	assign data_readRegB = regBsel[5] ? r5 : 32'bz;
	assign data_readRegB = regBsel[6] ? r6 : 32'bz;
	assign data_readRegB = regBsel[7] ? r7 : 32'bz;
	assign data_readRegB = regBsel[8] ? r8 : 32'bz;
	assign data_readRegB = regBsel[9] ? r9 : 32'bz;
	assign data_readRegB = regBsel[10] ? r10 : 32'bz;
	assign data_readRegB = regBsel[11] ? r11 : 32'bz;
	assign data_readRegB = regBsel[12] ? r12 : 32'bz;
	assign data_readRegB = regBsel[13] ? r13 : 32'bz;
	assign data_readRegB = regBsel[14] ? r14 : 32'bz;
	assign data_readRegB = regBsel[15] ? r15 : 32'bz;
	assign data_readRegB = regBsel[16] ? r16 : 32'bz;
	assign data_readRegB = regBsel[17] ? r17 : 32'bz;
	assign data_readRegB = regBsel[18] ? r18 : 32'bz;
	assign data_readRegB = regBsel[19] ? r19 : 32'bz;
	assign data_readRegB = regBsel[20] ? r20 : 32'bz;
	assign data_readRegB = regBsel[21] ? r21 : 32'bz;
	assign data_readRegB = regBsel[22] ? r22 : 32'bz;
	assign data_readRegB = regBsel[23] ? r23 : 32'bz;
	assign data_readRegB = regBsel[24] ? r24 : 32'bz;
	assign data_readRegB = regBsel[25] ? r25 : 32'bz;
	assign data_readRegB = regBsel[26] ? r26 : 32'bz;
	assign data_readRegB = regBsel[27] ? r27 : 32'bz;
	assign data_readRegB = regBsel[28] ? r28 : 32'bz;
	assign data_readRegB = regBsel[29] ? r29 : 32'bz;
	assign data_readRegB = regBsel[30] ? r30 : 32'bz;
	assign data_readRegB = regBsel[31] ? r31 : 32'bz;

endmodule
