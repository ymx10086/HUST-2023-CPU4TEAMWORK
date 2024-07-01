`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/14 22:51:49
// Design Name: 
// Module Name: ALU_float
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


module ALU_float(X,Y,AluOP,Result,Equal,Smaller,BiggerOrEqual,overflow,underflow);
    input [31:0] X,Y;
    input [4:0] AluOP;
    output reg[31:0] Result;
    output reg Smaller,BiggerOrEqual;
    output Equal;
    output overflow,underflow;
    wire [31:0] result_add, result_sub, result_mult, result_f2i, result_i2f, result_ui2f, result_classify;
    
    assign Equal = (X==Y) ? 1'b1 : 1'b0;
    Adder add(.a(X),.b(Y),.out(result_add));
    Subber sub(.X(X),.Y(Y),.Result(result_sub));
    Multiplier mult(.X(X),.Y(Y),.Result(result_mult),.overflow(overflow),.underflow(underflow));
    // Division div(.X(X),.Y(Y),.Result(result_div));
    float_to_i f2i(.in(X),.out(result_f2i));
    i_to_float i2f(.in(X),.out(result_i2f));
    ui_to_float ui2f(.in(X),.out(result_ui2f));
    check_type ct(.in(X),.out(result_classify));
    
    always@(*)begin
        case(AluOP)
            5'b00000: //直送
                begin
                    Result = X;
                end
            5'b00001: //加法
                begin
                    Result = result_add;
                end
            5'b00010: //减法
                begin
                     Result = result_sub;
                end
            5'b00011: //乘法
                begin
                     Result = result_mult;
                end
//            5'b00100: //除法
//                begin
//                    Result = result_div;
//                end
            5'b00101: //开方
                begin
                    
                end
            5'b00110: //float -> int
                begin
                    Result = result_f2i;
                end
            5'b00111: //unsigned int -> float
                begin
                    Result = result_ui2f;
                end
            5'b01000: //int -> float
                begin
                    Result = result_i2f;
                end
            5'b01001: // (X == Y) ? 1 : 0
                begin
                    Result = (X == Y) ? 32'd1 : 32'd0;
                end
            5'b01010: // (X < Y) ? 1 : 0
                begin
                    if(X[31] == 1'b1 && Y[31] == 1'b0) begin
                        Result = 32'd1;
                        BiggerOrEqual = 1'b0;
                        Smaller = 1'b1;
                    end
                    else if(X[31] == 1'b0 && Y[31] == 1'b1) begin
                        Result = 32'd0;
                        BiggerOrEqual = 1'b1;
                        Smaller = 1'b0;
                    end
                    else if(X[31] == 1'b0 && Y[31] == 1'b0) begin
                        Result = (X[30:0] < Y[30:0]) ? 32'd1:32'd0;
                        BiggerOrEqual = (X[30:0] < Y[30:0]) ? 1'b0:1'b1;
                        Smaller = (X[30:0] < Y[30:0]) ? 1'b1:1'b0;
                    end
                    else if(X[31] == 1'b1 && Y[31] == 1'b1) begin
                        Result = (X[30:0] < Y[30:0]) ? 32'd0:32'd1;
                        BiggerOrEqual = (X[30:0] < Y[30:0]) ? 1'b1:1'b0;
                        Smaller = (X[30:0] < Y[30:0]) ? 1'b0:1'b1;
                    end
                end
            5'b01011: // (X <= Y) ? 1 : 0
                begin
                    if(X[31] == 1'b1 && Y[31] == 1'b0) begin
                        Result = 32'd1;
                        BiggerOrEqual = 1'b0;
                        Smaller = 1'b1;
                    end
                    else if(X[31] == 1'b0 && Y[31] == 1'b1) begin
                        Result = 32'd0;
                        BiggerOrEqual = 1'b1;
                        Smaller = 1'b0;
                    end
                    else if(X[31] == 1'b0 && Y[31] == 1'b0) begin
                        Result = (X[30:0] <= Y[30:0]) ? 32'd1:32'd0;
                        BiggerOrEqual = (X[30:0] < Y[30:0]) ? 1'b0:1'b1;
                        Smaller = (X[30:0] < Y[30:0]) ? 1'b1:1'b0;
                    end
                    else if(X[31] == 1'b1 && Y[31] == 1'b1) begin
                        Result = (X[30:0] <= Y[30:0]) ? 32'd0:32'd1;
                        BiggerOrEqual = (X[30:0] < Y[30:0]) ? 1'b1:1'b0;
                        Smaller = (X[30:0] < Y[30:0]) ? 1'b0:1'b1;
                    end
                end
            5'b01100: // MAX(X,Y)
                begin
                    if(X[31] == 1'b1 && Y[31] == 1'b0) begin
                        Result = Y;
                        BiggerOrEqual = 1'b0;
                        Smaller = 1'b1;
                    end
                    else if(X[31] == 1'b0 && Y[31] == 1'b1) begin
                        Result = X;
                        BiggerOrEqual = 1'b1;
                        Smaller = 1'b0;
                    end
                    else if(X[31] == 1'b0 && Y[31] == 1'b0) begin
                        Result = (X[30:0] < Y[30:0]) ? Y:X;
                        BiggerOrEqual = (X[30:0] < Y[30:0]) ? 1'b0:1'b1;
                        Smaller = (X[30:0] < Y[30:0]) ? 1'b1:1'b0;
                    end
                    else if(X[31] == 1'b1 && Y[31] == 1'b1) begin
                        Result = (X[30:0] < Y[30:0]) ? X:Y;
                        BiggerOrEqual = (X[30:0] < Y[30:0]) ? 1'b1:1'b0;
                        Smaller = (X[30:0] < Y[30:0]) ? 1'b0:1'b1;
                    end
                end
            5'b01101: //MIN(X,Y)
                begin
                    if(X[31] == 1'b1 && Y[31] == 1'b0) begin
                        Result = X;
                        BiggerOrEqual = 1'b0;
                        Smaller = 1'b1;
                    end
                    else if(X[31] == 1'b0 && Y[31] == 1'b1) begin
                        Result = Y;
                        BiggerOrEqual = 1'b1;
                        Smaller = 1'b0;
                    end
                    else if(X[31] == 1'b0 && Y[31] == 1'b0) begin
                        Result = (X[30:0] < Y[30:0]) ? X:Y;
                        BiggerOrEqual = (X[30:0] < Y[30:0]) ? 1'b0:1'b1;
                        Smaller = (X[30:0] < Y[30:0]) ? 1'b1:1'b0;
                    end
                    else if(X[31] == 1'b1 && Y[31] == 1'b1) begin
                        Result = (X[30:0] < Y[30:0]) ? Y:X;
                        BiggerOrEqual = (X[30:0] < Y[30:0]) ? 1'b1:1'b0;
                        Smaller = (X[30:0] < Y[30:0]) ? 1'b0:1'b1;
                    end
                end
            5'b01110: //Result = {Y[31],X[30:0]}
                begin
                    Result = {Y[31],X[30:0]};
                end
            5'b01111: //Result = {~Y[31],X[30:0]}
                begin
                    Result = {~Y[31],X[30:0]};
                end
            5'b10000: //Result = {Y[31]^X[31],X[30:0]}
                begin
                    Result = {Y[31]^X[31],X[30:0]};
                end
            5'b10001:
                begin
                    Result = result_classify;
                end
            5'b10010: //float -> unsigned int / int
                begin
                    if(X[31] == 1'b1) Result = 32'd0;
                    else Result = result_f2i;
                end
            default:
                begin
                    Result = X;
                end
        endcase
     end
    
endmodule
