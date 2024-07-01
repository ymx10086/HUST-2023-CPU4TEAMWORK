`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 19:25:21
// Design Name: 
// Module Name: get_poscount
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


module get_poscount(in,cnt);

    input [31:0] in;
    output reg[7:0] cnt;
    
    always @(in) begin
        casex (in)
            32'b1000_0000_0000_0000_0000_0000_0000_0000 :    
                begin
                    cnt = 8'd0;
                end
            32'bx100_0000_0000_0000_0000_0000_0000_0000 :     
                begin                        
                    cnt = 8'd1;
                end
            32'bxx10_0000_0000_0000_0000_0000_0000_0000 :     
                begin                        
                    cnt = 8'd2;
                end
            32'bxxx1_0000_0000_0000_0000_0000_0000_0000 :     
                begin                             
                    cnt = 8'd3;
                end
            32'bxxxx_1000_0000_0000_0000_0000_0000_0000:     
                begin                        
                    cnt = 8'd4;
                end
            32'bxxxx_x100_0000_0000_0000_0000_0000_0000 :     
                begin                        
                    cnt = 8'd5;
                end
            32'bxxxx_xx10_0000_0000_0000_0000_0000_0000 :     
                begin                        // 24'h020000
                    cnt = 8'd6;
                end
            32'bxxxx_xxx1_0000_0000_0000_0000_0000_0000 :     
                begin                        // 24'h010000
                    cnt = 8'd7;
                end
            32'bxxxx_xxxx_1000_0000_0000_0000_0000_0000 :     
                begin                        // 24'h008000
                    cnt = 8'd8;
                end
            32'bxxxx_xxxx_x100_0000_0000_0000_0000_0000 :     
                begin                        // 24'h004000
                    cnt = 8'd9;
                end 
            32'bxxxx_xxxx_xx10_0000_0000_0000_0000_0000 :     
                begin                        // 24'h002000
                    cnt = 8'd10;
                end
            32'bxxxx_xxxx_xxx1_0000_0000_0000_0000_0000 :     
                begin                        // 24'h001000
                   cnt = 8'd11;
                end
            32'bxxxx_xxxx_xxxx_1000_0000_0000_0000_0000 :     
                begin                        // 24'h000800
                    cnt = 8'd12;
                end
            32'bxxxx_xxxx_xxxx_x100_0000_0000_0000_0000 :     
                begin                        // 24'h000400
                    cnt = 8'd13;
                end
            32'bxxxx_xxxx_xxxx_xx10_0000_0000_0000_0000 :     
                begin                        // 24'h000200
                    cnt = 8'd14;
                end
            32'bxxxx_xxxx_xxxx_xxx1_0000_0000_0000_0000 :     
                begin                        // 24'h000100
                    cnt = 8'd15;
                end
            32'bxxxx_xxxx_xxxx_xxxx_1000_0000_0000_0000 :     
                begin                        // 24'h000080
                    cnt = 8'd16;
                end
            32'bxxxx_xxxx_xxxx_xxxx_x100_0000_0000_0000 :     
                begin                        // 24'h000040
                    cnt = 8'd17;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xx10_0000_0000_0000 :     
                begin                        // 24'h000020
                    cnt = 8'd18;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxx1_0000_0000_0000 :     
                begin                        // 24'h000010
                    cnt = 8'd19;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_1000_0000_0000 :    
                begin                        // 24'h000008
                    cnt = 8'd20;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_x100_0000_0000 :     
                begin                        // 24'h000004
                    cnt = 8'd21;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_xx10_0000_0000 :     
                begin                        // 24'h000002
                    cnt = 8'd22;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx1_0000_0000 :     
                begin                        // 24'h000001
                    cnt = 8'd23;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_1000_0000 :     
                begin                        // 24'h000000
                    cnt = 8'd24;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x100_0000 :    
                begin
                    cnt = 8'd25;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx10_0000 :    
                begin
                    cnt = 8'd26;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx1_0000 :    
                begin
                    cnt = 8'd27;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_1000 :    
                begin
                    cnt = 8'd28;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_x100 :    
                begin
                    cnt = 8'd29;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xx10 :    
                begin
                    cnt = 8'd30;
                end
            32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxx1 :    
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
