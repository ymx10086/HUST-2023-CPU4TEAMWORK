`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 07:32:57
// Design Name: 
// Module Name: Subber
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


module Subber(X,Y,Result,inf);
    input [31:0] X,Y;
    output [31:0] Result;
    output inf;
    wire [31:0] op_X,op_Y;
    wire sign,perform,zero,differ;
    wire [7:0]  ExponentX,ExponentY,diffexp,after_add_Y_exp,Exponent_sub;
    wire [23:0] MantissaX,MantissaY,after_shift_Y,significand_sub_complement;
    wire [24:0] Mantissa_add, Mantissa_sub,Mantissa_out;
    wire [30:0] add_res, sub_res;
    assign {op_X,op_Y} = (X[30:0] < Y[30:0]) ? {Y,X}:{X,Y};
    assign sign = ~((~X[31] & Y[31]) | (~X[31] & (X[30:0] > Y[30:0])) | (X[31] & Y[31] & (X[30:0] < Y[30:0])));
    assign zero = (X == Y);
    assign differ = X[31]^Y[31];
    assign ExponentX = op_X[30:23];
    assign ExponentY = op_Y[30:23];
    assign inf = (&op_X[30:23])|(&op_Y[30:23])|(&sub_res[30:23]);
    assign MantissaX = (|op_X[30:23]) ?{1'b1,op_X[22:0]}:{1'b0,op_X[22:0]};
    assign MantissaY = (|op_Y[30:23]) ?{1'b1,op_Y[22:0]}:{1'b0,op_Y[22:0]};
    
    //对阶
    assign diffexp = op_X[30:23] - op_Y[30:23];
    assign after_shift_Y = MantissaY >> diffexp; //小数尾数右移
    assign after_add_Y_exp = ExponentY + diffexp; //小数阶码增大
    
     //减法
    assign perform = (op_X[30:23] == after_add_Y_exp); //Checking exponents are same or not
    assign significand_sub_complement = perform ?( ~(after_shift_Y) + 24'd1) : 24'd0 ; 
    assign Mantissa_sub = perform ? ({1'b0,MantissaX} + {1'b0,significand_sub_complement}) : 25'd0;
    assign Mantissa_add = perform ? ({1'b0,MantissaX} + {1'b0,after_shift_Y}) : 25'd0; 
    priority_Encoder pe(Mantissa_sub,op_X[30:23],Mantissa_out,Exponent_sub);
    
    assign sub_res[22:0] = differ ? (Mantissa_add[24] ? Mantissa_add[23:1]: Mantissa_add[22:0]):Mantissa_out[22:0];
    assign sub_res[30:23] = differ ? (Mantissa_add[24] ? (op_X[30:23] + 8'd1):op_X[30:23]):Exponent_sub;    
    assign Result = zero ? {X[31],31'd0}: inf ? {sign,31'h7f800000}:{sign,sub_res};
    
endmodule
