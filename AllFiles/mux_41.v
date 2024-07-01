`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 12:45:56
// Design Name: 
// Module Name: mux_41
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


module mux_41(a, b, c, d, sel, out);
    parameter DATA_WIDTH = 32;
    input [DATA_WIDTH-1:0] a, b, c, d;
    input [1:0] sel;
    output reg[DATA_WIDTH-1:0] out;
    
    always @(a, b, c, d, sel)
    begin
        case(sel)
            2'b00: out = a;
            2'b01: out = b;
            2'b10: out = c;
            default: out = d;
        endcase
    end
endmodule

