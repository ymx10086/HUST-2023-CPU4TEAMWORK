`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/14 23:40:35
// Design Name: 
// Module Name: priority_Encoder
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


module priority_Encoder(Mantissa_in,Exponent_a,Mantissa_out,Exponent_sub);
    input [24:0] Mantissa_in;
    input [7:0] Exponent_a;
    output reg [24:0] Mantissa_out;
    output [7:0] Exponent_sub;
    reg [4:0] shift;
    
    always @(Mantissa_in) begin
        casex (Mantissa_in)
            25'b1_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx :    
                begin
                    Mantissa_out = Mantissa_in;
                    shift = 5'd0;
                end
            25'b1_01xx_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    Mantissa_out = Mantissa_in << 1;
                    shift = 5'd1;
                end
            25'b1_001x_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    Mantissa_out = Mantissa_in << 2;
                    shift = 5'd2;
                end
            25'b1_0001_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                             
                    Mantissa_out = Mantissa_in << 3;
                    shift = 5'd3;
                end
            25'b1_0000_1xxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    Mantissa_out = Mantissa_in << 4;
                    shift = 5'd4;
                end
            25'b1_0000_01xx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    Mantissa_out = Mantissa_in << 5;
                    shift = 5'd5;
                end
            25'b1_0000_001x_xxxx_xxxx_xxxx_xxxx :     
                begin                        // 24'h020000
                    Mantissa_out = Mantissa_in << 6;
                    shift = 5'd6;
                end
            25'b1_0000_0001_xxxx_xxxx_xxxx_xxxx :     
                begin                        // 24'h010000
                        Mantissa_out = Mantissa_in << 7;
                        shift = 5'd7;
                end
            25'b1_0000_0000_1xxx_xxxx_xxxx_xxxx :     
                begin                        // 24'h008000
                    Mantissa_out = Mantissa_in << 8;
                    shift = 5'd8;
                end
            25'b1_0000_0000_01xx_xxxx_xxxx_xxxx :     
                begin                        // 24'h004000
                    Mantissa_out = Mantissa_in << 9;
                    shift = 5'd9;
                end 
            25'b1_0000_0000_001x_xxxx_xxxx_xxxx :     
                begin                        // 24'h002000
                    Mantissa_out = Mantissa_in << 10;
                    shift = 5'd10;
                end
            25'b1_0000_0000_0001_xxxx_xxxx_xxxx :     
                begin                        // 24'h001000
                    Mantissa_out = Mantissa_in << 11;
                    shift = 5'd11;
                end
            25'b1_0000_0000_0000_1xxx_xxxx_xxxx :     
                begin                        // 24'h000800
                    Mantissa_out = Mantissa_in << 12;
                    shift = 5'd12;
                end
            25'b1_0000_0000_0000_01xx_xxxx_xxxx :     
                begin                        // 24'h000400
                    Mantissa_out = Mantissa_in << 13;
                    shift = 5'd13;
                end
            25'b1_0000_0000_0000_001x_xxxx_xxxx :     
                begin                        // 24'h000200
                    Mantissa_out = Mantissa_in << 14;
                    shift = 5'd14;
                end
            25'b1_0000_0000_0000_0001_xxxx_xxxx  :     
                begin                        // 24'h000100
                    Mantissa_out = Mantissa_in << 15;
                    shift = 5'd15;
                end
            25'b1_0000_0000_0000_0000_1xxx_xxxx :     
                begin                        // 24'h000080
                    Mantissa_out = Mantissa_in << 16;
                    shift = 5'd16;
                end
            25'b1_0000_0000_0000_0000_01xx_xxxx :     
                begin                        // 24'h000040
                    Mantissa_out = Mantissa_in << 17;
                    shift = 5'd17;
                end
            25'b1_0000_0000_0000_0000_001x_xxxx :     
                begin                        // 24'h000020
                    Mantissa_out = Mantissa_in << 18;
                    shift = 5'd18;
                end
            25'b1_0000_0000_0000_0000_0001_xxxx :     
                begin                        // 24'h000010
                    Mantissa_out = Mantissa_in << 19;
                    shift = 5'd19;
                end
            25'b1_0000_0000_0000_0000_0000_1xxx :    
                begin                        // 24'h000008
                    Mantissa_out = Mantissa_in << 20;
                    shift = 5'd20;
                end
            25'b1_0000_0000_0000_0000_0000_01xx :     
                begin                        // 24'h000004
                    Mantissa_out = Mantissa_in << 21;
                    shift = 5'd21;
                end
            25'b1_0000_0000_0000_0000_0000_001x :     
                begin                        // 24'h000002
                    Mantissa_out = Mantissa_in << 22;
                    shift = 5'd22;
                end
            25'b1_0000_0000_0000_0000_0000_0001 :     
                begin                        // 24'h000001
                    Mantissa_out = Mantissa_in << 23;
                    shift = 5'd23;
                end
            25'b1_0000_0000_0000_0000_0000_0000 :     
                begin                        // 24'h000000
                    Mantissa_out = Mantissa_in << 24;
                    shift = 5'd24;
                end
            default :     
                begin
                    Mantissa_out = (~Mantissa_in) + 25'd1;
                    shift = 5'd0;
                end
        endcase
    end
    assign Exponent_sub = Exponent_a - shift;
endmodule
