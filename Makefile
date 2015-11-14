MODULES = scaler\
	  timer\
	  sq_register\
	  stage_branch

AUTOGEN_FILES = $(addsuffix .v, $(addprefix modules/, $(MODULES)))

SOURCES = components/nor_gates.v\
	  components/buffers.v\
	  components/agc_parts.v\
	  $(AUTOGEN_FILES)\
	  agc.v\
	  test_agc.v

OBJECTS = 

HARDWARE_DIR=~/agc_hardware/

test_agc: $(SOURCES)
	iverilog -o $@ $^

agc.v: $(AUTOGEN_FILES)
	python scripts/generate_agc_backplane.py $@ modules/

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
