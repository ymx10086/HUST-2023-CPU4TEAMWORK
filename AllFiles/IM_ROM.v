`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/03 22:21:56
// Design Name: 
// Module Name: IM_ROM
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


module IM_ROM(addr,data);
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 10;
    input [ADDR_WIDTH - 1:0] addr;
    output [DATA_WIDTH - 1:0] data;
    // ÉêÃ÷´æ´¢Æ÷Êý
    reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH - 1:0];
    initial begin
        $readmemh("D:/work/CO_Team_Data/predict_for_board_with_f.hex", rom);
    end
    assign data = rom[addr];
endmodule
