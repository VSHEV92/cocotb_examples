import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles
from cocotbext.axi import AxiStreamBus, AxiStreamSource, AxiStreamSink

# генератор случайных пауз в транзакциях
def rand_pause(prob = 100):
    while True:
        yield prob >= random.randint(0, 100)

@cocotb.test()
async def test(dut):
    """Simple fifo test"""

    #dut._log.setLevel(cocotb.logging.DEBUG)

    # начальное значение сигнала сброса
    dut.s_axis_aresetn.setimmediatevalue(0)

    # число транзакций
    trans_numb = 1000
    
    # старт тактового сигнала
    cocotb.start_soon(Clock(dut.s_axis_aclk, 10, units="ns").start())

    # настройка axis интерфейсов
    source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis"), dut.s_axis_aclk, dut.s_axis_aresetn, reset_active_level=False)
    sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis"), dut.s_axis_aclk, dut.s_axis_aresetn, reset_active_level=False)
    source.set_pause_generator(rand_pause(20))
    sink.set_pause_generator(rand_pause(90))

    # снятие сигнала сброса
    await ClockCycles(dut.s_axis_aclk, 10)
    dut.s_axis_aresetn.value = 1
    await ClockCycles(dut.s_axis_aclk, 10)

    # формирование и запись входных данных
    indata = random.sample(range(0, 2**16-1), trans_numb)
    await source.send(indata)
    
    # считывание и проверка выходных данных
    for inframe in indata:
        outframe = await sink.read(1)
        dut._log.debug("Wtite data: %s. Read data: %s.", inframe, outframe[0])
        assert inframe == outframe[0], "Write and read data mismatch"

