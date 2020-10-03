derive_pll_clocks

create_generated_clock -source [get_pins {pll|altpll_component|auto_generated|pll1|clk[1]}] \
                       -name SDRAM_CLK [get_ports {SDRAM_CLK}]

derive_clock_uncertainty

# Set acceptable delays for SDRAM chip (See correspondent chip datasheet) 
#set_input_delay -max -clock SDRAM_CLK 6.4ns [get_ports SDRAM_DQ[*]]
#set_input_delay -min -clock SDRAM_CLK 3.7ns [get_ports SDRAM_DQ[*]]
set_input_delay -max -clock SDRAM_CLK 5.0ns [get_ports SDRAM_DQ[*]]
set_input_delay -min -clock SDRAM_CLK 2.9ns [get_ports SDRAM_DQ[*]]

set_multicycle_path -from [get_clocks {SDRAM_CLK}] \
                    -to [get_clocks {pll|altpll_component|auto_generated|pll1|clk[1]}] \
                                                  -setup 2

#set_output_delay -max -clock SDRAM_CLK 1.6ns [get_ports {SDRAM_D* SDRAM_A* SDRAM_BA* SDRAM_n* SDRAM_CKE}]
#set_output_delay -min -clock SDRAM_CLK -0.9ns [get_ports {SDRAM_D* SDRAM_A* SDRAM_BA* SDRAM_n* SDRAM_CKE}]
set_output_delay -max -clock SDRAM_CLK 1.2ns [get_ports {SDRAM_D* SDRAM_A* SDRAM_BA* SDRAM_n* SDRAM_CKE}]
set_output_delay -min -clock SDRAM_CLK -0.7ns [get_ports {SDRAM_D* SDRAM_A* SDRAM_BA* SDRAM_n* SDRAM_CKE}]
