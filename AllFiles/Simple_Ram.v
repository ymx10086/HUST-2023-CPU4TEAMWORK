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


module Simple_Ram(clk,rst,data);
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 30;
    input clk,rst; 
    output reg [DATA_WIDTH - 1:0] data;
    
    reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
    
    initial begin: block_1
        begin: block_4
            //$readmemh("D:/CO_Team_Data/fc1_weight.hex",ram,0);//fc1_weight
            $readmemh("D:/CO_Team_Data/fc1_bias.hex",ram,0);//fc1_bias
            //$readmemh("D:/CO_Team_Data/fc2_weight.hex",ram,314000);//fc2_weight
            //$readmemh("D:/CO_Team_Data/fc2_bias.hex",ram,324400);//fc2_bias
        end
    end
    
    always@(posedge clk)
    begin
        data <= ram[1];
    end
endmodule
