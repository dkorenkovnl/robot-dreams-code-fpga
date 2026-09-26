# 2026-09-26T16:29:36.098082186
import vitis

client = vitis.create_client()
client.set_workspace(path="task10-microblaze")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component2")
comp.build()

status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp = client.get_component(name="app_component2")
comp.build()

status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

vitis.dispose()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../design_1_wrapper.xsa")

status = platform.build()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../design_1_wrapper.xsa")

status = platform.build()

status = platform.build()

comp.build()

status = platform.build()

comp = client.create_app_component(name="app_component3",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_microblaze_0")

status = platform.build()

comp = client.get_component(name="app_component3")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp = client.get_component(name="app_component2")
comp.build()

status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

vitis.dispose()

