`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 07:18:25
// Design Name: 
// Module Name: DFF
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


module DFF(D,clk,rst,en,State);
    input D,rst,en;
    input clk;
    output reg State;
    initial begin
        State = 0;
    end
    always@(posedge clk) begin
        if(rst) State <= 0;
        else if(en) State <= D;
    end
endmodule
