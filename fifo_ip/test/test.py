import random

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import RisingEdge 
from cocotb.triggers import Timer 
from cocotb.queue import Queue
from cocotb.result import TestSuccess


async def fifo_wr_driver(dut, rate):
    """Interface Driver to write data to fifo"""
    while True:
        await RisingEdge(dut.clk)
        await Timer(2, units="ns")
        write_enable = 1 if random.randint(0, 100) < rate else 0
        if write_enable and not dut.full.value:
            dut.wr_en.value = 1
            dut.din.value = random.randint(0, 255)
        else:
            dut.wr_en.value = 0        


async def fifo_wr_monitor(dut, queue):
    """Interface Monitor for fifo write"""
    while True:
        await RisingEdge(dut.clk)
        if dut.wr_en.value:
            queue.put_nowait(dut.din.value)
            dut._log.debug("Write data %s to fifo", dut.din.value)
            

async def fifo_rd_driver(dut, rate):
    """Interface Driver to read data from fifo"""
    while True:
        await RisingEdge(dut.clk)
        await Timer(2, units="ns")
        read_enable = 1 if random.randint(0, 100) < rate else 0
        if read_enable and not dut.empty.value:
            dut.rd_en.value = 1
        else:
            dut.rd_en.value = 0  


async def fifo_rd_monitor(dut, queue):
    """Interface Monitor for fifo read"""
    read_last = 0
    while True:
        await RisingEdge(dut.clk)
        if read_last:
            queue.put_nowait(dut.dout.value)
            dut._log.debug("Read data %s from fifo", dut.dout.value)
        read_last = dut.rd_en.value


async def scoreboard(dut, in_queue, out_queue, trans_numb):
    """Test checker"""
    counter = 0
    while True:
        indata = await in_queue.get()
        dut._log.debug("Scoreboard write data %s", indata)
        outdata = await out_queue.get()
        dut._log.debug("Scoreboard read data %s", outdata)
        assert indata == outdata, "Write and read data mismatch"
        counter += 1
        if counter == trans_numb:
            raise TestSuccess("Fifo pass %s transactions" % trans_numb)

@cocotb.test()
async def test(dut):
    """Simple fifo test"""

    #dut._log.setLevel(cocotb.logging.DEBUG)

    # число транзакций
    trans_numb = 1000

    # очереди для входного и выходного интерфейсов
    in_queue = Queue()
    out_queue = Queue()

    # начальное значение сигналов
    dut.srst.setimmediatevalue(1)
    dut.wr_en.setimmediatevalue(0)
    dut.rd_en.setimmediatevalue(0)
    
    # тактовый сигнал
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start(start_high=False))

    # запуск мониторов и проверки теста
    cocotb.start_soon(scoreboard(dut, in_queue, out_queue, trans_numb))
    cocotb.start_soon(fifo_wr_monitor(dut, in_queue))
    cocotb.start_soon(fifo_rd_monitor(dut, out_queue))

    # снятие сигнала сброса
    await ClockCycles(dut.clk, 5)
    dut.srst.value = 0
    await ClockCycles(dut.clk, 2)

    # запуск драйвера для записи
    cocotb.start_soon(fifo_wr_driver(dut, 20))
    await ClockCycles(dut.clk, 20)

    # запуск драйвера для чтения
    cocotb.start_soon(fifo_rd_driver(dut, 80))

    # ожидаем окончания транзакций
    await ClockCycles(dut.clk, trans_numb*1000)
    


