all:	bin/fred.xex

bin/fred.xex:	main.asm d1/CI.ASM d1/FR.ASM d1/GR.ASM d1/SO.ASM d1/TI.ASM d2/AMP.ASM d1/SHOWPIC.ASM d2/TITLE.FNT d2/DI.FNT d2/GRA.DTA d2/GRA.PLR d2/GRA.STA d2/FAZY.FNT d2/FRED.PIC d2/GRA.FNT d2/FRED.AMC
	mads main.asm -o:bin/fred.xex

test:	d1/CI.OBJ d1/DSAV.OBJ d1/FR.OBJ d1/GR.OBJ d1/SO.OBJ d1/TI.OBJ d1/MAKEFRED.XEX d2/AMP.OBJ d2/CSAV.OBJ d2/SHOWPIC.OBJ checksum.md5
	md5sum --check checksum.md5

d1/CI.OBJ:
	mads d1/CI.ASM -o:d1/CI.OBJ

d1/DSAV.OBJ:
	mads d1/DSAV.ASM -o:d1/DSAV.OBJ

d1/FR.OBJ:
	mads d1/FR.ASM -o:d1/FR.OBJ

d1/GR.OBJ:
	mads d1/GR.ASM -o:d1/GR.OBJ

d1/SO.OBJ:
	mads d1/SO.ASM -o:d1/SO.OBJ

d1/TI.OBJ:
	mads d1/TI.ASM -o:d1/TI.OBJ

d1/MAKEFRED.XEX:
	mads d1/MAKEFRED.ASM -o:d1/MAKEFRED.XEX

d2/AMP.OBJ:
	mads d2/AMP.ASM -o:d2/AMP.OBJ

d2/CSAV.OBJ:
	mads d1/CSAV.ASM -o:d2/CSAV.OBJ

d2/SHOWPIC.OBJ:
	mads d1/SHOWPIC.ASM -o:d2/SHOWPIC.OBJ

clean:
	rm -f d1/*.OBJ d2/*.OBJ d1/*.XEX bin/*.xex
