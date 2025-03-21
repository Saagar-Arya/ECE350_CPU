module TFF_6(input clock, input en, input clr, output [5:0] q);
  
    TFF_1 tff0(.clock(clock), .t(1'b1), .en(en), .clr(clr), .q(q[0]));
    TFF_1 tff1(.clock(clock), .t(q[0]), .en(en), .clr(clr), .q(q[1]));
    TFF_1 tff2(.clock(clock), .t(q[0]&q[1]), .en(en), .clr(clr), .q(q[2]));
    TFF_1 tff3(.clock(clock), .t(q[0]&q[1]&q[2]), .en(en), .clr(clr), .q(q[3]));
    TFF_1 tff4(.clock(clock), .t(q[0]&q[1]&q[2]&q[3]), .en(en), .clr(clr), .q(q[4]));
    TFF_1 tff5(.clock(clock), .t(q[0]&q[1]&q[2]&q[3]&q[4]), .en(en), .clr(clr), .q(q[5]));

endmodule