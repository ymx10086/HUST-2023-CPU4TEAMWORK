`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/18 16:00:58
// Design Name: 
// Module Name: Iteration
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


module Iteration(operand_1,operand_2,solution);
    input [31:0] operand_1;
    input [31:0] operand_2;
    output [31:0] solution;
    
    wire [31:0] Intermediate_Value1,Intermediate_Value2;
    
    Multiplier M1(.X(operand_1),.Y(operand_2),.Result(Intermediate_Value1));
    
    //32'h4000_0000 -> 2.
    Adder A1(.a(32'h4000_0000),.b({1'b1,Intermediate_Value1[30:0]}),.out(Intermediate_Value2));
    
     Multiplier M2(.X(operand_1),.Y(Intermediate_Value2),.Result(solution));
endmodule
