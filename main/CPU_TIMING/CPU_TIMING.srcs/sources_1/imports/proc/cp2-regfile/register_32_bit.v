module register_32_bit(q, d, clk, en, clr);
input en, clk, clr;
input [31:0] d;
output [31:0] q;

genvar x;
generate
    for ( x=0;x<32;x = x+1)begin 
        dffe_ref reg0(.q(q[x]), .d(d[x]), .clk(clk), .en(en), .clr(clr));
    end
endgenerate

endmodule