* 89.06.27
* 89.09.18

     OPT h+

* strona zerowa ----

Z0   EQU $80
ADDR EQU Z0+00 ;+01
SCRA EQU Z0+02 ;+03
CHAD EQU Z0+04 ;+05
FADR EQU Z0+06 ;+07

X    EQU Z0+18
Y    EQU Z0+19
X1   EQU Z0+20
Y1   EQU Z0+21
FX   EQU Z0+22
FY   EQU Z0+23
LM   EQU Z0+24
VSF  EQU Z0+25
VSC  EQU Z0+26
TELE EQU Z0+27
FAC  EQU Z0+28
CNUM EQU Z0+29

KEYS EQU Z0+30
LIVS EQU Z0+31
ZEBR EQU Z0+32
SKRB EQU Z0+33
NABO EQU Z0+34
DEMO EQU Z0+35

SCOR EQU Z0+36 ;37 38

HLP  EQU Z0+39
RUCH EQU Z0+40
LAST EQU Z0+41
PNTR EQU Z0+42
DCV  EQU Z0+43



* system -----------

JOY  EQU $278
TRIG EQU $284
TMR  EQU $21C

RND  EQU $D20A
VSCR EQU $D405

SETV EQU $E45C
VBEX EQU $E462

VOIC EQU $D200

* program ----------


SFNT   EQU $1000
IFNT   EQU $1800
PLAY   EQU $1c00
TTPG   EQU $3800
SCRN   EQU $b800

CONG   EQU TTPG+3
sound_ equ play+3
soundv equ play+6


********************


     ORG TTPG
     JMP TITLE
     JMP CONGR


********************

     DTA B(1)
SETUP EQU *

     LDA SETUP-1
     BEQ SET1


     LDA 10
     STA EXIT+1
     LDA 11
     STA EXIT+2

     LDA #0
     STA SETUP-1
     STA CNUM
     STA DCV
     STA DEMO
     STA STCN


SET1 LDA $D01F
     AND #4   ;OPTION
     BNE NOEX

     LDA #34
     STA 559
     lda #1
     sta setup-1

EXIT JMP *+*-*+*


NOEX LDA <RESET
     STA 10
     LDA >RESET
     STA 11

     LDA MASK+3
     STA MASK+1
     LDA MASK+2
     STA MASK

     LDX #5
COPC LDA COLS,X
     STA 707,X
     DEX
     BPL COPC

     LDA <INST
     STA CHAD
     LDA >INST
     STA CHAD+1

     LDA >IFNT
     STA 756

     LDA #255
     STA TMR
     STA TBUF

     LDA #0
     STA 559
     STA 580
     STA 9
     STA 8
     STA $D20E ;-IRQ
     STA PNTR
     STA TMR+1
     jmp halt


********************

* Title page -------

RESET EQU *


TITLE EQU *

     LDX #255
     TXS

     LDA CNUM
     LDX DEMO
     BEQ NOD
     LDA #0
     STA DEMO
     LDA DCV
NOD  STA STCN
     STA CNUM

     JSR SETUP
     JSR HALT

     LDA <TPDL
     STA 560
     LDA >TPDL
     STA 561

     LDA #33
     STA 559

     JSR CLS



********************

TPLP EQU *

     JSR BIGR

     LDX #36
     LDA #$0E
     JSR WLIN
     LDA #$00
     STA $D018

     LDX #48
     LDA #$04
     JSR WLIN

     LDX #74
     LDA #$06
     JSR WLIN


* print char -------

     LDA #0
     STA VOIC+1

     LDY PNTR
     LDA 20
     ASL @
     ASL @
     ASL @
     ASL @
     AND #$80
     STA SCRN+352,Y

     LDA TMR
     ORA TMR+1
     BNE NOPR



     LDY PNTR
     CPY #32
     DEY
     BCS NXT1
     INY
     LDA (CHAD),Y

     PHA
     AND #3
     ADC #2
     STA TMR

     LDA #$10
     STA VOIC
     LDA #$82
     STA VOIC+1
     PLA

     CMP #$FF
     BNE CONP


* end of text ------

     LDA #4
     STA TMR+1

     LDA <INST-3
     STA CHAD
     LDA >INST-3
     STA CHAD+1
     LDA #$40 ;♥

CONP CMP #$40 ;♥
     BNE PUTC


* nxtln ------------

NXTL LDA #0
     STA SCRN+352,Y

NXT1 TYA
     ADC CHAD
     STA CHAD
     BCC *+4
     INC CHAD+1

     LDA #15
     STA TMR

     LDA #$02
     STA VOIC
     LDA #$C4
     STA VOIC+1

     LDY #0
     LDA SCRN+160,Y
     STA SCRN+128,Y
     INY
     BNE *-7

     STY PNTR
     BEQ NOPR


PUTC STA SCRN+352,Y
     INC PNTR


NOPR EQU *

     LDA #0
     STA 77 ;ATRAC

* haslo

     LDA $D209
     ORA #$40
     TAX
     LDA $FB51,X
     CMP TBUF+HALE-1
     BEQ NOHA

     PHA
     LDX #0
ROLB LDA TBUF+1,X
     STA TBUF,X
     INX
     CPX <HALE-1
     BCC ROLB
     PLA
     STA TBUF+10


NOHA LDA TMR+1
     CMP #1
     BEQ DEM

     LDA $D01F
     CMP #3 ;-OPTION
     BNE QQ

DEM  LDA #1
     STA DEMO
     LDA CNUM
     STA DCV
     JMP PLAJ

QQ   JSR TETR
     BEQ *+5
     JMP TPLP

********************

* Play! ------------

STCN EQU *+1
PLAJ LDA #0
     AND #%11111100
     STA CNUM

* chck has

     LDX <HALE-1
CHCH LDA TBUF,X
    CMP TBUF+HALE,X
     BNE LIV3
     DEX
     BPL CHCH

     LDA #$80
     BNE *+4

LIV3 LDA #$08

     STA LIVS

     LDA #0
     STA TMR
     STA TMR+1

     JMP PLAY




********************
********************
********************

* Congratulations --


CONGR EQU *

     JSR HALT

     LDA >SFNT
     STA 756

     LDA <CDL1
     STA 560
     LDA >CDL1
     STA 561

     LDX #5
     LDA COLS+6,X
     STA 707,X
     DEX
     BPL *-7

********************

     LDA #$FF
     STA Y
     STA FX

     JSR DISP

     LDX #50
     JSR WAIT

* wchodzi Robbo

     LDA #30
     STA FX
     LDA #12
     STA FY
     LDA #$05
     STA RUCH

     LDA #$05
     JSR SOUND_

WCHO LDA RUCH
     EOR #$10
     STA RUCH
     JSR DIWA
     DEC FX
     LDA FX
     CMP #22
     BCS WCHO

     LDA #$06
     STA RUCH
     JSR DIWA

     LDX #10
     JSR WAIT


* laduje statek

     LDA #12
     STA X
     LDA #0
     STA Y

     LDA #$0E
     JSR SOUND_

LAND JSR DIWA
     LDA RUCH
     EOR #$10
     STA RUCH
     INC Y
     LDA Y
     CMP #12
     BCC LAND


* macha raczka

     LDA #$0D
     JSR SOUND_


     LDY #14
MACH TYA
     PHA
     LDA #$13
     STA RUCH
     JSR DIWA
     LDA #$12
     STA RUCH
     JSR DIWA
     PLA
     TAY
     DEY
     BNE MACH


* idzie

     LDA #$05
     STA RUCH

IDZI LDA RUCH
     EOR #$10
     STA RUCH
     JSR DIWA
     DEC FX
     LDA FX
     CMP #13
     BCS IDZI

* odlatuje

     LDA #$0B
     JSR SOUND_

ODLA JSR DIWA
     DEC FY
     DEC Y
     LDA Y
     CMP #$FE
     BNE ODLA


     LDA #$05
     JSR SOUND_


     LDX #50
     JSR WAIT

* congratulations!

     LDA #0
     LDX #6
     STA 707,X
     DEX
     BPL *-4

     JSR HALT

     LDA <CDL2
     STA 560
     LDA >CDL2
     STA 561

     LDA >IFNT
     STA 756

     LDX #0
     LDA #'`'
     STA SCRN+$000,X
     STA SCRN+$100,X
     STA SCRN+$200,X
     DEX
     BNE *-10

     LDY #0
ROZJ STY 709
     LDX #2
     JSR WAIT
     INY
     CPY #$0F
     BCC ROZJ

     LDA #$02
     STA 710

     LDA #$00
     JSR SOUND_

COPT LDY RND
     LDA COTX,Y
     STA SCRN,Y
     LDY RND
     LDA COTX+$100,Y
     STA SCRN+$100,Y
     LDY RND
     LDA COTX+$200,Y
     STA SCRN+$200,Y

     LDX #0
     LDA $FFFF
     DEX
     BNE *-4

     JSR TETR
     BNE COPT

********************

     LDA #$09
     JSR SOUND_

     LDX #116
ZNIK CPX $D40B
     BNE ZNIK
     LDY #$0F
Z1   STY $D018
     STY $D40A
     DEY
     BPL Z1

     LDA #$00
     STA $D018
     STA $D017
     STA $D01A
     DEX
     BPL ZNIK

     LDA #$0D
     JSR SOUND_

********************

     LDA #0
     STA CNUM
     JMP TTPG

********************

* display scene ----

DIWA LDX #6
     JSR WAIT


DISP LDA #92
     CMP $D40B
     BNE *-3

     JSR CLS


* ground -----------


     LDX #30

GROU TXA
     PHA
     LDY #14
     LDA #16+$80
     JSR PUT_
     PLA
     TAX
     DEX
     DEX
     BPL GROU

* stars ------------


     LDY #32
STAR TYA
     PHA
     LDA STAT,Y
     TAX
     LDA STAT+1,Y
     TAY
     LDA #0
     JSR PUT_
     PLA
     TAY
     DEY
     DEY
     BPL STAR


* disp Robbo

     LDX FX
     LDY FY
     LDA RUCH
     JSR PUT_

* disp ship --------

SHIP LDX X
     LDY Y
     LDA 20
     ASL @
     ASL @
     ASL @
     AND #$80
     PHA
     ORA #2
     JSR PUT_
     LDX X
     INX
     INX
     LDY Y
     PLA
     ORA #3
     JMP PUT_


********************
********************
********************



* procedury --------

CLS  LDX #0
     TXA
CLS1 STA SCRN+$000,X
     STA SCRN+$100,X
     STA SCRN+$200,X
     STA SCRN+$300,X
     DEX
     BNE CLS1
     RTS

* ------------------

PUT_ EQU *

     CPX #31
     BCC *+3
     RTS

     CPY #15
     BCC *+3
     RTS

     PHA

     LDA #0
     STA SCRA+1
     TYA
     ASL @
     ASL @
     ASL @
     ROL SCRA+1
     ASL @
     ROL SCRA+1
     ASL @
     ROL SCRA+1

     STX ADDR
     ADC ADDR
     STA SCRA

     ADC <SCRN
     STA SCRA
     LDA >SCRN
     ADC SCRA+1
     STA SCRA+1


     LDA #0
     STA ADDR ;-invr

     PLA
     ASL @
     ROR ADDR


     CMP #32
     BCC *+4
     ADC #31

     ORA ADDR

     TAX
     LDY #0
     STA (SCRA),Y
     INY
     INX
     TXA
     STA (SCRA),Y

     CLC
     ADC #31
     TAX
     LDY #32
     STA (SCRA),Y
     INY
     INX
     TXA
     STA (SCRA),Y

     RTS


* Big robbo --------

BIGR EQU *

     LDX #3
CCOL LDA RND
     AND #31
     BNE NOCC
     LDA 708,X
     CLC
     ADC #$10
     STA 708,X
NOCC DEX
     BPL CCOL

     LDX #4

BIG0 TXA
     PHA

     STA HLP
     ASL @
     ADC HLP
     ADC <SCRN+1
     STA SCRA
     LDA >SCRN
     STA SCRA+1

     LDA ROBO,X

     ASL @
     ASL @
     ASL @
     STA ADDR


     LDX #7

BIG1 TXA
     PHA


     LDA #0
     LDY #0

     LDX ADDR
     LDA IFNT+$3E8,X
     STA HLP


BIG3 LDX #3

BIG4 ASL HLP
     PHP
     ROL @
     PLP
     ROL @
     DEX
     BPL BIG4

     AND MASK,Y
     STA (SCRA),Y

     LDA #0
     INY
     CPY #1
     BEQ BIG3

     JSR ROLM

     CLC
     LDA SCRA
     ADC #16
     STA SCRA
     BCC *+4
     INC SCRA+1


     INC ADDR

     PLA
     TAX
     DEX
     BPL BIG1


     PLA
     TAX
     DEX
     BPL BIG0


* rotate mask ------

     LDA 20
     AND #3
     BNE RTS

     LDA RND
     AND #31
     BNE ROTM
     INC ROTM+1

ROTM LDA #0
     LSR @
     BCC RORM



* rotate left mask -

ROLM LDX #1

ROL1 ASL MASK+1
     ROL MASK
     PHP
     ROR MASK+1
     PLP
     ROL MASK+1

     DEX
     BPL ROL1

RTS  RTS

* rotate right mask-

RORM LDX #1

ROR1 LSR MASK
     ROR MASK+1
     PHP
     ROL MASK
     PLP
     ROR MASK

     DEX
     BPL ROR1
     RTS



ROBO DTA D' !""!'

MASK EQU *
    DTA D'  '
    DTA B(%11111010)
    DTA B(%01011010)

* wait one frame ---

WAIT JSR HALT
     DEX
     BNE WAIT

HALT LDA 20
     CMP 20
     BEQ *-2
     RTS

* tst triger -------

TETR LDA $D20F ;shft
     LSR @
     LSR @
     LSR @
     AND TRIG
     AND TRIG+1
     AND $D01F ;strt
     RTS

* wait for line ---

WLIN CPX $D40B
     BNE WLIN
     STA $D017
     RTS


********************

COLS DTA B($00)
     DTA B($72)
     DTA B($74)
     DTA B($78)
     DTA B($00)
     DTA B($00)

     DTA B($00)
     DTA B($32)
     DTA B($C8)
     DTA B($0C)
     DTA B($74)
     DTA B($00)


********************

TBUF EQU *
  DTA C'1989.09.18 '
HALE EQU *-TBUF
  DTA C'JANUSZ PELC'

TPDL DTA D'pp',B($40)
     DTA B($4A)
     DTA A(SCRN)
     DTA D' * * * *'
     DTA D' * * *'

     DTA B($60)
     DTA B($42)
     DTA A(TEXT)
     DTA B($30)
     DTA B($02)

     DTA B($70)
     DTA B($20)
     DTA B($02)
     DTA B($02)
     DTA B($30)
     DTA B($02)
     DTA B($02)

     DTA B($70)
     DTA B($20)
     DTA B($4C)
     DTA A(LINE)
     DTA B($00)

     DTA B($42)
     DTA A(SCRN+128)
     DTA D'"""""""'

     DTA B($00)
     DTA B($4C)
     DTA A(LINE)

     DTA B($41)
     DTA A(TPDL)

********************

CDL1 EQU *
     DTA D'pppppp'
     DTA B($44)
     DTA A(SCRN)
     DTA D'$$$$$$$$'
     DTA D'$$$$$$$'
     DTA B($41)
     DTA A(CDL1)

CDL2 EQU *
     DTA D'ppppp'
     DTA B($42)
     DTA A(SCRN)
     DTA D'""""""""'
     DTA D'""""""""'
     DTA D'"""'
     DTA B($41)
     DTA A(CDL2)

********************


LINE DTA A($FFFF)
     DTA A($FFFF)
     DTA A($FFFF)
     DTA A($FFFF)
     DTA A($FFFF)
     DTA A($FFFF)
     DTA A($FFFF)
     DTA A($FFFF)

TEXT EQU *
     DTA D'        '
     DTA B($59),B($5A),D'6>=> b'
     DTA D'y Avalon'
     DTA D'        '

     DTA D' Program'
     DTA D' i grafi'
     DTA D'ka',B($43),D' Janu'
     DTA D'sz Pelc '

     DTA D'   Stero'
     DTA D'wanie',B($43),D'  '
     DTA D'joystick'
     DTA D' lub    '

     DTA D'        '
     DTA D'        '
     DTA D'klawisze'
     DTA D' ',B($5E),B($5F),B($5C),B($5D),D'   '

     DTA D'   Strza'
     DTA D']',B($43),D'      '
     DTA D'przycisk'
     DTA D' lub    '

     DTA D'        '
     DTA D'        '
     DTA D'klawisz '
     DTA D'SHIFT   '


 DTA B($40),B($40),B($40)
INST EQU *
 DTA D'          '
 DTA D' '*
 DTA D'Instrukcja'*
 DTA B($C3),D' '*
 DTA B($40),B($40)


 DTA D'    Robbo  m'
 DTA D'usi  przeby['
 DTA D'  trudn@'
 DTA D'drog\   prze'
 DTA D'z  :;   plan'
 DTA D'et',B($41),D'  aby'
 DTA D'wydosta[ si\'
 DTA D'  z wrogiego'
 DTA D'  uk]adu'
 DTA D'planetarnego'
 DTA B($41),D'  na kt_rym'
 DTA D'  zosta]'
 DTA D'podst\pnie u'
 DTA D'wi\ziony',B($42)
 DTA B($40),B($40)
 DTA D'    Na ka|de'
 DTA D'j  planecie '
 DTA D'czeka na'
 DTA D'niego  ma]a '
 DTA D'kapsu]a',B($41),D' kt_'
 DTA D'r@  mo|e'
 DTA D'przelecie[ n'
 DTA D'a nast\pn@  '
 DTA D'planet\',B($42)
 DTA D'Niestety',B($41),D'  w'
 DTA D'i\kszo{[ kap'
 DTA D'su] jest'
 DTA D'niekompletna'
 DTA B($41),D' dlatego Ro'
 DTA D'bbo musi'
 DTA D'zebra[ odpow'
 DTA D'iedni@ liczb'
 DTA D'\ cz\{ci'
 DTA D'rozrzuconych'
 DTA D'  po ca]ej p'
 DTA D'lanecie',B($42)
 DTA D'B\d@  mu w t'
 DTA D'ym przeszkad'
 DTA D'za[  z]e'
 DTA D'stworki  ?  '
 DTA D'mieszka^cy  '
 DTA D'systemu',B($42)
 DTA D'W swojej w\d'
 DTA D'r_wce Robbo '
 DTA D'znajdzie'
 DTA D'r_|ne   prze'
 DTA D'dmioty',B($42),D'  Odk'
 DTA D'ryj  ich'
 DTA D'przeznaczeni'
 DTA D'e',B($42),D'  Pr_buj j'
 DTA D'e pcha[',B($41)
 DTA D'zbiera[ lub '
 DTA D'strzela[ do '
 DTA D'nich',B($42)
 DTA B($40),B($40)
 DTA D'  Je{li  Rob'
 DTA D'bo  znajdzie'
 DTA D'  si\  w'
 DTA D'sytuacji  be'
 DTA D'z  wyj{cia',B($41),D' '
 DTA D' wci{nij'
 DTA D'klawisz '
 DTA D' ESC '*
 DTA B($42),B($40),B($40)
 DTA D'  Pami\taj',B($41),D' '
 DTA D' |e  ka|d@  '
 DTA D' planet\'
 DTA D'mo|na przej{'
 DTA D'[',B($44),B($40),B($40),B($40)


 DTA D'  '
 DTA D'Mi]ej zabawy'
 DTA D' |yczy Ci au'
 DTA D'tor',B($42),B($40),B($40),B($40)

*DTA D'  Je|eli uda'
*DTA D' Ci si\ prze'
*DTA D'by[ ca]y'
*DTA D'system plane'
*DTA D'tarny',B($41),D' napis'
*DTA D'z do nas'
*DTA D'i  opisz  za'
*DTA D'ko^czenie  g'
*DTA D'ry',B($42),D'  Dla'
*DTA D'pierwszych p'
*DTA D'i\ciu os_b',B($41),D' '
*DTA D'kt_re do'
*DTA D'nas  napisz@'
*DTA B($41),D'   nagrod@ '
*DTA D'  b\dzie'
*DTA D'specjalny   '
*DTA D'egzemplarz  '
*DTA D'  naszej'
*DTA D'nast\pnej gr'
*DTA D'y',B($42),B($40),B($40),B($40),B($40)


 DTA D'  Je|eli sam'
 DTA D'  piszesz  p'
 DTA D'rogramy',B($41)

 DTA D'skontaktuj  '
 DTA D'si\  z nami',B($42)
 DTA D'  Wydamy'

 DTA D'na bardzo ko'
 DTA D'rzystnych  w'
 DTA D'arunkach'

 DTA D'ka|dy dobry '
 DTA D' program',B($42),B($40),B($40)

 DTA D'Oto nasz adr'
 DTA D'es',B($43),B($40),B($40)

 DTA D'    Laborato'
 DTA D'rium Kompute'
 DTA D'rowe',B($40)

 DTA D' ',B($45),B($46),D'         '
 DTA D' Avalon     '
 DTA D'     ',B($49)
 DTA B(74)
 DTA B(0)

 DTA D' ',B($47),B($48),D'    '
 DTA D'skryt'
 DTA D'ka pocztowa '
 DTA D'9;   ',B($4B),B($4C),D' '

 DTA D'         8=?'
 DTA D'655 Strzy|_w'

 DTA B($40)
 DTA B($FF)

********************

COTX EQU *
     DTA D'````````'
     DTA D'````````'
     DTA D'````````'
     DTA D'````````'

     DTA D'`       '
     DTA D'        '
     DTA D'        '
     DTA D'       `'

   DTA D'`         '
    DTA D' B R A'*
    DTA D' W O'*,B($C4),D' '*
   DTA D'         `'

     DTA D'`       '
     DTA D'        '
     DTA D'        '
     DTA D'       `'

     DTA D'`   Robb'
     DTA D'o przedo'
     DTA D'sta] si\'
     DTA D' przez `'

     DTA D'` wrogi '
     DTA D'system p'
     DTA D'lanetarn'
     DTA D'y',B($42),D'     `'

     DTA D'`   Plan'
     DTA D'y',B($41),D' kt_re'
     DTA D' ma w pa'
     DTA D'mi\ci',B($41),D' `'

     DTA D'` s@ bar'
     DTA D'dzo cenn'
     DTA D'e dla Zi'
     DTA D'emi',B($44),D'   `'

     DTA D'`       '
     DTA D'        '
     DTA D'        '
     DTA D'       `'

     DTA D'`   Tym '
     DTA D'samym uk'
     DTA D'o^czy]e{'
     DTA D' nasz@ `'

     DTA D'` pierws'
     DTA D'z@ gr\',B($42),D' '
     DTA D' Je|eli '
     DTA D'Ci si\ `'

     DTA D'` podoba'
     DTA D']a',B($41),D' szuk'
     DTA D'aj nast\'
     DTA D'pnych',B($42),D' `'

     DTA D'`       '
     DTA D'        '
     DTA D'        '
     DTA D'       `'

     DTA D'`   Pami'
     DTA D'\taj',B($43),D'  n'
     DTA D'ajlepsze'
     DTA D' gry   `'

     DTA D'`       '
     DTA D'    to t'
     DTA D'ylko    '
     DTA D'       `'

     DTA D'`       '
     DTA D'        '
     DTA D'        '
     DTA D'       `'

     DTA D'`   Labo'
     DTA D'ratorium'
     DTA D' Kompute'
     DTA D'rowe   `'

     DTA D'`       '
     DTA D'    Aval'
     DTA D'on',B($44),B($44),B($44),D'   '
     DTA D'       `'

     DTA D'`       '
     DTA D'        '
     DTA D'        '
     DTA D'       `'

     DTA D'````````'
     DTA D'````````'
     DTA D'````````'
     DTA D'````````'


*-------------------

STAT DTA B(00),B(00)
     DTA B(26),B(00)
     DTA B(17),B(01)
     DTA B(30),B(01)
     DTA B(16),B(02)
     DTA B(24),B(03)
     DTA B(28),B(04)
     DTA B(05),B(04)
     DTA B(18),B(08)
     DTA B(25),B(08)
     DTA B(06),B(09)
     DTA B(12),B(10)
     DTA B(09),B(02)
     DTA B(14),B(05)
     DTA B(01),B(06)
     DTA B(03),B(12)
     DTA B(26),B(12)

*-------------------

     END
