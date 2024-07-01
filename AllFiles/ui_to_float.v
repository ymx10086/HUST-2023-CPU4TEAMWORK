`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 08:46:45
// Design Name: 
// Module Name: ui_to_float
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


module ui_to_float(in,out);
    input [31:0] in;
    output reg[31:0] out;
    wire sign;
    wire [31:0] posout;
    wire [7:0] precnt;
    
    get_precount gpre(.in(in),.cnt(precnt));
    get_positive_for_ui gpositive(.in(in),.cnt(precnt),.out(posout));

    assign sign = in[31];
    
    always @(*) begin
        if(in == 0) begin
            out = 32'd0;
        end
        else begin
            out = posout;
        end
    end
    
endmodule
