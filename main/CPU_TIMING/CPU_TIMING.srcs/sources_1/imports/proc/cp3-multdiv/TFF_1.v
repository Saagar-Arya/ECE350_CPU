module TFF_1(input clock, input t, input en, input clr, output q);
wire w1,w2,w3;

and(w1,q,~t);
and(w2,~q,t);
or (w3,w1,w2);
dffe_ref reg0(.q(q), .d(w3), .clk(clock), .en(en), .clr(clr));

endmodule