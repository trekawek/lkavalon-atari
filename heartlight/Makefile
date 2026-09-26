MADS ?= mads

.PHONY: all test clean

all: bin/HL.OBJ bin/HLREAD.OBJ

bin/HL.OBJ: d1/HL.ASM
	@mkdir -p bin
	$(MADS) d1/HL.ASM -o:$@

bin/HLREAD.OBJ: d1/HLREAD.ASM
	@mkdir -p bin
	$(MADS) d1/HLREAD.ASM -o:$@

test: all
	md5sum --check checksum.md5
	cmp bin/HL.OBJ reference/HL.OBJ
	cmp bin/HLREAD.OBJ reference/HLREAD.OBJ

clean:
	rm -f bin/HL.OBJ bin/HLREAD.OBJ
