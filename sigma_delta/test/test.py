import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb_bus.drivers.amba import AXI4LiteMaster

@cocotb.test()
async def test(dut):
    """Sigma delta AXI-Lite test"""

    dut._log.setLevel(cocotb.logging.DEBUG)

    # начальное значение сигнала сброса
    dut.s_axi_aresetn.setimmediatevalue(0)

    # число транзакций записи и чтения
    trans_numb = 256
    
    # старт тактового сигнала
    cocotb.start_soon(Clock(dut.s_axi_aclk, 10, units="ns").start())

    # создание axi интерфейса
    axim = AXI4LiteMaster(dut, "S_AXI", dut.s_axi_aclk)

    # снятие сигнала сброса
    await ClockCycles(dut.s_axi_aclk, 10)
    dut.s_axi_aresetn.value = 1
    await ClockCycles(dut.s_axi_aclk, 10)

    # включить IP-ядро 
    await axim.write(0x00, 1)
    data = await axim.read(0x00)
    assert data == 1, "Write and read data mismatch"
    await ClockCycles(dut.s_axi_aclk, 10)

    # запись всех возмлжных значений модулятора
    for value in range(256):
        dut._log.debug("Write value: %s", value)
        await axim.write(0x04, value)
        data = await axim.read(0x04)
        assert data == value, "Write and read data mismatch"
        await ClockCycles(dut.s_axi_aclk, 1000)

    
