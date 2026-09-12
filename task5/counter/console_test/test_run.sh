#!/usr/bin/env bash

source /home/dmas/Xilinx/vivado_2025_2/2025.2/Vivado/settings64.sh
xvlog counter_top.v tb_counter.v && \
xelab tb_counter -s tb_sim && \
xsim tb_sim -R
