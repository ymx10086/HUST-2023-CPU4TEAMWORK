`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 12:09:03
// Design Name: 
// Module Name: check_type
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


module check_type(in,out);
    input [31:0] in;
    output reg[31:0] out;
    wire [7:0] exp;
    wire [22:0] mantissa;
    wire flag;
    wire informal,inf,zero,nan;
    assign exp = in[30:23];
    assign mantissa = in[22:0];
    assign flag = in[31];
    assign informal = (~(|in[30:23])) & (|in[22:0]); // 阶码全零，尾数非零，非规格化数
    assign inf = (&in[30:23]) & (~(|in[22:0])); //阶码全1，尾数为零，inf
    assign zero = (~(|in[30:0])); //阶码全0，尾数全0
    assign nan = (&in[30:23]) & (in[22:0] != 23'd0); //阶码全1，尾数非零
    
    always @(*)begin
        if(nan == 1'b1) begin
            if(in[22] == 1'b1) out = 32'd512;
            else out = 32'd256;
        end
        else if(flag == 1'b1) begin
            if(inf == 1'b1) out = 32'd1;
            else if(informal == 1'b1) out = 32'd4;
            else if(zero == 1'b1) out = 32'd8;
            else out = 32'd2;
        end
        else begin
            if(inf == 1'b1) out = 32'd128;
            else if(informal == 1'b1) out = 32'd32;
            else if(zero == 1'b1) out = 32'd16;
            else out = 32'd64;
        end
    end
    
endmodule
