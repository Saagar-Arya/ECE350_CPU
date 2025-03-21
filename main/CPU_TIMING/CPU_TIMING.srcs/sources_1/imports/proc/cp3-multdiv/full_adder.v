module full_adder(a,b,cin,s,cout);
    input a,b,cin;
    output s,cout;
    wire xora_b, anda_b, and_ab_cin;

    xor xor1(xora_b,a,b);
    xor xor2(s,xora_b,cin); 

    and and1(anda_b,a,b);
    and and2(and_ab_cin,xora_b,cin);
    or or1(cout,anda_b,and_ab_cin);

endmodule