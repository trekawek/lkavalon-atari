     opt h+
SCRA EQU $D0
SP   EQU $FB
DATA EQU $A5
TXRG EQU $FD

*-------------------

     ORG $9200

     JMP OPEN
     JMP CLOSE
     JMP PRINT
     JMP SPOS

PARM EQU *

XPOS DTA B(0)
YPOS DTA B(0)
WIDT DTA B(0)
HEIG DTA B(0)

*- print text ------

PRINT EQU *

     PLA
     STA DATA
     PLA
     STA DATA+1
     JSR INCD
     LDX #0
     LDY #0
PRLP LDA (DATA,X)
     CMP #$40
     BEQ LFD
     CMP #$5B
     BEQ PEND
     STA (SCRA),Y
     INY
     JSR INCD
     JMP PRLP
LFD  JSR NXLN
     JSR INCD
     LDY #0
     JMP PRLP
PEND JSR INCD
     JMP (DATA)

*- inc DATA pointer

INCD INC DATA
     BNE *+4
     INC DATA+1
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
     RTS

*- open window -----

OPEN EQU *

     PLA
     STA DATA
     PLA
     STA DATA+1
     JSR INCD
*- get parameters --
     LDX #0
     LDY #0
GWPA LDA (DATA,X)
     STA PARM,Y
     JSR INCD
     INY
     CPY #4
     BNE GWPA
*- set scrn position
     LDX XPOS
     LDY YPOS
     JSR SPOS
*-------------------
     LDA 20
     CMP 20
     BEQ *-2
*- store and clear -
     LDX HEIG
     INX
WWLP LDY WIDT
     INY
OLLP LDA (SCRA),Y
*-------------------
     STX TXRG
     TAX
     LDA SP
     BNE *+4
     DEC SP+1
     DEC SP
     TXA
     LDX #0
     STA (SP,X)
     LDX TXRG
*-------------------
     LDA #0
     STA (SCRA),Y
     DEY
     BPL OLLP
     JSR NXLN
     DEX
     BPL WWLP
*-------------------
     LDX XPOS
     LDY YPOS
     JSR SPOS
*- create frames ---
     LDX #2
     JSR LINE
     LDA HEIG
     STA TXRG
FRLP LDX #5
     JSR LINE
     DEC TXRG
     BNE FRLP
     LDX #8
     JSR LINE
*-------------------
     JSR STOR
     LDX XPOS
     INX
     LDY YPOS
     INY
     JSR SPOS
     JMP (DATA) ; exit
*-------------------
LINE EQU *
     LDY WIDT
     INY
     LDA FDEF,X
     STA (SCRA),Y
     DEY
     DEX
     LDA FDEF,X
LIN1 STA (SCRA),Y
     DEY
     BNE LIN1
     DEX
     LDA FDEF,X
     STA (SCRA),Y
     JMP NXLN

*-------------------

FDEF EQU *

     DTA B($46),B($4D),B($47)
     DTA B($56),D' ',B($42)
     DTA B($47),B($4E),B($46)

*-------------------

PUSH EQU *

     STX TXRG
     TAX
     LDA SP
     BNE *+4
     DEC SP+1
     DEC SP
     TXA
     LDX #0
     STA (SP,X)
     LDX TXRG
     RTS

*-------------------

POP  EQU *

     STX TXRG
     LDX #0
     LDA (SP,X)
     TAX
     INC SP
     BNE *+4
     INC SP+1
     TXA
     LDX TXRG
     RTS

*- close window ----

CLOSE EQU *

     JSR RESP
*-------------------
     LDX XPOS
     LDA YPOS
     SEC ; +1
     ADC HEIG
     TAY
     JSR SPOS
*-------------------
     LDX HEIG
     INX
RWLP LDY #0
ROLP EQU *
*-------------------
     STX TXRG
     LDX #0
     LDA (SP,X)
     TAX
     INC SP
     BNE *+4
     INC SP+1
     TXA
     LDX TXRG
*-------------------
     STA (SCRA),Y
     INY
     SEC
     TYA
     SBC #2
     CMP WIDT
     BNE ROLP
     SEC
     LDA SCRA
     SBC #40
     STA SCRA
     BCS *+4
     DEC SCRA+1
     DEX
     BPL RWLP
*-------------------
     RTS

*- push win. param.

STOR EQU *
     LDX #3
SPRL LDA PARM,X
     JSR PUSH
     DEX
     BPL SPRL
     RTS

*- pull win. param.

RESP EQU *
     LDX #0
RPAR JSR POP
     STA PARM,X
     INX
     CPX #4
     BNE RPAR
     RTS

*-------------------

NXLN CLC
     LDA SCRA
     ADC #40
     STA SCRA
     BCC *+4
     INC SCRA+1
     RTS

     END
