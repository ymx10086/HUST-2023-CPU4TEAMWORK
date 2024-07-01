`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 07:54:28
// Design Name: 
// Module Name: clr_generator
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


module clr_generator(IntNo,clk,uret,IntrRequest,clrNo);
    input [1:0] IntNo;
    input clk,uret;
    input IntrRequest;
    output [1:0] clrNo;
    
//    // 单级中断
//    wire [1:0] IntNoOut;
//    register #(2) register_IntNo(.clk(clk),.rst(rst),.en(IntrRequest),.in(IntNo),.out(IntNoOut));
//    assign clrNo = (uret == 1) ? IntNoOut: 0;
    // 多级中断
    assign clrNo = (uret == 1) ? IntNo: 0;
    
endmodule
