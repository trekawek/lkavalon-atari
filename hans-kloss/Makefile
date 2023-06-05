all: bin/hans-kloss.xex

side_a/HK_MAIN.OBJ: side_a/HK_MAIN.ASM
	mads side_a/HK_MAIN.ASM -o:side_a/HK_MAIN.OBJ

side_b/HK_MAIN.XEX: side_a/HK_MAIN.OBJ
	go run util/protect.go < side_a/HK_MAIN.OBJ > side_b/HK_MAIN.XEX

side_a/HK_LOAD.OBJ: side_a/HK_LOAD.ASM
	mads side_a/HK_LOAD.ASM -o:side_a/HK_LOAD.OBJ
	
bin/hans-kloss.xex: main.asm side_a/HK_INIT.ASM side_a/HK_LOAD.FNT side_a/HK_LOAD.OBJ side_a/HK_MAIN.FNT side_a/HK_TITL.FNT side_a/HK_FINI.FNT side_a/HK_GOTH.FNT side_a/HK_PLAN.FNT side_a/HK_NAME.FNT side_a/HK_WALK.PLR side_a/HK_JUMP.PLR side_a/HK_STAT.STA side_a/HK_PLAY.AMC side_a/HK_CAVE.DTA side_b/HK_MAIN.XEX
	mads main.asm -o:bin/hans-kloss.xex

side_b/HK_GAME.XEX: bin/hans-kloss.xex
	cp bin/hans-kloss.xex side_b/HK_GAME.XEX

side_b/HK_INIT.OBJ: side_a/HK_INIT.ASM
	mads side_a/HK_INIT.ASM -o:side_b/HK_INIT.OBJ

side_b/HK_LOAD.OBJ: side_a/HK_LOAD.ASM
	mads side_a/HK_LOAD.ASM -o:side_b/HK_LOAD.OBJ

clean:
	rm side_a/*.OBJ side_b/*.OBJ side_b/*.XEX bin/*.xex

test: side_b/HK_GAME.XEX side_b/HK_INIT.OBJ side_b/HK_LOAD.OBJ side_b/HK_MAIN.XEX checksum.md5
	md5sum --check checksum.md5
