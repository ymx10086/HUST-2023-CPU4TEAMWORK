`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 19:51:26
// Design Name: 
// Module Name: MEM_COMBINES
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


module MEM_COMBINES(addr,clk,rst,Memwrite,FMemwrite,MDin,FMDin,InputData,data,Fdata);
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 17;
    input [ADDR_WIDTH - 1:0] addr;
    input clk,rst,Memwrite,FMemwrite; 
    input [25087:0] InputData;
    input [DATA_WIDTH - 1:0] MDin;
    input [DATA_WIDTH - 1:0] FMDin;
    output reg[DATA_WIDTH - 1:0] data;
    output reg[DATA_WIDTH - 1:0] Fdata;
    (*ram_style = "block"*) reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
   
    // reg [ADDR_WIDTH - 1:0] InputAddr;
    // reg [25087:0] tmp;
    
    initial begin
        $readmemh("D:/work/CO_Team_Data/fc1_weight.hex",ram,1024);//fc1_weight
        $readmemh("D:/work/CO_Team_Data/fc1_bias.hex",ram,79424);//fc1_bias
        $readmemh("D:/work/CO_Team_Data/fc2_weight.hex",ram,79524);//fc2_weight
        $readmemh("D:/work/CO_Team_Data/fc2_bias.hex",ram,82124);//fc2_bias
        $readmemh("D:/work/CO_Team_Data/input.hex",ram,82150); // input
    end
    
//    always @(posedge clk) begin
//        if(rst) begin
//            InputAddr = 17'd82150;
//            tmp <= InputData;
//        end
//        else begin
//            if (InputAddr >= 82150 && InputAddr <= 82933) begin
//                ram[InputAddr] <= tmp[DATA_WIDTH-1:0];
//                tmp <= {{(32){1'b0}},tmp[25087:32]};
//                InputAddr = InputAddr + 1;
//            end
//        end
//    end
    always @(negedge clk) begin
       if (Memwrite)
          ram[addr] <=  MDin;
       else if (FMemwrite)
          ram[addr] <=  FMDin;
    end
    
    
    always @(negedge clk) begin
        data <= ram[addr];  //¶Á
        Fdata <= ram[addr];
    end
    
endmodule
