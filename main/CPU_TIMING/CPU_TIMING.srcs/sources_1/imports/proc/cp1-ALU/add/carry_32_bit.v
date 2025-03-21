module carry_32_bit(in1,in2,cin,carry,cout);
input[31:0] in1, in2;
input cin;
output[31:0] carry;
output cout;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,G0,P0,G1,P1,G2,P2,G3,P3;

carry_8_bit carry0(.in1(in1[7:0]),.in2(in2[7:0]),.cin(cin),.carry(carry[7:0]),.G(G0),.P(P0));
and and0(w4,cin,P0);
or or0(w5,w4,G0);
carry_8_bit carry1(.in1(in1[15:8]),.in2(in2[15:8]),.cin(w5),.carry(carry[15:8]),.G(G1),.P(P1));
and and1(w6,cin,P0,P1);
and and2(w7,G0,P1);
or or1(w8,G1,w7,w6);
carry_8_bit carry2(.in1(in1[23:16]),.in2(in2[23:16]),.cin(w8),.carry(carry[23:16]),.G(G2),.P(P2));
and and3(w9,cin,P0,P1,P2);
and and4(w10,G0,P1,P2);
and and5(w11,G1,P2);
or or2(w16,G2,w9,w10,w11);
carry_8_bit carry3(.in1(in1[31:24]),.in2(in2[31:24]),.cin(w16),.carry(carry[31:24]),.G(G3),.P(P3));
and and6(w12,cin,P0,P1,P2,P3);
and and7(w13,G0,P1,P2,P3);
and and8(w14,G1,P2,P3);
and and9(w15,G2,P3);
or or3(cout,G3,w12,w13,w14,w15);
endmodule