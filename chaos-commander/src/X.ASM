
TEMP EQU $A0
ADDR EQU $8000
FONT EQU $9000

     ORG $480
     JMP INIT

     ORG 65
     DTA B(0)
*    ORG 559
*    DTA B(0)

     ORG ADDR

*- initilization ---

INIT EQU *

     LDA 560
     STA TEMP
     LDA 561
     STA TEMP+1
     LDA 756
     STA TEMP+2
     LDA 709
     STA TEMP+3
     LDA 710
     STA TEMP+4
*-------------------
     LDA <DLIST
     STA 560
     LDA >DLIST
     STA 561
     LDA >FONT
     STA 756
     LDA #10
     STA 709
     LDA #0
     STA 710
     STA 712
*    TAX
*LS  STA SCRN+$000,X
*    STA SCRN+$100,X
*    DEX
*    BNE CLS
     LDX #7
     STA FONT,X
     DEX
     BPL *-4
     LDA #33
     STA 559
     LDA 20
     CMP 20
     BEQ *-2
     JMP *
     RTS

*--- display list --

DLIST EQU *

     DTA B($70)
     DTA B($70)
     DTA B($70)
     DTA B($70)
     DTA B($70)
     DTA B($70)
     DTA B($70)
     DTA B($42)
     DTA A(SCRN)
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($41)
     DTA A(DLIST)

SCRN EQU *

     ORG $2E2
     DTA A(INIT)

*- screen data -----

     ORG SCRN

 DTA D'+0000000'
 DTA D'00000000'
 DTA D'00000000'
 DTA D'000,    '

 DTA D'/       '
 DTA D'        '
 DTA D'        '
 DTA D'   /    '

 DTA D'/  ',B($41),B($42),D'   '
 DTA D'  ',B($49),D'     '
 DTA B($4F),B($50),D'     ',B($59)
 DTA B($5A),D'  /    '

 DTA D'/  ',B($43),B($44),B($45),B($46),B($47)
 DTA B($48),D' ',B($4A),B($4B),B($4C),B($4D),B($4E),D' '
 DTA B($51),B($52),B($53),B($54),B($55),B($56),B($57),B($58)
 DTA D'   /    '

 DTA D'/       '
 DTA D'        '
 DTA D'        '
 DTA D'   /    '

 DTA D'/       '
 DTA D'        '
 DTA D'        '
 DTA D'   /000,'

 DTA D'-0000000'
 DTA D'00000000'
 DTA D'00000000'
 DTA D'000.   /'

 DTA D'       '
 DTA D'   /    '
 DTA D'!"#$%   '
 DTA D'   ',B($40),D'`   /'

 DTA D'       '
 DTA D'   / by '
 DTA D'&''()*  {'
 DTA D'|} :;<=>/'

 DTA D'        '
 DTA D'  /     '
 DTA D'        '
 DTA D'       /'

 DTA D'       '
 DTA D'   -0000'
 DTA D'00000000'
 DTA D'00000000.'

 DTA D'@@@'

     END
