-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Fri Sep 25 20:52:13 2026
-- Host        : dmas-pc running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_ButtonDebouncerBus_0_0_stub.vhdl
-- Design      : design_1_ButtonDebouncerBus_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    CLK50MHZ : in STD_LOGIC;
    BUTTON : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BUTTON_DEBOUNCED : out STD_LOGIC_VECTOR ( 3 downto 0 );
    RISING_EDGE_PULSE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FALLING_EDGE_PULSE : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_ButtonDebouncerBus_0_0,ButtonDebouncerBus,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "CLK50MHZ,BUTTON[3:0],BUTTON_DEBOUNCED[3:0],RISING_EDGE_PULSE[3:0],FALLING_EDGE_PULSE[3:0]";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "ButtonDebouncerBus,Vivado 2025.2";
begin
end;
