# 2026-09-26T17:57:27.099205044
import vitis

client = vitis.create_client()
client.set_workspace(path="task10-microblaze")

platform = client.get_component(name="platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../design_1_wrapper.xsa")

status = platform.build()

status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp.build()

vitis.dispose()

