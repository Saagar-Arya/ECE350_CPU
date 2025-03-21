module sum_8_bit(in1, in2, cin, out);
    input [7:0] in1, in2, cin;
    output [7:0] out;
    sum_1_bit sum0(.in1(in1[0]),.in2(in2[0]),.cin(cin[0]),.out(out[0]));
    sum_1_bit sum1(.in1(in1[1]),.in2(in2[1]),.cin(cin[1]),.out(out[1]));
    sum_1_bit sum2(.in1(in1[2]),.in2(in2[2]),.cin(cin[2]),.out(out[2]));
    sum_1_bit sum3(.in1(in1[3]),.in2(in2[3]),.cin(cin[3]),.out(out[3]));
    sum_1_bit sum4(.in1(in1[4]),.in2(in2[4]),.cin(cin[4]),.out(out[4]));
    sum_1_bit sum5(.in1(in1[5]),.in2(in2[5]),.cin(cin[5]),.out(out[5]));
    sum_1_bit sum6(.in1(in1[6]),.in2(in2[6]),.cin(cin[6]),.out(out[6]));
    sum_1_bit sum7(.in1(in1[7]),.in2(in2[7]),.cin(cin[7]),.out(out[7]));

endmodule