module sum(in1, in2, cin, out, overflow, cout);
input [31:0] in1, in2;
input cin;
output [31:0] out;
output overflow;
wire [31:0] carry;
output cout;

carry_32_bit block1(.in1(in1),.in2(in2),.cin(cin),.carry(carry),.cout(cout));
sum_32_bit block2(.in1(in1),.in2(in2),.cin(carry),.out(out));
xor gate(overflow, carry[31], cout);

endmodule