import random

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import RisingEdge 
from cocotb.triggers import ReadWrite 

def counter_gold(ce, reset):
    """ 5-bit counter gold model """
    if reset:
        counter_gold.value = 0
    elif ce:
        counter_gold.value += 1
        counter_gold.value %= 2**5
    return counter_gold.value

async def counter_ce_generator(dut):
    """ random ce generator coroutine """
    while True:
        await RisingEdge(dut.CLK)
        dut.CE.value = random.randint(0, 1)

async def counter_monitor(dut):
    """ counter output monitor """
    while True:
        await RisingEdge(dut.CLK)
        if dut.SCLR.value:
            dut._log.debug("Counter in SCLR state")    
        else:
            dut._log.debug("Counter value is %s", dut.Q.value)

@cocotb.test()
async def test(dut):
    """Simple counter test"""

    # начальное значение сигнала сброса
    counter_gold.value = 0
    dut.SCLR.setimmediatevalue(1)
    dut.CE.setimmediatevalue(0)
    
    # тактовый сигнал
    clock = Clock(dut.CLK, 10, units="ns")
    cocotb.start_soon(clock.start(start_high=False))

    # запуск монитора
    cocotb.start_soon(counter_monitor(dut))

    # снятие сигнала сброса
    await ClockCycles(dut.CLK, 5)
    dut.SCLR.value = 0

    # запуск сигнала CE
    cocotb.start_soon(counter_ce_generator(dut))

    for i in range(50):
        await RisingEdge(dut.CLK)
        gold_Q = counter_gold(dut.CE.value, dut.SCLR.value)
        dut._log.debug("Gold counter value is %s", gold_Q)
        await ReadWrite()
        assert dut.Q.value == gold_Q, f"output Q was incorrect on the {i}th cycle"
    


