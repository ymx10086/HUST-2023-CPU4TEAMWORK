`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 13:03:15
// Design Name: 
// Module Name: decoder_38
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


module decoder_38(A, Y);
  input [2:0] A;
  output reg [7:0] Y;

  always @(A)
  begin
    case(A)
      3'd0: Y = 8'b1111_1110;
      3'd1: Y = 8'b1111_1101;
      3'd2: Y = 8'b1111_1011;
      3'd3: Y = 8'b1111_0111;
      3'd4: Y = 8'b1110_1111;
      3'd5: Y = 8'b1101_1111;
      3'd6: Y = 8'b1011_1111;
      3'd7: Y = 8'b0111_1111;
    endcase
  end
endmodule
