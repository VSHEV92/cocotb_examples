import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import RisingEdge 

async def counter_monitor(dut, clock):
    while True:
        await RisingEdge(dut.clk)
        if not dut.reset.value:
            dut._log.info("Counter in reset state")    
        else:
            dut._log.info("Counter value is %s", dut.Q.value)

@cocotb.test()
async def test(dut):
    """Simple counter test"""

    WIDTH = 5

    # начальное значение сигнала сброса
    dut.reset.setimmediatevalue(1)
    
    # тактовый сигнал
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start(start_high=False))

    # запуск логирования
    cocotb.start_soon(counter_monitor(dut, clock))

    # снятие сигнала сброса
    await ClockCycles(dut.clk, 5)
    dut.reset.value = 0

    for i in range(50):
        await RisingEdge(dut.clk)
        assert dut.Q.value == i % (2 ** WIDTH), f"output Q was incorrect on the {i}th cycle"
    


