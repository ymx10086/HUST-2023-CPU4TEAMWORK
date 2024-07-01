`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/03 23:05:03
// Design Name: 
// Module Name: Regifile
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


module Regifile(Din,Clk,WE,W,Addr1,Addr2,R1,R2,reg0);
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 5;
    input [DATA_WIDTH-1:0] Din;
    input Clk,WE;
    input [ADDR_WIDTH-1:0] W,Addr1,Addr2;
    output [DATA_WIDTH-1:0] R1,R2;
    output [DATA_WIDTH-1:0] reg0;
    reg [DATA_WIDTH-1:0] regs[2**ADDR_WIDTH-1:0];
    initial begin:block_1
        integer i;
        for(i = 0; i < 2**ADDR_WIDTH; i = i + 1)
            regs[i] = 0;
//        regs[2] = 32'd2048;
    end
    assign R1 = regs[Addr1];
    assign R2 = regs[Addr2];
    assign reg0 = regs[10];
    always @(posedge Clk) begin
        if (WE && W != 0)
          regs[W] <=  Din;
    end
endmodule
