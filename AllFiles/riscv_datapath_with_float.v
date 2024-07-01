`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/15 11:41:20
// Design Name: 
// Module Name: riscv_datapath_with_float
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


module riscv_datapath_with_float(clk,rst,go,frequency,showsel,IRA,IRB,IRC,Data,Done,Res,PC,cpunum);
    input clk, rst, go;
    input [1:0] frequency;
    input [1:0] showsel;
    input IRA,IRB,IRC;
    input [25087:0] Data;
    
    output Done;
    output [31:0] Res,PC,cpunum; 
    //output [7:0] SEG;   // 7段数码管驱动，低电平有效
    //output [7:0] AN;    // 7段数码管片选信号，低电平有效
//    output [31:0] R2out,ALU_result1,Memout,Memin_sb_ext;

//    output IRAin,IRBin,IRCin;
//    output [15:0] circles;
//    output [1:0] IntNo,clrNo,IntNoPre;
//    output uret,INT,IE,changeIntNo;
//    output [31:0] IntAddr;
//,IRAin,IRBin,IRCin,circles,IntNo,clrNo,IntNoPre,uret,INT,IE,IntAddr,changeIntNo,LedData, ALU_result_F
//    output [31:0] LedData, ALU_result_F;, IR, ALU_result_F, AinF, BinF, FR1out,FR2out,FRDin;
//    output FMemtoReg,FMemWrite,ALU_Src,FRegWrite,itof,ftoi,RegWrite;
//    output [4:0] ALU_OP_2,FR1in, FR2in,rd;
//    output Jal, Jalr, BJMP, uret, clk_n,halt,ecall;
//    output [4:0] R1in, rs1;
//,PCout,PCin,Jal,Jalr,BJMP,uret,clk_n,halt,R1in,R1out,rs1,ecall
//,LedData,IR,FMemtoReg,FMemWrite,ALU_Src,FRegWrite,itof,ftoi,RegWrite,ALU_result_F,ALU_OP_2,AinF,BinF,FR1out,FR2out,FR1in, FR2in,rd,FRDin
    wire clk_1,clk_2,clk_3,clk_4,clk_n;
    wire [31:0] PCin, PCout, IR;
    wire halt,LedData_en;
    wire [31:0] circles_ext, LEDin, LedData;
    wire [15:0] circles;
    wire [6:0] Funct7;
    wire [2:0] Funct3;
    wire [4:0] OpCode;
    wire IR21;
    wire [3:0] ALU_OP;
    wire MemtoReg,MemWrite,ALU_Src,RegWrite,uret,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI;
    wire [4:0] rs1, rs2, rd;
    wire [4:0] R1in, R2in;
    wire [31:0] RDin, RDin_1, RDin_2, RDin_3, RDin_4, LUI_RDin, AUIPC_RDin;
    wire [31:0] R1out, R2out;
    wire [11:0] Imm_I,Imm_S,Imm_B,Imm_IS,Imm_B_sll;
    wire [19:0] Imm_UJ,Imm_UJ_sll,Imm_U;
    wire [31:0] Imm_ALUin,Imm_B_ext,Imm_UJ_ext,PCin_B,PCin_UJ,Bin,Regin_NJ,Regin_NJ1,Regin_NJ2,Regin_NJ3,Regin_J,Imm_U_ext;
    wire [31:0] ALU_result1, ALU_result2, Memout, Memin, Memin1, Regin, Regin_lh_ext, Regin_lhu_ext, Regin_lb_ext, Regin_lbu_ext;
    wire [31:0] Memin_sb, Memin_sb_ext, Memin_sh, Memin_sh_ext;
    wire Equal,Smaller,BiggerOrEqual,BJMP;
    wire [15:0] Regin_lh, Regin_lhu;
    wire [7:0] Regin_lb, Regin_lbu;
    wire [31:0] PCin_normal,PCin_JAL,PCin_JALR,PCin_jalr;
    
    wire IntR,IE,IntrRequest,IRAin,IRBin,IRCin;
    wire [1:0] IntNo,clrNo;
    wire [31:0] IntAddr, EPCin, EPCout, RetAddr;
    
    wire CLI,IEen,INT,changeIntNo;
    wire [1:0] IntNoPre;
    
    wire overflow, underflow,FEqual,FSmaller,FBiggerOrEqual;
    wire [4:0] FR1in, FR2in;
    wire [4:0] ALU_OP_2;
    wire [31:0] FR1out,FR2out,FRDin;
    wire [31:0] ALU_result_F, AinF, BinF, Imm_ALUin_F, Memout_F;
    wire FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi;
    wire lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2;
    
    assign Funct7 = IR[31:25];
    assign Funct3 = IR[14:12];
    assign OpCode = IR[6:2];
    assign IR21 = IR[21];
    assign rs1 = IR[19:15];
    assign rs2 = IR[24:20];
    assign rd = IR[11:7];
    assign FR1in = rs1;
    assign FR2in = rs2;
    assign Imm_I = IR[31:20];
    assign Imm_S = {IR[31:25],IR[11:7]};
    assign Imm_B = {IR[31],IR[7],IR[30:25],IR[11:8]};
    assign Imm_UJ = {IR[31],IR[19:12],IR[20],IR[30:21]};
    assign Imm_U = IR[31:12];
    assign Regin_J = PCout + 32'd4;
    assign PCin_normal = PCout + 32'd4;
    assign PCin_B = Imm_B_ext + PCout;
    assign PCin_UJ = Imm_UJ_ext + PCout;
//    assign BJMP = (Beq & Equal) | (Bne & (~Equal)) | (Bge & BiggerOrEqual);
    assign BJMP = (Beq & Equal) | (Bne & (~Equal)) | (Bge & BiggerOrEqual) | (bgeu & BiggerOrEqual) | (blt & Smaller) | (bltu & Smaller);
    assign PCin_jalr = ALU_result1 & 32'hfffffffe;
    assign halt = (~(R1out == 32'h22)) & ecall;
    assign LedData_en = ecall & (R1out == 32'h22);
    assign LUI_RDin = {Imm_U,12'd0};
//    sign_extender #(20,32) sign_extender_ImmU(.in(Imm_U),.out(Imm_U_ext));
    assign AUIPC_RDin = LUI_RDin + PCout;
//    assign Res = R1out;
    assign Done = halt;    
    assign PC = PCout;
    assign cpunum = {{(16){1'b0}},circles};
//    单级中断
//    assign IntrRequest = (~IE) & IntR;

    assign CLI = INT | CSRRCI;
    assign IEen = CSRRSI | CSRRCI | INT | uret | (circles == 16'd0);
    assign INT = (IRAin | IRBin | IRCin) & IE & changeIntNo;
    assign changeIntNo = (IntNo != IntNoPre);
    
    sign_extender #(16,32) sign_extender_circles(.in(circles),.out(circles_ext));
    
    divider #(10_000_000) divider1(.clk(clk), .clk_N(clk_1)); //10Hz
    divider #(5_000_000) divider2(.clk(clk), .clk_N(clk_2)); //50Hz
    divider #(1_000_000) divider3(.clk(clk), .clk_N(clk_3)); //100Hz
    divider #(100) divider4(.clk(clk), .clk_N(clk_4)); //500Hz
    mux_41 #(1) mux_clk(.a(clk_1),.b(clk_2),.c(clk_3),.d(clk_4),.sel(frequency),.out(clk_n)); //选择频率
    
    PC_Register #(32)PC_Register(.clk(clk_n),.rst(rst),.en(go | (~halt)),.in(PCin),.out(PCout));
    IM_ROM #(32,10)IM_ROM(.addr(PCout[11:2]),.data(IR));
    hardware_controller_with_float hc(Funct7,Funct3,OpCode,rs2,IR21,ALU_OP,ALU_OP_2,MemtoReg,MemWrite,ALU_Src,RegWrite,uret,ecall,S_Type,Beq,Bne,Jal,Jalr,Bge,Lh,CSRRSI,CSRRCI,FMemtoReg,FMemWrite,ALU_Src_F,FRegWrite,itof,ftoi,lb,lbu,lhu,sb,sh,blt,bltu,bgeu,lui,auipc,Result2);
    mux_21 #(5) mux_21_R1in(.a(rs1),.b(5'h11),.sel(ecall),.out(R1in));
    mux_21 #(5) mux_21_R2in(.a(rs2),.b(5'ha),.sel(ecall),.out(R2in));
    
    Regifile #(32,5) Regfile(.Din(RDin),.Clk(clk_n),.WE(RegWrite),.W(rd),.Addr1(R1in),.Addr2(R2in),.R1(R1out),.R2(R2out),.reg0(Res));
    mux_21 #(32) mux_21_FRDin(.a(ALU_result_F),.b(Memout_F),.sel(FMemtoReg),.out(FRDin));
    FRegifile #(32,5) FRegfile(.Din(FRDin),.Clk(clk_n),.WE(FRegWrite),.W(rd),.Addr1(FR1in),.Addr2(FR2in),.R1(FR1out),.R2(FR2out));
    
    
    mux_21 #(12) mux_21_Imm(.a(Imm_I),.b(Imm_S),.sel(S_Type),.out(Imm_IS));
    sign_extender #(12,32) sign_extender_ALUin(.in(Imm_IS),.out(Imm_ALUin));
    logical_left #(12,4) logical_left_B(.in(Imm_B),.bitnum(4'b1),.out(Imm_B_sll));
    logical_left #(20,5) logical_left_UJ(.in(Imm_UJ),.bitnum(5'b1),.out(Imm_UJ_sll));
    sign_extender #(12,32) sign_extender_B(.in(Imm_B_sll),.out(Imm_B_ext));
    sign_extender #(20,32) sign_extender_UJ(.in(Imm_UJ_sll),.out(Imm_UJ_ext));
    
    mux_21 #(32) mux_21_ALUin(.a(R2out),.b(Imm_ALUin),.sel(ALU_Src),.out(Bin));
    ALU #(32) alu(.X(R1out),.Y(Bin),.AluOP(ALU_OP),.Result(ALU_result1),.Result2(ALU_result2),.Equal(Equal),.Smaller(Smaller),.BiggerOrEqual(BiggerOrEqual));
    
    sign_extender #(12,32) sign_extender_ALUin_F(.in(Imm_I),.out(Imm_ALUin_F));
    mux_21 #(32) mux_21_ALUin_F(.a(FR2out),.b(Imm_ALUin_F),.sel(ALU_Src),.out(BinF));
    mux_21 #(32) mux_21_X_F(.a(FR1out),.b(R1out),.sel(itof),.out(AinF));
    ALU_float alu_f(.X(AinF),.Y(BinF),.AluOP(ALU_OP_2),.Result(ALU_result_F),.Equal(FEqual),.Smaller(FSmaller),.BiggerOrEqual(FBiggerOrEqual),.overflow(overflow),.underflow(underflow));
    

//    mux_21 #(16) mux_21_sh(.a(R2out[15:0]),.b(R2out[31:16]),.sel(ALU_result1[1]),.out(Memin_sh));
    get_num_for_sh gsh(.in(R2out[15:0]),.sel(ALU_result1[1]),.data(Memout),.out(Memin_sh_ext));
//    mux_41 #(8) mux_41_sb(.a(R2out[7:0]),.b(R2out[15:8]),.c(R2out[23:16]),.d(R2out[31:24]),.sel(ALU_result1[1:0]),.out(Memin_sb));
    get_num_for_sb gsb(.in(R2out[7:0]),.sel(ALU_result1[1:0]),.data(Memout),.out(Memin_sb_ext));

    mux_21 #(32) MDin_sh(.a(R2out),.b(Memin_sh_ext),.sel(sh),.out(Memin1));
    mux_21 #(32) MDin_sb(.a(Memin1),.b(Memin_sb_ext),.sel(sb),.out(Memin));
    
//    MEM_RAM #(32,10) mem_ram(.addr(ALU_result1[11:2]),.clk(clk_n),.str(MemWrite),.rst(rst),.MDin(Memin),.data(Memout));    
//    MEM_RAM_FOR_F #(32,17) mem_ram_f(.addr(ALU_result1[18:2]),.clk(clk_n),.str(FMemWrite),.rst(rst),.MDin(FR2out),.InputData(Data),.data(Memout_F),.memwrite(MemWrite),.Memin(Memin));
   
    MEM_COMBINES #(32,17) mc(.addr(ALU_result1[18:2]),.clk(clk_n),.rst(rst),.Memwrite(MemWrite),.FMemwrite(FMemWrite),.MDin(Memin),.FMDin(FR2out),.InputData(Data),.data(Memout),.Fdata(Memout_F));
    
    mux_21 #(32) mux_21_MemtoReg(.a(ALU_result1),.b(Memout),.sel(MemtoReg),.out(Regin));
    mux_21 #(16) mux_21_lh(.a(Regin[15:0]),.b(Regin[31:16]),.sel(ALU_result1[1]),.out(Regin_lh));
    sign_extender #(16,32) sign_extender_lh(.in(Regin_lh),.out(Regin_lh_ext));
    mux_21 #(16) mux_21_lhu(.a(Regin[15:0]),.b(Regin[31:16]),.sel(ALU_result1[1]),.out(Regin_lhu));
    zero_extender #(16,32) zero_extender_lhu(.in(Regin_lhu),.out(Regin_lhu_ext));
    mux_41 #(8) mux_41_lb(.a(Regin[7:0]),.b(Regin[15:8]),.c(Regin[23:16]),.d(Regin[31:24]),.sel(ALU_result1[1:0]),.out(Regin_lb));
    sign_extender #(8,32) sign_extender_lb(.in(Regin_lb),.out(Regin_lb_ext));
    mux_41 #(8) mux_41_lbu(.a(Regin[7:0]),.b(Regin[15:8]),.c(Regin[23:16]),.d(Regin[31:24]),.sel(ALU_result1[1:0]),.out(Regin_lbu));
    zero_extender #(8,32) zero_extender_lbu(.in(Regin_lbu),.out(Regin_lbu_ext));
     
    
    mux_21 #(32) mux_21_NJ1(.a(Regin),.b(Regin_lh_ext),.sel(Lh),.out(Regin_NJ1));
    mux_21 #(32) mux_21_NJ2(.a(Regin_NJ1),.b(Regin_lhu_ext),.sel(lhu),.out(Regin_NJ2));
    mux_21 #(32) mux_21_NJ3(.a(Regin_NJ2),.b(Regin_lb_ext),.sel(lb),.out(Regin_NJ3));
    mux_21 #(32) mux_21_NJ(.a(Regin_NJ3),.b(Regin_lbu_ext),.sel(lbu),.out(Regin_NJ));
//    mux_21 #(32) mux_21_RDin(.a(Regin_NJ),.b(Regin_J),.sel(Jalr|Jal),.out(RDin));
    mux_21 #(32) mux_21_RDin(.a(Regin_NJ),.b(Regin_J),.sel(Jalr|Jal),.out(RDin_1));
    mux_21 #(32) mux_21_RDin_lui(.a(RDin_1),.b(LUI_RDin),.sel(lui),.out(RDin_2));
    mux_21 #(32) mux_21_RDin_auipc(.a(RDin_2),.b(AUIPC_RDin),.sel(auipc),.out(RDin_3));
    mux_21 #(32) mux_21_RDin_f(.a(RDin_3),.b(ALU_result_F),.sel(ftoi),.out(RDin_4));
    mux_21 #(32) mux_21_RDin_res2(.a(RDin_4),.b(ALU_result2),.sel(Result2),.out(RDin));
    
    mux_21 #(32) mux_21_JAL(.a(PCin_normal),.b(PCin_UJ),.sel(Jal),.out(PCin_JAL));
    mux_21 #(32) mux_21_JALR(.a(PCin_JAL),.b(PCin_jalr),.sel(Jalr),.out(PCin_JALR));
//    mux_21 #(32) mux_21_BJMP(.a(PCin_JALR),.b(PCin_B),.sel(BJMP),.out(PCin));
    mux_21 #(32) mux_21_BJMP(.a(PCin_JALR),.b(PCin_B),.sel(BJMP),.out(EPCin));
    mux_21 #(32) mux_21_URET(.a(EPCin),.b(EPCout),.sel(uret),.out(RetAddr));
//    mux_21 #(32) mux_21_INTR(.a(RetAddr),.b(IntAddr),.sel(IntrRequest),.out(PCin));
    mux_21 #(32) mux_21_INTR(.a(RetAddr),.b(IntAddr),.sel(INT),.out(PCin)); //多级中断
    
    register #(32) LedData_register(.clk(clk_n),.rst(rst),.en(LedData_en),.in(R2out),.out(LedData));
    counter #(16) circle_counter(.clk(clk_n),.rst_n(rst),.en(~halt),.dout(circles));
    mux_41 #(32) mux_led(.a(LedData),.b(circles_ext),.c(PCout),.d(IR),.sel(showsel),.out(LEDin)); //选择输出
    //_7Seg_Driver_Choice Led(.clk(clk),.LED(LEDin),.SEG(SEG),.AN(AN));
    
    // 单级中断
    DFF DFF_IRA(.D(IRA),.clk(clk_n),.rst(rst|(clrNo == 1)),.en(~IRAin),.State(IRAin));
    DFF DFF_IRB(.D(IRB),.clk(clk_n),.rst(rst|(clrNo == 2)),.en(~IRBin),.State(IRBin));
    DFF DFF_IRC(.D(IRC),.clk(clk_n),.rst(rst|(clrNo == 3)),.en(~IRCin),.State(IRCin));
    INTR_handler #(32) intr_handler(.IRA(IRAin),.IRB(IRBin),.IRC(IRCin),.IntR(IntR),.IntNo(IntNo),.IntAddr(IntAddr));
//    DFF DFF_IE(.D(IntR & (~uret)),.clk(clk_n),.rst(1'b0),.en(1),.State(IE));
//    register #(32) EPC(.clk(clk_n),.rst(rst),.en(IntrRequest),.in(EPCin),.out(EPCout));
    clr_generator clrSignals(.IntNo(IntNo),.clk(clk_n),.uret(uret),.IntrRequest(IntrRequest),.clrNo(clrNo));
    
    // 多级中断
    register #(1) reg_IE(.clk(clk_n),.rst(rst),.en(IEen),.in(~CLI),.out(IE));
    INTStack intStack(.clk(clk_n),.en(uret | INT),.rst(rst),.sel(uret),.IntNo(IntNo),.IntNoPre(IntNoPre));
    EPCStack epcStack(.clk(clk_n),.en(uret | INT),.rst(rst),.sel(uret),.EPCin(EPCin),.EPCout(EPCout));
endmodule
