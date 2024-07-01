`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 07:36:25
// Design Name: 
// Module Name: seg7
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


module seg7(display_num,cs,data);
    input [31:0] display_num;
    input [2:0] cs;
    output reg[3:0] data;
    
    always @* begin
        case(cs)
            3'd0: data = display_num[3:0];
            3'd1: data = display_num[7:4];
            3'd2: data = display_num[11:8];
            3'd3: data = display_num[15:12];
            3'd4: data = display_num[19:16];
            3'd5: data = display_num[23:20];
            3'd6: data = display_num[27:24];
            3'd7: data = display_num[31:28];
            default: data = 4'd0;
        endcase
    end
endmodule
