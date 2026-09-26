     opt h+
********************
*                  *
*      SZPER!      *
*                  *
*    1987/03/03    *
*                  *
*    1987/03/17    *
*                  *
* updte 1987/10/20 *
* (hi speed vers.) *
*                  *
* updte 1988/02/09 *
* (Ultra speed v.) *
*                  *
********************


*--- bell freq -----

BFRQ EQU 33

*--- page 0 --------

NUMB EQU $CA
HISP EQU $CB
SPSV EQU $CC
TEMP EQU $CD
DRVN EQU $CE
BYTN EQU $CF
SCRA EQU $D0
NBUF EQU $D2
NLNK EQU $D4
NMEM EQU $D6
NOLD EQU $D8
BUFA EQU $DA
CRAD EQU $DC
CODL EQU $DE
MODE EQU $DF
LFT  EQU $E0
RGT  EQU $E1
TOP  EQU $E2
BOT  EQU $E3
FLGS EQU $E4
CCOL EQU $E5
CROW EQU $E6
BYTE EQU $E7
WNDW EQU $E8
HERE EQU $E9
OFST EQU $EA
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

VSER EQU $20A

DDEVC EQU $300
DUNIT EQU $301
DCMMD EQU $302
DSTAT EQU $303
DBUFA EQU $304
DTIMO EQU $306
DBUFL EQU $308
DAUX1 EQU $30A
DAUX2 EQU $30B

IOCB  EQU $340


*--- system --------

CIOV EQU $E456
SIOV EQU $E459
CLIK EQU $F983

DISA EQU CLIK


*--- buffers -------

BUFF EQU $7E00
MEM  EQU $7E80
OLD  EQU $7F00


     ORG $7F80

*--- public entries

     JMP (10)
MACI JMP RDOS ; +3
     JMP CROF ; +6
     JMP CRON ; +9
     JMP $F556 ; +12
     JMP SSIO ; +15
     JMP STAT ; +18
     JMP GETS ; +21
     JMP INPS ; +24
     JMP OUTS ; +27
     JMP GETB ; +30
     JMP CHMD ; +33
     JMP $F556 ; +36
     JMP ATIN ; +39
     JMP DSPB ; +42
     JMP DSPD ; +45
     JMP $F556 ; +48
     JMP INLN ; +51
     JMP RDOS ; +54
     JMP XGET ; +57
     JMP TEST ; +60
*--- display list --

DLST DTA B($70)
     DTA B($70)
     DTA B($42)
SCAD DTA A(SCRN)
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
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($02)
     DTA B($41)
DLAD DTA A(DLST)

SAVE JSR $6800
     TAY

INIT EQU *
* set DL address
     LDX #1
LO   LDA $230,X
     STA SAVE,X
     LDA 88,X
     STA SAVE+2,X
     LDA DLAD,X
     STA $230,X
     LDA SCAD,X
     STA 88,X
     DEX
     BPL LO
     RTS

SORG EQU *

*===================

*    ORG $2E0
*    DTA A(BEGN)
*    DTA A(INIT)

     ORG $480  ;
     JSR INIT  ;
     JMP BEGN  ;


     ORG SORG

SCRN EQU *

   DTA D' ',B($51),B($52),B($52),B($52),B($45),B($51),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($45),B($51)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($45),B($51)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($45)

UPPR EQU *

   DTA D' |aux||sec'
   DTA D'tor# 000||'
   DTA D'next 000||'
   DTA D'length 00|'

   DTA D' ',B($5A),B($52),B($52),B($52),B($43),B($5A),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($43),B($5A)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($43),B($5A)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($43)

   DTA B($51),B($52),B($52),B($52),B($45),D'     '
   DTA D'          '
   DTA D' FILE ',B($51),B($52),B($52),B($52)
   DTA B($45),D'         '

   DTA D'|  ',B($51),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($57),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($45),D'  '
   DTA D'|',B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($45)

XX DTA D'|00|      '
   DTA D'          '
   DTA D'       |07'
   DTA D'|        |'

   DTA D'|08| Loadi'
   DTA D'ng new fan'
   DTA D'tastic |0F'
   DTA D'|        |'

   DTA D'|10|      '
   DTA D'          '
   DTA D'       |17'
   DTA D'|        |'

   DTA D'|18|      '
   DTA D'          '
   DTA D'       |1F'
   DTA D'|        |'

   DTA D'|20|  ',B($57),D' ',B($57),B($51)
   DTA B($52),B($45),B($51),B($57),B($45),B($51),B($52),B($45),B($51),B($52)
   DTA B($45),B($57),B($51),B($45),D'(R)|27'
   DTA D'|        |'

   DTA D'|28|  | ||'
   DTA D' | | |  | '
   DTA D'|',B($41),B($43),D'|   |2F'
   DTA D'|        |'

   DTA D'|30|  | |',B($41)
   DTA B($52),B($44),D' | ',B($5A),B($52),B($45),D'| '
   DTA D'|| |   |37'
   DTA D'|        |'

   DTA D'|38|  ||||'
   DTA D' | |   || '
   DTA D'|| |   |3F'
   DTA D'|        |'

   DTA D'|40|  ',B($5A),B($58),B($43),B($58)
   DTA D' ',B($58),D' ',B($58),D' ',B($5A),B($52),B($43),B($5A),B($52)
   DTA B($43),B($58),D' ',B($58),D'   |47'
   DTA D'|        |'

   DTA D'|48|      '
   DTA D'          '
   DTA D'       |4F'
   DTA D'|        |'

   DTA D'|50|      '
   DTA D'    by    '
   DTA D'       |57'
   DTA D'|        |'

   DTA D'|58|      '
   DTA D'          '
   DTA D'       |5F'
   DTA D'|        |'

   DTA D'|60|     J'
   DTA D'BW Softwor'
   DTA D'k      |67'
   DTA D'|        |'

   DTA D'|68|   & C'
   DTA D'HAOS Softw'
   DTA D'are    |6F'
   DTA D'|        |'

   DTA D'|70|      '
   DTA D'          '
   DTA D'       |77'
   DTA D'|        |'

   DTA D'|78|    Co'
   DTA D'pyright 19'
   DTA D'88     |7F'
   DTA D'|        |'

   DTA D'|  ',B($5A),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($58),B($52),B($52),B($52),B($52)
   DTA B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($43),D'  '
   DTA D'|',B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($43)

   DTA B($5A),B($52),B($52),B($52),B($43),D'     '
   DTA D'          '
   DTA D'      ',B($5A),B($52),B($52),B($52)
   DTA B($43),D'         '

   DTA D' ',B($51),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($45),B($51),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($45),B($51),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($45),B($51),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($45)

LOWR EQU *

   DTA D' |status 0'
   DTA D'1||file# 0'
   DTA D'0||mem 000'
   DTA D'||old 000|'

   DTA D' ',B($5A),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($43),B($5A),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($52),B($43),B($5A),B($52),B($52),B($52),B($52),B($52),B($52),B($52)
   DTA B($43),B($5A),B($52),B($52),B($52),B($52),B($52),B($52),B($52),B($43)


*===================

BEGN EQU *
* save stack pointer
     TSX
     STX SPSV
* set up screen
     LDA <SCRN
     STA 88
     LDA >SCRN
     STA 89
* wash work storage
     LDX #255
     STX MODE
     STX HERE
     STX FILE
     INX
     STX PATL
     STX CODL
     STX BYTN
     STX WNDW
     STX NMEM
     STX NOLD
     STX NBUF+1
     STX NMEM+1
     STX NOLD+1
     TXA
     INX
     STX DRVN
     STX NBUF

     LDX #127
WASH EQU *
     STA MEM,X
     STA OLD,X
     DEX
     BPL WASH
* set VSERIN vector
     LDA VSER
     STA 256
     LDA <SRDY
     STA VSER
     LDA VSER+1
     STA 257
     LDA >SRDY
     STA VSER+1
* clear hex screen
     LDA <XX+5
     STA SCRA
     LDA >XX+5
     STA SCRA+1
     LDX #16
CSL1 LDY #21
     LDA #0
CSL2 STA (SCRA),Y
     DEY
     BPL CSL2
     JSR INLN
     DEX
     BNE CSL1
* set DCB
     JSR SETD
     JSR INPS
* set cursor positio
     LDA #1
     STA CROW
     LDA #2
     STA CCOL
     JSR CRON
* adv. cursor speed
     LDA #16
     STA $2D9
     LDA #3
     STA $2DA
* open keyboard
     LDX #$10
     LDA #3
     STA IOCB+2,X
     LDA <KNAM
     STA IOCB+4,X
     LDA >KNAM
     STA IOCB+5,X
     LDA #4
     STA IOCB+10,X
     LDA #0
     STA IOCB+8,X
     STA IOCB+9,X
     STA IOCB+11,X
     JSR CIOV
     LDA #7
     STA IOCB+2,X

* main loop
LOOP EQU *
     LDA #0
     STA HISP
     STA INVF
     LDX #9
CLRD STA LOWR-69,X
     DEX
     BPL CLRD
     LDA #64
     STA SHFL
     JSR DSCM
     JSR DSPL
     LDA WNDW
     ASL @
     TAX
     LDA VECT,X
     STA SCRA
     LDA VECT+1,X
     STA SCRA+1
     JSR PROC
     JMP LOOP
PROC JMP (SCRA)
VECT DTA A(EMOD)
     DTA A(ESEC)
     DTA A(ESCN)
     DTA A(EHEX)
     DTA A(EATA)
     DTA A(EMEM)
     DTA A(EOLD)
KNAM DTA C'K:'
     DTA B($9B)


*--- edit aux ------

EMOD EQU *
     JSR GETC
     CMP #$9B
     BNE EMOD
     LDA #0
     STA HERE
     JSR CROF
     JSR MACI
     JSR DSPL
     JSR CRON
     LDA #255
     STA HERE
     JMP EMOD


*--- get byte ------

GETB LDY SECP
     CPY SECL
     BCC GB
     JSR GETS
     BPL GETB
RTS  RTS
GB   INC SECP
     LDA BUFF,Y
     LDY #1
     RTS


*--- drive test ----

TEST LDA DCMMD
     PHA
     LDA DRVN
     STA DUNIT
     LDA #'S'
     STA DCMMD
     JSR $E453
     JSR STAT
     JSR SETD
     PLA
     STA DCMMD
     LDA $2EA
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
     ADC #31
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
     INC NUMB
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
     LDA HERE
     BEQ ECHK
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
     LDA <BUFF
     STA DBUFA
     LDA >BUFF
     STA DBUFA+1
     RTS


*--- get sector ----

GETS JSR SETD
     LDA FILE
     BNE FLNK
* disk mode next
     INC NBUF
     BNE *+4
     INC NBUF+1
     JMP INPS
* file mode next
FLNK LDA BUFF+126
     STA BUFA
     LDA BUFF+125
     AND #3
     STA BUFA+1
* eof check
     ORA BUFA
     BNE *+5
     LDY #136
     RTS
* update sector #
     LDA BUFA
     STA NBUF
     LDA BUFA+1
     STA NBUF+1
* get sector
     JMP INPS


*--- return to DOS -

RDOS EQU *
* close keyboard
     LDX #0
     STX INVF
     DEX
     STX 764
     LDA #64
     STA SHFL
     LDX #$10
     LDA #12
     STA IOCB+2,X
     JSR CIOV
* restore DL address
     LDX #1
REDL LDA SAVE,X
     STA $230,X
     LDA SAVE+2,X
     STA 88,X
     DEX
     BPL REDL
* restore VSERIN
     LDA 256
     STA VSER
     LDA 257
     STA VSER+1
* reset stack & ret
     LDX SPSV
     TXS
     LDA 10
     CMP #$9F
     BNE JM10
     LDA 11
     CMP #$17
     BNE JM10
JM10 RTS



*--- edit sec# i ---

ESEC EQU *
     LDA #255
     STA HISP
ESLP JSR GETC
     CMP #$1D
     BMI ESLP
     BEQ LSN
     CMP #$20
     BPL ESLP
     AND #1
     BEQ ESMI
     INC NBUF
     BNE READ
     LDX NBUF+1
     INX
     TXA
     AND #15
     STA NBUF+1
     BPL READ ; (JMP)
ESMI LDA NBUF
     BNE *+4
     DEC NBUF+1
     DEC NBUF
     LDA NBUF+1
     AND #15
     STA NBUF+1
     BPL READ ; (JMP)

LSN  LDA NLNK
     ORA NLNK+1
     BEQ READ
STLN LDA NLNK
     STA NBUF
     LDA NLNK+1
     STA NBUF+1
READ EQU *
     LDA #255
     STA 764
     LDA <BUFF
     STA DBUFA
     LDA >BUFF
     STA DBUFA+1
     JSR INPS
     JMP ESLP


*--- edit sec# ii --

ESCN JSR DSPI
     JSR GETC
     CMP #$9B
     BEQ GS
     JSR SPEC
     BCC ESCN
     JSR XGET
     BCS ESCN
     PHA
     SEC
     LDA CCOL
     SBC LFT
     STA BYTE
     SEC
     LDA #2
     SBC BYTE
     STA OFST
     LDA #$F0
     LSR OFST
     BCC *+4
     LDA #$0F
     STA BYTE
     LDX OFST
     AND NBUF,X
     STA NBUF,X
     PLA
     BIT BYTE
     BMI *+6
     ASL @
     ASL @
     ASL @
     ASL @
     ORA NBUF,X
     STA NBUF,X
     JSR DSPI
     JSR CRRT
     JMP ESCN
GS   LDA <BUFF
     STA DBUFA
     LDA >BUFF
     STA DBUFA+1
     JSR INPS
     JMP ESCN


*--- edit hex ------

EHEX EQU *
     LDA #0
     STA OFST
     LDX BYTN

EHL2 DEX
     BMI EHLP
     TXA
     PHA
     JSR CRRT
     JSR CRRT
     PLA
     TAX
     JMP EHL2

EHLP JSR DSPL
     LDA OFST
     LSR @
     STA BYTN

     LDA <LOWR-69
     STA SCRA
     LDA >LOWR-69
     STA SCRA+1
     LDA <BUFF
     STA BUFA
     LDA >BUFF
     STA BUFA+1
     JSR DISA

     JSR GETC
     CMP #$9B
     BNE JS
* jump over instr
JOI  LDA CODL
     BEQ EHLP
     JSR CRRT
     JSR CRRT
     DEC CODL
     BPL JOI  ; (JMP)

JS   JSR SPEC
     LDY OFST
     BCC EHLP
     JSR XGET
     BCS EHLP
     PHA
     LDX #$F0
     LDA OFST
     LSR @
     BCS *+4
     LDX #$0F
     STX BYTE
     TAX
     LDA BUFF,X
     AND BYTE
     STA BUFF,X
     PLA
     BIT BYTE
     BMI *+6
     ASL @
     ASL @
     ASL @
     ASL @
     ORA BUFF,X
     STA BUFF,X
     JSR CRRT
     JMP EHLP


*--- edit atascii --

EATA EQU *
     LDA #0
     STA ESC
     STA OFST
     LDX BYTN

EAL2 DEX
     BMI EALP
     TXA
     PHA
     JSR CRRT
     PLA
     TAX
     JMP EAL2

EALP JSR DSPL
     LDA OFST
     STA BYTN
     JSR GETC
     LDX ESC
     BNE STCH
     CMP #254
     BEQ DELC
     CMP #255
     BEQ INSC
     CMP #126
     BNE JSP
* back space
     JSR CRLT
     JMP EALP
* delete char
DELC EQU *
     LDX BYTN
     CPX SECL
     BCS EALP
DCLP EQU *
     LDA #0
     STA BUFF,X
     INX
     CPX SECL
     BCS DCEN
     LDA BUFF,X
     STA BUFF-1,X
     JMP DCLP
DCEN EQU *
     LDA FILE
     BEQ EALP
     DEC BUFF+127
     LDA BUFF+127
     AND     #127
     STA SECL
     JMP EALP
* insert char
INSC LDY BYTN
     CPY SECL
     BCS EALP
     LDA #0
INSL LDX BUFF,Y
     STA BUFF,Y
     TXA
     INY
     CPY SECL
     BNE INSL
     LDX FILE
     BEQ EALP
     CPY #125
     BCS EALP
     STA BUFF,Y
     INC SECL
     INC BUFF+127
     BNE EALP ; (JMP)
* spec characters
JSP  JSR SPEC
     BCC EALP
STCH LDX #0
     STX ESC
     BIT MODE
     BMI *+5
     JSR ATIN
     LDX OFST
     STA BUFF,X
     JSR CRRT
     JMP EALP


*--- edit mem ------

EMEM EQU *
     JSR SETL
     JSR GETC
     LDX #127
     CMP #$1D
     BEQ STO
     CMP #$1C
     BNE EMEM
FET  LDA MEM,X
     STA BUFF,X
     DEX
     BPL FET
     LDA NMEM
     STA NBUF
     LDA NMEM+1
     STA NBUF+1
     JSR DSPL
     JMP EMEM
STO  LDA BUFF,X
     STA MEM,X
     DEX
     BPL STO
     CLC
     LDA <LOWR
     STA SCRA
     LDA >LOWR
     STA SCRA+1
     LDY #29
     LDA NBUF
     STA NMEM
     JSR DSPB
     LDA NBUF+1
     STA NMEM+1
     JSR DSPD
     JMP EMEM


*--- edit old ------

EOLD EQU *
     JSR SETL
     JSR GETC
     CMP #$1C
     BNE EOLD
     LDX #127
RES  LDA OLD,X
     STA BUFF,X
     DEX
     BPL RES
     LDA NOLD
     STA NBUF
     LDA NOLD+1
     STA NBUF+1
     JSR DSPL
     JMP EOLD


*--- get character -

BLNK EQU *
     LDY #144
     INY
     BNE *-1
     DEC CNTR
     BNE GETC
     LDY #0
     LDA (CRAD),Y
     EOR #128
     STA (CRAD),Y
GETC EQU *
     LDA HISP
     BEQ TURT
     LDA #$04
     BIT $D20F
     BNE TURT
     LDX $D209
     CPX #$86
     BEQ HURR
     CPX #$87
     BEQ HURR
     CPX #$8F
     BNE TURT
* hurry !!!
HURR LDA $FB51,X
     RTS
CNTR DTA B($9B)
TURT LDX 764
     INX
     BEQ BLNK
     LDA 764
     CMP #33+64
     BEQ SUCC
     CMP #33+128
     BEQ PRED
ALIE AND #$3F
     CMP #39
     BEQ LOGO
     CMP #60
     BEQ CAPS
     LDX #$10
     JMP CIOV
LOGO LDA INVF
     EOR #128
     STA INVF
     JMP XXX
CAPS LDA SHFL
     EOR #64
     STA SHFL
XXX  JSR R764
     JSR DSCM
     JMP BLNK
* change window
SUCC JSR CROF
     LDX WNDW
     INX
     CPX #7
     BNE *+4
     LDX #0
     STX WNDW
     JSR WCHK
     BEQ SUCC+3
     BNE SETW ; (JMP)
PRED JSR CROF
     LDX WNDW
     DEX
     BPL *+4
     LDX #6
     STX WNDW
     JSR WCHK
SETW CLC
     AND #$0F
     ADC LFT
     STA LFT
     STA CCOL
     LDA TOP
     STA CROW
********************
     PLA
     PLA
     JSR CRON
R764 LDA #255
     STA 764
     JMP CLIK


*--- window check --

WCHK LDA WNDW
     ASL @
     ASL @
     ADC WNDW ; (*5)
     ADC #4
     TAX
     LDY #4
SL   LDA FRDF,X
     STA LFT,Y
     DEX
     DEY
     BPL SL
     LDA FLGS
     RTS


*--- hex digit -----

XGET EQU *
     CMP #'0'
     BMI XERT
     CMP #'9'+1
     BMI DECD
     CMP #'A'
     BMI XERT
     CMP #'F'+1
     BMI UX
     CMP #'a'
     BMI XERT
     CMP #'f'+1
     BPL XERT
     SBC #32
UX   SBC #6
DECD SEC
     SBC #'0'
     CLC
     RTS
XERT SEC
     RTS


*--- screen control

SPEC EQU *
     CMP #$1B
     BEQ ESCF
     CMP #$1C
     BMI NOSP
     CMP #$1F+1
     BMI CRSR
NOSP SEC
     RTS
ESCF LDA #128
     STA ESC
     CLC
     RTS
CRSR AND #3
     ROR @
     ROR @
     BCS HOR
* vertical move
     BMI D
     JSR CRUP
     JMP SPOK
D    JSR CRDN
     JMP SPOK
* horizontal move
HOR  BMI R
     JSR CRLT
     JMP SPOK
R    JSR CRRT
SPOK CLC
     RTS


*--- cursor off ----

CROF LDY #0
     LDA CHAR
     STA (CRAD),Y
     RTS


*--- cursor on -----

CRON EQU *
* compute address
     CLC
     LDA <SCRN
     ADC CCOL
     STA CRAD
     LDA >SCRN
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
CO   LDY #0
     LDA (CRAD),Y
     STA CHAR
     RTS


*--- cursor left ---

CRLT JSR CROF
     LDA CCOL
     CMP LFT
     BEQ CU
     DEC CCOL
     DEC OFST
     LDA FLGS
     BPL CLRT
* blank ?
     LDA OFST
     LSR @
     BCC CLRT
     DEC CCOL
CLRT JMP CRON
CU   JSR CRRT
     LDA CCOL
     CMP RGT
     BNE CU
     JMP CRUP


*--- cursor right --

CRRT JSR CROF
     LDA CCOL
     CMP RGT
     BEQ CD
     INC CCOL
     INC OFST
     LDA FLGS
     BPL CRRE
* blank ?
     LDA OFST
     LSR @
     BCS CRRE
     INC CCOL
CRRE JMP CRON
CD   JSR CRLT
     LDA CCOL
     CMP LFT
     BNE CD
     JMP CRDN


*--- cursor up -----

CRUP JSR CROF
     LDA TOP
     CMP BOT
     BEQ CURT
     CMP CROW
     BEQ CUWR
     DEC CROW
     SEC
     LDA OFST
     SBC #8
     BIT FLGS
     BPL *+4
     SBC #8
     STA OFST
CURT JMP CRON
CUWR JSR CRDN
     LDA CROW
     CMP BOT
     BNE CUWR
     BEQ CURT


*--- cursor down ---

CRDN JSR CROF
     LDA BOT
     CMP TOP
     BEQ CDRT
     CMP CROW
     BEQ CDWR
     INC CROW
     CLC
     LDA OFST
     ADC #8
     BIT FLGS
     BPL *+4
     ADC #8
     STA OFST
CDRT JMP CRON
CDWR JSR CRUP
     LDA CROW
     CMP TOP
     BNE CDWR
     BEQ CDRT


*--- I/O & status --

SSIO EQU *
     STA DSTAT
     LDA #128
     STA $11
     JSR SIOV
STAT LDA <LOWR
     STA SCRA
     LDA >LOWR
     STA SCRA+1
     LDY #10
     LDA DSTAT
     JSR DSPB
     LDY DSTAT
     BPL SIOR
* bell
     LDX #$AF
     LDY #$0F
     LDA #BFRQ
     STA $D200
BL   STX $D201
     LDA 20
     DEC 20
     DEC 20
     CMP 20
     BNE *-2
     DEX
     DEY
     BPL BL
     LDY DSTAT
SIOR RTS


*--- input ---------

INPS EQU *
     LDA #$FE
     STA NUMB
     LDA <XX-40
     STA SCRA
     LDA >XX-40
     STA SCRA+1
     LDA DRVN
     STA DUNIT
     LDA NBUF
     STA DAUX1
     LDA NBUF+1
     STA DAUX2
     LDA #'R'
     STA DCMMD
     LDA #0
     STA BYTN
     STA SECP
     LDA #$40
     JSR SSIO
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


*--- disp H/A window

DSPL EQU *
     LDA #0
     STA NUMB
     LDA <XX-40
     STA SCRA
     LDA >XX-40
     STA SCRA+1
DSL1 LDY NUMB
     LDA BUFF,Y
     STA BYTE
     JSR DIBY
     BNE DSL1
*    ...

*--- disp info -----

DSPI EQU *
     LDA <LOWR
     STA SCRA
     LDA >LOWR
     STA SCRA+1
* file # display
     LDY #20
     LDA BUFF+125
     LSR @
     LSR @
     JSR DSPB
     LDA <UPPR
     STA SCRA
     LDA >UPPR
     STA SCRA+1
* sect len display
     LDY #38
     LDA BUFF+127
     AND #$7F
     JSR DSPB
* sect link display
     LDY #27
     LDA BUFF+126
     STA NLNK
     JSR DSPB
     LDA BUFF+125
     AND #$03
     STA NLNK+1
     JSR DSPD
* sect # display
     LDY #17
     LDA NBUF
     JSR DSPB
     LDA NBUF+1
     JMP DSPD


*--- output --------

OUTS EQU *
* save old sector
     LDA <OLD
     STA DBUFA
     LDA >OLD
     STA DBUFA+1
     JSR INPS
     LDY DSTAT
     BPL *+3
     RTS
     LDA NBUF
     STA NOLD
     LDA NBUF+1
     STA NOLD+1
     CLC
     LDA <LOWR
     STA SCRA
     LDA >LOWR
     STA SCRA+1
     LDY #38
     LDA NOLD
     JSR DSPB
     LDA NOLD+1
     JSR DSPD
* write new sector
     LDA <BUFF
     STA DBUFA
     LDA >BUFF
     STA DBUFA+1
     LDA #'W'
     STA DCMMD
     LDA #$80
     JMP SSIO


*--- incr line addr

INLN LDA #40
ADSC CLC
     ADC SCRA
     STA SCRA
     BCC *+4
     INC SCRA+1
     RTS


*--- chg char mode -

CHMD LDA MODE
     EOR #$FF
     STA MODE
* dspl char mode
DSCM LDA #'a'
     BIT MODE
     BMI *+4
     LDA #'i'
     EOR SHFL
     ORA INVF
     STA UPPR+115
     RTS


*--- ATASCII to int.

ATIN ASL @
     PHP
     LSR @
     CMP #96
     BPL DONE
     SBC #31
     BPL DONE
     ADC #96
DONE PLP
     BCC *+4
     ORA #128
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


*--- frame def -----

FRDF EQU *
* menu window
     DTA B(02)
     DTA B(04)
     DTA B(01)
     DTA B(01)
     DTA B(16)
* sector# window I
     DTA B(07)
     DTA B(17)
     DTA B(01)
     DTA B(01)
     DTA B(16)
* sector# window II
     DTA B(07)
     DTA B(17)
     DTA B(01)
     DTA B(01)
     DTA B(24)
* hex window
     DTA B(04)
     DTA B(26)
     DTA B(05)
     DTA B(20)
     DTA B(144)
* atascii window
     DTA B(31)
     DTA B(38)
     DTA B(05)
     DTA B(20)
     DTA B(16)
* memory window
     DTA B(23)
     DTA B(29)
     DTA B(24)
     DTA B(24)
     DTA B(16)
* old save window
     DTA B(32)
     DTA B(38)
     DTA B(24)
     DTA B(24)
     DTA B(16)


     END
