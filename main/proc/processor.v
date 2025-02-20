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
    wire[31:0] nextPC;

    register_32_bit PC(.q(address_imem), .d(nextPC), .clk(clock), .en(1'b1), .clr(reset));
    sum PC_sum(.in1(address_imem), .in2(32'b0), .cin(1'b1), .out(nextPC));


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
	
    // ================FETCH STAGE=================== //

    // Latch instruction from imem
    wire [31:0] fdinsn_out;
    register_32_bit FD_INSN(.q(fdinsn_out), .d(q_imem), .clk(~clock), .en(1'b1), .clr(reset));
    // ================DECODE STAGE================== //

    // Decode RS RT register 
    assign ctrl_readRegA = fdinsn_out[21:17];
    assign ctrl_readRegB = fdinsn_out[16:12];

    // Latch data from RS RT 
    wire [31:0] dxa_out;
    wire [31:0] dxb_out;
    register_32_bit DX_A(.q(dxa_out), .d(data_readRegA), .clk(~clock), .en(1'b1), .clr(reset));
    register_32_bit DX_B(.q(dxb_out), .d(data_readRegB), .clk(~clock), .en(1'b1), .clr(reset));


    // Latch instruction
    wire [31:0] dxinsn_out;
    register_32_bit DX_INSN(.q(dxinsn_out), .d(fdinsn_out), .clk(~clock), .en(1'b1), .clr(reset));

    // ================EXECUTE STAGE================= //

    // Helper wires
    wire [31:0] alu_out;
    wire [31:0] immediate; 
    assign immediate = {{15{dxinsn_out[16]}}, dxinsn_out[16:0]};

    wire [31:0] op_decoder;
    assign op_decoder = 32'b1 << dxinsn_out[31:27];

    wire [31:0] data_B;
    assign data_B = op_decoder[5] ? immediate : dxb_out;

    wire [4:0] alu_op;
    assign alu_op = op_decoder[5] ? 5'b0 : dxinsn_out[6:2];

    // Use ALU to compute result
    alu ALU(.data_operandA(dxa_out), .data_operandB(data_B), .ctrl_ALUopcode(alu_op), .data_result(alu_out), .ctrl_shiftamt(dxinsn_out[11:7])); 

    // Latch ALU result
    wire [31:0] xmo_out;
    register_32_bit XM_O(.q(xmo_out), .d(alu_out), .clk(~clock), .en(1'b1), .clr(reset));

    // Latch instruction
    wire [31:0] xminsn_out;
    register_32_bit XM_INSN(.q(xminsn_out), .d(dxinsn_out), .clk(~clock), .en(1'b1), .clr(reset));

    // ================Memory STAGE================= //
    assign wren = 1'd0;
    assign address_dmem = 32'd0;
    assign data = 32'd0;
    
    // Latch ALU result
    wire [31:0] mwo_out;
    register_32_bit MW_O(.q(mwo_out), .d(xmo_out), .clk(~clock), .en(1'b1), .clr(reset));

    // Latch instruction
    wire [31:0] mwinsn_out;
    register_32_bit MW_INSN(.q(mwinsn_out), .d(xminsn_out), .clk(~clock), .en(1'b1), .clr(reset));

    // ================WRITEBACK STAGE=============== //

    // Set destination register and data to write
    assign ctrl_writeReg = mwinsn_out[26:22];
    assign data_writeReg = mwo_out;

    // Set write enable
    assign ctrl_writeEnable = 1'b1;
	
	/* END CODE */

endmodule
