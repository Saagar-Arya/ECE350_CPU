module sum_32_bit(in1, in2, cin, out);
    input [31:0] in1, in2, cin;
    output [31:0] out;
    sum_8_bit sum0(.in1(in1[7:0]),.in2(in2[7:0]),.cin(cin[7:0]),.out(out[7:0]));
    sum_8_bit sum1(.in1(in1[15:8]),.in2(in2[15:8]),.cin(cin[15:8]),.out(out[15:8]));
    sum_8_bit sum2(.in1(in1[23:16]),.in2(in2[23:16]),.cin(cin[23:16]),.out(out[23:16]));
    sum_8_bit sum3(.in1(in1[31:24]),.in2(in2[31:24]),.cin(cin[31:24]),.out(out[31:24]));

endmodule