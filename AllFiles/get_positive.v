`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 19:40:27
// Design Name: 
// Module Name: get_positive
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


module get_positive(in,cnt,out);
    input [31:0] in;
    input [7:0] cnt;
    output reg[31:0] out;
    reg [31:0] after_shift;
    reg [7:0] after_add;
    always @(*) begin
        after_shift = in << (8'd32 - cnt);
        after_add = cnt + 8'd127;
        out = {in[31],after_add[7:0],after_shift[31:9]};
    end
endmodule
