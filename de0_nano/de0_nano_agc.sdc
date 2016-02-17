create_clock -period 20.000 -name OSC_50 [get_ports {OSC_50}]
derive_pll_clocks
set_clock_groups -exclusive -group [get_clocks {agc_clock|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {agc_clock|altpll_component|auto_generated|pll1|clk[1]}]
derive_clock_uncertainty