MODULES = scaler\
	  timer\
	  sq_register\
	  stage_branch\
	  crosspoint_nqi\
	  crosspoint_ii\
	  service_gates\
	  four_bit_1\
	  four_bit_2\
	  four_bit_3\
	  four_bit_4\
	  parity_s_register

AUTOGEN_FILES = $(addsuffix .v, $(addprefix modules/, $(MODULES)))

COMMON_SOURCES = components/nor_1.v\
		 components/nor_2.v\
		 components/nor_3.v\
		 components/nor_4.v\
		 components/od_buf.v\
		 components/U74HC04.v\
		 components/U74HC02.v\
		 components/U74HC27.v\
		 components/U74HC4002.v\
		 components/U74LVC07.v\
		 $(AUTOGEN_FILES)

HARDWARE_DIR=~/agc_hardware/

.phony: all
all: test_agc test_fpga

test_agc: $(COMMON_SOURCES) agc.v test_agc.v
	iverilog -o $@ $^

test_fpga: $(COMMON_SOURCES) de0_nano/fpga_agc.v test_agc.v
	iverilog -DTARGET_FPGA -o $@ $^

agc.v: $(AUTOGEN_FILES) scripts/generate_agc_backplane.py
	python scripts/generate_agc_backplane.py $@ modules/

de0_nano/fpga_agc.v: $(AUTOGEN_FILES) scripts/generate_agc_backplane.py
	python scripts/generate_agc_backplane.py $@ modules/ --fpga

.SECONDEXPANSION:
$(AUTOGEN_FILES): modules/%.v: $$(wildcard $(HARDWARE_DIR)/%/*.sch) scripts/generate_agc_verilog.py
	@echo Generating code for $(*F)...; \
	if xdotool search --onlyvisible --name "KiCad.*?$(*F)/$(*F).pro">/dev/null; then \
	    echo "Using running KiCAD instance"; \
	    RUNNING_KICAD=1; \
	elif xdotool search --onlyvisible --name "KiCad"; then \
	    echo "ERROR: KiCad running, but in module other than $(*F)"; \
	    exit 1; \
	else kicad "$(HARDWARE_DIR)/$(*F)/$(*F).pro" & \
	fi; \
	xdotool search --sync --onlyvisible --name KiCad windowactivate; \
	xdotool key ctrl+e; \
	xdotool search --sync --onlyvisible --name "^\[ .*?$(*F)\)$$" windowactivate; \
	xdotool key alt+t n; \
	xdotool search --sync --onlyvisible --name "^Netlist$$" windowactivate; \
	xdotool key shift+Tab shift+Tab Right Right Right Right Tab Tab Tab Tab Return; \
	xdotool type $(shell pwd)/$@; \
	xdotool key Return; \
	xdotool search --sync --onlyvisible --name "AGC Verilog Generation" windowactivate; \
	if xdotool search --onlyvisible --name "AGC Verilog Generation Error">/dev/null; then \
	    echo "Error generating code for module $(*F)"; \
	    exit 1; \
	fi; \
	xdotool key Tab space sleep 0.2; \
	if [ -z $$RUNNING_KICAD ]; then \
	    xdotool search --sync --onlyvisible --name KiCad windowactivate; \
	    xdotool key ctrl+q; \
	fi;
