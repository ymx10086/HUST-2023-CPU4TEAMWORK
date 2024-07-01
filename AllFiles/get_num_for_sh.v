`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/19 15:11:35
// Design Name: 
// Module Name: get_num_for_sh
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


module get_num_for_sh(in,sel,data,out);
    input [15:0] in;
    input sel;
    input [31:0] data;
    output reg[31:0] out;
    always@(*) begin
        if(sel == 0) out = {data[31:16],in};
        else out = {in,data[15:0]};
    end
endmodule
