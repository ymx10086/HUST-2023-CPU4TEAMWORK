`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/04 13:10:34
// Design Name: 
// Module Name: _7Seg_Driver_Choice
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


module _7Seg_Driver_Choice(clk, LED, SEG, AN);
    input clk;    // 16位拨动开关
    input [31:0] LED;   // 32位LED显示
    output [7:0] SEG;   // 7段数码管驱动，低电平有效
    output [7:0] AN;    // 7段数码管片选信号，低电平有效
    
    wire clk_n;         // 分频后时钟信号
    wire [3:0] data;    // 数码管数据
    wire [2:0] num;     // 计数器计数
    divider #(10_000) divider(.clk(clk), .clk_N(clk_n));
    counter #(3) counter(.clk(clk_n),.rst_n(1'b0),.en(1'b1),.dout(num));
    decoder_38 decoder_38(.A(num),.Y(AN));
    seg7 s7(.display_num(LED),.cs(num),.data(data));
    pattern  pat(.data(data),.pat(SEG));
       
endmodule

