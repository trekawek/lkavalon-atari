MADS ?= mads

.PHONY: all test clean

all: bin/heartlight.xex

bin/HL.OBJ: d1/HL.ASM
	@mkdir -p bin
	$(MADS) d1/HL.ASM -o:$@

bin/HLREAD.OBJ: d1/HLREAD.ASM
	@mkdir -p bin
	$(MADS) d1/HLREAD.ASM -o:$@

bin/CAVES.OBJ: d1/HL.LST util/build-caves.py
	@mkdir -p bin
	python3 util/build-caves.py d1/HL.LST $@

bin/heartlight.xex: main.asm bin/CAVES.OBJ d1/HL.FNT bin/HL.OBJ
	$(MADS) main.asm -o:$@ -s

test: all bin/HLREAD.OBJ
	md5sum --check checksum.md5
	cmp bin/HL.OBJ reference/HL.OBJ
	cmp bin/HLREAD.OBJ reference/HLREAD.OBJ
	python3 util/check-game.py bin/heartlight.xex d1/HL.DTA

clean:
	rm -f bin/HL.OBJ bin/HLREAD.OBJ bin/CAVES.OBJ bin/heartlight.xex
