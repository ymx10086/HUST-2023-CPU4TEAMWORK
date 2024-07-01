`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/03 23:13:19
// Design Name: 
// Module Name: MEM_RAM
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


module MEM_RAM(addr,clk,rst,str,MDin,data);
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 20;
    input [ADDR_WIDTH - 1:0] addr;
    input clk,str,rst; 
    input [DATA_WIDTH - 1:0] MDin;
    output [DATA_WIDTH - 1:0] data;
    reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
   
//    initial begin: block_1
//        integer i;
//        for(i = 0; i < 2**ADDR_WIDTH; i = i + 1)
//        begin
//            ram[i] = 0;
//        end
//    end
    
    assign data = ram[addr];
    always @(posedge clk) begin
       if ( !rst && str)
          ram[addr] <=  MDin;
    end
//    always @(posedge clk)
//        data <= ram[addr];  //¶Á
    
endmodule
