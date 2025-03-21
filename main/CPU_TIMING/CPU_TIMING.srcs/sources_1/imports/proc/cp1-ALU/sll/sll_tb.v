module sll_tb;
wire [31:0] in = 32'd4294967295;
wire [4:0] shift = 5'd31;
wire [31:0] out;
sll sll1(.data_operandA(in),.ctrl_shiftamt(shift),.out(out));

initial begin
        #1;
        $display("out:%b",out);
    end
endmodule