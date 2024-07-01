`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 07:32:45
// Design Name: 
// Module Name: Adder
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


module Adder(a,b,out);
    
//    input [31:0] a,b;
//    output reg[31:0] out;
//    wire [31:0] op_X,op_Y;
//    wire sign,inf,perform;
//    wire [7:0]  ExponentX,ExponentY,diffexp,after_add_Y_exp;
//    wire [23:0] MantissaX,MantissaY,after_shift_Y;
//    wire [24:0] Mantissa_add;
//    wire [30:0] add_res;
//    wire [31:0] result_sub1, result_sub2;
    
//    Subber sub1(.X({1'b0,a[30:0]}),.Y({1'b0,b[30:0]}),.Result(result_sub1));
//    Subber sub2(.X({1'b0,b[30:0]}),.Y({1'b0,a[30:0]}),.Result(result_sub2));
    
//    assign {op_X,op_Y} = (a[30:0] < b[30:0]) ? {b,a}:{a,b}; // 保证X >= Y
//    assign sign = ~((~a[31] & ~b[31])|(a[31] & ~b[31] & (a[30:0] < b[30:0]))|(~a[31] & b[31] & (a[30:0] > b[30:0])));
//    assign ExponentX = op_X[30:23];
//    assign ExponentY = op_Y[30:23];
//    assign inf = (&op_X[30:23])|(&op_Y[30:23]);
//    assign MantissaX = (|op_X[30:23]) ?{1'b1,op_X[22:0]}:{1'b0,op_X[22:0]};
//    assign MantissaY = (|op_Y[30:23]) ?{1'b1,op_Y[22:0]}:{1'b0,op_Y[22:0]};
    
//    //对阶
//    assign diffexp = op_X[30:23] - op_Y[30:23];
//    assign after_shift_Y = MantissaY >> diffexp; //小数尾数右移
//    assign after_add_Y_exp = ExponentY + diffexp; //小数阶码增大
    
//    //加法
//    assign perform = (op_X[30:23] == after_add_Y_exp); //Checking exponents are same or not
//    assign Mantissa_add = perform ? ({1'b0,MantissaX} + {1'b0,after_shift_Y}) : 25'd0; 
//    assign add_res[22:0] = Mantissa_add[24] ?  Mantissa_add[23:1] : Mantissa_add[22:0];
//    assign add_res[30:23] = Mantissa_add[24] ? (op_X[30:23] + 8'd1) : op_X[30:23];
////    assign out = inf ? {sign,31'h7f80000}:{sign,add_res}; 
    
//    always@(*)begin
//        if(inf == 1) out = {sign,31'h7f800000};
//        else if(a[31] == 1 && b[31] == 0) begin
//            if(a[30:0] < b[30:0]) out = result_sub2;
//            else if(a[30:0] > b[30:0]) out = {1'b1,result_sub1[30:0]};
//            else out = 32'h80000000;
//        end
//        else if(a[31] == 0 && b[31] == 1) begin
//            if(a[30:0] < b[30:0]) out = {1'b1, result_sub2[30:0]};
//            else if(a[30:0] > b[30:0]) out = result_sub1;
//            else out = 32'd0;
//        end
//        else begin
//            if(&add_res[30:23]) out = {sign,31'h7f800000};
//            else out = {sign,add_res};
//        end
//    end

    input  [31:0] a, b;
    output [31:0] out;
    
    wire [31:0] out;
    reg a_sign;
    reg [7:0] a_exponent;
    reg [23:0] a_mantissa;
    reg b_sign;
    reg [7:0] b_exponent;
    reg [23:0] b_mantissa;

      reg o_sign;
      reg [7:0] o_exponent;
      reg [24:0] o_mantissa;
    
      reg [7:0] diff;
      reg [23:0] tmp_mantissa;
      reg [7:0] tmp_exponent;
    
    
      reg  [7:0] i_e;
      reg  [24:0] i_m;
      wire [7:0] o_e;
      wire [24:0] o_m;
    
      addition_normaliser norm1
      (
        .in_e(i_e),
        .in_m(i_m),
        .out_e(o_e),
        .out_m(o_m)
      );
    
      assign out[31] = o_sign;
      assign out[30:23] = o_exponent;
      assign out[22:0] = o_mantissa[22:0];
    
      always @ ( * ) begin
            a_sign = a[31];
            if(a[30:23] == 0) begin
                a_exponent = 8'b00000001;
                a_mantissa = {1'b0, a[22:0]};
            end else begin
                a_exponent = a[30:23];
                a_mantissa = {1'b1, a[22:0]};
            end
            b_sign = b[31];
            if(b[30:23] == 0) begin
                b_exponent = 8'b00000001;
                b_mantissa = {1'b0, b[22:0]};
            end else begin
                b_exponent = b[30:23];
                b_mantissa = {1'b1, b[22:0]};
            end
        if (a_exponent == b_exponent) begin // Equal exponents
          o_exponent = a_exponent;
          if (a_sign == b_sign) begin // Equal signs = add
            o_mantissa = a_mantissa + b_mantissa;
            //Signify to shift
            o_mantissa[24] = 1;
            o_sign = a_sign;
          end else begin // Opposite signs = subtract
            if(a_mantissa > b_mantissa) begin
              o_mantissa = a_mantissa - b_mantissa;
              o_sign = a_sign;
            end else begin
              o_mantissa = b_mantissa - a_mantissa;
              o_sign = b_sign;
            end
          end
        end else begin //Unequal exponents
          if (a_exponent > b_exponent) begin // A is bigger
            o_exponent = a_exponent;
            o_sign = a_sign;
            diff = a_exponent - b_exponent;
            tmp_mantissa = b_mantissa >> diff;
            if (a_sign == b_sign)
              o_mantissa = a_mantissa + tmp_mantissa;
            else
               o_mantissa = a_mantissa - tmp_mantissa;
          end else if (a_exponent < b_exponent) begin // B is bigger
            o_exponent = b_exponent;
            o_sign = b_sign;
            diff = b_exponent - a_exponent;
            tmp_mantissa = a_mantissa >> diff;
            if (a_sign == b_sign) begin
              o_mantissa = b_mantissa + tmp_mantissa;
            end else begin
              o_mantissa = b_mantissa - tmp_mantissa;
            end
          end
        end
        if(o_mantissa[24] == 1) begin
          o_exponent = o_exponent + 1;
          o_mantissa = o_mantissa >> 1;
        end else if((o_mantissa[23] != 1) && (o_exponent != 0)) begin
          i_e = o_exponent;
          i_m = o_mantissa;
          o_exponent = o_e;
          o_mantissa = o_m;
        end
      end

endmodule
