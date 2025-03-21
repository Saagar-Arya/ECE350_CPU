module sra_tb;
wire [31:0] in = 32'd2147483647;
wire [4:0] shift = 5'd30;
wire [31:0] out;
sra sra1(.data_operandA(in),.ctrl_shiftamt(shift),.out(out));

initial begin
        #1;
        $display("out:%b",out);
    end
endmodule