     OPT h- s+
     INS "d2/M.FNT"
     INS "d2/S.FNT"
     INS "d2/F.FNT"
     INS "d2/I.FNT"

     OPT h+
     .local
     ICL "d1/R1.ASM"
     .endl

     .local
     ICL "d1/TITLE.ASM"
     .endl

     org $4800
     ICL "d2/DEMOL.ASM"

     ORG $2E0
     DTA A($3800)
