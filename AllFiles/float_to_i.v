`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 08:46:23
// Design Name: 
// Module Name: float_to_i
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


module float_to_i(in,out);

    input [31:0] in;
    output reg[31:0] out;
    
    wire [7:0] order;
    wire [31:0] mantissa;
    reg [31:0] shift_left, shift_right;
    
    assign order = in[30:23];
    assign mantissa = {9'd1,in[22:0]};
    
    always @(*) begin
        if (order > 8'd158) out =  32'h80000000;
        if (order < 8'd127) out = 32'd0;
        if (((in >> 8'd31) & 8'd1) == 8'd1) begin
            if (order > 8'd150) begin
                shift_left = mantissa << (order - 8'd150);
                out = ~shift_left + 32'd1;
            end
            else begin
                shift_right = mantissa >> (8'd150 - order);
                out = ~shift_right + 32'd1;
            end
        end
        else begin
            if (order > 8'd150) out = mantissa << (order - 8'd150);
            else out = mantissa >> (8'd150 - order);
        end
    end
    
endmodule
