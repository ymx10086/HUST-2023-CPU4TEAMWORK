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
      // 等待一段时间，然后释放重置信号
      #100 rst = 0; //t=10T
      // 等待一段时间后开始接收数据
  
      $finish; // 结束仿真
    end

endmodule
