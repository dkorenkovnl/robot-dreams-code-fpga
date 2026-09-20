#!/bin/bash

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/dmas/Xilinx/vivado_2025_2/2025.2/Vitis/bin:/home/dmas/Xilinx/vivado_2025_2/2025.2/Vivado/ids_lite/ISE/bin/lin64:/home/dmas/Xilinx/vivado_2025_2/2025.2/Vivado/bin
else
  PATH=/home/dmas/Xilinx/vivado_2025_2/2025.2/Vitis/bin:/home/dmas/Xilinx/vivado_2025_2/2025.2/Vivado/ids_lite/ISE/bin/lin64:/home/dmas/Xilinx/vivado_2025_2/2025.2/Vivado/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/dmas/robot_dreams/robot-dreams-code-fpga/task7-3/task7-3.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log expr_plain_top.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source expr_plain_top.tcl -notrace


