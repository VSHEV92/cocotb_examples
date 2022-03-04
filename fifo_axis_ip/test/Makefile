SIM = questa

SIM_ARGS+=-L axis_data_fifo_v2_0_6 -L axis_infrastructure_v1_1_0 -L xpm sim_build/work.glbl

TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES = ../../IP/axis_data_fifo_0/sim/*.v ./*.v

MODULE = test
TOPLEVEL = axis_data_fifo_0

include $(shell cocotb-config --makefiles)/Makefile.sim