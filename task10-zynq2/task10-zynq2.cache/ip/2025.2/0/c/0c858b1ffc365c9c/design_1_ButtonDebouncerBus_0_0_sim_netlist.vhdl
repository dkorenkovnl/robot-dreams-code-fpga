-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Fri Sep 25 20:52:13 2026
-- Host        : dmas-pc running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_ButtonDebouncerBus_0_0_sim_netlist.vhdl
-- Design      : design_1_ButtonDebouncerBus_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK50MHZ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover is
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[0]_i_3_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal debouncer_output_i_1_n_0 : STD_LOGIC;
  signal debouncer_output_i_2_n_0 : STD_LOGIC;
  signal debouncer_output_i_3_n_0 : STD_LOGIC;
  signal debouncer_output_i_4_n_0 : STD_LOGIC;
  signal \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 35;
begin
  D(0) <= \^d\(0);
\counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF80008000FFFF"
    )
        port map (
      I0 => debouncer_output_i_2_n_0,
      I1 => counter_reg(0),
      I2 => debouncer_output_i_3_n_0,
      I3 => debouncer_output_i_4_n_0,
      I4 => \out\(0),
      I5 => \^d\(0),
      O => \counter[0]_i_1_n_0\
    );
\counter[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_3_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2_n_7\,
      Q => counter_reg(0),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_2_n_0\,
      CO(2) => \counter_reg[0]_i_2_n_1\,
      CO(1) => \counter_reg[0]_i_2_n_2\,
      CO(0) => \counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_2_n_4\,
      O(2) => \counter_reg[0]_i_2_n_5\,
      O(1) => \counter_reg[0]_i_2_n_6\,
      O(0) => \counter_reg[0]_i_2_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_3_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3 downto 2) => \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_counter_reg[16]_i_1_O_UNCONNECTED\(3),
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3) => '0',
      S(2 downto 0) => counter_reg(18 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2_n_6\,
      Q => counter_reg(1),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2_n_5\,
      Q => counter_reg(2),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2_n_4\,
      Q => counter_reg(3),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_2_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8),
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9),
      R => \counter[0]_i_1_n_0\
    );
debouncer_output_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7F8000FFFF0000"
    )
        port map (
      I0 => debouncer_output_i_2_n_0,
      I1 => debouncer_output_i_3_n_0,
      I2 => debouncer_output_i_4_n_0,
      I3 => \out\(0),
      I4 => \^d\(0),
      I5 => counter_reg(0),
      O => debouncer_output_i_1_n_0
    );
debouncer_output_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => counter_reg(15),
      I1 => counter_reg(16),
      I2 => counter_reg(13),
      I3 => counter_reg(14),
      I4 => counter_reg(18),
      I5 => counter_reg(17),
      O => debouncer_output_i_2_n_0
    );
debouncer_output_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(4),
      I2 => counter_reg(1),
      I3 => counter_reg(2),
      I4 => counter_reg(6),
      I5 => counter_reg(5),
      O => debouncer_output_i_3_n_0
    );
debouncer_output_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(10),
      I2 => counter_reg(8),
      I3 => counter_reg(7),
      I4 => counter_reg(12),
      I5 => counter_reg(11),
      O => debouncer_output_i_4_n_0
    );
debouncer_output_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => debouncer_output_i_1_n_0,
      Q => \^d\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_0 is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK50MHZ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_0 : entity is "noise_remover";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_0 is
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counter[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter[0]_i_3__0_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \counter_reg[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__0_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__0_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__0_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__0_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__0_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__0_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__0_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__0_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \debouncer_output_i_1__0_n_0\ : STD_LOGIC;
  signal \debouncer_output_i_2__0_n_0\ : STD_LOGIC;
  signal \debouncer_output_i_3__0_n_0\ : STD_LOGIC;
  signal \debouncer_output_i_4__0_n_0\ : STD_LOGIC;
  signal \NLW_counter_reg[16]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter_reg[16]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_2__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1__0\ : label is 35;
begin
  D(0) <= \^d\(0);
\counter[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF80008000FFFF"
    )
        port map (
      I0 => \debouncer_output_i_2__0_n_0\,
      I1 => counter_reg(0),
      I2 => \debouncer_output_i_3__0_n_0\,
      I3 => \debouncer_output_i_4__0_n_0\,
      I4 => \out\(0),
      I5 => \^d\(0),
      O => \counter[0]_i_1__0_n_0\
    );
\counter[0]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_3__0_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__0_n_7\,
      Q => counter_reg(0),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[0]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_2__0_n_0\,
      CO(2) => \counter_reg[0]_i_2__0_n_1\,
      CO(1) => \counter_reg[0]_i_2__0_n_2\,
      CO(0) => \counter_reg[0]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_2__0_n_4\,
      O(2) => \counter_reg[0]_i_2__0_n_5\,
      O(1) => \counter_reg[0]_i_2__0_n_6\,
      O(0) => \counter_reg[0]_i_2__0_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_3__0_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__0_n_5\,
      Q => counter_reg(10),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__0_n_4\,
      Q => counter_reg(11),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__0_n_7\,
      Q => counter_reg(12),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1__0_n_0\,
      CO(3) => \counter_reg[12]_i_1__0_n_0\,
      CO(2) => \counter_reg[12]_i_1__0_n_1\,
      CO(1) => \counter_reg[12]_i_1__0_n_2\,
      CO(0) => \counter_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1__0_n_4\,
      O(2) => \counter_reg[12]_i_1__0_n_5\,
      O(1) => \counter_reg[12]_i_1__0_n_6\,
      O(0) => \counter_reg[12]_i_1__0_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__0_n_6\,
      Q => counter_reg(13),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__0_n_5\,
      Q => counter_reg(14),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__0_n_4\,
      Q => counter_reg(15),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1__0_n_7\,
      Q => counter_reg(16),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[16]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1__0_n_0\,
      CO(3 downto 2) => \NLW_counter_reg[16]_i_1__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \counter_reg[16]_i_1__0_n_2\,
      CO(0) => \counter_reg[16]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_counter_reg[16]_i_1__0_O_UNCONNECTED\(3),
      O(2) => \counter_reg[16]_i_1__0_n_5\,
      O(1) => \counter_reg[16]_i_1__0_n_6\,
      O(0) => \counter_reg[16]_i_1__0_n_7\,
      S(3) => '0',
      S(2 downto 0) => counter_reg(18 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1__0_n_6\,
      Q => counter_reg(17),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1__0_n_5\,
      Q => counter_reg(18),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__0_n_6\,
      Q => counter_reg(1),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__0_n_5\,
      Q => counter_reg(2),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__0_n_4\,
      Q => counter_reg(3),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__0_n_7\,
      Q => counter_reg(4),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_2__0_n_0\,
      CO(3) => \counter_reg[4]_i_1__0_n_0\,
      CO(2) => \counter_reg[4]_i_1__0_n_1\,
      CO(1) => \counter_reg[4]_i_1__0_n_2\,
      CO(0) => \counter_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1__0_n_4\,
      O(2) => \counter_reg[4]_i_1__0_n_5\,
      O(1) => \counter_reg[4]_i_1__0_n_6\,
      O(0) => \counter_reg[4]_i_1__0_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__0_n_6\,
      Q => counter_reg(5),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__0_n_5\,
      Q => counter_reg(6),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__0_n_4\,
      Q => counter_reg(7),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__0_n_7\,
      Q => counter_reg(8),
      R => \counter[0]_i_1__0_n_0\
    );
\counter_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1__0_n_0\,
      CO(3) => \counter_reg[8]_i_1__0_n_0\,
      CO(2) => \counter_reg[8]_i_1__0_n_1\,
      CO(1) => \counter_reg[8]_i_1__0_n_2\,
      CO(0) => \counter_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1__0_n_4\,
      O(2) => \counter_reg[8]_i_1__0_n_5\,
      O(1) => \counter_reg[8]_i_1__0_n_6\,
      O(0) => \counter_reg[8]_i_1__0_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__0_n_6\,
      Q => counter_reg(9),
      R => \counter[0]_i_1__0_n_0\
    );
\debouncer_output_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7F8000FFFF0000"
    )
        port map (
      I0 => \debouncer_output_i_2__0_n_0\,
      I1 => \debouncer_output_i_3__0_n_0\,
      I2 => \debouncer_output_i_4__0_n_0\,
      I3 => \out\(0),
      I4 => \^d\(0),
      I5 => counter_reg(0),
      O => \debouncer_output_i_1__0_n_0\
    );
\debouncer_output_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => counter_reg(15),
      I1 => counter_reg(16),
      I2 => counter_reg(13),
      I3 => counter_reg(14),
      I4 => counter_reg(18),
      I5 => counter_reg(17),
      O => \debouncer_output_i_2__0_n_0\
    );
\debouncer_output_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(4),
      I2 => counter_reg(1),
      I3 => counter_reg(2),
      I4 => counter_reg(6),
      I5 => counter_reg(5),
      O => \debouncer_output_i_3__0_n_0\
    );
\debouncer_output_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(10),
      I2 => counter_reg(8),
      I3 => counter_reg(7),
      I4 => counter_reg(12),
      I5 => counter_reg(11),
      O => \debouncer_output_i_4__0_n_0\
    );
debouncer_output_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \debouncer_output_i_1__0_n_0\,
      Q => \^d\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_1 is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK50MHZ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_1 : entity is "noise_remover";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_1;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_1 is
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counter[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \counter[0]_i_3__1_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \counter_reg[0]_i_2__1_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__1_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__1_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__1_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__1_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__1_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__1_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__1_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__1_n_7\ : STD_LOGIC;
  signal \debouncer_output_i_1__1_n_0\ : STD_LOGIC;
  signal \debouncer_output_i_2__1_n_0\ : STD_LOGIC;
  signal \debouncer_output_i_3__1_n_0\ : STD_LOGIC;
  signal \debouncer_output_i_4__1_n_0\ : STD_LOGIC;
  signal \NLW_counter_reg[16]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter_reg[16]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_2__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1__1\ : label is 35;
begin
  D(0) <= \^d\(0);
\counter[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF80008000FFFF"
    )
        port map (
      I0 => \debouncer_output_i_2__1_n_0\,
      I1 => counter_reg(0),
      I2 => \debouncer_output_i_3__1_n_0\,
      I3 => \debouncer_output_i_4__1_n_0\,
      I4 => \out\(0),
      I5 => \^d\(0),
      O => \counter[0]_i_1__1_n_0\
    );
\counter[0]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_3__1_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__1_n_7\,
      Q => counter_reg(0),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[0]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_2__1_n_0\,
      CO(2) => \counter_reg[0]_i_2__1_n_1\,
      CO(1) => \counter_reg[0]_i_2__1_n_2\,
      CO(0) => \counter_reg[0]_i_2__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_2__1_n_4\,
      O(2) => \counter_reg[0]_i_2__1_n_5\,
      O(1) => \counter_reg[0]_i_2__1_n_6\,
      O(0) => \counter_reg[0]_i_2__1_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_3__1_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__1_n_5\,
      Q => counter_reg(10),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__1_n_4\,
      Q => counter_reg(11),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__1_n_7\,
      Q => counter_reg(12),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[12]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1__1_n_0\,
      CO(3) => \counter_reg[12]_i_1__1_n_0\,
      CO(2) => \counter_reg[12]_i_1__1_n_1\,
      CO(1) => \counter_reg[12]_i_1__1_n_2\,
      CO(0) => \counter_reg[12]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1__1_n_4\,
      O(2) => \counter_reg[12]_i_1__1_n_5\,
      O(1) => \counter_reg[12]_i_1__1_n_6\,
      O(0) => \counter_reg[12]_i_1__1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__1_n_6\,
      Q => counter_reg(13),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__1_n_5\,
      Q => counter_reg(14),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__1_n_4\,
      Q => counter_reg(15),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1__1_n_7\,
      Q => counter_reg(16),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[16]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1__1_n_0\,
      CO(3 downto 2) => \NLW_counter_reg[16]_i_1__1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \counter_reg[16]_i_1__1_n_2\,
      CO(0) => \counter_reg[16]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_counter_reg[16]_i_1__1_O_UNCONNECTED\(3),
      O(2) => \counter_reg[16]_i_1__1_n_5\,
      O(1) => \counter_reg[16]_i_1__1_n_6\,
      O(0) => \counter_reg[16]_i_1__1_n_7\,
      S(3) => '0',
      S(2 downto 0) => counter_reg(18 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1__1_n_6\,
      Q => counter_reg(17),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1__1_n_5\,
      Q => counter_reg(18),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__1_n_6\,
      Q => counter_reg(1),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__1_n_5\,
      Q => counter_reg(2),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__1_n_4\,
      Q => counter_reg(3),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__1_n_7\,
      Q => counter_reg(4),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[4]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_2__1_n_0\,
      CO(3) => \counter_reg[4]_i_1__1_n_0\,
      CO(2) => \counter_reg[4]_i_1__1_n_1\,
      CO(1) => \counter_reg[4]_i_1__1_n_2\,
      CO(0) => \counter_reg[4]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1__1_n_4\,
      O(2) => \counter_reg[4]_i_1__1_n_5\,
      O(1) => \counter_reg[4]_i_1__1_n_6\,
      O(0) => \counter_reg[4]_i_1__1_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__1_n_6\,
      Q => counter_reg(5),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__1_n_5\,
      Q => counter_reg(6),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__1_n_4\,
      Q => counter_reg(7),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__1_n_7\,
      Q => counter_reg(8),
      R => \counter[0]_i_1__1_n_0\
    );
\counter_reg[8]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1__1_n_0\,
      CO(3) => \counter_reg[8]_i_1__1_n_0\,
      CO(2) => \counter_reg[8]_i_1__1_n_1\,
      CO(1) => \counter_reg[8]_i_1__1_n_2\,
      CO(0) => \counter_reg[8]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1__1_n_4\,
      O(2) => \counter_reg[8]_i_1__1_n_5\,
      O(1) => \counter_reg[8]_i_1__1_n_6\,
      O(0) => \counter_reg[8]_i_1__1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__1_n_6\,
      Q => counter_reg(9),
      R => \counter[0]_i_1__1_n_0\
    );
\debouncer_output_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7F8000FFFF0000"
    )
        port map (
      I0 => \debouncer_output_i_2__1_n_0\,
      I1 => \debouncer_output_i_3__1_n_0\,
      I2 => \debouncer_output_i_4__1_n_0\,
      I3 => \out\(0),
      I4 => \^d\(0),
      I5 => counter_reg(0),
      O => \debouncer_output_i_1__1_n_0\
    );
\debouncer_output_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => counter_reg(15),
      I1 => counter_reg(16),
      I2 => counter_reg(13),
      I3 => counter_reg(14),
      I4 => counter_reg(18),
      I5 => counter_reg(17),
      O => \debouncer_output_i_2__1_n_0\
    );
\debouncer_output_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(4),
      I2 => counter_reg(1),
      I3 => counter_reg(2),
      I4 => counter_reg(6),
      I5 => counter_reg(5),
      O => \debouncer_output_i_3__1_n_0\
    );
\debouncer_output_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(10),
      I2 => counter_reg(8),
      I3 => counter_reg(7),
      I4 => counter_reg(12),
      I5 => counter_reg(11),
      O => \debouncer_output_i_4__1_n_0\
    );
debouncer_output_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \debouncer_output_i_1__1_n_0\,
      Q => \^d\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_2 is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK50MHZ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_2 : entity is "noise_remover";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_2;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_2 is
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counter[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \counter[0]_i_3__2_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \counter_reg[0]_i_2__2_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__2_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__2_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__2_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__2_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__2_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__2_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_2__2_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__2_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__2_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__2_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__2_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__2_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__2_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__2_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1__2_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__2_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__2_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__2_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__2_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1__2_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__2_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__2_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__2_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__2_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__2_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__2_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1__2_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__2_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__2_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__2_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__2_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__2_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__2_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__2_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1__2_n_7\ : STD_LOGIC;
  signal \debouncer_output_i_1__2_n_0\ : STD_LOGIC;
  signal \debouncer_output_i_2__2_n_0\ : STD_LOGIC;
  signal \debouncer_output_i_3__2_n_0\ : STD_LOGIC;
  signal \debouncer_output_i_4__2_n_0\ : STD_LOGIC;
  signal \NLW_counter_reg[16]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter_reg[16]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_2__2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1__2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1__2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1__2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1__2\ : label is 35;
begin
  D(0) <= \^d\(0);
\counter[0]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF80008000FFFF"
    )
        port map (
      I0 => \debouncer_output_i_2__2_n_0\,
      I1 => counter_reg(0),
      I2 => \debouncer_output_i_3__2_n_0\,
      I3 => \debouncer_output_i_4__2_n_0\,
      I4 => \out\(0),
      I5 => \^d\(0),
      O => \counter[0]_i_1__2_n_0\
    );
\counter[0]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_3__2_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__2_n_7\,
      Q => counter_reg(0),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[0]_i_2__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_2__2_n_0\,
      CO(2) => \counter_reg[0]_i_2__2_n_1\,
      CO(1) => \counter_reg[0]_i_2__2_n_2\,
      CO(0) => \counter_reg[0]_i_2__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_2__2_n_4\,
      O(2) => \counter_reg[0]_i_2__2_n_5\,
      O(1) => \counter_reg[0]_i_2__2_n_6\,
      O(0) => \counter_reg[0]_i_2__2_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_3__2_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__2_n_5\,
      Q => counter_reg(10),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__2_n_4\,
      Q => counter_reg(11),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__2_n_7\,
      Q => counter_reg(12),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[12]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1__2_n_0\,
      CO(3) => \counter_reg[12]_i_1__2_n_0\,
      CO(2) => \counter_reg[12]_i_1__2_n_1\,
      CO(1) => \counter_reg[12]_i_1__2_n_2\,
      CO(0) => \counter_reg[12]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1__2_n_4\,
      O(2) => \counter_reg[12]_i_1__2_n_5\,
      O(1) => \counter_reg[12]_i_1__2_n_6\,
      O(0) => \counter_reg[12]_i_1__2_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__2_n_6\,
      Q => counter_reg(13),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__2_n_5\,
      Q => counter_reg(14),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[12]_i_1__2_n_4\,
      Q => counter_reg(15),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1__2_n_7\,
      Q => counter_reg(16),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[16]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1__2_n_0\,
      CO(3 downto 2) => \NLW_counter_reg[16]_i_1__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \counter_reg[16]_i_1__2_n_2\,
      CO(0) => \counter_reg[16]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_counter_reg[16]_i_1__2_O_UNCONNECTED\(3),
      O(2) => \counter_reg[16]_i_1__2_n_5\,
      O(1) => \counter_reg[16]_i_1__2_n_6\,
      O(0) => \counter_reg[16]_i_1__2_n_7\,
      S(3) => '0',
      S(2 downto 0) => counter_reg(18 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1__2_n_6\,
      Q => counter_reg(17),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[16]_i_1__2_n_5\,
      Q => counter_reg(18),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__2_n_6\,
      Q => counter_reg(1),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__2_n_5\,
      Q => counter_reg(2),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[0]_i_2__2_n_4\,
      Q => counter_reg(3),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__2_n_7\,
      Q => counter_reg(4),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[4]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_2__2_n_0\,
      CO(3) => \counter_reg[4]_i_1__2_n_0\,
      CO(2) => \counter_reg[4]_i_1__2_n_1\,
      CO(1) => \counter_reg[4]_i_1__2_n_2\,
      CO(0) => \counter_reg[4]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1__2_n_4\,
      O(2) => \counter_reg[4]_i_1__2_n_5\,
      O(1) => \counter_reg[4]_i_1__2_n_6\,
      O(0) => \counter_reg[4]_i_1__2_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__2_n_6\,
      Q => counter_reg(5),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__2_n_5\,
      Q => counter_reg(6),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[4]_i_1__2_n_4\,
      Q => counter_reg(7),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__2_n_7\,
      Q => counter_reg(8),
      R => \counter[0]_i_1__2_n_0\
    );
\counter_reg[8]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1__2_n_0\,
      CO(3) => \counter_reg[8]_i_1__2_n_0\,
      CO(2) => \counter_reg[8]_i_1__2_n_1\,
      CO(1) => \counter_reg[8]_i_1__2_n_2\,
      CO(0) => \counter_reg[8]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1__2_n_4\,
      O(2) => \counter_reg[8]_i_1__2_n_5\,
      O(1) => \counter_reg[8]_i_1__2_n_6\,
      O(0) => \counter_reg[8]_i_1__2_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \counter_reg[8]_i_1__2_n_6\,
      Q => counter_reg(9),
      R => \counter[0]_i_1__2_n_0\
    );
\debouncer_output_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7F8000FFFF0000"
    )
        port map (
      I0 => \debouncer_output_i_2__2_n_0\,
      I1 => \debouncer_output_i_3__2_n_0\,
      I2 => \debouncer_output_i_4__2_n_0\,
      I3 => \out\(0),
      I4 => \^d\(0),
      I5 => counter_reg(0),
      O => \debouncer_output_i_1__2_n_0\
    );
\debouncer_output_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => counter_reg(15),
      I1 => counter_reg(16),
      I2 => counter_reg(13),
      I3 => counter_reg(14),
      I4 => counter_reg(18),
      I5 => counter_reg(17),
      O => \debouncer_output_i_2__2_n_0\
    );
\debouncer_output_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => counter_reg(3),
      I1 => counter_reg(4),
      I2 => counter_reg(1),
      I3 => counter_reg(2),
      I4 => counter_reg(6),
      I5 => counter_reg(5),
      O => \debouncer_output_i_3__2_n_0\
    );
\debouncer_output_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(10),
      I2 => counter_reg(8),
      I3 => counter_reg(7),
      I4 => counter_reg(12),
      I5 => counter_reg(11),
      O => \debouncer_output_i_4__2_n_0\
    );
debouncer_output_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \debouncer_output_i_1__2_n_0\,
      Q => \^d\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ButtonDebouncerBus is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    RISING_EDGE_PULSE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FALLING_EDGE_PULSE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    BUTTON : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK50MHZ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ButtonDebouncerBus;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ButtonDebouncerBus is
  signal \^d\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal button_previous : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal button_sample : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal button_sync1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute async_reg : string;
  attribute async_reg of button_sync1 : signal is "true";
  signal button_sync2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute async_reg of button_sync2 : signal is "true";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FALLING_EDGE_PULSE[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FALLING_EDGE_PULSE[1]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FALLING_EDGE_PULSE[2]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FALLING_EDGE_PULSE[3]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \RISING_EDGE_PULSE[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \RISING_EDGE_PULSE[1]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \RISING_EDGE_PULSE[2]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \RISING_EDGE_PULSE[3]_INST_0\ : label is "soft_lutpair3";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \button_sync1_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \button_sync1_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \button_sync1_reg[1]\ : label is std.standard.true;
  attribute KEEP of \button_sync1_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \button_sync1_reg[2]\ : label is std.standard.true;
  attribute KEEP of \button_sync1_reg[2]\ : label is "yes";
  attribute ASYNC_REG_boolean of \button_sync1_reg[3]\ : label is std.standard.true;
  attribute KEEP of \button_sync1_reg[3]\ : label is "yes";
  attribute ASYNC_REG_boolean of \button_sync2_reg[0]\ : label is std.standard.true;
  attribute KEEP of \button_sync2_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \button_sync2_reg[1]\ : label is std.standard.true;
  attribute KEEP of \button_sync2_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \button_sync2_reg[2]\ : label is std.standard.true;
  attribute KEEP of \button_sync2_reg[2]\ : label is "yes";
  attribute ASYNC_REG_boolean of \button_sync2_reg[3]\ : label is std.standard.true;
  attribute KEEP of \button_sync2_reg[3]\ : label is "yes";
begin
  D(3 downto 0) <= \^d\(3 downto 0);
\FALLING_EDGE_PULSE[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => button_previous(0),
      I1 => button_sample(0),
      O => FALLING_EDGE_PULSE(0)
    );
\FALLING_EDGE_PULSE[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => button_previous(1),
      I1 => button_sample(1),
      O => FALLING_EDGE_PULSE(1)
    );
\FALLING_EDGE_PULSE[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => button_previous(2),
      I1 => button_sample(2),
      O => FALLING_EDGE_PULSE(2)
    );
\FALLING_EDGE_PULSE[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => button_previous(3),
      I1 => button_sample(3),
      O => FALLING_EDGE_PULSE(3)
    );
\RISING_EDGE_PULSE[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => button_sample(0),
      I1 => button_previous(0),
      O => RISING_EDGE_PULSE(0)
    );
\RISING_EDGE_PULSE[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => button_sample(1),
      I1 => button_previous(1),
      O => RISING_EDGE_PULSE(1)
    );
\RISING_EDGE_PULSE[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => button_sample(2),
      I1 => button_previous(2),
      O => RISING_EDGE_PULSE(2)
    );
\RISING_EDGE_PULSE[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => button_sample(3),
      I1 => button_previous(3),
      O => RISING_EDGE_PULSE(3)
    );
\button_previous_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => button_sample(0),
      Q => button_previous(0),
      R => '0'
    );
\button_previous_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => button_sample(1),
      Q => button_previous(1),
      R => '0'
    );
\button_previous_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => button_sample(2),
      Q => button_previous(2),
      R => '0'
    );
\button_previous_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => button_sample(3),
      Q => button_previous(3),
      R => '0'
    );
\button_sample_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \^d\(0),
      Q => button_sample(0),
      R => '0'
    );
\button_sample_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \^d\(1),
      Q => button_sample(1),
      R => '0'
    );
\button_sample_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \^d\(2),
      Q => button_sample(2),
      R => '0'
    );
\button_sample_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => \^d\(3),
      Q => button_sample(3),
      R => '0'
    );
\button_sync1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => BUTTON(0),
      Q => button_sync1(0),
      R => '0'
    );
\button_sync1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => BUTTON(1),
      Q => button_sync1(1),
      R => '0'
    );
\button_sync1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => BUTTON(2),
      Q => button_sync1(2),
      R => '0'
    );
\button_sync1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => BUTTON(3),
      Q => button_sync1(3),
      R => '0'
    );
\button_sync2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => button_sync1(0),
      Q => button_sync2(0),
      R => '0'
    );
\button_sync2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => button_sync1(1),
      Q => button_sync2(1),
      R => '0'
    );
\button_sync2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => button_sync1(2),
      Q => button_sync2(2),
      R => '0'
    );
\button_sync2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK50MHZ,
      CE => '1',
      D => button_sync1(3),
      Q => button_sync2(3),
      R => '0'
    );
\gen_debounce[0].filter\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover
     port map (
      CLK50MHZ => CLK50MHZ,
      D(0) => \^d\(0),
      \out\(0) => button_sync2(0)
    );
\gen_debounce[1].filter\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_0
     port map (
      CLK50MHZ => CLK50MHZ,
      D(0) => \^d\(1),
      \out\(0) => button_sync2(1)
    );
\gen_debounce[2].filter\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_1
     port map (
      CLK50MHZ => CLK50MHZ,
      D(0) => \^d\(2),
      \out\(0) => button_sync2(2)
    );
\gen_debounce[3].filter\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_noise_remover_2
     port map (
      CLK50MHZ => CLK50MHZ,
      D(0) => \^d\(3),
      \out\(0) => button_sync2(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    CLK50MHZ : in STD_LOGIC;
    BUTTON : in STD_LOGIC_VECTOR ( 3 downto 0 );
    BUTTON_DEBOUNCED : out STD_LOGIC_VECTOR ( 3 downto 0 );
    RISING_EDGE_PULSE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FALLING_EDGE_PULSE : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_ButtonDebouncerBus_0_0,ButtonDebouncerBus,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ButtonDebouncerBus,Vivado 2025.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ButtonDebouncerBus
     port map (
      BUTTON(3 downto 0) => BUTTON(3 downto 0),
      CLK50MHZ => CLK50MHZ,
      D(3 downto 0) => BUTTON_DEBOUNCED(3 downto 0),
      FALLING_EDGE_PULSE(3 downto 0) => FALLING_EDGE_PULSE(3 downto 0),
      RISING_EDGE_PULSE(3 downto 0) => RISING_EDGE_PULSE(3 downto 0)
    );
end STRUCTURE;
