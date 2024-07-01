`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/19 15:11:21
// Design Name: 
// Module Name: get_num_for_sb
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


module get_num_for_sb(in,sel,data,out);
    input [7:0] in;
    input [1:0] sel;
    input [31:0] data;
    output reg[31:0] out;
    always@(*) begin
        case(sel)
            2'b00:
                begin
                    out = {data[31:8],in};
                end
            2'b01:
                begin
                    out = {data[31:16],in,data[7:0]};
                end
            2'b10:
                begin
                    out = {data[31:24],in,data[15:0]};
                end
            2'b11:
                begin
                    out = {in,data[23:0]};
                end
        endcase
    end
    
endmodule
