// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue Mar  1 11:58:43 2022
// Host        : DESKTOP-1E7S4JH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/vovan/Desktop/learn_cocotb/IP/c_counter_binary_0/c_counter_binary_0_stub.v
// Design      : c_counter_binary_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_counter_binary_v12_0_14,Vivado 2021.1" *)
module c_counter_binary_0(CLK, CE, SCLR, Q)
/* synthesis syn_black_box black_box_pad_pin="CLK,CE,SCLR,Q[4:0]" */;
  input CLK;
  input CE;
  input SCLR;
  output [4:0]Q;
endmodule
