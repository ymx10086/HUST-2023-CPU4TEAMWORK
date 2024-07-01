`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 07:11:15
// Design Name: 
// Module Name: counter
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


module counter(clk,rst_n,en,dout);
    parameter DATA_WIDTH = 16;
    input clk, rst_n, en;
    output reg [DATA_WIDTH - 1:0] dout;
    initial begin
        dout = 0;
    end
    always @(posedge clk or posedge rst_n) begin
        if (rst_n) begin
            dout <= 0;
        end
        else if (en) begin
            if(dout < 2 ** DATA_WIDTH - 1) begin
               dout <= dout + 1;
            end
            else begin
               dout <= 0;
            end
        end
    end
endmodule
