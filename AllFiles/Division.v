`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 07:33:55
// Design Name: 
// Module Name: Division
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


module Division(X,Y,Result,inf);

    input [31:0] X,Y;
    output [31:0] Result;
    output inf;
    wire [31:0] Y_after_iteration;
//    Iteration_for_division iter(.in(Y),.out(Y_after_iteration));
//    Multiplier mul(.X(X),.Y(Y_after_iteration),.Result(Result));
    
    wire sign;
    wire [7:0] shift;
    wire [7:0] exponent_a;
    wire [31:0] divisor;
    wire [31:0] operand_a;
    wire [31:0] Intermediate_X0;
    wire [31:0] Iteration_X0;
    wire [31:0] Iteration_X1;
    wire [31:0] Iteration_X2;
    wire [31:0] Iteration_X3;
    wire [31:0] Iteration_X4;
    wire [31:0] solution;
    
    wire [31:0] denominator;
    wire [31:0] operand_a_change;
    
    assign Exception = (&X[30:23]) | (&Y[30:23]);
    
    assign sign = X[31] ^ Y[31];
    
    assign shift = 8'd126 - Y[30:23];
    
    assign divisor = {1'b0,8'd126,Y[22:0]};
    
    assign denominator = divisor;
    
    assign exponent_a = X[30:23] + shift;
    
    assign operand_a = {X[31],exponent_a,X[22:0]};
    
    assign operand_a_change = operand_a;
    
    //32'hC00B_4B4B = (-37)/17
    Multiplier x0(.X(32'hC00B_4B4B),.Y(divisor),.Result(Intermediate_X0));
    
    //32'h4034_B4B5 = 48/17
    Adder X0(.a(Intermediate_X0),.b(32'h4034_B4B5),.out(Iteration_X0));
    
    Iteration X1(Iteration_X0,divisor,Iteration_X1);
    
    Iteration X2(Iteration_X1,divisor,Iteration_X2);
    
    Iteration X3(Iteration_X2,divisor,Iteration_X3);
    
    Iteration X4(Iteration_X3,divisor,Iteration_X4);
    
    Multiplier END(.X(Iteration_X4),.Y(operand_a),.Result(solution));
    
    assign Result = {sign,solution[30:0]};
    
endmodule
