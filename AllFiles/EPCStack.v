`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 09:52:55
// Design Name: 
// Module Name: EPCStack
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


module EPCStack(clk,en,rst,sel,EPCin,EPCout);
    input clk,en,rst,sel; // sel == 1, pop; sel == 0, push
    input [31:0] EPCin;
    output [31:0] EPCout;
    
    reg [31:0] stack[3:0];
    reg [2:0] num;
    
    assign EPCout = stack[num - 3'd1];
    
    initial begin: block_1
        integer i;
        for(i = 0; i < 4; i = i + 1)
            stack[i] = 32'd0;
        num = 3'd0;
    end
    always @(posedge clk) begin
        if (rst) begin: block_2
                integer i;
                for(i = 0; i < 4; i = i + 1)
                    stack[i] = 32'd0;
                num = 3'd0;
        end
        else if (en) begin
            if(sel == 0) begin
                stack[num] <= EPCin;
                num <= num + 3'd1;
            end
            else begin
                if(num != 0) begin
                    num <= num - 3'd1;
                    stack[num] <= 32'd0;
                end
            end
        end
    end
endmodule
