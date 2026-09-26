MADS ?= mads

.PHONY: all test clean

all: bin/watson.xex bin/wacio.xex

bin/WATSON2.OBJ: src/WATSON2.ASM
	@mkdir -p bin
	$(MADS) src/WATSON2.ASM -o:$@

bin/AUX2.OBJ: src/AUX2.ASM
	@mkdir -p bin
	$(MADS) src/AUX2.ASM -o:$@

bin/WGEM.OBJ: src/WGEM.ASM
	@mkdir -p bin
	$(MADS) src/WGEM.ASM -o:$@

bin/WATSON.OBJ: src/WATSON.ASM
	@mkdir -p bin
	$(MADS) src/WATSON.ASM -o:$@

bin/NEW.OBJ: src/NEW.ASM src/DEC.ASM src/NEW2.ASM
	@mkdir -p bin
	$(MADS) src/NEW.ASM -o:$@

bin/wacio.xex: main-wacio.asm bin/WATSON2.OBJ bin/AUX2.OBJ bin/WGEM.OBJ
	$(MADS) main-wacio.asm -o:$@ -s

bin/watson.xex: main-watson.asm bin/WATSON.OBJ bin/NEW.OBJ
	$(MADS) main-watson.asm -o:$@ -s

clean:
	rm -f bin/*.OBJ bin/*.xex
