
cmake_minimum_required(VERSION 3.15)
project(bsp)

# Use CMAKE_LIBRARY_PATH in link_directories
link_directories(${CMAKE_LIBRARY_PATH})
        
set(DRIVER_TARGETS gpio;tmrctr;intc;bram)
set(DRIVER_LOCATIONS /home/dmas/Xilinx/vivado_2025_2/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/gpio_v4_12;/home/dmas/Xilinx/vivado_2025_2/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/tmrctr_v4_14;/home/dmas/Xilinx/vivado_2025_2/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/intc_v3_21;/home/dmas/Xilinx/vivado_2025_2/2025.2/Vitis/data/embeddedsw/XilinxProcessorIPLib/drivers/bram_v4_13)

list(LENGTH DRIVER_TARGETS no_of_drivers)
set(index 0)

while(${index} LESS ${no_of_drivers})
    list(GET DRIVER_TARGETS ${index} drv)
    list(GET DRIVER_LOCATIONS ${index} drv_dir)
    set(exp_dir "${drv_dir}/examples")
    add_custom_target(
        ${drv}_example ALL
        COMMAND lopper -f -O /home/dmas/robot_dreams/robot-dreams-code-fpga/task10-microblaze/platform2/microblaze_0/standalone_microblaze_0/bsp/libsrc/${drv} /home/dmas/robot_dreams/robot-dreams-code-fpga/task10-microblaze/platform2/microblaze_0/standalone_microblaze_0/bsp/hw_artifacts/microblaze_0_baremetal.dts -- bmcmake_metadata_xlnx microblaze_0 ${exp_dir} drvcmake_metadata
        BYPRODUCTS x${drv}_exlist.yaml)
    MATH(EXPR index "${index}+1")
endwhile()
