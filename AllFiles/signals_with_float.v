`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 11:15:14
// Design Name: 
// Module Name: signals_with_float
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


module signals_with_float(Funct7,Funct3,OpCode,Rs2,MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI,FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi,lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2);
    input [6:0] Funct7;
    input [2:0] Funct3;
    input [4:0] OpCode;
    input [4:0] Rs2;
    output reg MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI,FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi;
    output reg lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2;
    initial begin
        {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
        {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
        {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
    end
    always @(Rs2,Funct7,Funct3,OpCode) begin
        if(Funct7 == 7'd0 && Funct3 == 3'd0 && OpCode == 5'hc)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd32 && Funct3 == 3'd0 && OpCode == 5'hc) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd7 && OpCode == 5'hc)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd6 && OpCode == 5'hc)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd2 && OpCode == 5'hc)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd3 && OpCode == 5'hc) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd0 && OpCode == 5'h4)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00110000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd7 && OpCode == 5'h4)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00110000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd6 && OpCode == 5'h4)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00110000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd4 && OpCode == 5'h4)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00110000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd2 && OpCode == 5'h4)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00110000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd1 && OpCode == 5'h4)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00110000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd5 && OpCode == 5'h4)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00110000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd32 && Funct3 == 3'd5 && OpCode == 5'h4)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00110000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd2 && OpCode == 5'h0) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b10110000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd2 && OpCode == 5'h8)  begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b01100100000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd0 && OpCode == 5'h1c) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00001000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd0 && OpCode == 5'h18) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000010000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd1 && OpCode == 5'h18) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000001000000; 
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(OpCode == 5'h1b) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000100000;     
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;   
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end                
        else if(Funct3 == 3'd0 && OpCode == 5'h19) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00110000010000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd6 && OpCode == 5'h1c) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000010;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd7 && OpCode == 5'h1c) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000001;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd0 && OpCode == 5'h1c) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00001000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd32 && Funct3 == 3'd5 && OpCode == 5'hc) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd4 && OpCode == 5'hc) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd1 && OpCode == 5'h0) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b10110000000100;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd5 && OpCode == 5'h18) begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000001000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        
        
        
        else if(Funct7 == 7'd0 && Funct3 == 3'd1 && OpCode == 5'hc)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd0 && Funct3 == 3'd5 && OpCode == 5'hc)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd0 && OpCode == 5'h0)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b10110000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b10000000000;
        end
        else if(Funct3 == 3'd4 && OpCode == 5'h0)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b10110000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b01000000000;
        end
        else if(Funct3 == 3'd5 && OpCode == 5'h0)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b10110000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00100000000;
        end
        else if(Funct3 == 3'd0 && OpCode == 5'h8)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b01100100000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00010000000;
        end
        else if(Funct3 == 3'd1 && OpCode == 5'h8)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b01100100000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00001000000;
        end
        else if(Funct3 == 3'd4 && OpCode == 5'h18)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000100000;
        end
        else if(Funct3 == 3'd6 && OpCode == 5'h18)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000010000;
        end
        else if(Funct3 == 3'd7 && OpCode == 5'h18)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000001000;
        end
        else if(OpCode == 5'hd)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000100;
        end
        else if(OpCode == 5'h5)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000010;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd0 && OpCode == 5'hc)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd1 && OpCode == 5'hc)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000001;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd2 && OpCode == 5'hc)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000001;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd3 && OpCode == 5'hc)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000001;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd4 && OpCode == 5'hc)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd5 && OpCode == 5'hc)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd6 && OpCode == 5'hc)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000001;
        end
        else if(Funct7 == 7'd1 && Funct3 == 3'd7 && OpCode == 5'hc)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000001;
        end
        else if(Funct3 == 3'd3 && OpCode == 5'h4)  begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00110000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        
        
        
        else if(Funct3 == 3'd2 && OpCode == 5'b00001) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00100000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b100100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct3 == 3'd2 && OpCode == 5'b01001) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00100100000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b010000;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd0 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd4 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd8 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd12 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd44 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd16 && Funct3 == 3'd0 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd16 && Funct3 == 3'd1 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd16 && Funct3 == 3'd2 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd20 && Funct3 == 3'd0 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd20 && Funct3 == 3'd1 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000100;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd104 && Rs2 == 3'd0 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000110;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd104 && Rs2 == 3'd1 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000110;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd96 && Rs2 == 3'd0 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000001;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd96 && Rs2 == 3'd1 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000001;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd112 && Funct3 == 3'd0 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000001;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd120 && Funct3 == 3'd0 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000110;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd80 && Funct3 == 3'd2 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000001;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd80 && Funct3 == 3'd1 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000001;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd80 && Funct3 == 3'd0 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000001;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else if(Funct7 == 7'd112 && Funct3 == 3'd1 && OpCode == 5'b10100) begin
            {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00010000000000;
            {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000001;
            {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
        else begin
           {MemtoReg,MemWrite,ALU_Src,RegWrite,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI} = 14'b00000000000000;
           {FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi} = 6'b000000;
           {lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2} = 11'b00000000000;
        end
    end
endmodule
