# Artix7 xdc
# define clock and period
create_clock -period 10.000 -name clk_pin -waveform {0.000 5.000} [get_ports clk]

# Create a virual clock for IO constraints
create_clock -period 10.0 -name virtual_clock

# input delay
set_input_delay -clock clk_pin -max 1.5 [get_ports reset]
set_input_delay -clock clk_pin -min 0.5 [get_ports reset]

set_input_delay -clock virtual_clock -max 1.5 [get_ports sw[*]]
set_input_delay -clock virtual_clock -min 0.5 [get_ports sw[*]]
set_input_delay -clock virtual_clock -max 1.5 [get_ports kcpsm6_interrupt]
set_input_delay -clock virtual_clock -min 0.5 [get_ports kcpsm6_interrupt]

#output delay
set_output_delay -clock virtual_clock -2.0 [get_ports led[*]]
