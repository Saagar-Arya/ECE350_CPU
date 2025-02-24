/**
 * READ THIS DESCRIPTION!
 *
 * This is your processor module that will contain the bulk of your code submission. You are to implement
 * a 5-stage pipelined processor in this module, accounting for hazards and implementing bypasses as
 * necessary.
 *
 * Ultimately, your processor will be tested by a master skeleton, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file, Wrapper.v, acts as a small wrapper around your processor for this purpose. Refer to Wrapper.v
 * for more details.
 *
 * As a result, this module will NOT contain the RegFile nor the memory modules. Study the inputs 
 * very carefully - the RegFile-related I/Os are merely signals to be sent to the RegFile instantiated
 * in your Wrapper module. This is the same for your memory elements. 
 *
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for RegFile
    ctrl_writeReg,                  // O: Register to write to in RegFile
    ctrl_readRegA,                  // O: Register to read from port A of RegFile
    ctrl_readRegB,                  // O: Register to read from port B of RegFile
    data_writeReg,                  // O: Data to write to for RegFile
    data_readRegA,                  // I: Data from port A of RegFile
    data_readRegB                   // I: Data from port B of RegFile
	 
	);

	// Control signals
	input clock, reset;
	
	// Imem
    output [31:0] address_imem;
	input [31:0] q_imem;


	// Dmem
	output [31:0] address_dmem, data;
	output wren;
	input [31:0] q_dmem;

	// Regfile
	output ctrl_writeEnable;
	output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_writeReg;
	input [31:0] data_readRegA, data_readRegB;

	/* YOUR CODE STARTS HERE */
    // ================Program Counter=================== //
    wire branch, jump, jal, jr, bex_take, mult, div, not_stalling, flushing;
    wire[31:0] nextPC, branching_PC, target, PC_sum_out;
    assign not_stalling = ~((mult|div) & (~multdiv_ready));
    assign flushing = (branch | jump | jal | jr | bex_take) ;

    register_32_bit PC(.q(address_imem), .d(nextPC), .clk(~clock), .en(not_stalling), .clr(reset));
    assign branching_PC = branch ? dxpc_out : address_imem;
    assign target = branch ? {15'd0, dxinsn_out[16:0]} : 32'd0;
	sum PC_sum(.in1(branching_PC), .in2(target), .cin(~branch), .out(PC_sum_out));
    assign nextPC = jr ? dxa_out : (jump|jal|bex_take) ? {5'd0, dxinsn_out[26:0]} : PC_sum_out;
    // ================FETCH STAGE=================== //

    // Latch instruction from imem
    wire [31:0] fdinsn_out;
    register_32_bit FD_INSN(.q(fdinsn_out), .d(q_imem), .clk(~clock), .en(not_stalling), .clr(reset|flushing));
    
    // Latch PC
    wire [31:0] fdpc_out;
    register_32_bit FD_OP(.q(fdpc_out), .d(PC_sum_out), .clk(~clock), .en(not_stalling), .clr(reset|flushing));
    
    // ================DECODE STAGE================== //
    // Instruction decoder decode stage
    wire [31:0] op_decoder_decode;
    assign op_decoder_decode = 32'b1 << fdinsn_out[31:27];
    wire r_type_decode, i_type_decode, ji_type_decode, jii_type_decode;
    
    // type of instruction
    // assign r_type_decode = op_decoder_decode[0];
    assign i_type_decode = op_decoder_decode[5] | op_decoder_decode[7] | op_decoder_decode[8] | op_decoder_decode[2] | op_decoder_decode[6];
    // assign ji_type_decode = op_decoder_decode[1] | op_decoder_decode[3] | op_decoder_decode[22] | op_decoder_decode[21];
    assign jii_type_decode = op_decoder_decode[4];

    // Decode RS RT register 
    assign ctrl_readRegA = ((i_type_decode | jii_type_decode) ? fdinsn_out[26:22] : fdinsn_out[21:17]);
    assign ctrl_readRegB = op_decoder_decode[22] ? 5'b11110 : (i_type_decode ? fdinsn_out[21:17] : fdinsn_out[16:12]);

    // Latch data from RS RT 
    wire [31:0] dxa_out;
    wire [31:0] dxb_out;
    register_32_bit DX_A(.q(dxa_out), .d(data_readRegA), .clk(~clock), .en(not_stalling), .clr(reset));
    register_32_bit DX_B(.q(dxb_out), .d(data_readRegB), .clk(~clock), .en(not_stalling), .clr(reset));

    // Latch instruction
    wire [31:0] dxinsn_out;
    register_32_bit DX_INSN(.q(dxinsn_out), .d(fdinsn_out), .clk(~clock), .en(not_stalling), .clr(reset));
    
    // Latch PC
    wire [31:0] dxpc_out;
    register_32_bit DX_OP(.q(dxpc_out), .d(fdpc_out), .clk(~clock), .en(not_stalling), .clr(reset));

    // ================EXECUTE STAGE================= //
        
    wire [31:0] alu_out, op_decoder_execute, data_A, data_B, multdiv_out;
    wire [4:0] alu_op, shiftamt;
    wire isNotEqual, isLessThan, overflow, multdiv_ready, multdiv_exception;
    assign shiftamt = dxinsn_out[11:7];
    
    // Instruction decoder Execute stage
    // wire r_type_execute, i_type_execute, ji_type_execute, jii_type_execute;
    assign op_decoder_execute = 32'b1 << dxinsn_out[31:27];
    // type of instruction
    // assign r_type_execute = op_decoder_execute[0];
    // assign i_type_execute = op_decoder_execute[5] | op_decoder_execute[7] | op_decoder_execute[8] | op_decoder_execute[2] | op_decoder_execute[6];
    // assign ji_type_execute = op_decoder_execute[1] | op_decoder_execute[3] | op_decoder_execute[22] | op_decoder_execute[21];
    // assign jii_type_execute = op_decoder_execute[4];
    
    wire addi, bne, blt, sw, lw, addi_sw_lw, bex;
    assign addi = op_decoder_execute[5]; 
    assign bne = op_decoder_execute[2];
    assign blt = op_decoder_execute[6];
    assign jump = op_decoder_execute[1];
    assign jal = op_decoder_execute[3];
    assign jr = op_decoder_execute[4];
    assign sw = op_decoder_execute[7];
    assign lw = op_decoder_execute[8];
    assign addi_sw_lw = addi|sw|lw;
    assign mult = op_decoder_execute[0] & ((~dxinsn_out[6]) & (~dxinsn_out[5]) & dxinsn_out[4] & dxinsn_out[3] & (~dxinsn_out[2]));
    assign div = op_decoder_execute[0] & ((~dxinsn_out[6]) & (~dxinsn_out[5]) & dxinsn_out[4] & dxinsn_out[3] & (dxinsn_out[2]));
    assign bex = op_decoder_execute[22];
    assign bex_take = (bex & (|dxb_out));

    assign data_A = addi_sw_lw ? dxb_out : dxa_out;
    assign data_B = addi_sw_lw ? {{15{dxinsn_out[16]}}, dxinsn_out[16:0]} : dxb_out;
    assign alu_op = (bne | blt) ? 5'd1 : (addi_sw_lw ? 5'b0 : dxinsn_out[6:2]);

    wire mult_trigger, mult_t;
    dffe_ref MULT(.q(mult_t), .d(mult), .clk(~clock), .en(1'd1), .clr(reset));
    assign mult_trigger = mult & ~mult_t;

    wire div_trigger, div_t;
    dffe_ref DIV(.q(div_t), .d(div), .clk(~clock), .en(1'd1), .clr(reset));
    assign div_trigger = div & ~div_t;

    // ALU
    alu ALU(.data_operandA(data_A), .data_operandB(data_B), .ctrl_ALUopcode(alu_op), .data_result(alu_out), .ctrl_shiftamt(shiftamt), .overflow(overflow), .isNotEqual(isNotEqual), .isLessThan(isLessThan)); 
    multdiv MULTDIV(.data_operandA(dxa_out), .data_operandB(dxb_out), .ctrl_MULT(mult_trigger), .ctrl_DIV(div_trigger), .clock(clock), .data_result(multdiv_out), .data_exception(multdiv_exception), .data_resultRDY(multdiv_ready));

    wire[31:0] math_out;
    assign math_out = (mult|div) ? multdiv_out : alu_out;
    wire exception;
    assign exception = (mult|div) ? multdiv_exception : overflow;

    //set branch if BNE or BLT conditions are met
    assign branch = (bne & isNotEqual) | (blt & isLessThan);
    // Latch ALU result
    wire [31:0] xmo_out;
    register_32_bit XM_O(.q(xmo_out), .d(math_out), .clk(~clock), .en(not_stalling), .clr(reset));
    // Latch ALU Error result
    wire xm_error;
    dffe_ref XM_ERROR(.q(xm_error), .d(exception), .clk(~clock), .en(not_stalling), .clr(reset));

    // Latch data from RD 
    wire [31:0] xma_out;
    register_32_bit XM_A(.q(xma_out), .d(dxa_out), .clk(~clock), .en(not_stalling), .clr(reset));

    // Latch instruction
    wire [31:0] xminsn_out;
    register_32_bit XM_INSN(.q(xminsn_out), .d(dxinsn_out), .clk(~clock), .en(not_stalling), .clr(reset));
    
    // Latch PC
    wire [31:0] xmpc_out;
    register_32_bit XM_OP(.q(xmpc_out), .d(dxpc_out), .clk(~clock), .en(not_stalling), .clr(reset));
    
    // ================Memory STAGE================= //
    wire[31:0] op_decoder_memory;
    assign op_decoder_memory = 32'b1 << xminsn_out[31:27];

    assign wren = op_decoder_memory[7];
    assign address_dmem = xmo_out;
    assign data = xma_out;

    // Latch ALU result
    wire [31:0] mwo_out;
    register_32_bit MW_O(.q(mwo_out), .d(xmo_out), .clk(~clock), .en(not_stalling), .clr(reset));
    // Latch Error result
    wire mw_error;
    dffe_ref MW_ERROR(.q(mw_error), .d(xm_error), .clk(~clock), .en(not_stalling), .clr(reset));
    
    // Latch Memory result
    wire [31:0] mwmemory_out;
    register_32_bit MW_MEMORY(.q(mwmemory_out), .d(q_dmem), .clk(~clock), .en(not_stalling), .clr(reset));

    // Latch instruction
    wire [31:0] mwinsn_out;
    register_32_bit MW_INSN(.q(mwinsn_out), .d(xminsn_out), .clk(~clock), .en(not_stalling), .clr(reset));
    // Latch PC
    wire [31:0] mwpc_out;
    register_32_bit MW_OP(.q(mwpc_out), .d(xmpc_out), .clk(~clock), .en(not_stalling), .clr(reset));
    
    // ================WRITEBACK STAGE=============== //

    // Instruction decoder writeback stage
    wire [31:0] op_decoder_write;
    assign op_decoder_write = 32'b1 << mwinsn_out[31:27];
    wire setx, add_write, addi_write, sub_write, mult_write, div_write;
    wire [31:0] exception_write;
    assign setx = op_decoder_write[21];
    assign add_write = op_decoder_write[0] & (~(|mwinsn_out[6:2])) & mw_error;
    assign addi_write = op_decoder_write[5] & mw_error;
    assign sub_write = op_decoder_write[0] & (~(|mwinsn_out[6:3])) & mwinsn_out[2] & mw_error;
    assign mult_write = mw_error & (op_decoder_write[0] & ((~mwinsn_out[6]) & (~mwinsn_out[5]) & mwinsn_out[4] & mwinsn_out[3] & (~mwinsn_out[2])));
    assign div_write = mw_error & (op_decoder_write[0] & ((~mwinsn_out[6]) & (~mwinsn_out[5]) & mwinsn_out[4] & mwinsn_out[3] & (mwinsn_out[2])));
    assign exception_write = div_write ? 32'd5 : (mult_write ? 32'd4 : (add_write ? 32'd1 : (addi_write ? 32'd2 : 32'd3)));

    // Set destination register and data to write
    // if JAL[3] set reg r31 to PC+1
    assign ctrl_writeReg = (add_write | addi_write | sub_write | mult_write | div_write) ? 5'b11110 : (setx ? 5'b11110 : (op_decoder_write[3] ? 5'b11111 : mwinsn_out[26:22]));
    assign data_writeReg = (add_write | addi_write | sub_write | mult_write | div_write) ? exception_write : (setx ? {5'd0, mwinsn_out[26:0]} : (op_decoder_write[8] ? mwmemory_out : (op_decoder_write[3] ? mwpc_out : mwo_out)));
    
    // Set write enable for ALU Op and addi
    assign ctrl_writeEnable = op_decoder_write[0] | op_decoder_write[5] | op_decoder_write[3] | op_decoder_write[8] | setx;
	

	/* END CODE */

endmodule
