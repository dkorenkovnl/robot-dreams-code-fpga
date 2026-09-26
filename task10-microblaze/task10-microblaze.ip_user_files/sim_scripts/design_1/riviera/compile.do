transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/microblaze_v11_0_16
vlib riviera/xil_defaultlib
vlib riviera/lmb_v10_v3_0_16
vlib riviera/lmb_bram_if_cntlr_v4_0_27
vlib riviera/blk_mem_gen_v8_4_12
vlib riviera/proc_sys_reset_v5_0_17
vlib riviera/smartconnect_v1_0
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_36
vlib riviera/axi_vip_v1_1_22
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/axi_intc_v4_1_22
vlib riviera/mdm_v3_2_29
vlib riviera/interrupt_control_v3_1_5
vlib riviera/axi_gpio_v2_0_37
vlib riviera/axi_timer_v2_0_37

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap microblaze_v11_0_16 riviera/microblaze_v11_0_16
vmap xil_defaultlib riviera/xil_defaultlib
vmap lmb_v10_v3_0_16 riviera/lmb_v10_v3_0_16
vmap lmb_bram_if_cntlr_v4_0_27 riviera/lmb_bram_if_cntlr_v4_0_27
vmap blk_mem_gen_v8_4_12 riviera/blk_mem_gen_v8_4_12
vmap proc_sys_reset_v5_0_17 riviera/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_36 riviera/axi_register_slice_v2_1_36
vmap axi_vip_v1_1_22 riviera/axi_vip_v1_1_22
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap axi_intc_v4_1_22 riviera/axi_intc_v4_1_22
vmap mdm_v3_2_29 riviera/mdm_v3_2_29
vmap interrupt_control_v3_1_5 riviera/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 riviera/axi_gpio_v2_0_37
vmap axi_timer_v2_0_37 riviera/axi_timer_v2_0_37

vlog -work xilinx_vip  -incr "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/home/dmas/Xilinx/vivado_2025_2/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_16 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/c957/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_microblaze_0_0/sim/design_1_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_16 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/dac4/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_dlmb_v10_0/sim/design_1_dlmb_v10_0.vhd" \
"../../../bd/design_1/ip/design_1_ilmb_v10_0/sim/design_1_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_27 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/7cd0/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_dlmb_bram_if_cntlr_0/sim/design_1_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/design_1/ip/design_1_ilmb_bram_if_cntlr_0/sim/design_1_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_12  -incr -v2k5 "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/42f3/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_lmb_bram_0/sim/design_1_lmb_bram_0.v" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/sim/bd_67b2.v" \

vcom -work proc_sys_reset_v5_0_17 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_1/sim/bd_67b2_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_2/sim/bd_67b2_arinsw_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_3/sim/bd_67b2_rinsw_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_4/sim/bd_67b2_awinsw_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_5/sim/bd_67b2_winsw_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_6/sim/bd_67b2_binsw_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_7/sim/bd_67b2_aroutsw_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_8/sim/bd_67b2_routsw_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_9/sim/bd_67b2_awoutsw_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_10/sim/bd_67b2_woutsw_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_11/sim/bd_67b2_boutsw_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_12/sim/bd_67b2_arni_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_13/sim/bd_67b2_rni_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_14/sim/bd_67b2_awni_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_15/sim/bd_67b2_wni_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_16/sim/bd_67b2_bni_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_17/sim/bd_67b2_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_18/sim/bd_67b2_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_19/sim/bd_67b2_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_20/sim/bd_67b2_s00a2s_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_21/sim/bd_67b2_sarn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_22/sim/bd_67b2_srn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_23/sim/bd_67b2_sawn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_24/sim/bd_67b2_swn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_25/sim/bd_67b2_sbn_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_26/sim/bd_67b2_m00s2a_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_27/sim/bd_67b2_m00arn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_28/sim/bd_67b2_m00rn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_29/sim/bd_67b2_m00awn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_30/sim/bd_67b2_m00wn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_31/sim/bd_67b2_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_32/sim/bd_67b2_m00e_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_33/sim/bd_67b2_m01s2a_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_34/sim/bd_67b2_m01arn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_35/sim/bd_67b2_m01rn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_36/sim/bd_67b2_m01awn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_37/sim/bd_67b2_m01wn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_38/sim/bd_67b2_m01bn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_39/sim/bd_67b2_m01e_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_40/sim/bd_67b2_m02s2a_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_41/sim/bd_67b2_m02arn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_42/sim/bd_67b2_m02rn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_43/sim/bd_67b2_m02awn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_44/sim/bd_67b2_m02wn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_45/sim/bd_67b2_m02bn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_46/sim/bd_67b2_m02e_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_47/sim/bd_67b2_m03s2a_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_48/sim/bd_67b2_m03arn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_49/sim/bd_67b2_m03rn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_50/sim/bd_67b2_m03awn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_51/sim/bd_67b2_m03wn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_52/sim/bd_67b2_m03bn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_53/sim/bd_67b2_m03e_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_54/sim/bd_67b2_m04s2a_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_55/sim/bd_67b2_m04arn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_56/sim/bd_67b2_m04rn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_57/sim/bd_67b2_m04awn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_58/sim/bd_67b2_m04wn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_59/sim/bd_67b2_m04bn_0.sv" \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/bd_0/ip/ip_60/sim/bd_67b2_m04e_0.sv" \

vcom -work smartconnect_v1_0 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_36  -incr -v2k5 "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_periph_0/sim/design_1_microblaze_0_axi_periph_0.sv" \

vcom -work axi_lite_ipif_v3_0_4 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_intc_v4_1_22 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f258/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_microblaze_0_axi_intc_0/sim/design_1_microblaze_0_axi_intc_0.vhd" \

vcom -work mdm_v3_2_29 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/1dd0/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_mdm_1_0/sim/design_1_mdm_1_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_rst_clk_wiz_1_100M_0/sim/design_1_rst_clk_wiz_1_100M_0.vhd" \

vcom -work interrupt_control_v3_1_5 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_axi_gpio_0_0/sim/design_1_axi_gpio_0_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_gpio_1_0/sim/design_1_axi_gpio_1_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_gpio_2_0/sim/design_1_axi_gpio_2_0.vhd" \

vcom -work axi_timer_v2_0_37 -93  -incr \
"../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/05e8/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_axi_timer_0_0/sim/design_1_axi_timer_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../task10-microblaze.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../../../../Xilinx/vivado_2025_2/2025.2/data/rsb/busdef" "+incdir+/home/dmas/Xilinx/vivado_2025_2/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l microblaze_v11_0_16 -l xil_defaultlib -l lmb_v10_v3_0_16 -l lmb_bram_if_cntlr_v4_0_27 -l blk_mem_gen_v8_4_12 -l proc_sys_reset_v5_0_17 -l smartconnect_v1_0 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_36 -l axi_vip_v1_1_22 -l axi_lite_ipif_v3_0_4 -l axi_intc_v4_1_22 -l mdm_v3_2_29 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_timer_v2_0_37 \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

