MADS ?= mads

PROGRAMS := ADM CCOM CCOM3 CP DUMMY LOADADM X
OBJECTS := $(addprefix bin/,$(addsuffix .OBJ,$(PROGRAMS)))

.PHONY: all clean

all: $(OBJECTS)

bin/%.OBJ: src/%.ASM
	@mkdir -p bin
	$(MADS) $< -o:$@

bin/ADM.OBJ: src/ADMSCR.ASM src/ADMTAB.ASM

clean:
	rm -f $(OBJECTS)
