( GRAPHICS COMMANDS )

CODE &GR     XSAVE STX, # 30 LDX,
             # C LDA,  IOCX 2 +
             ,X STA,   CIO JSR,
             XSAVE LDX, 0 # LDA,
             GFLAG STA, NEXT JMP,

: XGR  &GR  0 GR.  &GR ;
  ( EXIT GRAPHICS MODE )

-->




