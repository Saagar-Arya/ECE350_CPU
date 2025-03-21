module carry_8_bit(in1,in2,cin,carry,G,P);
input[7:0] in1, in2;
input cin;
output[7:0] carry;
output G,P;
wire g0,p0,g1,p1,g2,p2,g3,p3,g4,p4,g5,p5,g6,p6,g7,p7;
wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32, w33, w34, w35;

gen_1_bit gen0(.in1(in1[0]),.in2(in2[0]),.out(g0));
prop_1_bit prop0(.in1(in1[0]),.in2(in2[0]),.out(p0));

gen_1_bit gen1(.in1(in1[1]),.in2(in2[1]),.out(g1));
prop_1_bit prop1(.in1(in1[1]),.in2(in2[1]),.out(p1));

gen_1_bit gen2(.in1(in1[2]),.in2(in2[2]),.out(g2));
prop_1_bit prop2(.in1(in1[2]),.in2(in2[2]),.out(p2));

gen_1_bit gen3(.in1(in1[3]),.in2(in2[3]),.out(g3));
prop_1_bit prop3(.in1(in1[3]),.in2(in2[3]),.out(p3));

gen_1_bit gen4(.in1(in1[4]),.in2(in2[4]),.out(g4));
prop_1_bit prop4(.in1(in1[4]),.in2(in2[4]),.out(p4));

gen_1_bit gen5(.in1(in1[5]),.in2(in2[5]),.out(g5));
prop_1_bit prop5(.in1(in1[5]),.in2(in2[5]),.out(p5));

gen_1_bit gen6(.in1(in1[6]),.in2(in2[6]),.out(g6));
prop_1_bit prop6(.in1(in1[6]),.in2(in2[6]),.out(p6));

gen_1_bit gen7(.in1(in1[7]),.in2(in2[7]),.out(g7));
prop_1_bit prop7(.in1(in1[7]),.in2(in2[7]),.out(p7));

assign carry[0] = cin;

and and1(w0, carry[0], p0);
or or1(carry[1], g0,w0);

and and2_1(w1, carry[0], p0, p1);
and and2_2(w2, g0, p1);
or or2(carry[2], g1,w1,w2);

and and3_1(w3, carry[0], p0, p1, p2);
and and3_2(w4, g0, p1, p2);
and and3_3(w5, g1, p2);
or or3(carry[3], g2,w3,w4,w5);

and and4_1(w6, carry[0], p0, p1, p2, p3);
and and4_2(w7, g0, p1, p2, p3);
and and4_3(w8, g1, p2, p3);
and and4_4(w9, g2, p3);
or or4(carry[4], g3,w6,w7,w8,w9);

and and5_1(w10, carry[0], p0, p1, p2, p3, p4);
and and5_2(w11, g0, p1, p2, p3, p4);
and and5_3(w12, g1, p2, p3, p4);
and and5_4(w13, g2, p3, p4);
and and5_5(w14, g3, p4);
or or5(carry[5], g4,w10,w11,w12,w13,w14);

and and6_1(w15, carry[0], p0, p1, p2, p3, p4, p5);
and and6_2(w16, g0, p1, p2, p3, p4, p5);
and and6_3(w17, g1, p2, p3, p4, p5);
and and6_4(w18, g2, p3, p4, p5);
and and6_5(w19, g3, p4, p5);
and and6_6(w20, g4, p5);
or or6(carry[6], g5,w15,w16,w17,w18,w19,w20);

and and7_1(w21, carry[0], p0, p1, p2, p3, p4, p5, p6);
and and7_2(w22, g0, p1, p2, p3, p4, p5, p6);
and and7_3(w23, g1, p2, p3, p4, p5, p6);
and and7_4(w24, g2, p3, p4, p5, p6);
and and7_5(w25, g3, p4, p5, p6);
and and7_6(w26, g4, p5, p6);
and and7_7(w27, g5, p6);
or or7(carry[7], g6,w21,w22,w23,w24,w25,w26,w27);

and and8_1(P, p0, p1, p2, p3, p4, p5, p6, p7);
and and8_2(w29, g0, p1, p2, p3, p4, p5, p6, p7);
and and8_3(w30, g1, p2, p3, p4, p5, p6, p7);
and and8_4(w31, g2, p3, p4, p5, p6, p7);
and and8_5(w32, g3, p4, p5, p6, p7);
and and8_6(w33, g4, p5, p6, p7);
and and8_7(w34, g5, p6, p7);
and and8_8(w35, g6, p7);

or or8(G, g7,w29,w30,w31,w32,w33,w34,w35);
endmodule