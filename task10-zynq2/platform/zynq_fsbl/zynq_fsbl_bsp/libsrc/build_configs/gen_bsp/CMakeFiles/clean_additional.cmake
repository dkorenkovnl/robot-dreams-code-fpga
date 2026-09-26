# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/include/diskio.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/include/ff.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/include/ffconf.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/include/sleep.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/include/xilffs.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/include/xilffs_config.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/include/xilrsa.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/include/xiltimer.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/include/xtimer_config.h"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/lib/libxilffs.a"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/lib/libxilrsa.a"
  "/home/dmas/robot_dreams/robot-dreams-code-fpga/task10-zynq2/platform/zynq_fsbl/zynq_fsbl_bsp/lib/libxiltimer.a"
  )
endif()
