`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 08:36:41
// Design Name: 
// Module Name: logical_left
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


module logical_left(in,bitnum,out);
    parameter DATA_WIDTH = 32;
    parameter NUM_WIDTH = 5;
    input [DATA_WIDTH-1:0] in;
    input [NUM_WIDTH-1:0] bitnum;
    output [DATA_WIDTH-1:0] out;
    
    assign out = in << bitnum;
endmodule
