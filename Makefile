ROM=Aurora12

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
	  parity_s_register\
	  alarms\
	  memory_timing_addressing\
	  rupt_service\
	  fixed_erasable_memory\
	  inout_i\
	  inout_ii\
	  inout_iii\
	  inout_iv\
	  counter_cell_i\
	  counter_cell_ii\
	  inout_v\
	  inout_vi\
	  inout_vii\
	  ch77_alarm_box

AUTOGEN_FILES = $(addsuffix .v, $(addprefix modules/, $(MODULES)))

COMMON_SOURCES = components/nor_1.v\
		 components/nor_2.v\
		 components/nor_3.v\
		 components/nor_4.v\
		 components/od_buf.v\
		 components/tri_buf.v\
		 components/U74HC04.v\
		 components/U74HC02.v\
		 components/U74HC27.v\
		 components/U74HC4002.v\
		 components/U74LVC06.v\
		 components/U74LVC07.v\
		 components/U74HC244.v\
		 components/MR0A16A.v\
		 components/SST39VF200A.v\

SIM_SOURCES = $(COMMON_SOURCES)\
	      $(AUTOGEN_FILES)\
	      agc.v\
	      test_agc.v

FPGA_SOURCES = $(COMMON_SOURCES)\
	       de0_nano/fpga_agc.v\
	       test_agc.v

ROMS = Retread44 \
       Aurora12 \
       Sunburst120 \
       Luminary099 \
       Luminary131 \
       Luminary210 \
       Colossus237 \
       Colossus249 \
       Comanche055 \
       Artemis072 \
       Validation
#       Borealis

VIRTUALAGC_DIR=../virtualagc/
ROM_FILES = $(addsuffix .v, $(addprefix roms/, $(ROMS)))
BIN_FILES = $(addsuffix .bin, $(join $(addprefix $(VIRTUALAGC_DIR), $(ROMS)), $(addprefix /, $(ROMS))))

HARDWARE_DIR=../agc_hardware/

.phony: all
all: test_agc de0_nano/fpga_agc.v $(ROM_FILES)

roms/rom.v: roms/$(ROM).v FORCE
	cp roms/$(ROM).v roms/rom.v

FORCE:

test_agc: $(SIM_SOURCES) roms/rom.v
	iverilog -o $@ $(SIM_SOURCES)

test_fpga: $(FPGA_SOURCES)
	iverilog -DTARGET_FPGA -o $@ $(FPGA_SOURCES)

agc.v: $(AUTOGEN_FILES) scripts/generate_agc_backplane.py
	python scripts/generate_agc_backplane.py $@ modules/

de0_nano/fpga_agc.v: $(AUTOGEN_FILES) scripts/generate_agc_backplane.py
	python scripts/generate_agc_backplane.py $@ modules/ --fpga

$(BIN_FILES):
	make -C$(VIRTUALAGC_DIR) $(ROMS)

roms/%.v: $(BIN_FILES) scripts/bin_to_verilog_rom.py
	python scripts/bin_to_verilog_rom.py --to-hardware --hex $(VIRTUALAGC_DIR)/$*/$*.bin $@

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
	xdotool search --sync --onlyvisible --name "^EESchema" windowactivate; \
	xdotool key alt+t n; \
	xdotool search --sync --onlyvisible --name "^Netlist$$" windowactivate; \
	xdotool key shift+Tab shift+Tab Right Right Right Right Tab Tab Tab Tab Return; \
	xdotool type --delay 0 $(shell pwd)/$@; \
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
