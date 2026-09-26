# 2026-09-25T21:31:09.791967934
import vitis

client = vitis.create_client()
client.set_workspace(path="task10-zynq2")

platform = client.get_component(name="platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../design_1_wrapper.xsa")

status = platform.build()

status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

vitis.dispose()

