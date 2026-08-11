`timescale 1ns/1ps

module half_wave_rectifier (
    input  wire clk,
    input  wire reset,
    input  wire signed [7:0] ac_input,
    output reg  [7:0] dc_output
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            dc_output <= 8'd0;
        else if (ac_input > 0)
            dc_output <= ac_input;
        else
            dc_output <= 8'd0;
    end

endmodule