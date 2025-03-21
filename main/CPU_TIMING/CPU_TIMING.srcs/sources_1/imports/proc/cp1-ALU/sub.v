module sub(in1, in2, cin, out, overflow, isNotEqual, isLessThan);
input [31:0] in1, in2;
input cin;
output [31:0] out;
output overflow, isNotEqual, isLessThan;
wire [31:0] notin2, notout;
wire w0,or0,or1,or2,or3,not31; 

not_32_bit not_in_2(.in(in2), .out(notin2));
sum subtractor(.in1(in1), .in2(notin2), .cin(cin), .out(out), .overflow(overflow));

not not_0(not31,out[31]);
assign isLessThan = overflow ? not31 : out[31];

or or_0(or0, out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7]);
or or_1(or1, out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15]);
or or_2(or2, out[16],out[17],out[18],out[19],out[20],out[21],out[22],out[23]);
or or_3(or3, out[24],out[25],out[26],out[27],out[28],out[29],out[30],out[31]);
or or_4(isNotEqual, or0,or1,or2,or3);

endmodule