`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 08:31:08
// Design Name: 
// Module Name: zero_extender
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


module zero_extender(in,out);
    parameter FROM_WIDTH = 12;
    parameter TO_WIDTH = 32;
    input [FROM_WIDTH - 1:0] in;
    output reg[TO_WIDTH - 1:0] out;
    always@(in) begin
        out = {{(TO_WIDTH-FROM_WIDTH){1'b0}},in};
    end
endmodule
