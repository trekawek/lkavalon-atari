     OPT h-
     INS "bin/CAVES.OBJ" ; OS color shadows and $7000 cave data from HL.BAS
     INS "d1/HL.FNT"    ; $9000-$93FF, loaded before the overlapping game code
     INS "bin/HL.OBJ"   ; $9260-$98FF

     OPT h+
     ORG $02E0
     DTA A($9260)
