# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
bypass { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


