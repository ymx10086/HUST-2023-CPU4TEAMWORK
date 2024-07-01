`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 12:37:06
// Design Name: 
// Module Name: divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module divider (clk, clk_N);
    parameter N = 100_000_000;
    input clk;
    output reg clk_N;
    reg [31:0] counter;
    initial begin;
        counter = 32'd0;
        clk_N = 1'd0;
    end
    always @(posedge clk)  begin
        counter = counter + 1;
        if(counter >= N / 2) begin
            clk_N = ~clk_N;
            counter = 32'h0;
        end
    end
endmodule
