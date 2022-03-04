import random

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import RisingEdge 
from cocotb.triggers import Timer 
from cocotb.queue import Queue
from cocotb.result import TestSuccess


async def fifo_axis_wr_driver(dut,  max_delay = 0, min_delay = 0):
    """Interface Driver to write data to fifo"""
    while True:
        # формируем случайную задержку и по тактовому фронту выставляем данные 
        delay = random.randint(min_delay, max_delay)
        await ClockCycles(dut.s_axis_aclk, delay)
        dut.s_axis_tvalid.value = 1
        dut.s_axis_tdata.value = random.randint(0, 2**16 - 1)
        await RisingEdge(dut.s_axis_aclk)
        # проверяем сигнал tready и, если он установлен, то сбрасываем tvalid 
        if dut.s_axis_tready.value:
            dut.s_axis_tvalid.value = 0
        else:
            await RisingEdge(dut.s_axis_tready)
            await RisingEdge(dut.s_axis_aclk)
            dut.s_axis_tvalid.value = 0     


async def fifo_axis_wr_monitor(dut, queue):
    """Interface Monitor for fifo write"""
    while True:
        await RisingEdge(dut.s_axis_aclk)
        if dut.s_axis_tready.value and dut.s_axis_tvalid.value:
            queue.put_nowait(dut.s_axis_tdata.value)
            dut._log.debug("Write data %s to fifo", dut.s_axis_tdata.value)
            

async def fifo_axis_rd_driver(dut,  max_delay = 0, min_delay = 0):
    """Interface Driver to read data from fifo"""
    while True:
        # формируем случайную задержку и по тактовому фронту выставляем данные 
        delay = random.randint(min_delay, max_delay)
        await ClockCycles(dut.s_axis_aclk, delay)
        dut.m_axis_tready.value = 1
        await RisingEdge(dut.s_axis_aclk)
        # проверяем сигнал tvalid и, если он установлен, то сбрасываем tready 
        if dut.m_axis_tvalid.value:
            dut.m_axis_tready.value = 0
        else:
            await RisingEdge(dut.m_axis_tvalid)
            await RisingEdge(dut.s_axis_aclk)
            dut.m_axis_tready.value = 0


async def fifo_axis_rd_monitor(dut, queue):
    """Interface Monitor for fifo read"""
    while True:
        await RisingEdge(dut.s_axis_aclk)
        if dut.m_axis_tready.value and dut.m_axis_tvalid.value:
            queue.put_nowait(dut.m_axis_tdata.value)
            dut._log.debug("Read data %s from fifo", dut.m_axis_tdata.value)


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

    # dut._log.setLevel(cocotb.logging.DEBUG)

    # число транзакций
    trans_numb = 1000

    # очереди для входного и выходного интерфейсов
    in_queue = Queue()
    out_queue = Queue()

    # начальное значение сигналов
    dut.s_axis_aresetn.setimmediatevalue(0)
    dut.s_axis_tvalid.setimmediatevalue(0)
    dut.m_axis_tready.setimmediatevalue(0)
    
    # тактовый сигнал
    clock = Clock(dut.s_axis_aclk, 10, units="ns")
    cocotb.start_soon(clock.start(start_high=False))

    # начальная задержка
    await Timer(200, units="ns")
    
    # запуск мониторов и проверки теста
    cocotb.start_soon(scoreboard(dut, in_queue, out_queue, trans_numb))
    cocotb.start_soon(fifo_axis_wr_monitor(dut, in_queue))
    cocotb.start_soon(fifo_axis_rd_monitor(dut, out_queue))

    # снятие сигнала сброса
    await ClockCycles(dut.s_axis_aclk, 10)
    dut.s_axis_aresetn.value = 1
    await ClockCycles(dut.s_axis_aclk, 10)

    # запуск драйвера для записи
    cocotb.start_soon(fifo_axis_wr_driver(dut, 5, 0))
    await ClockCycles(dut.s_axis_aclk, 20)

    # запуск драйвера для чтения
    cocotb.start_soon(fifo_axis_rd_driver(dut, 3, 1))

    # # ожидаем окончания транзакций
    await ClockCycles(dut.s_axis_aclk, trans_numb)
    raise TestSuccess("Fifo pass %s transactions" % trans_numb)


