# 2026-09-25T21:39:35.917926001
import vitis

client = vitis.create_client()
client.set_workspace(path="task10-zynq2")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

vitis.dispose()

