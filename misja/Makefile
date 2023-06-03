all:	bin/misja.xex

bin/misja.xex:	main.asm d1/E.ASM d1/H.ASM d1/I.ASM d1/JOINT.ASM d1/M.ASM d1/S.ASM d1/SCREEN.ASM d1/T.ASM d1/W.ASM d2/AMP.ASM d2/ENEMY.FNT d2/HERO.PLR d2/INFO.FNT d2/LEVEL1.DTA d2/LEVEL1.FNT d2/LEVEL1.STA d2/MISSION.AMC d2/SCREEN.FNT d2/TITLE.FNT
	mads main.asm -o:bin/misja.xex

test:	d1/E.OBJ d1/H.OBJ d1/I.OBJ d1/M.OBJ d1/S.OBJ d1/SCREEN.OBJ d1/T.OBJ d1/W.OBJ d2/AMP.OBJ d2/CSAV.OBJ checksum.md5
	md5sum --check checksum.md5

d1/E.OBJ:
	mads d1/E.ASM -o:d1/E.OBJ

d1/H.OBJ:
	mads d1/H.ASM -o:d1/H.OBJ

d1/I.OBJ:
	mads d1/I.ASM -o:d1/I.OBJ

d1/M.OBJ:
	mads d1/M.ASM -o:d1/M.OBJ

d1/S.OBJ:
	mads d1/S.ASM -o:d1/S.OBJ

d1/SCREEN.OBJ:
	mads d1/SCREEN.ASM -o:d1/SCREEN.OBJ

d1/T.OBJ:
	mads d1/T.ASM -o:d1/T.OBJ

d1/W.OBJ:
	mads d1/W.ASM -o:d1/W.OBJ

d2/AMP.OBJ:
	mads d2/AMP.ASM -o:d2/AMP.OBJ

d2/CSAV.OBJ:
	mads d2/CSAV.ASM -o:d2/CSAV.OBJ

clean:
	rm -f d1/*.OBJ d2/*.OBJ bin/*.xex
