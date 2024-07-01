`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 09:35:31
// Design Name: 
// Module Name: INTStack
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


module INTStack(clk,en,rst,sel,IntNo,IntNoPre);
    input clk,en,rst,sel; // sel == 1, pop; sel == 0, push
    input [1:0] IntNo;
    output [1:0] IntNoPre;
    
    reg [1:0] stack[3:0];
    reg [2:0] num;
    
    assign IntNoPre = (num > 0) ? stack[num - 3'd1] : 2'd0;
    
    initial begin: block_1
        integer i;
        for(i = 0; i < 4; i = i + 1)
            stack[i] = 2'd0;
        num = 3'd0;
    end
    always @(posedge clk) begin
        if (rst) begin: block_2
                integer i;
                for(i = 0; i < 4; i = i + 1)
                    stack[i] = 2'd0;
                num = 3'd0;
        end
        else if (en) begin
            if(sel == 0) begin
                stack[num] <= IntNo;
                num <= num + 3'd1;
            end
            else begin
                if(num != 0) begin
                    num <= num - 3'd1;
                    stack[num] <= 2'd0;
                end
            end
        end
    end
endmodule
