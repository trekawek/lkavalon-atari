MADS ?= mads

.PHONY: all test clean

all: bin/ap.xex bin/cap.xex

bin/APLOAD.OBJ: d2/APLOAD.ASM
	@mkdir -p bin
	$(MADS) d2/APLOAD.ASM -o:$@

bin/AP.OBJ: d2/AP.ASM d2/AP2.ASM
	@mkdir -p bin
	$(MADS) d2/AP.ASM -o:$@

bin/CAP.OBJ: d1/CAP.ASM d1/CAP2.ASM
	@mkdir -p bin
	$(MADS) d1/CAP.ASM -o:$@

bin/ap.xex: main.asm bin/APLOAD.OBJ bin/AP.OBJ d2/AP.FNT d2/DEMO.OBJ d2/DATA.OBJ
	$(MADS) main.asm -o:$@ -s

bin/cap.xex: main-cassette.asm bin/APLOAD.OBJ bin/CAP.OBJ d1/AP.FNT d1/DEMO.OBJ d1/DATA.OBJ
	$(MADS) main-cassette.asm -o:$@ -s

test: all
	md5sum --check checksum.md5
	cmp bin/APLOAD.OBJ reference/APLOAD.OBJ
	cmp bin/AP.OBJ reference/AP.OBJ
	cmp bin/CAP.OBJ reference/CAP.OBJ
	cmp bin/ap.xex reference/ap.xex
	cmp bin/cap.xex reference/cap.xex

clean:
	rm -f bin/*.OBJ bin/*.xex
