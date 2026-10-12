********************
*                  *
* CHAOS commander  *
*                  *
* v.2.1   19.12.88 *
* v.2.2   27.01.89 *
*                  *
********************



CH   EQU $2FC
MELO__ EQU $2E7 ; DOS memory limit; missing from archived source
IOCB EQU $340
CIOV EQU $E456
CROW EQU $54
CCOL EQU $55
CADR EQU $5E
RMAR EQU $53

*-------------------

EESS EQU $CF

SCRA EQU $D0
TMP EQU $D2
BYTE EQU $D5
DIRP EQU $D7
MARG EQU $D9
LEN EQU $DA
ERED EQU $DB
MUM EQU $DC

********************

     ORG $480
     JMP BEGN

********************

     ORG $7F00

********************
ST____ EQU *

     LDX #0
     LDA <TXT
     STA IOCB+4
     LDA >TXT
     STA IOCB+5
     LDA <20
     STA IOCB+8
     LDA >20
     STA IOCB+9
     LDA #9
     STA IOCB+2
     JMP CIOV

*-------------------
TXT  EQU *
     DTA C'Chaos Co'
     DTA C'mmander '
     DTA C'2.2T'
     DTA B($9B)

********************

     ORG $8000

STAR EQU *

     LDA $C
     STA DOSIL
     LDA $D
     STA DOSIL+1

     CLC
     LDA MELO__
     ADC <PLEN
     STA NMEM
     LDA MELO__+1
     ADC >PLEN
     STA NMEM+1

*-------------------

RESET EQU *

     JSR BUBU
     LDA QQD
     BNE BUBU-1

BEGN EQU *

*- find E in HATAB
     LDX #30
SLOP LDA $31A,X
     CMP #'E'
     BEQ FNDE
     DEX
     DEX
     DEX
     BNE SLOP
     RTS
*-------------------
BUBU JMP (DOSIL)

*- change han table
FNDE EQU *

     STX EPOS

     LDA $31A+1,X
     STA TMP
     STA EADR
     LDA $31A+2,X
     STA TMP+1
     STA EADR+1
     LDY #15
COPL LDA (TMP),Y
     STA NEWTB,Y
     DEY
     BPL COPL

     INY
     STY TRANF
     STY FRFL

     LDA NEWTB+4
     STA OLDGT
     LDA GETA
     STA NEWTB+4
     LDA NEWTB+5
     STA OLDGT+1
     LDA GETA+1
     STA NEWTB+5

     LDA NEWTBA
     STA $31A+1,X
     LDA NEWTBA+1
     STA $31A+2,X

     LDA NMEM
     STA MELO__
     LDA NMEM+1
     STA MELO__+1
     RTS

*- hide myself -----
BREK EQU *
     LDA #128
     BNE *+4
     LDA #136
     STA ERED
     PLA
     PLA
     JSR REZIO
     JMP FLEOL

HIDE EQU *

     LDY #1
     STY HIDF
     DEY
     STY FRFL

     JSR FLAP
     JMP NOLOAD

OGTJ LDA OLDGT+1
     PHA
     LDA OLDGT
     PHA
     RTS

*- put some commands
PUT  EQU *

     LDA NEWTB+7
     PHA
     LDA NEWTB+6
     PHA
     TXA
RTS  RTS

*- get routine

GET  EQU *
*- am I living ?
     LDA HIDF
     BEQ VISB
*-------------------

     LDA TRANF
     BNE TRBT
QQ__ JSR OGTJ
*-------------------
     CMP #$9B
     BNE RTS

     LDX $D209
     CPX #$4C
     BNE RTS

*- resurrection ----
     LDX #0
     STX HIDF
     RTS

*- store get call --

VISB LDA FIRF
     BNE CHGR

     LDA IOCB+4
     STA IOCO
     LDA IOCB+5
     STA IOCO+1
     INC FIRF

*-- check get route

CHGR EQU *
     LDA IOCB+4
     CMP IOCO
     BNE OGTJ
     LDA IOCB+5
     CMP IOCO+1
     BNE OGTJ

     LDA IOCB+2
     CMP #5
     BNE OGTJ

* check transmission
     LDA TRANF
     BEQ NOTR

TRBT DEC TMP+2
     BPL PUEU

     LDA #0
     STA TRANF

     LDA HIDF
     BNE QQ__


* flap & send EOLN

FLEOL EQU *
     JSR FLAP
     LDX #$9B
     JSR PUT
     LDA #$9B
     LDY #0
     STY TRANF
     LDY ERED
     RTS

*- send data
PUEU EQU *
     LDY TMP+1
     INC TMP+1
     LDA (SCRA),Y
     JSR INAT
     LDY #1
     RTS

*- cursor position
NOTR EQU *

     LDA CROW
     CMP #12
     BCS BPAN
*- insert line -----
     LDX #$9D
     JSR PUT
     INC CROW
     BNE NOTR
* cursor below panel
BPAN EQU *
     LDA CROW
     CMP #23
     BNE CPOS
*-------------------
     LDX #$9B
     JSR PUT
     LDX #$1C
     JSR PUT
* correct cursor pos
CPOS EQU *
     LDA #0
     STA TRANF
*-------------------
     LDX #15
     LDA $20,X
     STA STZI,X
     DEX
     BPL *-6
*-------------------
     JSR FLIP
     LDA FRFL
     BNE NORD
*- read first dir --
     LDA #$BA
     STA CH
*-------------------
     INC FRFL
     BNE NORD+3
*-------------------
NORD EQU *
     JSR PRINT
     LDY CROW
     LDX 82
     JSR SPOS
*- copy prompt -----
     LDX 82
     LDY #2
CPP  LDA (SCRA),Y
     AND #$3F
     JSR INAT
     STA PROMPT,Y
     INX
     DEY
     BPL CPP
     STX MARG
*-------------------
     LDA CCOL
     CMP 82
     BNE EDIT
     INC CCOL
     INC CCOL
     LDX #$1F
     JSR PUT
     JMP EDIT

*- rest 0 IOCB -----
REZIO EQU *
     LDX #15
     LDA STZI,X
     STA $20,X
     DEX
     BPL REZIO+2
     RTS

*-------------------
SHDL EQU *

     LDA RMAR
     STA CCOL
SDL  LDA CCOL
     CMP MARG
     BNE *+3
     RTS
     JSR DELP
     JMP SDL

*- edit line -------

EDIT EQU *
*-- Edit -----------
     JSR GETK
*-------------------
     CMP #$FF
     BNE *+5
     JSR BREK
*-------------------
     LDX #22
SK   CMP KTAB,X
     BEQ FNDK
     DEX
     BPL SK
*-------------------
     TAX
     LDA $FB51,X
*-------------------
NOEX TAX
     BMI EDIT
     CMP #'a'
     BCC *+4
     SBC #$20
     CMP #' '
     BCC EDIT
*-------------------
     LDX CCOL
     CPX RMAR
     BEQ EDIT
*-------------------
     TAX
     JSR PUT
     BNE EDIT
*-------------------
FNDK EQU *

     CPX #6
     BCC EDFN
EDFN TXA
     ASL @
     TAX
     LDA PRTAB,X
     STA JUMP
     LDA PRTAB+1,X
     STA JUMP+1
*-------------------
NOSTS EQU *
     JSR JMP
*-------------------
     JMP EDIT

JMP  JMP (JUMP)

*-------------------

DELP EQU *

     LDA CCOL
     CMP MARG
     BNE *+3
     RTS
     LDX #$7E
     JMP PUT

*-------------------

CRET EQU *

     LDX #0

     LDA DSTAT
     BEQ NOL
     BMI NOL

*- fnam to screen
     LDY CROW
     JSR SPOS
     LDY CCOL
     LDX #0
CPFN LDA HLPB,X
     CMP #$9B
     BEQ NOL
     CPY RMAR
     BEQ NOL
     STX TMP
     STY TMP+1
     TAX
     JSR PUT
     LDX TMP
     LDY TMP+1
     INY
     INX
     CPX #12
     BNE CPFN
NOL  RTS

*-------------------
EDRT EQU *

     JSR SLEN
     BNE NOLOAD
     JSR CRET
     TXA
     BEQ NOLOAD
     LDA #0
     STA FRFL
*-------------------
NOLOAD EQU *
     LDY #0
     STY TMP+1
     INY
     STY ERED
     JSR SLEN
     STY TMP+2
     INY
     STY TRANF
     PLA
     PLA
     JSR REZIO
     JMP TRBT

*- set line length
SLEN EQU *

     LDX MARG
     LDY CROW
     JSR SPOS
     SEC
     LDA RMAR
     SBC MARG
     TAY
     DEY
SLL  LDA (SCRA),Y
     AND #$7F
     BNE XCPB
     DEY
     BPL SLL
XCPB INY
     RTS

*-------------------
CRT  EQU *

     LDA CCOL
     CMP RMAR
     BEQ RMM
     LDX #$1F
     JMP PUT

*-------------------
CLFT EQU *

     LDA CCOL
     CMP MARG
     BEQ RMM
     LDX #$1E
     JMP PUT

*-------------------
DEL  EQU *

     LDX #$FE
     JMP PUT

*-------------------

INS  EQU *

     SEC
     LDA RMAR
     SBC CCOL
     BEQ RMM
     TAY
     DEY
     LDA #0
     STA (CADR),Y
     LDX #$FF
     JMP PUT

*-------------------
CLTM EQU *
     LDX #7
     LDA #0
     STA TAGM,X
     DEX
     BPL *-4
RMM  RTS

*- quit CCOM -------

QUIT JSR SURE
     BEQ *+5
     JMP PRINT
*- check MEMLO -----
     LDA MELO__
     CMP NMEM
     BNE NOTL
     LDA MELO__+1
     CMP NMEM+1
     BNE NOTL
*- relase memory ---
     SEC
     LDA MELO__
     SBC <PLEN
     STA MELO__
     LDA MELO__+1
     SBC >PLEN
     STA MELO__+1
*- restore DOSINI --
     LDA DOSIL
     STA $C
     LDA DOSIL+1
     STA $D
*- restore H table -
RESH LDX EPOS
     LDA EADR
     STA $31A+1,X
     LDA EADR+1
     STA $31A+2,X
*- BYE -------------
     JMP HIDE
*- not last --------
NOTL LDA #1
     STA QQD
     BNE RESH

*-- read directory -

REDIR EQU *
     JSR FLWE
     JSR WAIT
     JSR SUBARU
     STA DLEN
*-------------------
     JSR CLTM
*-------------------
     STX DSTAT
*-------------------
*- read directory --
     JSR SDEF
*-------------------
     LDA #6
     JSR OPEN
     BMI DERR
*-------------------
     CLC
     LDA IOCB+$14
     ADC #3
     STA IOCB+$14
     BCC *+5
     INC IOCB+$15
*-------------------
DIRL LDX #$10
     LDA <20
     STA IOCB+8,X
     LDA >20
     STA IOCB+9,X
     LDA #5
     STA IOCB+2,X
     JSR CIOV
     BMI EOFD
*-------------------
     LDX DLEN
     INC DLEN
     INC DSTAT
     JSR SDIRP
*-------------------
     LDY #13
     LDX #16
COPE LDA HLPB,X
     STA (DIRP),Y
     CPX #14
     BNE *+3
     DEX
     DEX
     DEY
     BPL COPE
     BMI DIRL
*-------------------
EOFD EQU *
     CPY #136
     BNE DERR
     JSR CLOSE
     LDX #3
CFRE LDA HLPB,X
     JSR ATIN
     ORA #$80
     STA FRE,X
     DEX
     BPL CFRE
     DEC DLEN
     BEQ *+5
     DEC DLEN
     JSR SORT
     JMP PRINT
*-------------------
DERR LDA #0
     STA DLEN
     LDA #$FF
     STA DSTAT
     LDA #$9B
     STA HLPB
     JSR ERROR
     JMP PRINT

*- sort directory --

SORT EQU *

     LDA DSTAT
     BMI CSOR
     BEQ CSOR
     LDA DLEN
     BNE *+3
CSOR RTS
*- enough files ----
     STA TMP
*- find max name ---
CONT EQU *
     LDA #0
     STA TMP+1
     STA TMP+2
     LDA DIRBA
     STA DIRP
     STA SCRA
     LDA DIRBA+1
     STA DIRP+1
     STA SCRA+1
* compare extensions
MAXL LDY #8
COM1 LDA (SCRA),Y
     CMP (DIRP),Y
     BNE NOTE
     INY
     CPY #11
     BNE *+4
     LDY #0
     CPY #8
     BNE COM1
*- not equal -------
NOTE BCS NNAM
*- greater ---------
     LDX TMP+2
     STX TMP+1
     JSR SDIRP
     LDA DIRP
     STA SCRA
     LDA DIRP+1
     STA SCRA+1
*- last name ? -----
NNAM LDA TMP+2
     CMP TMP
     BEQ MAXF
*- next name -------
     CLC
     LDA DIRP
     ADC #14
     STA DIRP
     BCC *+4
     INC DIRP+1
     INC TMP+2
     BNE MAXL
*- max name found --
MAXF LDX TMP
     JSR SDIRP
     LDA DIRP
     STA SCRA
     LDA DIRP+1
     STA SCRA+1
     LDX TMP+1
     JSR SDIRP
*- copy max name ---
     LDY #13
SWAP LDA (SCRA),Y
     STA MUM
     LDA (DIRP),Y
     STA (SCRA),Y
     LDA MUM
     STA (DIRP),Y
     DEY
     BPL SWAP
*- dir sorted ? ----
     DEC TMP
     BNE CONT
*- sorted ! --------
     RTS

*-- set LEN
*-- last fnam to prn
SETLEN EQU *

     SEC
     LDA DLEN
     BMI TU
     SBC POINT

     CMP #7
     BCC LENN

     LDA #5
LENN ADC POINT
     STA LEN
     INC LEN
     RTS


*-- bar up
BARUP EQU *

     LDA YD
     BEQ PRINT

     DEC YD

     LDA YW
     BNE NOSU

     DEC POINT
     JMP PRINT

NOSU DEC YW
     JMP PRINT


BARDN EQU *

     JSR BD
     JMP PRINT

*-- bar down
BD   EQU *

     LDA YD

     CMP DLEN
     BCS TU

     INC YD

     LDA YW
     CMP #6
     BNE NOSC

     INC POINT
     RTS

NOSC INC YW
TU   RTS

*-- print directory
* from POINT fnam
* to   LEN   fnam
* YW eor line

PRINT EQU *

     LDX #20
     LDY #2
     JSR SPOS

     JSR SETLEN

     LDA DSTAT
     BMI TU
     BEQ JMER

     LDX POINT
PRL  JSR PRFN
     JSR CFTS
     JSR NXLN
     LDA LEN
     INX
     CPX LEN
     BNE PRL

     JSR EOR
JMER LDA #16+15
     JMP DMES

*-- print filename -

PRFN EQU *

     JSR SDIRP

     LDY #0
CPF  LDA (DIRP),Y
     STA HLPB,Y
     INY
     CPY #8
     BNE CPF

     LDA #'.'
     STA HLPB,Y

CF1  LDA (DIRP),Y
     STA HLPB+1,Y
     INY
     CPY #11
     BNE CF1

     LDA #' '
     STA HLPB+1,Y

CF2  LDA (DIRP),Y
     STA HLPB+2,Y
     INY
     CPY #14
     BNE CF2

NTPR RTS

*-- copy fnam to scr
CFTS EQU *
     LDY #19
     LDA #'B'
     STA (SCRA),Y
     DEY
CF3  LDA HLPB-3,Y
     JSR ATIN
     STA (SCRA),Y
     DEY
     CPY #2
     BNE CF3

     TXA
     PHA
     JSR GETBIT
     BEQ NOTG

     LDA #$60
NOTG LDY #2
     STA (SCRA),Y

     DEY
     LDA #'V'
     STA (SCRA),Y

     PLA
     TAX

     RTS

*- set dir pointer
SDIRP EQU *

     STX MUM
     STX MUM+4
     LDA #0
     STA MUM+1
     STA MUM+3
*- 2A --------------
     ASL MUM
*-------------------
     LDA MUM
     STA MUM+2
*- 16A -------------
     LDX #3
MULL ASL MUM
     ROL MUM+1
     DEX
     BNE MULL
*- 16A-2A=14A ------
     SEC
     LDA MUM
     SBC MUM+2
     STA DIRP
     LDA MUM+1
     SBC MUM+3
     STA DIRP+1
*- add dir base ----
     CLC
     LDA DIRBA
     ADC DIRP
     STA DIRP
     LDA DIRBA+1
     ADC DIRP+1
     STA DIRP+1
     LDX MUM+4
     RTS

*- tag/untag proc
TAGPR EQU *

     LDA YD
     JSR BYTN

     LDA #1

DYDY DEY
     BMI GG1
     ASL @
     BCC DYDY

GG1  EQU *
     EOR TAGM,X
     STA TAGM,X

     JMP BARDN

* get byte number
* returns:
* Y bit#
* X byte#
*
BYTN EQU *
     TAX
     AND #%00000111
     TAY
     TXA
     LSR @
     LSR @
     LSR @
     TAX
     RTS

*-- get bit
*-- fnam # in X

GETBIT EQU *

     JSR BYTN

     LDA TAGM,X

DTMP DEY
     BMI GBIT
     LSR @
     BPL DTMP

GBIT EQU *
     AND #%00000001
     RTS

*-------------------
CHTF EQU *
     LDA #0
     LDX #7
     ORA TAGM,X
     DEX
     BPL CHTF+4
     TAX
     RTS

*-------------------
SUBARU EQU *
     LDA #0
     STA YW
     STA YD
     STA POINT
     RTS

*-------------------
SETBAR EQU *
     JSR CHTF
     BNE *+4
     SEC
     RTS

     JSR SUBARU
PRP  LDA YD
     JSR GETBIT
     BNE TFON
     JSR BD
     JMP PRP

TFON JSR PRINT
     CLC
     RTS

***********
*   DOS   *
***********

HELP EQU *

     LDA #1
     STA H
     JMP TYPE

*MEML DTA A($7800)
*MEMT DTA A($7F03)
MEML EQU $2E7
MEMT EQU $2E5

*- copy file -------

COPY EQU *

     RTS



*    LDA #0
*    STA TMP
*    JSR WAIT
*- open source -----
*    LDA #4
*    JSR OPEN
*    BPL *+5
*    JMP CERR
*    STX 202
*- load data -------
*READ LDA TMP
*    BEQ FLOD
*    LDA #63
*    JSR DMES
*    JSR GETK
*    CMP #28
*    BNE *+5
*    JMP ABRT
*    JSR WAIT
*-------------------
*FLOD LDX #$10
*    JSR SBA
*-------------------
*    SEC
*    LDA MEMT
*    SBC MEML
*    STA IOCB+8,X
*    LDA MEMT+1
*    SBC MEML+1
*    STA IOCB+9,X
*    LDA #7
*    STA IOCB+2,X
*    JSR CIOV
*-------------------
*    LDA IOCB+8,X
*    STA TMP+1
*    LDA IOCB+9,X
*    STA TMP+2
*    TYA
*    BPL NCPL
*    CPY #136
*    BNE CERR
*-------------------
*   comp 8    0
* uncomp 8    1
*   comp 12   2
* uncomp 12   3
*-------------------
*    LDA TMP
*    BEQ SAVE
*    LDA #2
*    STA TMP
*    BNE SAVE
*-------------------
*NCPL EQU *
*    LDA TMP
*    BNE *+8
*    LDA #1
*    STA TMP
*    BNE SAVE
*    LDA #3
*    STA TMP
*-------------------
*- open destination
*SAVE LDA #79
*    JSR DMES
*    JSR GETK
*    CMP #28
*    BEQ ABRT
*    JSR WAIT
*- write or append ?
*    LDA TMP
*    CMP #2
*    BCS *+6
*    LDA #8
*    BNE *+4
*    LDA #9
*-------------------
*    JSR OPEN
*    BMI CERR
*-------------------
*    JSR SBA
*-------------------
*    LDA TMP+1
*    STA IOCB+8,X
*    LDA TMP+2
*    STA IOCB+9,X
*    LDA #11
*    STA IOCB+2,X
*    JSR CIOV
*    BMI CERR
*-------------------
*    JSR CLOSE
*    LDA TMP
*    BEQ CDON
*    CMP #2
*    BEQ CDON
*    JMP READ
*- error during copy
*CERR JSR ERROR
*ABRT LDX #$10
*    JSR CLOSE
*    LDX #$20
*    JSR CLOSE
*    JMP PRINT
*- done ------------
*CDON LDX #$10
*    JSR CLOSE
*    JMP REDIR
*-------------------
*SBA  EQU *
*    LDA MEML
*    STA IOCB+4,X
*    LDA MEML+1
*    STA IOCB+5,X
*RET  RTS

*- rename file -----
EREN LDA #$80
     STA (SCRA),Y
     RTS

REN  EQU *

     LDA #47
     JSR DMES

     LDY #4
EGK  LDA #0
     STA (SCRA),Y

     JSR GETK
     TAX
     LDA $FB51,X
*-------------------
     CMP #$9B
     BEQ RENAM
*-------------------
     CMP #$1B
     BNE *+8
     JSR EREN
     JMP PRINT
*-------------------
     CMP #$7E
     BNE NOBS

     CPY #4
     BEQ EGK
     LDA #$80
     STA (SCRA),Y
     DEY
     JMP EGK
*-------------------
NOBS EQU *

     CPY #16
     BCS EGK

     CMP #'a'
     BCC *+4
     SBC #$20
     JSR ATIN
     ORA #$80
     STA (SCRA),Y
     INY
     JMP EGK

*-------------------
RENAM EQU *

     JSR EREN

     LDX #0
SEOL LDA HLPB,X
     CMP #$9B
     BEQ ADNM
     INX
     BNE SEOL
*-------------------
ADNM LDA #','
     STA HLPB,X
     LDY #4
ADN1 LDA (SCRA),Y
     AND #$7F
     BEQ RENA
     JSR INAT
     STA HLPB+1,X
     INX
     INY
     BNE ADN1
*-------------------
RENA EQU *
     LDA #$9B
     STA HLPB+1,X
     JSR WAIT
     LDA #$20
     JSR DOSF
     BMI ERER
     BPL EDON

*- erase file(s) ---

ERASE EQU *

     JSR SURE
     BEQ *+5
     JMP PRINT
     JSR CHTF
     BNE ERAL
     JSR TAGPR
ERAL JSR SETBAR
     BCS EDON
*-------------------
ERAF EQU *
     JSR WAIT
     LDA #$21
     JSR DOSF
     BMI ERER
*-------------------
ERAD JSR TAGPR
     JMP ERAL
ERER JMP ERROR
EDON JMP REDIR

*- type file -------

TYPE EQU *

     LDA #0
     STA EESS

*-------------------
     LDA H
     BEQ NTYP
     LDX #8
     LDA HNAM,X
     STA HLPB,X
     DEX
     BPL *-7
*-------------------
     LDA #4
     JSR OPEN
     BPL CHUJ
     JSR CLOSE
     LDA #0
     STA H
     LDA #127
     JMP E
*-------------------
NTYP LDA #4
     JSR OPEN
     BPL *+5
     JMP ERROR
*-------------------
CHUJ JSR FLAP
     LDX #$9B
     JSR PUT
TLOP LDX #$10
     LDA #0
     STA H
     STA IOCB+5,X
     STA IOCB+9,X
     LDA <BYTE
     STA IOCB+4,X
     LDA #1
     STA IOCB+8,X
     LDA #7
     STA IOCB+2,X
*-------------------
     LDA $11
     BEQ TERR
     JSR CIOV
     BMI TERR
*-------------------
     LDA $11
     BEQ TERR

     LDA EESS
     BEQ LOLO

     LDA #0
     STA EESS

     LDX BYTE
     JSR PUT

     JMP TLOP

LOLO LDX BYTE
     CPX #$1B
     BNE QBA

     STX EESS
     JSR PUT
     JMP TLOP

QBA  EQU *

     LDA EESS
     BNE LULI

     LDX #$1B
     JSR PUT
LULI LDX BYTE
     JSR PUT

     LDA #0
     STA EESS



     JMP TLOP

*-------------------
TERR JSR CLOSE
     JSR GETK
     LDX #'}'
     JSR PUT
     JSR REZIO
     PLA
     PLA
     LDA #$9B
     STA $11
     LDY #1
     RTS

*- format ----------

FORMAT EQU *

     JSR SURE
     BEQ *+5
     JMP PRINT
     JSR WAIT
     LDA #254
     JSR DOSF
     BPL *+5
     JMP ERROR
     JSR REDIR

*- SURE (Y/N) ? ----

SURE EQU *

     LDA #95
     JSR DMES
     JSR GETK
     AND #$3F
     CMP #43
     RTS

*- set default fnam

SDEF EQU *

     LDX #3
     LDA DEFA,X
     STA HLPB,X
     DEX
     BPL SDEF+2
     RTS

*- open file -------

OPEN EQU *

     LDX #$20
     CMP #8
     BEQ OPN1
     CMP #9
     BEQ OPN1
     LDX #$10
OPN1 STA IOCB+10,X
     LDA #0
     STA IOCB+11,X
     LDA #3
     STA IOCB+2,X
     JSR PUTN+2
     JMP CIOV

*- close file ------

CLOSE EQU *

     LDA #12
     STA IOCB+2,X
     JMP CIOV

*- filename to IOCB

PUTN LDX #$10
     LDA NAMEAD
     STA IOCB+4,X
     LDA NAMEAD+1
     STA IOCB+5,X
     RTS

*- call DOS function

DOSF EQU *

     LDX #$10
     STA IOCB+2,X
     JSR PUTN
     JMP CIOV

*- error message ---

ERROR EQU *

     TYA
     AND #$7F
     TAY
     SED
     LDA #0
*-------------------
     CLC
     ADC #1
     DEY
     BNE *-4
*-------------------
     CLC
     ADC #$28
     CLD
     LDY #14
     JSR DSPB
     JSR CLOSE
     LDA #0+15
E    JSR DMES
     JSR $F556
     LDX #255
     STX CH
     CPX CH
     BEQ *-3
     JMP PRINT

*- 'wait' message --

WAIT LDA #111

*- display message -

DMES EQU *

     PHA
     LDX #22
     LDY #10
     JSR SPOS
     PLA
     TAX
     LDY #15
MESL LDA MESS,X
     STA (SCRA),Y
     DEX
     DEY
     BPL MESL
     RTS

*- set SCRA --------

SPOS EQU *
     LDA 88
     STA SCRA
     LDA 89
     STA SCRA+1
     TYA
SPLP BEQ YDNE
     JSR NXLN
     DEY
     JMP SPLP
YDNE CLC
     TXA
     ADC SCRA
     STA SCRA
     BCC *+4
     INC SCRA+1
XIS  RTS

NXLN CLC
     LDA SCRA
     ADC #40
     STA SCRA
     BCC *+4
     INC SCRA+1
     RTS

*-------------------
EOR  EQU *

     LDX #21
     LDY YW
     INY
     INY
     JSR SPOS

     LDY #2
     LDX #0

CPLL LDA (SCRA),Y
     CPY #10
     BCS NOSP
     PHA
     PLA
     BNE NOSP
     LDY #10
     BNE CPLL

NOSP EQU *
     PHA
     PLA
     BEQ PEOL
     JSR INAT
     STA HLPB,X
     INX
     INY
     CPY #14
     BNE CPLL

PEOL LDA #$9B
     STA HLPB,X


     LDY #18
CBOR LDA (SCRA),Y
     EOR #$80
     STA (SCRA),Y
     DEY
     BPL CBOR

     RTS

*-------------------

GETK EQU *

     LDX #$FF
     LDA 17
     BEQ BRKP
     CPX CH
     BNE G___
     LDA 732
     BEQ GETK+2
     LDA #$B9
     STA CH
G___ LDA CH
     STX CH
     INX
     STX 732
     JMP $F983
BRKP LDA #$80
     STA 17
     TXA
     RTS

DSPB EQU *
     PHA
     JSR DSPD
     PLA
     LSR @
     LSR @
     LSR @
     LSR @
DSPD AND #$0F
     ORA #$90
     STA MESS,Y
     DEY
     RTS

*-------------------

ATIN AND #$7F
     CMP #96
     BCS DONE
     SBC #31
     BCS DONE
     ADC #96
DONE RTS

INAT AND #$7F
     CMP #96
     BCS DONE
     SBC #63
     BCS DONE
     ADC #96
     RTS

*- store screen data
FLIP EQU *

*- store bottom line
     LDX #0
     LDY #23
     JSR SPOS
     LDY #39
FLL  EQU *
     LDA (SCRA),Y
     STA BOTB,Y
     DEY
     BPL FLL

*- disp bottom line
     LDY #39
     LDA BOTL,Y
     STA (SCRA),Y
     DEY
     BPL *-6

*- store underwindow
     LDX #21
     LDY #0
     JSR SPOS

     LDX #228
FLWL LDY #18
     LDA (SCRA),Y
     STA WINB-1,X
     DEX
     BEQ FLWE
     DEY
     BPL FLWL+2
     JSR NXLN
     JMP FLWL

FLWE EQU *
*- display commander

     JSR HALT

     LDX #21
     LDY #0
     JSR SPOS

     LDA #$4E
     JSR LINE

     LDX #10

RW   EQU *

     JSR NXLN

     LDA #0
     JSR LINE

     INY
     LDA #$56
     STA (SCRA),Y

     LDY #18
     LDA #$42
     STA (SCRA),Y

     DEX
     BNE RW

     LDA #$80
*------------------
LINE EQU *
     LDY #18
     STA (SCRA),Y
     DEY
     BPL LINE+2
ERW  RTS

*- restore screen
FLAP EQU *

     LDX #0
     LDY #23
     JSR SPOS

     JSR HALT

     LDY #39
     LDA BOTB,Y
     STA (SCRA),Y
     DEY
     BPL *-6

*-------------------
     LDX #21
     LDY #0
     JSR SPOS

     LDX #228
RWL  LDY #18
     LDA WINB-1,X
     STA (SCRA),Y
     DEX
     BEQ ERW
     DEY
     BPL RWL+2
     JSR NXLN
     JMP RWL

HALT EQU *
     LDA 20
     CMP 20
     BEQ *-2
     RTS

     BRK


*-------------------

GETA   DTA A(GET-1)
NEWTBA DTA A(NEWTB)
DIRBA  DTA A(DIRB)
NAMEAD DTA A(PROMPT)
RESAD  DTA A(RESET)

PRTAB  EQU *
     DTA A(HIDE)
     DTA A(DELP)
     DTA A(EDRT)
     DTA A(SHDL)
     DTA A(CLFT)
     DTA A(CRT)
     DTA A(DEL)
     DTA A(INS)
     DTA A(REDIR)
     DTA A(BARUP)
     DTA A(BARUP)
     DTA A(BARDN)
     DTA A(BARDN)
     DTA A(TAGPR)
     DTA A(TYPE)
     DTA A(FORMAT)
     DTA A(ERASE)
     DTA A(REN)
     DTA A(COPY)
     DTA A(BREK+4)
     DTA A(HELP)
     DTA A(CRET)
     DTA A(QUIT)

*-------------------

POINT DTA B(0)
YW    DTA B(0)
YD    DTA B(0)
DLEN  DTA B(0)
DSTAT DTA B(0)
HIDF  DTA B(0)
FIRF  DTA B(0)
FRFL  DTA B(0)
TRANF DTA B(0)
H     DTA B(0)
EPOS  DTA B(0)
QQD   DTA B(0)

NMEM  DTA A(0)
EADR  DTA A(0)
DOSIL DTA A(0)
OLDGT DTA A(0)
IOCO  DTA A(0)
JUMP  DTA A(0)

NEWTB EQU *
     DTA D' '
     ORG NEWTB+16

*- messages --------

MESS EQU *

    DTA D' I/O err'*
    DTA D'or  1.. '*
FRE DTA D'____free'*
    DTA D' sectors'*
    DTA D'new:    '*
    DTA D'        '*
    DTA D'source,p'*
    DTA D'lease...'*
    DTA D'destinat'*
    DTA D'ion...  '*
  DTA D' ''Y'' to '*
    DTA D'confirm '*
    DTA D'     wai'*
    DTA D't...    '*
    DTA D'  no hel'*
    DTA D'p file  '*

BOTL EQU *
 DTA D' ^Dir ^Era'*
 DTA D' ^Ren ^Cop'*
 DTA D'y ^Type ^I'*
 DTA D'nit ^Help '*

KTAB EQU *
     DTA B($1C)
     DTA B($34)
     DTA B($0C)
     DTA B($74)
     DTA B($86)
     DTA B($87)
     DTA B($B4)
     DTA B($B7)
     DTA B($BA)
     DTA B($0E)
     DTA B($8E)
     DTA B($0F)
     DTA B($8F)
     DTA B($2C)
     DTA B($AD)
     DTA B($8D)
     DTA B($AA)
     DTA B($A8)
     DTA B($92)
     DTA B($9A)
     DTA B($B9)
     DTA B($8C)
     DTA B($DC)

*- HELP ------------

HNAM DTA C'CCOM.HLP'
     DTA B(155)

*- *.* -------------

DEFA EQU *

     DTA C'*.*'
     DTA B($9B)

*-- buffers --------

TAGM DTA D' '
     ORG TAGM+8+16

PROMPT DTA C'D1:'

HLPB DTA D' '
     ORG HLPB+38

STZI DTA D' '
     ORG STZI+16

BOTB DTA D' '
     ORG BOTB+40

WINB DTA B(0)
     ORG WINB+228

DIRB DTA D' '
     ORG DIRB+910


PLEN EQU *-RESET


STAR_ EQU BEGN
USER_ EQU STAR

     END
