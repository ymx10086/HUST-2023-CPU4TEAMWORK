`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 07:33:15
// Design Name: 
// Module Name: Multiplier
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


module Multiplier(X,Y,Result,inf,overflow,underflow);
    input [31:0] X,Y;
    output [31:0] Result;
    output inf, overflow, underflow;
    wire sign, to_normalise, round, zero;
    wire [23:0] MantissaX,MantissaY;
    wire [47:0] Mantissa_mult,Mantissa_mult_after_normalise;
    wire [22:0] res_mantissa;
    wire [8:0] res_exp;
    assign sign = X[31] ^ Y[31];
    assign inf = (&X[30:23])|(&Y[30:23]);
   
   // 阶码全0时为非规格化数
    assign MantissaX = (|X[30:23]) ?{1'b1,X[22:0]}:{1'b0,X[22:0]};
    assign MantissaY = (|Y[30:23]) ?{1'b1,Y[22:0]}:{1'b0,Y[22:0]};
    
    // 尾数计算
    assign Mantissa_mult = MantissaX * MantissaY;
    assign to_normalise = Mantissa_mult[47]; //判断是否需要规格化
    assign round = |Mantissa_mult_after_normalise[22:0]; //判断舍入是否需要进位
    assign Mantissa_mult_after_normalise = to_normalise ? Mantissa_mult : Mantissa_mult << 1; //规格化
    assign res_mantissa = Mantissa_mult_after_normalise[46:24] + {21'b0,(Mantissa_mult_after_normalise[23] & round)}; //舍入
    
    // 阶码计算
    assign res_exp = X[30:23] + Y[30:23] - 8'd127 + to_normalise;
    assign zero = inf ? 1'b0:(res_mantissa == 23'd0 && res_exp == 8'd0) ? 1'b1:1'b0;
    assign overflow = ((res_exp[8] & !res_exp[7]) & !zero) ? 1'b1:1'b0; //上溢
    assign underflow = ((res_exp[8] & res_exp[7]) & !zero) ? 1'b1:1'b0; //下溢
    
    assign Result = inf ? {sign,31'h7f800000}:zero ? {sign,31'd0}:overflow ? {sign,8'hff,23'd0}:underflow ? {sign,31'd0}:{sign,res_exp[7:0],res_mantissa};

endmodule
