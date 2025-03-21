module sum_tb();
wire signed [31:0] in1, in2;
wire cin;

wire [31:0] out;
wire overflow;

assign in1 = -32'd2147483647;
assign in2 = -32'd247483647;
assign cin = 1'd0;

sum sum1(.in1(in1), .in2(in2), .cin(cin), .out(out), .overflow(overflow));

initial begin
        #1;
        $display("in1:%b in2:%b cin:%b overflow:%b out:%b",in1, in2,cin, overflow, out);
    end


endmodule