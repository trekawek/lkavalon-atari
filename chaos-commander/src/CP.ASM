
*******************
*Command Processor*
*******************
*---Spring-1988---*
* 1.0    18.03.88 *
* 1.1    21.03.88 *
* 1.2    23.03.88 *
* 1.3    24.03.88 *
* 1.4    25.03.88 *
* 1.5    26.03.88 *
* 1.6    28.03.88 *
* 1.7    29.03.88 *
* 1.8    21.04.88 *
* 1.9    24.04.88 *
* 2.0    18.05.88 *
* 2.1    19.05.88 *
* 2.2    30.05.88 *
* 2.3     1.06.88 *
* 2.4     2.06.88 *
*---Summer-1988---*
* 2.5    21.06.88 *
* 2.6    03.08.88 *
*---Autumn-1988---*
* 3.01    9.11.88 *
* 3.02   14.11.88 *
* 3.03   14.11.88 *
* 3.04   17.11.88 *
* 3.05    8.12.88 *
*---Winter-1989---*
* 3.07   25.01.89 *
* 3.08   28.01.89 *
*******************

*- system ---------

DOSI EQU $C
DOSV EQU $A
KEYD EQU $2D9
KEYR EQU $2DA
EDIT EQU $340
IOCB EQU $350
CIOV EQU $E456
BELL EQU $F556
POKE EQU $D200
SKST EQU $D20F
MEMT EQU $2E5
MEML EQU $2E7
BASC EQU 202
BASF EQU 1016
WARM EQU $E474
WARF EQU $8
PORT EQU $D301
BOOT EQU 9
RUN  EQU $2E0
PINT EQU $206

BLEN EQU 38

*-------------------

     ORG $480
     LDA #$A0
     STA 106
     JMP STRT

*-------------------

     ORG $2E0
     DTA A(STRT)

*-------------------

     ORG $8000

STRT EQU *

*- correct DOS -----

     LDX #$FE
     STX $15CB
     STX $15EE
     LDA #0
     STA $15D0
     INX
     STX $15F3
     LDA #$EA
     STA $15EF
     STA $15F4
     LDA #$C5
     STA $15ED
     STA $15F2

*-------------------

     LDA <$E450
     STA RUN
     LDA >$E450
     STA RUN+1

*- set RESET vectors

     LDA DOSI
     STA DOSS
     LDA DOSI+1
     STA DOSS+1

*    LDA MEML
*    STA DOSI
*    LDA MEML+1
*    STA DOSI+1

     CLC
     LDA MEML
     ADC <LEN
     STA MEMA
     STA MEMM
     LDA MEML+1
     ADC >LEN
     STA MEMA+1
     STA MEMM+1

     CLC
     LDA MEML
     ADC <DOSO
     STA DOSA
     STA DOOS
     LDA MEML+1
     ADC >DOSO
     STA DOSA+1
     STA DOOS+1

     CLC
     LDA MEML
     ADC <BRKO
     STA BRRK
     STA BRKK
     STA PINT
     LDA MEML+1
     ADC >BRKO
     STA BRRK+1
     STA BRKK+1
     STA PINT+1

*-------------------

     STA BASC

     LDX #8
     LDA #0
SILP STA POKE,X
     DEX
     BPL SILP

     LDA #3
     STA SKST

     JSR CLOSE

     LDX <TITLE
     LDY >TITLE
     LDA #71
     JSR PUTL

     LDA #20
     STA KEYD
     LDA #3
     STA KEYR

*-------------------

*    JSR RELO

*    LDA MEMM
*    STA MEML
*    LDA MEMM+1
*    STA MEML+1
*
*    LDA DOOS
*    STA DOSV
*    LDA DOOS+1
*    STA DOSV+1

*    JMP (DOSV)

     JMP DOS

MEMM DTA A(0)
DOOS DTA A(0)
BRRK DTA A(0)

*- title text ------

TITLE EQU *

   DTA A($9B7D)
   DTA C'   DOS 2.5'
   DTA C' Command P'
   DTA C'rocessor 3'
   DTA C'.08'
   DTA B($9B)
   DTA C'  (c) CHAO'
   DTA C'S software'
   DTA C'. Winter 1'
   DTA C'989.'
   DTA B($9B)

*- RESET service ---

RESS EQU *

     JSR IDOS

SET  EQU *

     LDA DOSA
     STA DOSV
     LDA DOSA+1
     STA DOSV+1

     LDA MEMA
     STA MEML
     LDA MEMA+1
     STA MEML+1

     LDA BRKK
     STA PINT
     LDA BRKK+1
     STA PINT+1

     LDA #$14
     STA KEYD
     LDA #3
     STA KEYR

     RTS

IDOS JMP (DOSS)

BRKO EQU *-RESS

*- clear interr mask

BRKR CLI
     CLD

*- BRK routine -----

     PLA
     PLA
*-------------------
     SEC
     PLA
     SBC #2
     STA TMP
     PLA
     SBC #0
     STA TMP+1
*-------------------
     LDY #26
     LDA TMP
     JSR DSPB
     LDA TMP+1
     JSR DSPB

     LDX BRKT
     LDY BRKT+1
     LDA #12
     JSR PUTL

*-------------------

DOSO EQU *-RESS

DOS  CLI
     CLD

*- reset stack -----

     LDX #$FF
     TXS

*- BOOT? <> 0 ------

     LDA BOOT
     BNE *+4
     INC BOOT

*- main loop -------

MAIN EQU *

     JSR DSPP
     JSR GETR
     BMI MAIN

*- execute command -

EXEC EQU *

     LDA LINE_+3
     CMP #$9B
     BEQ EXX
     CMP #' '
     BNE LOAD
*- keyword search --
EXX  EQU *
     LDA #6
     STA KEYN
SRLP LDA KEYN
     ASL @
     ADC KEYN
     ADC #2
     TAX
     LDY #2
CCMP LDA LINE_,Y
     CMP KEYW,X
     BNE SFIL
     DEX
     DEY
     BPL CCMP
     BMI FND
SFIL DEC KEYN
     BPL SRLP
     BMI LOAD
* keyword recognized
FND  LDA KEYN
     ASL @
     TAX
     LDA KTAB,X
     STA CADR
     LDA KTAB+1,X
     STA CADR+1
     JSR CALL
JMAI JMP MAIN

*-------------------

CALL JMP (CADR)

*- load command file

LOAD EQU *

     LDX #0
SF   LDA LINE_,X
     CMP #$9B
     BEQ ADEX
     CMP #'.'
     BEQ EXAD
     INX
     BNE SF
*-------------------
ADEX CPX #BLEN-4
     BCS JMAI
* add .COM extension
     LDY #4
ADEL LDA COM,Y
     STA LINE_,X
     INX
     DEY
     BPL ADEL
*-------------------
EXAD LDX FLIN
     LDY FLIN+1
     JSR PUTF
*- clear BASIC -----
     STX BASC
*- call binary LOAD
     JSR $15A6
     LDA IOCB+3
     BPL JMAI
*- file not found ?
     LDA #0
     STA BASC
EDLO JSR ERROR
     JMP MAIN
*-------------------

*- put fnam to IOCB

PUTF EQU *

     STX IOCB+4
     STY IOCB+5
     LDX #$10
RRTS RTS

*- display prompt --

DSPP EQU *

     LDA #$80
     STA $11
     LDA #4
NEWL LDX PROM
     LDY PROM+1
     JMP PUTL

*- RUN at address --

RUNA JMP (RUN)

RUNAD EQU *

     LDA LINE_+3
     CMP #$9B
     BEQ RUNA
     JSR COPY
     LDA #0
     JSR BIDC
     INX
GADR LDA LINE_,X
     CMP #$9B
     BEQ GO
     CMP #'0'
     BCC RRTS
     CMP #'9'
     BCC DECD
     CMP #'A'
     BCC RRTS
     CMP #'F'
     BCS RRTS
     SBC #6
DECD SEC
     SBC #'0'
     LDY #3
MULT ASL TMP
     ROL TMP+1
     DEY
     BPL MULT
     ORA TMP
     STA TMP
     INX
     CPX #4
     BNE GADR
GO   JMP (TMP)

*- REName ----------

RENAME EQU *

     JSR COPY
*-------------------
     LDX #0
SWIL LDA LINE_,X
     CMP #'*'
     BEQ CREN
     CMP #'?'
     BEQ CREN
     CMP #$9B
     BEQ NORM
     INX
     BNE SWIL
*-------------------
NORM LDX #2
CDEV LDA FLIN_,X
     STA RFIL_,X
     DEX
     BPL CDEV
*-------------------
     LDX #0
CSRC LDA LINE_,X
     CMP #','
     BEQ CFND
     CMP #$9B
     BEQ CREN
     INX
     BNE CSRC
*-------------------
CFND LDY #0
CTRB LDA LINE_+1,X
     STA RBUF,Y
     CMP #$9B
     BEQ TOPE
     INX
     INY
     CPY #13
     BNE CTRB
*-------------------
TOPE LDX RFIL
     LDY RFIL+1
     JSR PUTF
     JSR ERA
     BPL CREN
*-------------------
     CPY #170
     BEQ CREN
     JMP ERROR
*-------------------
CREN JSR SETF
     LDA #$20
     STA IOCB+2
     JMP CCIO

*- Basic OFf -------

BOF  EQU *

     LDA #255
     STA BASF
     STA PORT
     BNE RRES

*- to CARtrige -----

CAR  EQU *

     LDX BASF
     BNE BON
     DEX
     STX WARF
     JMP ($BFFA)
*- Basic on --------
BON  LDA #0
     STA BASF
     LDA #$FD
     STA PORT
RRES JMP WARM

*- ERAse -----------

ERASE EQU *

     JSR COPY
     JSR SETF
     JSR ERA
     BPL SETF
     JMP ERROR

ERA  LDA #$21
     STA IOCB+2
     JMP CIOV

*-------------------

SETF LDX FLIN
     LDY FLIN+1
     JMP PUTF

*- directory -------

DIR EQU *

     LDA #1
     JSR NEWL
     LDA LINE_+3
     CMP #$9B
     BEQ SDEF
     JSR COPY
     BEQ USET
*-------------------
SDEF LDX #3
DEFL LDA DEFA,X
     STA LINE_,X
     DEX
     BPL DEFL
*-------------------
USET LDX FLIN
     LDY FLIN+1
     JSR PUTF
     LDA #3
     STA IOCB+2
     LDA #7
     STA IOCB+10
     JSR CIOV
     BMI ERROR
*-------------------
DIRL LDX LINE
     LDY LINE+1
     JSR PUTT
     JSR PUTF
     LDA <20
     STA IOCB+8
     STA EDIT+8
     LDA >20
     STA IOCB+9
*-------------------
     LDA #5
     STA IOCB+2
     JSR CIOV
     BMI EOFD
*-------------------
     LDA #9
     STA EDIT+2
     LDX #0
     JSR CIOV
     BMI CLOSE
     BPL DIRL
*- end of dir ? ----
EOFD CPY #136
     BNE ERROR

*- call DOS close --
CLOSE EQU *

     JMP $1992

*- call CIO --------

CCIO EQU *

     JSR CIOV
     BPL RTS

*--- error ---------

ERROR EQU *

     LDA IOCB+3
     JSR BIDC
     LDY #40
     LDA TMP
     JSR DSPB
     LDA TMP+1
     JSR DSPD
     JSR CLOSE
*- disp error mess -
     LDX ERRL
     LDY ERRL+1
     LDA #11
     JMP PUTL

*- move fnam in buff

COPY EQU *

     LDX #3
SKLP INX
     LDA LINE_,X
     CMP #' '
     BEQ SKLP
     LDY #0
COPL LDA LINE_,X
     STA LINE_,Y
     CMP #$9B
     BNE *+3
RTS  RTS
     INX
     INY
     BNE COPL

*- print MEMLO -----

MEM  EQU *

     LDY #14
     LDX #0
PMLP LDA MEMT,X
     JSR DSPB
     INX
     CPX #2
     BNE *+4
     LDY #6
     CPX #4
     BNE PMLP
*-------------------
     LDX MTXT
     LDY MTXT+1
     LDA #16
     JMP PUTL

*- put txt adr -----

PUTT STX EDIT+4
     STY EDIT+5
     RTS

*- bin to bcd ------

BIDC STA TMP+2
     LDA #0
     STA TMP
     STA TMP+1
     LDX #7
     SED
CVLP ASL TMP+2
     LDA TMP
     ADC TMP
     STA TMP
     ROL TMP+1
     DEX
     BPL CVLP
     CLD
ABRT RTS

*--- disp byte -----

DSPB PHA
     AND #$F
     JSR DSPD
     PLA
     LSR @
     LSR @
     LSR @
     LSR @
DSPD ORA #$30
     CMP #$3A
     BCC XDOK
     ADC #6
XDOK STA MTXT_,Y
     DEY
     RTS

*- display line ----

PUTL JSR PUTT
     STA EDIT+8
     LDA #11
     STA EDIT+2
     LDX #0
     STX EDIT+9
     JMP CIOV

*- get respose -----

GETR LDA #5
     STA EDIT+2
     LDX LINE
     LDY LINE+1
     JSR PUTT
     LDA #BLEN
     STA EDIT+8
     LDX #0
     JSR CIOV
     BMI RGOT
*- new device ------
     LDA EDIT+8
     CMP #4
     BCC CRFN
     LDA LINE_+2
     CMP #':'
     BNE CRFN
     LDX #0
MBAC LDA LINE_,X
     STA FLIN_,X
     CMP #$9B
     BEQ CRFN
     INX
     BPL MBAC
*-------------------
CRFN LDA LINE_
     CMP #$9B
     BEQ RGOT
     TYA
RGOT TAY
BRK  RTS

     BRK

*-------------------

MTXT DTA A(MTXT_)
ERRL DTA A(ERRL_)
PROM DTA A(PROM_)
FLIN DTA A(FLIN_)
LINE DTA A(LINE_)
RFIL DTA A(RFIL_)
BRKT DTA A(BRKT_)

*-------------------

KTAB EQU *

     DTA A(DIR)
     DTA A(RENAME)
     DTA A(ERASE)
     DTA A(CAR)
     DTA A(MEM)
     DTA A(RUNAD)
     DTA A(BOF)

*-------------------

EPOS DTA B(0)
KEYN DTA B(0)
TMP  DTA D'123'
DOSS DTA A(0)
MEMA DTA A(0)
DOSA DTA A(0)
CADR DTA A(0)
BRKK DTA A(0)

*- keywords --------

KEYW EQU *

     DTA C'DIR'
     DTA C'REN'
     DTA C'ERA'
     DTA C'CAR'
     DTA C'MEM'
     DTA C'RUN'
     DTA C'BOF'

*-------------------

MTXT_ EQU *

     DTA C'Lo=.... '
     DTA C'Hi=....'
     DTA B($9B)

BRKT_ EQU *

     DTA C'BRK at '
     DTA C'....'

*-------------------

COM  DTA B($9B)
     DTA C'MOC.'

*- error massage ---

ERRL_ EQU *

     DTA C'Error '
     DTA C'...'
     DTA B($FD)
     DTA B($9B)

*- buffers ---------

RFIL_ EQU *

     DTA C'D1:'
RBUF DTA C'FILENAME'
     DTA C'.EXT '

DEFA EQU *

     DTA C'*.*'

PROM_ EQU *

     DTA B($9B)

FLIN_ EQU *

     DTA C'D1:'

LINE_ EQU *

     ORG LINE_+38

LEN EQU *-RESS

*------------------*
*                  *
*  Relocator 0.1   *
*                  *
*                  *
*     88-05-29     *
*     88-05-31     *
*                  *
*------------------*

*--- page 0 --------

BYTE__ EQU $CE
DATF__ EQU $CF
DIST__ EQU $D0
SRCE__ EQU $D2
DEST__ EQU $D4
ADDR__ EQU $D6


*--- system --------

MELO__ EQU $2E7

*--- move ----------

STAR__ EQU RESS

RELO   EQU *

MOVE__ EQU *
* disable RUN comm
     LDA #$60
     STA MOVE__
* clear data flag
     LDA #0
     STA DATF__
* source address
* given as  STAR__
* --------------
     LDA <STAR__
     STA SRCE__
     LDA >STAR__
     STA SRCE__+1
* destination
     LDA MELO__
     STA DEST__
     LDA MELO__+1
     STA DEST__+1
* distance
     SEC
     LDA SRCE__
     SBC DEST__
     STA DIST__
     LDA SRCE__+1
     SBC DEST__+1
     STA DIST__+1
*** move process ***
     LDY #0
     BEQ MOVL__
SEDA__ SEC
     ROR DATF__
MOVL__ EQU *
     LDA SRCE__
     CMP <MOVE__
     LDA SRCE__+1
     SBC >MOVE__
     BCC DCHK__
* done !
     RTS
* data flag check
DCHK__ BIT DATF__
     BVS MOV1__
     BMI TPE3__
INST__ EQU *
     LDA (SRCE__),Y
     STA BYTE__
     STA (DEST__),Y
     JSR INCA__
     TAX
     BEQ SEDA__
* instr type check
     CMP #$20
     BEQ TPE3__
     CMP #$40
     BEQ MOVL__
     CMP #$60
     BEQ MOVL__
     AND #$0D
     CMP #$08
     BEQ MOVL__
     BCC MOV1__
     TXA
     AND #$1F
     CMP #$09
     BEQ MOV1__
* 3-byte instruction
TPE3__ EQU *
     LDA (SRCE__),Y
     INY
     CMP <STAR__
     LDA (SRCE__),Y
     DEY
     SBC >STAR__
     BCC MOV2__
     LDA (SRCE__),Y
     INY
     CMP <MOVE__
     LDA (SRCE__),Y
     DEY
     SBC >MOVE__
     BCS MOV2__
* alter abs adresses
     LDA DIST__
     LDX DIST__+1
     BCC MOVA__
* move w/o changes
MOV2__ BIT DATF__
     BMI SEDA__
     LDA #0
     TAX
* move 2b address
MOVA__ EQU *
     STA ADDR__
     STX ADDR__+1
     SEC
     LDA (SRCE__),Y
     SBC ADDR__
     STA (DEST__),Y
     JSR INCA__
     LDA (SRCE__),Y
     SBC ADDR__+1
     STA (DEST__),Y
     JSR INCA__
     JMP MOVL__
* move 1b data
MOV1__ EQU *
     LDA (SRCE__),Y
     STA (DEST__),Y
     JSR INCA__
     JMP MOVL__


*--- inc SRCE,DEST -

INCA__ INC SRCE__
     BNE *+4
     INC SRCE__+1
     INC DEST__
     BNE *+4
     INC DEST__+1
     RTS

     END
