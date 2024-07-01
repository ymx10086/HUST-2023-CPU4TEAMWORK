import serial
import time

# 串口配置信息（根据FPGA UART模块的设置进行配置）
serial_port = 'COM10'  # 串口设备名称
baud_rate = 9600  # 波特率
data_bits = serial.EIGHTBITS  # 数据位数（8位数据位）
parity = serial.PARITY_NONE  # 校验位（无校验位）
stop_bits = serial.STOPBITS_ONE  # 停止位数（1位停止位）


# 打开串口连接
ser = serial.Serial(port=serial_port, baudrate=baud_rate, bytesize=data_bits, parity=parity, stopbits=stop_bits)

# 检验串口是否打开成功
if(ser.isOpen()):
    print("串口打开成功！")
else:
    print("串口打开失败！")

try:
    # 准备要发送的数据
    with open("./input.hex", "r") as f:
        hex_list = f.readlines()
    hex_str = "ab41" + "".join(hex_list)
    transmit_data = bytes.fromhex(hex_str)  # 要发送的数据，以字节形式表示
    # 发送数据给FPGA
    ser.write(transmit_data)
    print(f"Sent: {transmit_data[:100]}")

    # 接收从FPGA返回的数据
    received_data = ser.read(4)  # 假设要接收的数据长度为1字节
    print(f"Received: {received_data}")

except serial.SerialException as e:
    print(f"Serial communication error: {str(e)}")

finally:
    ser.close()  # 关闭串口连接

# import serial.tools.list_ports
#
# # 获取可用串口列表
# available_ports = list(serial.tools.list_ports.comports())
#
# if len(available_ports) > 0:
#     print("Available serial ports:")
#     for port_info in available_ports:
#         print(f"- {port_info.device}")
# else:
#     print("No serial ports found.")
