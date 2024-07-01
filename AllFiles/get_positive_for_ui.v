`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 17:35:54
// Design Name: 
// Module Name: get_positive_for_ui
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


module get_positive_for_ui(in,cnt,out);
    input [31:0] in;
    input [7:0] cnt;
    output reg[31:0] out;
    reg [31:0] after_shift;
    reg [7:0] after_add1, after_add2;
    reg [23:0] mantissa;
    always @(*) begin
        after_shift = in << (8'd32 - cnt);
        after_add1 = cnt + 8'd127;
        after_add2 = cnt + 8'd128;
        mantissa = {1'b0,after_shift[31:9]} + {23'd0,after_shift[8]};
        out = mantissa[23] ? {1'b0,after_add2[7:0], mantissa[22:0]}:{1'b0,after_add1[7:0], mantissa[22:0]};
    end
endmodule
