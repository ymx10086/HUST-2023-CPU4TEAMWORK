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
    input clk;    // 16λ��������
    input [31:0] LED;   // 32λLED��ʾ
    output [7:0] SEG;   // 7��������������͵�ƽ��Ч
    output [7:0] AN;    // 7�������Ƭѡ�źţ��͵�ƽ��Ч
    
    wire clk_n;         // ��Ƶ��ʱ���ź�
    wire [3:0] data;    // ���������
    wire [2:0] num;     // ����������
    divider #(10_000) divider(.clk(clk), .clk_N(clk_n));
    counter #(3) counter(.clk(clk_n),.rst_n(1'b0),.en(1'b1),.dout(num));
    decoder_38 decoder_38(.A(num),.Y(AN));
    seg7 s7(.display_num(LED),.cs(num),.data(data));
    pattern  pat(.data(data),.pat(SEG));
       
endmodule

