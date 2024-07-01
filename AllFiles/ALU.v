`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/03 21:58:20
// Design Name: 
// Module Name: ALU
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


module ALU(X,Y,AluOP,Result,Result2,Equal,Smaller,BiggerOrEqual);
    parameter WIDTH=32;
    input [WIDTH-1:0] X,Y;
    input [3:0] AluOP;
    output reg[WIDTH-1:0] Result,Result2;
    output reg Smaller,BiggerOrEqual;
    output Equal;
    assign Equal = (X==Y) ? 1 : 0;
    reg signed[64:0] tmp_res;
    wire signed[127:0] tmp_res_2;
    reg [31:0] tmp_X;
    reg [31:0] tmp_Y;
//    assign tmp_res = $signed(X) * $signed({1'b0,Y});
//    assign tmp_res_2 = tmp_X * tmp_Y;
    
    always@(X,Y,AluOP)begin
        case(AluOP)
            4'b0000:
                begin
                    Result = X << Y[4:0];
                    Result2 = 0;
                end
            4'b0001:
                begin
                    Result = $signed(X) >>> Y[4:0];
                    Result2 = 0;
                end
            4'b0010:
                begin
                    Result = X >> Y[4:0];
                    Result2 = 0;
                end
            4'b0011:
                begin
                   {Result2,Result} = X * Y;
                end
            4'b0100:
                begin
                    Result = X / Y;
                    Result2 = X % Y;
                end
            4'b0101:
                begin
                    Result = X + Y;
                    Result2 = 0;
                end
            4'b0110:
                begin
                    Result = X - Y;
                    Result2 = 0;
                end
            4'b0111:
                begin
                    Result = X & Y;
                    Result2 = 0;
                end
            4'b1000:
                begin
                    Result = X | Y;
                    Result2 = 0;
                end
            4'b1001:
                begin
                    Result = X ^ Y;
                    Result2 = 0;
                end
            4'b1010:
                begin
                    Result = ~(X | Y);
                    Result2 = 0;
                end
            4'b1011:
                begin
                    Result = ($signed(X) < $signed(Y)) ? 1 : 0;
                    Result2 = 0;
                    Smaller = $signed(X) < $signed(Y);
                    BiggerOrEqual = $signed(X) >= $signed(Y);
                end
            4'b1100:
                begin
                    Result = (X < Y) ? 1 : 0;
                    Result2 = 0;
                    Smaller = X < Y;
                    BiggerOrEqual = X >= Y;
                end
            4'b1101:
                begin
                    tmp_X = (X[31] == 1'b1)?(~X + 32'd1):(X);
                    tmp_Y = (Y[31] == 1'b1)?(~Y + 32'd1):(Y);
                    if(X[31] == Y[31]) {Result2,Result} = tmp_X * tmp_Y;
                    else {Result2,Result} = ~(tmp_X * tmp_Y) + 64'd1;
                end
            4'b1110:
                begin
                    tmp_res = $signed(X) * $signed({1'b0,Y});
                    Result2 = tmp_res[63:32];
                    Result = tmp_res[31:0];
                end
            4'b1111:
                begin
                    Result = $signed(X) / $signed(Y);
                    Result2 = $signed(X) % $signed(Y);
                end
        endcase
     end
endmodule
