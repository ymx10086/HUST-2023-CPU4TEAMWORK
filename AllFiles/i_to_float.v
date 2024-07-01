`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 08:47:02
// Design Name: 
// Module Name: i_to_float
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


module i_to_float(in,out);
    input [31:0] in;
    output reg[31:0] out;
    wire sign;
    wire [31:0] posout, negout;
    wire [7:0] precnt, poscnt;
    wire zero;
    
    get_precount gpre(.in(in),.cnt(precnt));
    get_poscount gpos(.in(in),.cnt(poscnt));
    get_positive gpositive(.in(in),.cnt(precnt),.out(posout));
    get_negative gnegative(.in(in),.cnt(poscnt),.out(negout));

    assign sign = in[31];
    assign zero = |in[31:0];
    
    always @(*) begin
        if(zero == 1'b0) begin
            out = in;
        end
        else if(in[31] == 1'b1)begin
            out = negout;
        end
        else if(in[31] == 1'b0)begin
            out = posout;
        end
    end
    
endmodule
