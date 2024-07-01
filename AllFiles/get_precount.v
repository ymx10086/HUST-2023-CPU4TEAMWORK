`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 18:50:05
// Design Name: 
// Module Name: get_precount
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


module get_precount(in,cnt);
    input [31:0] in;
    output reg[7:0] cnt;
    
    always @(in) begin
        casex (in)
            32'b0000_0000_0000_0000_0000_0000_0000_0001 :    
                begin
                    cnt = 8'd0;
                end
            32'b0000_0000_0000_0000_0000_0000_0000_001x :    
                begin
                    cnt = 8'd1;
                end
            32'b0000_0000_0000_0000_0000_0000_0000_01xx :    
                begin
                    cnt = 8'd2;
                end
            32'b0000_0000_0000_0000_0000_0000_0000_1xxx :    
                begin
                    cnt = 8'd3;
                end
            32'b0000_0000_0000_0000_0000_0000_0001_xxxx :    
                begin
                    cnt = 8'd4;
                end
             32'b0000_0000_0000_0000_0000_0000_001x_xxxx :    
                begin
                   cnt = 8'd5;
                end
             32'b0000_0000_0000_0000_0000_0000_01xx_xxxx :     
                begin                        // 24'h000000
                    cnt = 8'd6;
                end
             32'b0000_0000_0000_0000_0000_0000_1xxx_xxxx :     
                begin                        // 24'h000001
                    cnt = 8'd7;
                end
             32'b0000_0000_0000_0000_0000_0001_xxxx_xxxx :     
                begin                        // 24'h000002
                    cnt = 8'd8;
                end
             32'b0000_0000_0000_0000_0000_001x_xxxx_xxxx :     
                begin                        // 24'h000004
                    cnt = 8'd9;
                end
             32'b0000_0000_0000_0000_0000_01xx_xxxx_xxxx :    
                begin                        
                    cnt = 8'd10;
                end
             32'b0000_0000_0000_0000_0000_1xxx_xxxx_xxxx :     
                begin                        // 24'h000010
                    cnt = 8'd11;
                end
             32'b0000_0000_0000_0000_0001_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd12;
                end
             32'b0000_0000_0000_0000_001x_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd13;
                end
             32'b0000_0000_0000_0000_01xx_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd14;
                end
             32'b0000_0000_0000_0000_1xxx_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd15;
                end   
             32'b0000_0000_0000_0001_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd16;
                end
             32'b0000_0000_0000_001x_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd17;
                end
             32'b0000_0000_0000_01xx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd18;
                end
             32'b0000_0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                   cnt = 8'd19;
                end
             32'b0000_0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin
                    cnt = 8'd20;
                end
             32'b0000_0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd21;
                end
             32'b0000_0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        // 24'h008000
                    cnt = 8'd22;
                end
             32'b0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        // 24'h010000
                    cnt = 8'd23;
                end
             32'b0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        // 24'h020000
                    cnt = 8'd24;
                end
             32'b0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd25;
                end
             32'b0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd26;
                end
             32'b0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                             
                    cnt = 8'd27;
                end
             32'b0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd28;
                end
             32'b001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :     
                begin                        
                    cnt = 8'd29;
                end
             32'b01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :    
                begin
                    cnt = 8'd30;
                end
             32'b1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :    
                begin
                    cnt = 8'd31;
                end
            default :     
                begin
                    cnt = 8'd0;
                end
        endcase
    end
    
endmodule
