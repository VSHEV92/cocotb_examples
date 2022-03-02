// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue Mar  1 11:58:43 2022
// Host        : DESKTOP-1E7S4JH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/vovan/Desktop/learn_cocotb/IP/c_counter_binary_0/c_counter_binary_0_sim_netlist.v
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_14,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module c_counter_binary_0
   (CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [4:0]Q;

  wire CE;
  wire CLK;
  wire [4:0]Q;
  wire SCLR;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "5" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  c_counter_binary_0_c_counter_binary_v12_0_14 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
GTqSEFfdw74AxDk1xtNQd2f6GHWzPN2yfLbDluzXTaZpl4W+sEd4lTW79qJytbO6Id+EKMIQA/Rd
JoOZOfWlzssuRG26ui4Pta5Y3JPgDAy22thMZez0bbLCexUp/MGwpsqeiAH6fB25CKwqaY0ZeWU5
zVSIuMCwrJjkXNKwtns=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zg7QdpS0h5qvdN8jDF6+Uy7LIqhoofwxBC4VSN6My9UgXglQ2uXgzJ3C3R8F1pgtGLa4D+ow2y/Y
AYpFHE8foILr6fC+wuHZ1AVOCIwn3jyrqkyC5GdfavPR782wRbs37sC/s2HdBL9KBYEYx/5Jns/o
UYIX6hvN50LZfVhiFW7hgfl90zqrt0dD0p5PPQIo+CjylU1iskxRQklRTt4e8CiQG4CDFV4P8lOl
A8j9h1MbVgW67VZNE2bmg8yVzCpLZWRMG/YJVq4c5A6ijn++/Skhq8nBHcw/pDZM2cPEt5tIjCsi
RX7+h5VqjxnJIDLE8NjzHmZqaYqo0f46F0d8yA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sraMSTIusw2vW8x6E/6NjBaBni1BYS47l8DJ4rLdHpjUsGIjJyCpbYaL5fGuk9CxeqtrDOjYVAi7
90gKBWdO9PFhDW1ioDW5KOAL0Vn4jIu47pX4jDV4qeNvNk1diz69p4CFg1STDlAXZzrSuxsj72WP
87dmE4nl3SabfGRMBlo=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DR1bpsHn3evUQJqCy4fwFjV86IgidayNbMB9OsXIxw3etzwha87Cnp5nA00lGLG4fZ8pZJyrI6L/
fRkMyndVySdfcAKVuezHlGOupplByaJ1+yCRdSsxFWClOxzxu14UG4YKPeaiNLetLoWeelB5Tnqq
1hYi/BGV/rThTOY71pF8la+OJtDpWMFLfoXJoOTVCegrm5gqKtFY6w/8XsbGVdyg3iSIqj8qCkwB
BZ3YsrUv1TDfRwq1TYRCI1n8zXr53wvSW/5PP77E4inmNHCXCVXnOKsizHIZJAkA2UmS1vzkurzr
VEW+C/svU60NnxjcTMNcwEEDircH1H9DE6aBOA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mOBk7oA7/Fcn9XTT8ZhbYFKmYzC49P630wnSr28owJKgc5uh27BumG9Lb7w3/r45RWv2mmSUb6eo
4mxciLVWSDIdLhjlTf7LOhgrJMOQXh5LGfsh9zwms2iOvCnCe0hfP9CL4UIgLUV2jp5cxrFr9uAh
yJgNcg2fWFX83mbc16nw5NIp0rSQlbrOKf65j+6+CDDgfV9oxBoALy3cgRDvV7+fgxQgopIKdFoK
b45HIQkxV/IjqDH03Avy68Ukar+0zNvwBgy+ehioNpAXVylHbDXnHQp4PrgZSO+OktFUy+3UBAwI
dJq7YaBh/R/fv/SlpxdK/xa4Qvtzq9l/9JB4GQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bCy2E+cIonplnhEbZmGvC1heHQ60MGwVmU2x15ENdnJuhBjqhnJc/OjcmXCnsQ0PVFLIlQ/0wpvC
IqfKU1GFE+M+qT4h4wnc/x1JQXagKtMY5JeKKAYfWs8npp6CsE1Cg65poSjyPQsgppvcKCQkY5IZ
90pVE9LqdAo5VyBUFrKhK+FCFJMU+3N2xsv05aL9/AGTNG+GXNZ7CkLFnRb50dABLQ4Ku2BMSRvn
+UuVYirvcztxNT1gNuOrcoLmom1iYxT/TCqIeQROkp5HGgunWatU6fYC+ht+UFU9ygjggNSGfAnd
nCf+NSTYx33GxKIYVtgmZXwyP5cI8Lk/NmSxwA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TmV0I8CXrLN6NcEG9hNmTThTTkBIattb9yt7bm+0yRK6TSd3xiYqQWx5SXI3IMOAAqoYeCKDQiZi
cDQjcnh57glJKKvIBsctOLK/D2Kxyx3ml4Bjudc5vHfUEcBa5y/gEA0EWGBeWkllUdY84GtJEUsS
AuoWUgMw5h5ipQAj5iVYp95KGgk8eW8+W7GSh8cLYOV/kSvykcQxSrHFcgdJFnmCjN2aBEVI+6Rq
fnZfZDbZGAJB6fq14VDxtFeZczuf+wg4xmxBX+Eh2/eWWs22Kj7qYMcbKvAFaRq5iGeydCuQBnIu
ea3TVf+OoBqLQ94kHgaoWr2qD25EKHXRIXHKzQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
Qes+skSjlfcngFHqOonb/14mf4z1xOJPJsFQklrcQMwgfeYnzbXPyi+VjQno7oMepbwl3h4WW5qp
aNXYP/ZpN4wr42OVgYVRglpc1gbAeMcellSFa1b3aa0p0MTVbZLuSRBHvAHGATaSH+IryuDZhdQK
2ph4EVLTnZlFXUBQTpyMiG7KQBeQ0fae3hCn5gCL5DSdxeRA3jjvxvbhmrKdOJ62//GfreJsyaWw
nYXtlk7UFCVSSNpAlj6KeazG3ySpvsPARbSw7rVBZlwuxyyVaNShIrT4xyocuG+decy0RByiaxY3
VVhRV6XM/SqfxlhSmSAQ5c9iR+Z7Of4EW3OPW3xuRiFX3j2RMmv7RZJ+grM24tWBNfD7vubT/uYx
LHeqF03tFF/s6jlupPE6Ss6Jdt/rNxPq1rM10viJa0v0aNFc/a7FhHHO9CmpZ3V18zUmudbd6mIi
itL0+u9Q5BeihF1Yk/zHxWnMDZ9bzZzebHRLl4tGiWOJMHyTnvLtg/uj

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fT9P0busnHFhNtVhuf1ATqDeNMlqjQwbhvf0x34wZd35mjARDv55SXpRz+pBacoaxyo8g70Zt6by
jhGGO95tzsD9Cq8TIfsQ2B4hmI5lT4QzHGYby6xuklbwvPhpcpNgdDV9apT+gdvPWZnNk+R5awyV
uNxQNzyZblMxkJinicsdHysCQjzYlps9O1mEE9ZZTZ6WH4+e+k1mrmPmUBBazuWMZ2/cw7t9XbZT
/zm9meBtxtVaA35lu3qeM0Of8DV+54hnAG4sYgN9RRwmHgxE//V5fc/cyV6/fVWSrBIACq6lNplr
Gs0JTuAQrPaxxhx39ruQXEKIuc1vtVdzAuNhSw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eHJOMXoCfeXMvmc9rIe3fQGVrd5zdZ/wWXt5U3Eyv9fCaXa6vlHcHYXI3jy7wrsPKXYLJHDqeFR7
E76GLZO5N6ihPilTXaElPopykuKXqz495Eaz2uDJtdtSSDw4gMN0avCp6O27hhH9x/JkMRIdpAK9
ok4BDuqTKOcs0wY/EI/0JVqQE5TJ2jXEJKNau719uGfUCoohKUFdkoDv5ljiDU417BNf1AzuE7Fq
znozM8CZxJSPIrBG+FhC72RiI/0b0Kkq1nFMmkmfSNpG3OiFiQZHBlGkJdxoX+mc8StwSVvvbb2O
8aqQlXlz0EvfW4snJVBzcOo/v3KLT9b/qa9VWg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F/2Fpm93Bm+YyB7ukHhCbUy4rLrXHutXaXJhwN/9Rq5QKDg+WImUDPn0xY6YSdlX8yQf4GRo5IDP
iyHiM/2mgjsl7Ug4prMDXd+SHlaXGaaRIeQAEm+WxagZpeSieWlCXPZ0NRiYWtwYp2lt6YQ0PJI9
yxYHVKf5FVMxtP0XdCa9nMY6S6pH8VbDmJEWuIyLOSZ+ONIExGsdgma8xPozQXJX/VxBTtJHGGKv
ck+lk+jUDYhNReNJrzlfs9y0HK89yksRpLijetNWJ3jfBlRRB5Upcgj40pOobHf4YgYiCbQ8njF0
dTv+2iDpiOgDXD48whVY3ojTXvEa4nkKgCc/2A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8640)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
