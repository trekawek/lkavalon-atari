
*- strona zerowa ---

PTR EQU $D0
LAST EQU $D2
MIN EQU $D4

*- system ----------

DOS  EQU $A
EDIT EQU $340
CIOV EQU $E453
ATOI EQU $F556
DSPD EQU $F983

*-------------------

     ORG $480

*- poczatek porgramu

BEGIN EQU *

*- wyswietl HELP ---

     LDA #9
     STA EDIT+2
     LDA <HELP
     STA EDIT+4
     LDA >HELP
     STA EDIT+5
     LDA <93
     STA EDIT+8
     LDA >93
     STA EDIT+9
     LDX #0
     JSR CIOV

*- pobierz wyrazy --
*- ciagu -----------

     LDA <FREE
     STA PTR
     LDA >FREE
     STA PTR+1

*- wyswietl '?' ----

ILOP LDA #9
     STA EDIT+2
     LDA <PROMPT
     STA EDIT+4
     LDA >PROMPT
     STA EDIT+5
     LDA <2
     STA EDIT+8
     LDA >2
     STA EDIT+9
     LDX #0
     JSR CIOV

*- pobierz liczbe --

     LDA #7
     STA EDIT+2
     LDA <BUFF
     STA EDIT+4
     LDA >BUFF
     STA EDIT+5
     LDA <4
     STA EDIT+8
     LDA >4
     STA EDIT+9
     LDX #0
     JSR CIOV

* czy koniec wprowa-
* dzania danych ? --

     LDA BUFF
     CMP #$9B
     BEQ IEND

*- zamien na bajt --

     LDX <BUFF
     LDY >BUFF
     JSR ATOI
     LDY #0
     STA (PTR),Y

*- przesun PTR -----

     INC PTR
     BNE *+4
     INC PTR+1
     JMP ILOP

*wyszukaj najmniej-
*szy element w ciagu

IEND INC PTR
     BNE *+4
     INC PTR+1
     LDA PTR
     STA LAST
     LDA PTR+1
     STA LAST+1

*-------------------

     LDA <FREE
     STA PTR
     LDA >FREE
     STA PTR+1

     LDA FREE
     STA MIN

*- petla wyszukujaca

SLOP LDA PTR
     CMP LAST
     BNE OK
     LDA PTR+1
     CMP LAST+1
     BNE OK
     JMP SEND

*- porownaj elementy
*- ciagu -----------

OK   LDY #0
     LDA (PTR),Y
     CMP MIN
     BCS INCR

*znaleziono mniejszy

     STA MIN

*-------------------

INCR INC PTR
     BNE *+4
     INC PTR+1
     JMP SLOP

*- przeszukano ciag

SEND LDA #9
     STA EDIT+2
     LDA <FINM
     STA EDIT+4
     LDA >FINM
     STA EDIT+5
     LDA <29
     STA EDIT+8
     LDA >29
     STA EDIT+9
     LDX #0
     JSR CIOV

* wyswietl minimalny

     LDA MIN
     JSR DSPD

*- koniec ----------

     JMP (DOS)

*- komunikaty ------

PROMPT EQU *

     DTA C'? '

HELP EQU *

     DTA B($7D)
     DTA B($9B)
     DTA C'Wprowadz'
     DTA C' kolejno'
     DTA C' wyrazy '
     DTA C'ciagu.  '
     DTA B($9B)
     DTA C'Nacisnij'
     DTA C' tylko R'
     DTA C'ETURN ab'
     DTA C'y zakonc'
     DTA C'zyc '
     DTA B($9B)
     DTA C'pro'
     DTA C'wadzanie'
     DTA C'danych. '
     DTA B($9B)

FINM EQU *

     DTA C'Najmniej'
     DTA C'szy elem'
     DTA C'ent ciag'
     DTA C'gu = '


*- wolna pamiec ----

BUFF EQU *

FREE EQU *+5

     END
