     OPT h+
     .local
     ICL "side_a/HK_INIT.ASM"
     .endl

     OPT h-
     INS "side_a/HK_LOAD.FNT" ; $B800-BBFF

     OPT h-
     INS "side_a/HK_LOAD.OBJ" ; $0480
     INS "side_a/HK_MAIN.FNT" ; $8000-87FF
     INS "side_a/HK_TITL.FNT" ; $5C00-63FF
     INS "side_a/HK_FINI.FNT" ; $5400-5BFF
     INS "side_a/HK_GOTH.FNT" ; $5000-53FF
     INS "side_a/HK_PLAN.FNT" ; $4C00-4FFF
     INS "side_a/HK_NAME.FNT" ; $4800-4BFF
     INS "side_a/HK_WALK.PLR" ; $6400-6BFF
     INS "side_a/HK_JUMP.PLR" ; $6C00-73FF
     INS "side_a/HK_STAT.STA" ; $8800-883F
     INS "side_a/HK_PLAY.AMC" ; $3C00-428D
     INS "side_a/HK_CAVE.DTA" ; $8900-B12C
     INS "side_b/HK_MAIN.XEX" ; $1000
