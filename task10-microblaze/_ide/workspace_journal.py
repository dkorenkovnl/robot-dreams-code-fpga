# 2026-09-26T19:34:45.151624219
import vitis

client = vitis.create_client()
client.set_workspace(path="task10-microblaze")

platform = client.get_component(name="platform2")
status = platform.build()

comp = client.get_component(name="app_component4")
comp.build()

status = platform.build()

comp.build()

client.delete_component(name="app_component3")

client.delete_component(name="componentName")

client.delete_component(name="app_component2")

client.delete_component(name="componentName")

client.delete_component(name="componentName")

client.delete_component(name="app_component")

client.delete_component(name="componentName")

