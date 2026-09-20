# design constraint 
create_clock -period 10.000 -name clk [get_ports clk]

#set_input_delay -clock [get_clocks clk] -min -add_delay 1.000 [get_ports {a[*]}]
#set_input_delay -clock [get_clocks clk] -max -add_delay 1.000 [get_ports {a[*]}]

#set_input_delay -clock [get_clocks clk] -min -add_delay 1.000 [get_ports {b[*]}]
#set_input_delay -clock [get_clocks clk] -max -add_delay 1.000 [get_ports {b[*]}]

#set_input_delay -clock [get_clocks clk] -min -add_delay 1.000 [get_ports {op[*]}]
#set_input_delay -clock [get_clocks clk] -max -add_delay 1.000 [get_ports {op[*]}]

#set_input_delay -clock [get_clocks clk] -min -add_delay 1.000 [get_ports rst]
#set_input_delay -clock [get_clocks clk] -max -add_delay 1.000 [get_ports rst]

#set_output_delay -clock [get_clocks clk] -min -add_delay -1.000 [get_ports {result[*]}]
#set_output_delay -clock [get_clocks clk] -max -add_delay 1.000 [get_ports {result[*]}]
