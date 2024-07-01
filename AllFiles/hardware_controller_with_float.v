`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 11:50:24
// Design Name: 
// Module Name: hardware_controller_with_float
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


module hardware_controller_with_float(Funct7,Funct3,OpCode,Rs2,IR21,ALU_OP,ALU_OP_2,MemtoReg,MemWrite,ALU_Src,RegWrite,uret,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI,FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi,lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2);
    input [6:0] Funct7;
    input [2:0] Funct3;
    input [4:0] OpCode;
    input [4:0] Rs2;
    input IR21;
    output [3:0] ALU_OP;
    output [4:0] ALU_OP_2;
    output MemtoReg,MemWrite,ALU_Src,RegWrite,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI;
    output FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi;
    output lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2;
    output uret, ecall;
    
    wire tmp_ecall;
    controller_with_float cf(Funct7,Funct3,OpCode,Rs2,ALU_OP,ALU_OP_2);
    signals_with_float sf(Funct7,Funct3,OpCode,Rs2,MemtoReg,MemWrite,ALU_Src,RegWrite,tmp_ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI,FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi,lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2);
    assign uret = IR21 & tmp_ecall;
    assign ecall = (~IR21) & tmp_ecall;
endmodule
