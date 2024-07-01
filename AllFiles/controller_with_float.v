`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 10:13:48
// Design Name: 
// Module Name: controller_with_float
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


module controller_with_float(Funct7,Funct3,OpCode,Rs2,ALU_OP,ALU_OP_2);
    input [6:0] Funct7;
    input [2:0] Funct3;
    input [4:0] OpCode;
    input [4:0] Rs2;
    output reg[3:0] ALU_OP;
    output reg[4:0] ALU_OP_2;
    
    initial begin
        ALU_OP = 4'd5;
        ALU_OP_2 = 5'd0;
    end
    
    always @(Rs2,Funct7,Funct3,OpCode) begin
        if(Funct7 == 7'd0 && Funct3 == 3'd0 && OpCode == 5'hc)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd32 && Funct3 == 3'd0 && OpCode == 5'hc)  begin
            ALU_OP = 4'd6;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd7 && OpCode == 5'hc)  begin
            ALU_OP = 4'd7;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd6 && OpCode == 5'hc)  begin
            ALU_OP = 4'd8;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd2 && OpCode == 5'hc)  begin
            ALU_OP = 4'd11;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd3 && OpCode == 5'hc)  begin
            ALU_OP = 4'd12;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd0 && OpCode == 5'h4)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd7 && OpCode == 5'h4)  begin
            ALU_OP = 4'd7;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd6 && OpCode == 5'h4)  begin
            ALU_OP = 4'd8;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd4 && OpCode == 5'h4)  begin
            ALU_OP = 4'd9;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd2 && OpCode == 5'h4)  begin
            ALU_OP = 4'd11;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd1 && OpCode == 5'h4)  begin
            ALU_OP = 4'd0;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd5 && OpCode == 5'h4)  begin
            ALU_OP = 4'd2;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd32 && Funct3 == 3'd5 && OpCode == 5'h4)  begin
            ALU_OP = 4'd1;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd2 && OpCode == 5'h0)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd2 && OpCode == 5'h8)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd0 && OpCode == 5'h19)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd32 && Funct3 == 3'd5 && OpCode == 5'hc) begin
            ALU_OP = 4'd1;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd4 && OpCode == 5'hc)  begin
            ALU_OP = 4'd9;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd1 && OpCode == 5'h0)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd5 && OpCode == 5'h18)  begin
            ALU_OP = 4'd11;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd1 && OpCode == 5'hc)  begin
            ALU_OP = 4'd0;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd5 && OpCode == 5'hc)  begin
            ALU_OP = 4'd2;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd0 && OpCode == 5'h0)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd4 && OpCode == 5'h0)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd5 && OpCode == 5'h0)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd0 && OpCode == 5'h8)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd1 && OpCode == 5'h8)  begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd4 && OpCode == 5'h18)  begin
            ALU_OP = 4'd11;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd6 && OpCode == 5'h18)  begin
            ALU_OP = 4'd12;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd7 && OpCode == 5'h18)  begin
            ALU_OP = 4'd12;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd0 && OpCode == 5'hc)  begin
            ALU_OP = 4'd13;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd1 && OpCode == 5'hc)  begin
            ALU_OP = 4'd13;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd2 && OpCode == 5'hc)  begin
            ALU_OP = 4'd14;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd3 && OpCode == 5'hc)  begin
            ALU_OP = 4'd3;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd4 && OpCode == 5'hc)  begin
            ALU_OP = 4'd15;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd5 && OpCode == 5'hc)  begin
            ALU_OP = 4'd4;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd6 && OpCode == 5'hc)  begin
            ALU_OP = 4'd15;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd7 && OpCode == 5'hc)  begin
            ALU_OP = 4'd4;
            ALU_OP_2 = 5'd0;
        end
        else if(Funct3 == 3'd3 && OpCode == 5'h4)  begin
            ALU_OP = 4'd12;
            ALU_OP_2 = 5'd0;
        end
        
        
        else if(Funct3 == 3'd2 && OpCode == 5'b00001) begin 
            ALU_OP_2 = 5'd0;
            ALU_OP = 4'd5;
        end
        else if(Funct3 == 3'd2 && OpCode == 5'b01001) begin
            ALU_OP_2 = 5'd0;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd0 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd1;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd4 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd2;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd8 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd3;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd12 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd4;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd44 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd5;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd16 && Funct3 == 3'd0 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd14;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd16 && Funct3 == 3'd1 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd15;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd16 && Funct3 == 3'd2 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd16;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd20 && Funct3 == 3'd0 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd13;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd20 && Funct3 == 3'd1 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd12;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd104 && Rs2 == 3'd0 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd8;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd104 && Rs2 == 3'd1 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd7;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd96 && Rs2 == 3'd0 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd6;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd96 && Rs2 == 3'd1 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd18;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd112 && Funct3 == 3'd0 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd0;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd120 && Funct3 == 3'd0 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd0;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd80 && Funct3 == 3'd2 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd9;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd80 && Funct3 == 3'd1 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd10;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd80 && Funct3 == 3'd0 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd11;
            ALU_OP = 4'd5;
        end
        else if(Funct7 == 7'd112 && Funct3 == 3'd1 && OpCode == 5'b10100) begin
            ALU_OP_2 = 5'd17;
            ALU_OP = 4'd5;
        end
        else begin
            ALU_OP = 4'd5;
            ALU_OP_2 = 5'd0;
        end
    end
endmodule
