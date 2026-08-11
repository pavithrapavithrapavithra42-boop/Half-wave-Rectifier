`timescale 1ns/1ps

module tb_half_wave_rectifier;

    reg clk;
    reg reset;
    reg signed [7:0] ac_input;
    wire [7:0] dc_output;

    // Instantiate the Half-Wave Rectifier
    half_wave_rectifier uut (
        .clk(clk),
        .reset(reset),
        .ac_input(ac_input),
        .dc_output(dc_output)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        ac_input = 0;

        // Release reset
        #10;
        reset = 0;

        // Positive half-cycle
        #10 ac_input = 20;
        #10 ac_input = 40;
        #10 ac_input = 60;
        #10 ac_input = 80;

        // Negative half-cycle
        #10 ac_input = -20;
        #10 ac_input = -40;
        #10 ac_input = -60;
        #10 ac_input = -80;

        // Another positive half-cycle
        #10 ac_input = 30;
        #10 ac_input = 50;
        #10 ac_input = 70;

        // Negative half-cycle
        #10 ac_input = -30;
        #10 ac_input = -50;
        #10 ac_input = -70;

        #20;

        $finish;
    end

    // Display simulation values
    initial begin
        $monitor("Time = %0t | AC Input = %d | DC Output = %d",
                 $time, ac_input, dc_output);
    end

endmodule