// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Fri Sep 25 20:52:13 2026
// Host        : dmas-pc running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_ButtonDebouncerBus_0_0_stub.v
// Design      : design_1_ButtonDebouncerBus_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_ButtonDebouncerBus_0_0,ButtonDebouncerBus,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "ButtonDebouncerBus,Vivado 2025.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(CLK50MHZ, BUTTON, BUTTON_DEBOUNCED, 
  RISING_EDGE_PULSE, FALLING_EDGE_PULSE)
/* synthesis syn_black_box black_box_pad_pin="BUTTON[3:0],BUTTON_DEBOUNCED[3:0],RISING_EDGE_PULSE[3:0],FALLING_EDGE_PULSE[3:0]" */
/* synthesis syn_force_seq_prim="CLK50MHZ" */;
  input CLK50MHZ /* synthesis syn_isclock = 1 */;
  input [3:0]BUTTON;
  output [3:0]BUTTON_DEBOUNCED;
  output [3:0]RISING_EDGE_PULSE;
  output [3:0]FALLING_EDGE_PULSE;
endmodule
