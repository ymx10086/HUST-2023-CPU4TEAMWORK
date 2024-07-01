`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 09:11:09
// Design Name: 
// Module Name: register
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


module register(clk,rst,en,in,out);
    parameter WIDTH = 32;
    input clk, rst, en;
    input [WIDTH-1:0] in;
    output reg [WIDTH-1:0] out;
    initial begin
        out = 0;
    end
    
    always @(posedge clk) begin
      if (rst) out <= 0;
      else if (en) out <= in;
    end   
endmodule
