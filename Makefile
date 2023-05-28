all:	bin/robbo.xex bin/saver.xex bin/demo.xex

bin/robbo.xex:	main.asm d2/M.FNT d2/S.FNT d2/F.FNT d2/I.FNT d1/R1.ASM d1/TITLE.ASM d2/C1.OBJ d2/C2.OBJ d2/C3.OBJ
	mads main.asm -o:bin/robbo.xex

bin/saver.xex:	saver.asm d2/M.FNT d2/S.FNT d2/F.FNT d2/I.FNT d1/R1.ASM d1/TITLE.ASM d2/C1.OBJ d2/C2.OBJ d2/C3.OBJ
	mads saver.asm -o:bin/saver.xex

bin/demo.xex:	demo.asm d2/M.FNT d2/S.FNT d2/F.FNT d2/I.FNT d1/R1.ASM d1/TITLE.ASM d2/DEMOL.OBJ
	mads demo.asm -o:bin/demo.xex

test:	d1/R1.OBJ d1/RS.OBJ d1/TITLE.OBJ d2/C1.OBJ d2/C2.OBJ d2/C3.OBJ checksum.md5
	md5sum --check checksum.md5

d1/R1.OBJ:	d1/R1.ASM d1/R2.ASM
	mads d1/R1.ASM -o:d1/R1.OBJ

d1/RS.OBJ:	d1/RS.ASM
	mads d1/RS.ASM -o:d1/RS.OBJ

d1/TITLE.OBJ:	d1/TITLE.ASM
	mads d1/TITLE.ASM -o:d1/TITLE.OBJ

d2/C1.OBJ:	d2/C1.txt
	go run util/level-parser.go encode < d2/C1.txt > d2/C1.OBJ

d2/C2.OBJ:	d2/C2.txt
	go run util/level-parser.go encode < d2/C2.txt > d2/C2.OBJ

d2/C3.OBJ:	d2/C3.txt
	go run util/level-parser.go encode < d2/C3.txt > d2/C3.OBJ

d2/DEMOL.OBJ:	d2/DEMOL.txt
	go run util/level-parser.go encode < d2/DEMOL.txt > d2/DEMOL.OBJ

clean:
	rm -f d1/*.OBJ d2/*.OBJ bin/*.xex
