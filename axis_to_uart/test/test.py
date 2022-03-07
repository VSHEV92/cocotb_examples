import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotbext.uart import UartSource, UartSink
from cocotbext.axi import AxiStreamBus, AxiStreamSource, AxiStreamSink

# генератор случайных пауз в транзакциях
def rand_pause(prob = 100):
    while True:
        yield prob >= random.randint(0, 100)

@cocotb.test()
async def test(dut):
    """Uart to AXI-Stream test"""

    #dut._log.setLevel(cocotb.logging.DEBUG)

    # начальное значение сигнала сброса
    dut.aresetn.setimmediatevalue(0)

    # число транзакций записи и чтения
    trans_numb = 10
    
    # старт тактового сигнала
    cocotb.start_soon(Clock(dut.aclk, 100, units="ns").start())

    # настройка axis интерфейсов
    source_axis = AxiStreamSource(AxiStreamBus.from_prefix(dut, "in"), dut.aclk, dut.aresetn, reset_active_level=False)
    sink_axis = AxiStreamSink(AxiStreamBus.from_prefix(dut, "out"), dut.aclk, dut.aresetn, reset_active_level=False)
    source_axis.set_pause_generator(rand_pause(80))
    

    source_uart = UartSource(dut.RX, baud=115200, bits=8, stop_bits=1)
    sink_uart = UartSink(dut.TX, baud=115200, bits=8, stop_bits=1)

    # снятие сигнала сброса
    await ClockCycles(dut.aclk, 10)
    dut.aresetn.value = 1
    await ClockCycles(dut.aclk, 10)

    # тест AXI-Stream в UART
    # формирование и запись входных данных
    indata = random.sample(range(0, 2**8-1), trans_numb)
    await source_axis.send(indata)
    
    # считывание и проверка выходных данных
    for inframe in indata:
        tx_data = await sink_uart.read(1)
        dut._log.debug("Write axis data: %s. Read uart data: %s.", inframe, tx_data[0])
        assert inframe == tx_data[0], "Write and read data mismatch"


    # тест UART в AXI-Stream 
    # формирование и запись входных данных
    indata = random.sample(range(0, 2**8-1), trans_numb)
    await source_uart.write(indata)
    
    # считывание и проверка выходных данных
    for rx_data in indata:
        inframe = await sink_axis.read(1)
        dut._log.debug("Write uart data: %s. Read axis data: %s.", rx_data, inframe[0])
        assert rx_data == inframe[0], "Write and read data mismatch"

    
