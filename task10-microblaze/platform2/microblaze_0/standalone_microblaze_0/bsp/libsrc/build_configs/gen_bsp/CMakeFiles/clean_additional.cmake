# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-microblaze/platform2/microblaze_0/standalone_microblaze_0/bsp/include/sleep.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-microblaze/platform2/microblaze_0/standalone_microblaze_0/bsp/include/xiltimer.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-microblaze/platform2/microblaze_0/standalone_microblaze_0/bsp/include/xtimer_config.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-microblaze/platform2/microblaze_0/standalone_microblaze_0/bsp/lib/libxiltimer.a"
  )
endif()
