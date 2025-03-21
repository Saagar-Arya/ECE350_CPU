module TFF_2(input clock, input en, input clr, output [1:0] q);
    TFF_1 tff0(.clock(clock), .t(1'b1), .en(en), .clr(clr), .q(q[0]));
    TFF_1 tff1(.clock(clock), .t(q[0]), .en(en), .clr(clr), .q(q[1]));

endmodule