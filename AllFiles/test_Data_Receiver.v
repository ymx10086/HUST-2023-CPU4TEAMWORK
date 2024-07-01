`timescale 1ns / 1ps

module test_Data_Receiver
#(parameter BYTES = 3136)
(   input i_clk_sys,
    input i_rst_n,
    input [7:0] databyte,
    input w_rx_done,
    output reg [25087:0] receivedata,
    output reg receive_done
    );

reg [2:0] state;
reg [31:0] cnt;

localparam IDLE = 3'b001;
localparam DATACHECK = 3'b010;
localparam DATASTART = 3'b100;

always@(posedge i_clk_sys or negedge i_rst_n)
begin
    if(!i_rst_n)
    begin
        receivedata <= 25088'd0;
        receive_done <= 1'b0;
        cnt <= 32'd0;
        state <= IDLE;
    end
    else
        case(state)
            IDLE:
            begin
                receive_done <= 1'b0;
                cnt <= 32'd0;
                if(w_rx_done)
                begin
                    if(databyte == 8'hab)
                        state <= DATACHECK;
                    else
                        state <= IDLE;
                end
            end
            DATACHECK:
            begin
                if(w_rx_done)
                begin
                    if(databyte == 8'h41)
                        state <= DATASTART;
                    else
                        state <= IDLE;
                end
            end
            DATASTART:
            begin
                if(w_rx_done)
                begin
                   receivedata <= {receivedata[25079:0], databyte};
                   cnt <= cnt + 32'd1;
                   if(cnt == BYTES)
                   begin
                        state <= IDLE;
                        receive_done <= 1'b1;
                   end
                end
            end
        endcase
end

endmodule
