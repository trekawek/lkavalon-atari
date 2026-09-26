     OPT h+

********************
*                  *
*    NEW WATSON    *
*                  *
*==================*
*                  *
*       1988-08-14 *
*       1988-10-23 *
*                  *
********************


*--- page 0 --------

SCAD EQU $58

WSTK EQU $FB
NUMB EQU $CA
ONSC EQU $CB
SPSV EQU $CC
TEMP EQU $CD
NPOS EQU $CE
BYTN EQU $CF
SCRA EQU $D0
NBUF EQU $D2
NLNK EQU $D4
KSTA EQU $D6
BLKF EQU $D7
NOLD EQU $D8
ADDR EQU $DA
CRAD EQU $DC
CODL EQU $DE
MODE EQU $DF
KEY  EQU $E0
HLPN EQU $E1
IADR EQU $E2
B7TH EQU $E4
CCOL EQU $E5
CROW EQU $E6
BYTE EQU $E7
WNDW EQU $E8
OUTW EQU $E9
BMSK EQU $EA
ESC  EQU $EB
CHAR EQU $EC
SECL EQU $ED
SECP EQU $EE
FILE EQU $EF
*--- Maciejowa -----
PATL EQU $A1


*--- other ---------

INVF EQU $2B6
SHFL EQU $2BE

VIRQ EQU $216
VSER EQU $20A

TIMR EQU $21E

CRET EQU $29C
DRET EQU $2BD
HLPK EQU $2DC
DVST EQU $2EA

DDEVC EQU $300
DUNIT EQU $301
DCMMD EQU $302
DSTAT EQU $303
DBUFA EQU $304
DTIMO EQU $306
DBUFL EQU $308
DAUX1 EQU $30A
DAUX2 EQU $30B


*-------------------

AUX  EQU $6C00
MERO EQU $6C03
MINI EQU $6C06
WOPN EQU $9200
WCLO EQU $9203


*--- system --------

SIOV EQU $E459

KDEF EQU $FB51


*--- buffers -------

BUFF EQU $8000
OLD  EQU $8080

********************

*---- PAGE 0 -------

Z0   EQU $F0 ; ($AA)
TYPE EQU Z0+00
LAST EQU Z0+01 ; +02
HLP  EQU Z0+03 ; +04
PARS EQU Z0+05 ; +06
JEST EQU Z0+07 ; +08
*-------------------

     ORG $480
     JMP STAR
*    ORG $2E0
*    DTA A(STAR)
     ORG $8100

*--- public entries

STAR JMP BEGN ; +0
     JMP CROF ; +3
     JMP CRON ; +6
     JMP GETS ; +9
     JMP INPS ; +12
     JMP IBUF ; +15
     JMP OUTS ; +18
     JMP GETB ; +21
     JMP ATIN ; +24
     JMP DSPB ; +27
     JMP DSPD ; +30
     JMP INLN ; +33
     JMP RDOS ; +36
     JMP XGET ; +39
     JMP STAT ; +42
     JMP SSIO ; +45
     JMP GETC ; +48
     JMP BELL ; +51
     JMP EROR ; +54
     JMP REST ; +57
*===================

BEGN EQU *
*    LDA #0
*    STA HLPN
*    JMP HELP
* save stack pointer
     TSX
     STX SPSV
* wash work storage
     LDX #255
     STX MODE
     STX FILE
     INX
     STX HLPN
     STX HLPK
     STX OUTW
     STX PATL
     STX CODL
     STX BYTN
     STX WNDW
     STX NPOS
     STX NOLD
     STX NBUF+1
     STX NOLD+1
     TXA
     INX
     STX NBUF

     LDX #127
WASH EQU *
     STA BUFF,X
     STA OLD,X
     DEX
     BPL WASH
* init Maciek
     JSR MINI
* init screen
     JSR INIS
* save stack pointer
     TSX
     STX SPSV
* set drive number
     LDA DUNIT
     BEQ DSRC
     CMP #5
     BCS DSRC
     JSR STAT
     BPL SDCB
DSRC LDA #4
     STA DUNIT
DSRL JSR STAT
     BPL SDCB
     DEC DUNIT
     BNE DSRL
     INC DUNIT
* set DCB
SDCB JSR SETD
* get 1st sector
     JSR IBUF
* adv. cursor speed
     LDA #16
     STA $2D9
     LDA #3
     STA $2DA
* dummy cursor addr
     LDA <CHAR
     STA CRAD
     LDA >CHAR
     STA CRAD+1
* display advert
*    JSR HELP
* main loop
* main loop
* main loop
LOOP EQU *
* establish cursor
     LDA WNDW
     TAX
     INX
     STX HLPN
     ASL @
     TAX
     LDY CPRO,X
     LDA CPRO+1,X
     JSR CALL
     JSR CRON
* get byte from kbrd
     JSR GETC
     STA KEY
     JSR CROF
     LDA KEY
     BIT KSTA
     BPL LOCA
     BVC LOCA
* call AUX
     INC OUTW
     TXA
     JSR AUX
     LDA #20
     STA TIMR
     DEC OUTW
     JSR DSPL
     LDA TIMR
     BNE *-3
     BEQ LOOP ; (JMP)
* local
LOCA AND #%01111111
     CMP #' '
     BNE JWIN
     BIT KSTA
     BMI BACK
     BVC JWIN
* skip window forw
     LDX WNDW
     INX
     CPX #3
     BNE *+4
     LDX #0
     STX WNDW
     JMP LOOP
* skip window back
BACK LDX WNDW
     DEX
     BPL *+4
     LDX #2
     STX WNDW
     BPL LOOP ; (JMP)
* call window proc
JWIN LDA WNDW
     ASL @
     TAX
     LDY WPRO,X
     LDA WPRO+1,X
     JSR CALL
     JMP LOOP
CALL PHA
     TYA
     PHA
     RTS


*--- curs on num ---

NCUR LDA #1
     STA CROW
     CLC
     LDA #7
     ADC NPOS
     STA CCOL
     RTS


*--- curs on hex ---

XCUR LDA BYTN
     AND #7
     STA CCOL
     ASL @
     ADC CCOL
     BIT BMSK
     BPL *+3
     SEC
     ADC #3
     STA CCOL
XROW LDA BYTN
     LSR @
     LSR @
     LSR @
     CLC
     ADC #4
     STA CROW
     RTS


*--- curs on chr ---

CCUR LDA BYTN
     AND #7
     ADC #29
     STA CCOL
     JMP XROW


*--- num proc ------

NWP  DTA A(IBUF-1)
     DTA A(GPRV-1)
     DTA A(GNXT-1)
     DTA A(GLNK-1)
     DTA A(NWLT-1)
     DTA A(NWRT-1)
NWK  DTA B($9B)
     DTA B('+')
     DTA B('*')
     DTA B('=')
     DTA B('←')
     DTA B('→')
NWIN LDA KEY
     JSR XGET
     BCC NUPD
     LDX #NWIN-NWK-1
NSRC CMP NWK,X
     BEQ NFND
     DEX
     BPL NSRC
     RTS
NFND TXA
     ASL @
     TAX
     LDY NWP,X
     LDA NWP+1,X
     JSR CALL
     LDA #255
     STA 764
     JMP DSPI
NUPD TAY ; digit
     SEC
     LDA #2
     SBC NPOS
     LSR @
     TAX ; offset
     TYA ; digit
     LDY #%11110000
     BCC NU1
     LDY #%00001111
     ASL @
     ASL @
     ASL @
     ASL @
NU1  STA TEMP ; digit
     TYA ; mask
     AND NBUF,X
     ORA TEMP
     STA NBUF,X
     JSR NWRT
     JMP DSPI


*--- curs left -----

NWLT LDX NPOS
     DEX
     BPL *+4
     LDX #2
     STX NPOS
     RTS


*--- curs right ----

NWRT LDX NPOS
     INX
     CPX #3
     BCC *+4
     LDX #0
     STX NPOS
     RTS


*--- get previous --

GPRV LDA NBUF
     BNE *+4
     DEC NBUF+1
     DEC NBUF
ADJU LDA NBUF+1
     AND #%00001111
     STA NBUF+1
     JMP IBUF


*--- get next ------

GNXT INC NBUF
     BNE *+4
     INC NBUF+1
     JMP ADJU


*--- get nxt by link

GLNK JSR LINK
     BPL *+3
     RTS
     JMP ADJU


*--- hex proc ------

XWP  DTA A(XWLT-1)
     DTA A(XWRT-1)
     DTA A(XWUP-1)
     DTA A(XWDN-1)
     DTA A(SKIP-1)
XWK  DTA B('←')
     DTA B('→')
     DTA B('↑')
     DTA B('↓')
     DTA B($9B)
XWIN LDA KEY
     JSR XGET
     BCC XUPD
     LDX #XWIN-XWK-1
XSRC CMP XWK,X
     BEQ XFND
     DEX
     BPL XSRC
     RTS
XFND TXA
     ASL @
     TAX
     LDY XWP,X
     LDA XWP+1,X
     JSR CALL
     JMP DSPL
XUPD BIT BMSK
     BMI *+6
     ASL @
     ASL @
     ASL @
     ASL @
     STA TEMP
     LDX BYTN
     LDA BUFF,X
     AND BMSK
     ORA TEMP
     STA BUFF,X
     JSR XWRT
     JMP DSPL


*--- curs rt -------

XWRT LDA BMSK
     EOR #%11111111
     STA BMSK
     BPL CWRT
     RTS
CWRT INC BYTN
     BNE BNAN ; (JMP)


*--- curs lt -------

XWLT LDA BMSK
     EOR #%11111111
     STA BMSK
     BMI CWLT
     RTS
CWLT DEC BYTN
BNAN LDA BYTN
     AND #%01111111
     STA BYTN
     RTS


*--- curs up -------

XWUP SEC
     LDA BYTN
     SBC #8
     JMP BNAN+2


*--- curs dn -------

XWDN CLC
     LDA BYTN
     ADC #8
     JMP BNAN+2


*--- skip over instr

SKIP CLC
     LDA BYTN
     ADC CODL
     JMP BNAN+2


*--- chr proc ------

CWP  DTA A(CWLT-1)
     DTA A(CWRT-1)
     DTA A(XWUP-1)
     DTA A(XWDN-1)
     DTA A(SKIP-1)
CWK  DTA B('←')
     DTA B('→')
     DTA B('↑')
     DTA B('↓')
     DTA B($9B)
CWIN LDA KEY
     LDX #CWIN-CWK-1
CSRC CMP CWK,X
     BEQ CFND
     DEX
     BPL CSRC
     BIT MODE
     BMI *+5
     JSR ATIN
     LDX BYTN
     STA BUFF,X
     JSR CWRT
     JMP DSPL
CFND TXA
     ASL @
     TAX
     LDY CWP,X
     LDA CWP+1,X
     JSR CALL
     JMP DSPL


*--- error msg -----

EROR TYA
     PHA
     INC OUTW
     JSR MERO
     DEC OUTW
     LDA #4
     BIT $D20F
     BEQ *-3
     PLA
     TAY
     RTS


*--- get byte ------

GETB LDY SECP
     CPY SECL
     BCC GB
     JSR GETS
     BPL GETB
     RTS
GB   INC SECP
     LDA BUFF,Y
     LDY #1
     RTS


*--- init screen ---

INIS JSR WOPN
     DTA B(00),B(00)
     DTA B(38),B(22)
     LDA WSTK+1
     PHA
     LDA WSTK
     PHA
     JSR WOPN
     DTA B(02),B(03)
     DTA B(23),B(16)
     JSR WOPN
     DTA B(28),B(03)
     DTA B(08),B(16)
     PLA
     STA WSTK
     PLA
     STA WSTK+1

     JSR UPPR
     LDY #39
DTLL LDA TOPL,Y
     STA (SCRA),Y
     DEY
     BPL DTLL
     JSR LOWR
     LDA #20
     JSR ADSC
     LDY #4
DBLL LDA MTXT,Y
     STA (SCRA),Y
     DEY
     BPL DBLL
     JSR DSCM
     JMP DSPL


*--- drive test ----

STAT LDA DCMMD
     PHA
     LDA #$80
     STA $11
     LDA #'S'
     STA DCMMD
     JSR $E453
     JSR SETD
     PLA
     STA DCMMD
     LDA DVST
     LDY DSTAT
     RTS


*--- disp sect byte

DIBY EQU *
     LDA NUMB
     BMI BIRT
     AND #7
     TAY
     BNE *+5
     JSR INLN
     TYA
     STA TEMP
     ASL @
     ADC TEMP
     ADC #5
     TAY
     LDA BYTE
     JSR DSPB
     CLC
     LDA TEMP
     ADC #30
     TAY
     LDA BYTE
     BIT MODE
     BPL *+5
     JSR ATIN
     STA (SCRA),Y
********************
BIRT LDY NUMB
     INY
     CPY #128
     BEQ *+4
     STY NUMB
     RTS


*--- ser inp rdy ---

SRDY TYA
     PHA
* read SKSTAT
     LDA $D20F
     STA $D20A
     BMI AN20
* frame error
     LDY #$8C
     STY $30

AN20 AND #$20
     BNE BFUL
     LDY #$8E
     STY $30
* buffer full ?
BFUL LDA $38
     BEQ GBYT
* check checksum
     LDA $D20D
     CMP $31
     BEQ SERF
* checksum error
     LDY #$8F
     STY $30
* set RECVDN flag
SERF LDA #$FF
     STA $39
* return
SRRT PLA
     TAY
     PLA
     RTI
* get byte
GBYT LDA $D20D
     LDY #0
     STA ($32),Y
     STA BYTE
* update CHKSUM
     CLC
     ADC $31
     ADC #0
     STA $31
* updte buff pointer
     INC $32
     BNE *+4
     INC $33
********************
*** display byte ***
********************
     JSR DIBY
* end of buff check
ECHK LDA $32
     CMP $34
     LDA $33
     SBC $35
     BCC SRRT
* test NOCKSM
     LDA $3C
     BEQ SEBR
* clear NOCKSM
     LDA #0
     STA $3C
     BEQ SERF ; (JMP)
* set BUFRFL
SEBR LDA #$FF
     STA $38
     BNE SRRT ; (JMP)


*--- set DCB -------

SETD EQU *
     LDA #$31
     STA DDEVC
     LDA <7
     STA DTIMO
     LDA <128
     STA DBUFL
     LDA >128
     STA DBUFL+1
     RTS


*--- get sector ----

GETS JSR SETD
     LDA FILE
     BNE FLNK
* disk mode next
     INC NBUF
     BNE JIBU
     INC NBUF+1
     BNE JIBU ; (JMP)
* file mode next
FLNK JSR LINK
     BPL JIBU
     JMP EROR
* get sector
JIBU JMP IBUF


*--- next by link --

LINK LDA BUFF+125
     AND #3
     TAX
     ORA BUFF+126
     BEQ E136
     LDA BUFF+126
     STA NBUF
     STX NBUF+1
     LDY #1
     RTS
E136 LDY #136
     RTS


*--- return to DOS -

RDOS EQU *
     LDX #0
     STX INVF
     DEX
     STX 764
     LDA #64
     STA SHFL
* reset stack
     LDX SPSV
     TXS
* close windows
     JMP WCLO


*--- get key -------

BLNK EQU *
     LDY #144
     INY
     BNE *-1
     DEC CNTR
     BNE GETC
     LDA BLKF
     BEQ GETC
     LDA (CRAD),Y
     EOR #128
     STA (CRAD),Y
     LDA WNDW
     ORA OUTW
     BNE GETC
     LDA ONSC
     BNE GETC
JDIS JSR DSPL
GETC EQU *
     LDA WNDW
     ORA OUTW
     BNE TURT
     LDA #$04
     BIT $D20F
     BNE TURT
     LDA $D209
     CMP #$06
     BEQ HURR
     CMP #$07
     BEQ HURR
     CMP #$0F
     BEQ HURR
     CMP #12
     BNE TURT
* hurry !!!
HURR TAX
     LDA #0
     STA KSTA
     LDA KDEF,X
     RTS
CNTR DTA B($9B)
TURT EQU *
*    LDX HLPK  help?
*    BEQ *+5
*    JSR HELP
     LDX 764
     INX
     BEQ BLNK
     JSR CLIK
     LDA #255
     LDX 764
     STA 764
     TXA
     AND #$C0
     STA KSTA
     TXA
     AND #$3F
     LDY OUTW
     BNE CMLC
     CMP #44
     BNE CMLC
     JSR CHMD
     JMP JDIS
CMLC CMP #39
     BEQ LOGO
     CMP #60
     BEQ CAPS
     LDA KDEF,X
NOSC CMP #27
     BCC INV
     CMP #32
     BCC KRET
CMPA CMP #'a'
     BCC INV
     CMP #'z'+1
     BCS INV
     TXA
     EOR SHFL
     TAX
     LDA KDEF,X
INV  ORA INVF
KRET RTS
LOGO LDA INVF
     EOR #128
     STA INVF
     JMP JDSM
CAPS LDA SHFL
     EOR #64
     STA SHFL
JDSM JSR DSCM
     JMP BLNK


*--- hex digit -----

XGET EQU *
     TAY
     AND #%01111111
     CMP #'0'
     BCC XERT
     CMP #'9'+1
     BCC DECD
     CMP #'A'
     BCC XERT
     CMP #'F'+1
     BCC UX
     CMP #'a'
     BCC XERT
     CMP #'f'+1
     BCS XERT
     SBC #32
UX   SBC #6
DECD SEC
     SBC #'0'
     CLC
     RTS
XERT TYA
     SEC
     RTS


*--- cursor off ----

CROF LDY #0
     LDA CHAR
     STA (CRAD),Y
     STY BLKF
     RTS


*--- cursor on -----

CRON EQU *
* display info
     JSR DSPI
* compute address
     CLC
     LDA SCAD
     ADC CCOL
     STA CRAD
     LDA SCAD+1
     ADC #0
     STA CRAD+1
     LDX CROW
CALP DEX
     BMI CO
     CLC
     LDA CRAD
     ADC #40
     STA CRAD
     BCC *+4
     INC CRAD+1
     JMP CALP
* save old char
CO   STX BLKF
     LDY #0
     LDA (CRAD),Y
     STA CHAR
     RTS


*--- I/O -----------

NSIO LDY NBUF
     STY DAUX1
     LDY NBUF+1
     STY DAUX2
SSIO EQU *
     STA DCMMD
     LDY #$40
     CMP #'W'
     BNE *+4
     LDY #$80
     STY DSTAT
     LDA #128
     STA $11
     JMP SIOV


*--- bell ----------


BELL LDA #15
     LDY #2
     BPL CLK
CLIK LDA #1
     LDY #1
CLK  STY DELA
     TAY
     ORA #$A0
     TAX
     LDA #33
     STA $D200
BL   STX $D201
     LDA #0
DELA EQU *-1
     STA TIMR
WAIT LDA TIMR
     BNE WAIT
     DEX
     DEY
     BPL BL
     RTS


*--- input ---------

IBUF LDA <BUFF
     STA DBUFA
     LDA >BUFF
     STA DBUFA+1
     LDA #0
     STA ONSC
INPS EQU *
* save VSERIN
     LDA VSER
     PHA
     LDA VSER+1
     PHA
* check VIMIRQ vect
RERE BIT VIRQ+1
     BPL ISBG
     BVC ISBG
* check HERE flag
     LDA OUTW
     BNE ISBG
* steal VSERIN
     LDA <SRDY
     STA VSER
     LDA >SRDY
     STA VSER+1
ISBG EQU *
     LDA #$FE
     STA NUMB
     JSR UPPR
     LDA #79
     JSR ADSC
     LDA #0
     STA BYTN
     STA SECP
     LDA #%00001111
     STA BMSK
     LDA #'R'
     JSR NSIO
     BPL REVS
     JSR EROR
     BCC RERE
* restore VSERIN
REVS PLA
     STA VSER+1
     PLA
     STA VSER
* sec len for srch
SETL LDA BUFF+127
     AND #127
     LDY FILE
     BNE *+4
     LDA #128
     STA SECL
* display sect info
     JSR DSPI
* restore I/O status
     LDY DSTAT
     RTS


*--- disp sector ---

DSPL EQU *
     LDY #0
     STY NUMB
     DEY
     STY ONSC
     JSR UPPR
     LDA #79
     JSR ADSC
DSL1 LDY NUMB
     LDA BUFF,Y
     STA BYTE
     JSR DIBY
     BNE DSL1

DSPI EQU *
*** lower line ***
     JSR LOWR
* disassemble
     JSR DISS
     STX CODL
* sector pointer
     LDY #3
     LDA BYTN
     JSR DSPB
* mode of work
     LDA #25
     JSR ADSC
     LDX #3
     LDA FILE
     BNE *+4
     LDX #7
     LDY #3
DMLP LDA MMSG,X
     STA (SCRA),Y
     DEX
     DEY
     BPL DMLP
*** upper line ***
     JSR UPPR
* sector number
     LDY #9
     LDA NBUF
     JSR DSPB
     LDA NBUF+1
     JSR DSPD
* next sector number
     LDY #19
     LDA BUFF+126
     STA NLNK
     JSR DSPB
     LDA BUFF+125
     AND #3
     STA NLNK+1
     JSR DSPD
* sector length
     LDY #28
     LDA BUFF+127
     AND #$7F
     LDX FILE
     BEQ *+4
     STA SECL
     JSR DSPB
* file number
     LDY #37
     LDA BUFF+125
     LSR @
     LSR @
     JMP DSPB


*--- output --------

OUTS EQU *
     LDA #4
     BIT $D01F ; Cnsl
     BEQ WRIS
* save old sector
     LDA <OLD
     STA DBUFA
     LDA >OLD
     STA DBUFA+1
     JSR INPS
     LDY DSTAT
     BMI OURT
     LDA NBUF
     STA NOLD
     LDA NBUF+1
     STA NOLD+1
* write new sector
WRIS LDA <BUFF
     STA DBUFA
     LDA >BUFF
     STA DBUFA+1
     LDA #'W'
     JSR NSIO
     BPL OURT
     JSR EROR
     BCC WRIS
     LDY DSTAT
OURT RTS


*--- restore old ---

REST LDX #127
     LDA OLD,X
     STA BUFF,X
     DEX
     BPL REST+2
     LDA NOLD
     STA NBUF
     LDA NOLD+1
     STA NBUF+1
     RTS


*--- chg char mode -

CHMD LDA MODE
     EOR #$FF
     STA MODE
* dspl char mode
DSCM JSR LOWR
     LDA #'a'
     BIT MODE
     BMI *+4
     LDA #'i'
     EOR SHFL
     ORA INVF
     LDY #35
     STA (SCRA),Y
     RTS


*--- set scra ------

UPPR LDA SCAD
     STA SCRA
     LDA SCAD+1
     STA SCRA+1
     LDA #40
     JMP ADSC

LOWR CLC
     LDA SCAD
     ADC <880
     STA SCRA
     LDA SCAD+1
     ADC >880
     STA SCRA+1
     RTS


*--- ATASCII to int.

ATIN ASL @
     PHP
     CMP #192
     BCS *+8
     SBC #63
     BCS *+4
     ADC #192
     PLP
     ROR @
     RTS


*--- display byte --

DSPB PHA
     AND #$0F
     JSR DSPD
     PLA
     LSR @
     LSR @
     LSR @
     LSR @
DSPD ORA #$10
     CMP #26
     BCC XDOK
     ADC #6
XDOK STA (SCRA),Y
     DEY
     RTS


*--- incr scr addr -

INLN LDA #40
ADSC CLC
     ADC SCRA
     STA SCRA
     BCC *+4
     INC SCRA+1
     RTS

*-------------------

DISS EQU *
     RTS

TOPL EQU *
   DTA B($56),D' sect=   '
   DTA D'  next=   '
   DTA D'  lgth=   '
   DTA D' file=   ',B($42)

MTXT DTA D'mode='
MMSG DTA D'file'
     DTA D'disk'

*--- window proc ---

WPRO DTA A(NWIN-1)
     DTA A(XWIN-1)
     DTA A(CWIN-1)

CPRO DTA A(NCUR-1)
     DTA A(XCUR-1)
     DTA A(CCUR-1)


     END
