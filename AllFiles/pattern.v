`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 12:58:59
// Design Name: 
// Module Name: pattern
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


module pattern(data,pat);
    input [3:0] data;
    output reg[7:0] pat;
    always@(data)
        begin
            case(data)
                4'b0000 : pat = 8'b11000000;
                4'b0001 : pat = 8'b11111001;
                4'b0010 : pat = 8'b10100100;
                4'b0011 : pat = 8'b10110000;
                4'b0100 : pat = 8'b10011001;
                4'b0101 : pat = 8'b10010010;
                4'b0110 : pat = 8'b10000010;
                4'b0111 : pat = 8'b11111000;
                4'b1000 : pat = 8'b10000000;
                4'b1001 : pat = 8'b10011000;
                4'b1010 : pat = 8'b10001000;
                4'b1011 : pat = 8'b10000011;
                4'b1100 : pat = 8'b11000110;
                4'b1101 : pat = 8'b10100001;
                4'b1110 : pat = 8'b10000110;
                4'b1111 : pat = 8'b10001110;
            endcase
        end
endmodule
