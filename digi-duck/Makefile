all: bin/digi-duck.xex

src/INIT.OBJ: src/INIT.ASM
	mads src/INIT.ASM -o:src/INIT.OBJ

src/DUCK.OBJ: src/DUCK.ASM src/DATAS.ASM src/DD_PROC.ASM
	mads src/DUCK.ASM -o:src/DUCK.OBJ -i:src

bin/digi-duck.xex: src/INIT.FNT src/INIT.OBJ src/DIGI.DTA src/DIGI.CMC src/DIGI.FNT src/DUCK.FNT src/LITERY.FNT src/TITLE.FNT src/DIGI.REP src/SP.OBJ src/DUCK.ASM src/DATAS.ASM src/DD_PROC.ASM
	mads main.asm -o:bin/digi-duck.xex -i:src

test: src/DUCK.OBJ src/INIT.OBJ
	md5sum --check checksum.md5
