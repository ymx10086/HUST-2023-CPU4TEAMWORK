`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/09 15:56:42
// Design Name: 
// Module Name: Check_Read
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


module Check_Read();

reg clk;
reg rst;
wire [31:0] data;

Simple_Ram SR(.clk(clk),.rst(rst),.data(data));

always begin
    #5 clk = ~clk;
end

initial begin
      clk = 0;
      rst = 1;
      // �ȴ�һ��ʱ�䣬Ȼ���ͷ������ź�
      #100 rst = 0; //t=10T
      // �ȴ�һ��ʱ���ʼ��������
  
      $finish; // ��������
    end

endmodule
