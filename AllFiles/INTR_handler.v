`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 07:22:41
// Design Name: 
// Module Name: INTR_handler
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


module INTR_handler(IRA,IRB,IRC,IntR,IntNo,IntAddr);
    parameter WIDTH = 32;
    input IRA,IRB,IRC;
    output IntR;
    output reg[1:0] IntNo;
    output reg[WIDTH-1:0] IntAddr;
    
    assign IntR = IRA | IRB | IRC;
    always@(*) begin
        if(IRC) begin
            IntNo = 2'd3;
//            IntAddr = 32'h31f4; // 单级中断
//            IntAddr = 32'h3204; // 多级中断
            IntAddr = 32'h35f0; //benchmark + 中断
        end
        else if(IRB) begin
            IntNo = 2'd2;
//            IntAddr = 32'h3150; //单级中断
//            IntAddr = 32'h3158; // 多级中断
            IntAddr = 32'h3544; //benchmark + 中断
        end
        else if(IRA) begin
            IntNo = 2'd1;
//            IntAddr = 32'h30ac; //单级中断 + 多级中断
            IntAddr = 32'h3498; //benchmark + 中断
        end
        else begin
            IntNo = 2'd0;
            IntAddr = 32'h0;
        end
    end
endmodule
