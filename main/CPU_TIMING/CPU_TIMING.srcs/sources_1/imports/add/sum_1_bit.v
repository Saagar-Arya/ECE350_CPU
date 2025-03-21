module sum_1_bit(in1, in2, cin, out);
    input in1, in2, cin;
    output out;
    wire w1;
    xor sum0(w1, in1, in2);
    xor sum1(out, w1, cin);
endmodule