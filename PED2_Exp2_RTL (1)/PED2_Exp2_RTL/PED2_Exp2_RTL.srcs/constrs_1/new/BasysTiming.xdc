# Artix7 xdc
# define clock and period
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports clk]

# Create a virual clock for IO constraints
create_clock -period 10.0 -name virtual_clock

# input delay
set_input_delay -clock sys_clk_pin -max 1.5 [get_ports reset]
set_input_delay -clock sys_clk_pin -min 0.5 [get_ports reset]

set_input_delay -clock virtual_clock -max 1.5 [get_ports sw[*]]
set_input_delay -clock virtual_clock -min 0.5 [get_ports sw[*]]

set_input_delay -clock virtual_clock -max 1.5 [get_ports start]
set_input_delay -clock virtual_clock -min 0.5 [get_ports start]
set_input_delay -clock virtual_clock -max 1.5 [get_ports update]
set_input_delay -clock virtual_clock -min 0.5 [get_ports update]

#output delay
set_output_delay -clock virtual_clock 2.0 [get_ports led[*]]
set_output_delay -clock virtual_clock 2.0 [get_ports ready]
set_output_delay -clock virtual_clock -3.0 [get_ports sclkout]