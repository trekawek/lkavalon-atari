all:	bin/robbo.xex bin/saver.xex bin/demo.xex

bin/robbo.xex:	main.asm d2/M.FNT d2/S.FNT d2/F.FNT d2/I.FNT d1/R1.ASM d1/TITLE.ASM d2/C1.ASM d2/C2.ASM d2/C3.ASM
	mads main.asm -o:bin/robbo.xex

bin/saver.xex:	saver.asm d2/M.FNT d2/S.FNT d2/F.FNT d2/I.FNT d1/R1.ASM d1/TITLE.ASM d2/C1.ASM d2/C2.ASM d2/C3.ASM
	mads saver.asm -o:bin/saver.xex

bin/demo.xex:	demo.asm d2/M.FNT d2/S.FNT d2/F.FNT d2/I.FNT d1/R1.ASM d1/TITLE.ASM d2/DEMOL.ASM
	mads demo.asm -o:bin/demo.xex

test:	d1/R1.obx d1/RS.obx d1/TITLE.obx d2/C1.obx d2/C2.obx d2/C3.obx checksum.md5
	md5sum --check checksum.md5

d1/R1.obx:	d1/R1.ASM d1/R2.ASM
	mads d1/R1.ASM

d1/RS.obx:	d1/RS.ASM d1/RS.ASM
	mads d1/RS.ASM

d1/TITLE.obx:	d1/TITLE.ASM
	mads d1/TITLE.ASM

d2/C1.obx:	d2/C1.ASM
	mads d2/C1.ASM

d2/C2.obx:	d2/C2.ASM
	mads d2/C2.ASM

d2/C3.obx:	d2/C3.ASM
	mads d2/C3.ASM

clean:
	rm -f d1/*.obx d2/*.obx bin/*.xex