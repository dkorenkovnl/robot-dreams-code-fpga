# 2026-09-26T19:03:44.462937699
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

platform = client.create_platform_component(name = "platform2",hw_design = "$COMPONENT_LOCATION/../design_1_wrapper.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0",compiler = "gcc")

client.delete_component(name="platform")

platform = client.get_component(name="platform2")
status = platform.build()

comp = client.create_app_component(name="app_component4",platform = "$COMPONENT_LOCATION/../platform2/export/platform2/platform2.xpfm",domain = "standalone_microblaze_0")

status = platform.build()

comp = client.get_component(name="app_component4")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

