`timescale 1ns/1ps

module register_32_bit_tb;
    reg clk, en, clr;
    reg [31:0] d;
    wire [31:0] q;

    // Instantiate the register module
    register_32_bit uut (
        .q(q),
        .d(d),
        .clk(clk),
        .en(en),
        .clr(clr)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        en = 0;
        clr = 0;
        d = 32'h00000000;

        // Apply reset
        #10 clr = 1;
        #10 clr = 0;
        
        // Test writing to register
        #10 en = 1; d = 32'hA5A5A5A5; // Write pattern
        #10 en = 0; // Disable write
        #10 d = 32'hFFFFFFFF; // Change input, should not update q
        #10 en = 1; // Enable write
        #10 d = 32'h12345678; // New data
        
        // Test clear functionality
        #10 clr = 1;
        #10 clr = 0;
        
        // Finish simulation
        #50 $finish;
    end

    // Monitor output changes
    initial begin
        $monitor("Time: %0t | clr: %b | en: %b | d: %h | q: %h", $time, clr, en, d, q);
    end
endmodule
