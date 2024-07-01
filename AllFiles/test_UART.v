`timescale 1ns / 1ps

module test_UART(
    //input clk, //系统时钟
    input i_clk_sys, //系统时钟
    input i_rst_n, //全局异步复位
    input i_uart_rx, //接收数据,UART输入 
    output o_uart_tx, //发送数据,UART输出
    output o_ld_parity, //校验位检验LED
    output [7:0] SEG,
    output [7:0] AN
    ); 
    
    localparam BYTES = 3136; //传输总字节数
    localparam CLK_FRE = 500; //时钟频率
    localparam DATA_WIDTH = 8; //有效数据位数 
    localparam BAUD_RATE = 10000; //波特率
    localparam PARITY_ON = 0; //校验位
    localparam PARITY_TYPE = 0; //校验类型
    
    wire [7:0] rx_data;
    reg [7:0] tx_data;
    wire w_rx_done,out_done;
    reg w_tx_done;
    
    wire go = 1'b0;
    wire [1:0] frequency = 2'b11;
    wire [1:0] showsel = 2'b00;
    wire IRA = 1'b0;
    wire IRB = 1'b0;
    wire IRC = 1'b0;
    wire [31:0] Res;
    reg [25087:0] CPU_Data;
    wire CPU_Done;
    reg Rst_CPU;
    
    test_UART_Receiver //接收数据 
    #(
        .CLK_FRE(CLK_FRE),         //时钟频率，默认时钟频率为100000Hz
        .DATA_WIDTH(DATA_WIDTH),       //有效数据位数，缺省为8位
        .PARITY_ON(PARITY_ON),        //校验位，1为有校验位，0为无校验位，缺省为0
        .PARITY_TYPE(PARITY_TYPE),      //校验类型，1为奇校验，0为偶校验，缺省为偶校验
        .BAUD_RATE(BAUD_RATE)      //波特率，缺省为9600
    ) u_uart_rx
    (
        .i_clk_sys(i_clk_sys),      //系统时钟
        .i_rst_n(i_rst_n),        //全局异步复位,低电平有效
        .i_uart_rx(i_uart_rx),      //UART输入
        .o_uart_data(rx_data),    //UART接收数据
        .o_ld_parity(o_ld_parity),    //校验位检验LED，高电平位为校验正确
        .o_rx_done(w_rx_done)      //UART数据接收完成标志
    );
    
    wire [25087:0] receivedata;
    wire receive_done;
    
    test_Data_Receiver
    #(.BYTES(BYTES))
    tDR
    (   .i_clk_sys(i_clk_sys),
        .i_rst_n(i_rst_n),
        .databyte(rx_data),
        .w_rx_done(w_rx_done),
        .receivedata(receivedata),
        .receive_done(receive_done)
    );
    
    riscv_datapath_with_float CPU
    (
        .clk(i_clk_sys),
        .rst(Rst_CPU),
        .go(go),
        .frequency(frequency),
        .showsel(showsel),
        .IRA(IRA),
        .IRB(IRB),
        .IRC(IRC),
        .Data(CPU_Data),
        .Done(CPU_Done),
        .Res(Res),
        .PC(led_data)
    );
    
    test_UART_Transmitter //发送数据 
    #(
        .CLK_FRE(CLK_FRE),         //时钟频率，默认时钟频率为100000Hz
        .DATA_WIDTH(DATA_WIDTH),       //有效数据位，缺省为8位
        .PARITY_ON(PARITY_ON),        //校验位，1为有校验位，0为无校验位，缺省为0
        .PARITY_TYPE(PARITY_TYPE),      //校验类型，1为奇校验，0为偶校验，缺省为偶校验
        .BAUD_RATE(BAUD_RATE)      //波特率，缺省为9600
    ) u_uart_tx
    (   .i_clk_sys(i_clk_sys),      //系统时钟
        .i_rst_n(i_rst_n),        //全局异步复位
        .i_data_tx(tx_data),      //传输数据输入
        .i_data_valid(w_tx_done),   //传输数据有效
        .o_uart_tx(o_uart_tx),       //UART输出
        .out_done(out_done) //输出完成
    );

    reg [25087:0] treceivedata;
    reg [6:0] SendState;
    reg [31:0] SendCnt;
    reg SendEn;
    
    localparam IDLE=7'b0000001;
    localparam CPUEn=7'b0000010;
    localparam StartCPU=7'b0000100;
    localparam WaitCPU=7'b0001000;
    localparam TxSendEn=7'b0010000;
    localparam StartSend=7'b0100000;
    localparam WaitSend=7'b1000000;
    
    always@(posedge i_clk_sys or negedge i_rst_n)
    begin
        if(!i_rst_n)
        begin
            SendCnt <= 32'd0;
            SendState <= IDLE;
            SendEn <= 1'b0;
            Rst_CPU <= 1'b1;
        end
        else
        begin
            case(SendState)
                IDLE:
                begin
                    Rst_CPU <= 1'b1;
                    SendEn <= 1'b0;
                    SendCnt <= 32'd0;
                    if(receive_done)
                        SendState <= CPUEn;
                end
                CPUEn:
                begin
                    CPU_Data <= receivedata;
                    SendState <= StartCPU;
                end
                StartCPU:
                begin
                    Rst_CPU <= 1'b0;
                    if(SendEn)
                    begin
                        SendState <= TxSendEn;
                        SendEn <= 1'b0;
                    end
                    else
                        SendState <= WaitCPU;
                end
                WaitCPU:
                begin
                    if(CPU_Done)
                    begin
                        SendState <= StartCPU;
                        SendEn <= 1'b1;
                    end
                end
                TxSendEn:
                begin
                    treceivedata <= Res;
                    SendState <= StartSend;
                end
                StartSend:
                begin
                    tx_data <= treceivedata[31:24];
                    treceivedata <= treceivedata << 8;
                    w_tx_done <= 1'b1;
                    SendCnt <= SendCnt + 32'd1;
                    if(SendCnt == 32'd4)
                    begin
                        SendState <= IDLE;
                        w_tx_done <= 1'b0;
                    end
                    else
                        SendState <= WaitSend;
                end
                WaitSend:
                begin
                    w_tx_done <= 1'b0;
                    if(out_done)
                        SendState <= StartSend;
                end
            endcase
        end
    end
    
    wire [31:0] led_data;
    //assign led_data = Res;
    _7Seg_Driver_Choice seg(.clk(i_clk_sys), .LED(led_data), .SEG(SEG), .AN(AN));

endmodule
