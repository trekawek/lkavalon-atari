*--- print ---------

PRINT EQU *
     PLA
     STA STRP
     PLA
     STA STRP+1
     JSR NXCH
     LDX #0
     LDY #0
PRLP LDA (STRP,X)
     CMP #$40
     BEQ LFD
     CMP #$5B
     BEQ PEND
     STA (SCRA),Y
     INY
     JSR NXCH
     JMP PRLP
LFD  JSR NXLN
     JSR NXCH
     LDY #0
     JMP PRLP
PEND JSR NXCH
     JMP (STRP)
NXCH INC STRP
     BNE *+4
     INC STRP+1
     RTS

*--- bin to bcd ----

BIDC STA TMP+3
     LDA #0
     STA TMP+4
BID2 LDA #0
     STA TMP
     STA TMP+1
     STA TMP+2
     LDX #15
     SED
CVLP ASL TMP+3
     ROL TMP+4
     LDA TMP
     ADC TMP
     STA TMP
     LDA TMP+1
     ADC TMP+1
     STA TMP+1
     ROL TMP+2
     DEX
     BPL CVLP
     CLD
     RTS

*--- set scra ------

SETPOS EQU *
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

*--- open window ---

WIDT DTA D' '
HEIG DTA D' '
WPOS DTA D'  '

OPENW EQU *
     JSR SETW
     STX STRP
     STY STRP+1
     LDY #0
     LDA (STRP),Y
     STA WPOS
     TAX
     INY
     LDA (STRP),Y
     STA WPOS+1
     TAY
     JSR SETPOS
     LDY #2
     LDA (STRP),Y
     STA SMEM
     INY
     LDA (STRP),Y
     STA SMEM+1
     INY
     LDA (STRP),Y
     STA WIDT
     INY
     LDA (STRP),Y
     TAX
     STX HEIG
     DEX
*--- store ---------
NEXT LDY WIDT
     DEY
STOR LDA (SCRA),Y
     STA (SMEM),Y
     LDA #0
     STA (SCRA),Y
     DEY
     BPL STOR
     JSR NXLN
     CLC
     LDA WIDT
     ADC SMEM
     STA SMEM
     BCC *+4
     INC SMEM+1
     DEX
     BPL NEXT
*--- make frame ----
     LDX WPOS
     LDY WPOS+1
     JSR SETPOS
     LDY WIDT
     DEY
     LDA #82
UPLN STA (SCRA),Y
     DEY
     BPL UPLN
     LDA #81
     LDY #0
     STA (SCRA),Y
     LDY WIDT
     DEY
     LDA #69
     STA (SCRA),Y
     JSR NXLN
     LDX HEIG
     DEX
     DEX
     DEX
LINE LDA #124
     LDY #0
     STA (SCRA),Y
     LDY WIDT
     DEY
     STA (SCRA),Y
     JSR NXLN
     DEX
     BPL LINE
     LDA #82
     LDY WIDT
     DEY
BTLN STA (SCRA),Y
     DEY
     BPL BTLN
     LDA #90
     LDY #0
     STA (SCRA),Y
     LDA #67
     LDY WIDT
     DEY
     STA (SCRA),Y
     RTS

*--- close window --

CLOSEW EQU *
     JSR SETW
     STX STRP
     STY STRP+1
     LDY #0
     LDA (STRP),Y
     TAX
     INY
     LDA (STRP),Y
     TAY
     JSR SETPOS
     LDY #2
     LDA (STRP),Y
     STA SMEM
     INY
     LDA (STRP),Y
     STA SMEM+1
     INY
     LDA (STRP),Y
     STA WIDT
     INY
     LDA (STRP),Y
     TAX
     DEX
NXTL LDY WIDT
     DEY
REST LDA (SMEM),Y
     STA (SCRA),Y
     DEY
     BPL REST
     JSR NXLN
     CLC
     LDA WIDT
     ADC SMEM
     STA SMEM
     BCC *+4
     INC SMEM+1
     DEX
     BPL NXTL
     RTS

*-------------------

NXLN CLC
     LDA SCRA
     ADC #40
     STA SCRA
     BCC *+4
     INC SCRA+1
     RTS

*--- set window par.

SETW STA CHAR
     ASL @
     CLC
     ADC CHAR
     ASL @
     CLC
     ADC <WNBAS
     TAX
     LDA #0
     ADC >WNBAS
     TAY
     RTS

GETK EQU *

     LDA #$FF
     STA 764
QLPP LDA 764
     CMP #$FF
     BEQ QLPP
     JMP $F983

GETKEY EQU *

     LDA #$FF
     STA 764
     LDA (SCRA),Y
     STA CHAR
     EOR #$80
     STA (SCRA),Y
QQPP LDX #0
     STX 20
PUPA LDX 764
     CPX #$FF
     BNE VON
     LDX 20
     CPX #5
     BMI PUPA
     EOR #$80
     STA (SCRA),Y
     JMP QQPP
VON  LDA CHAR
     STA (SCRA),Y
     TXA
     CMP #$27
     BEQ TOGI
     CMP #$3C
     BEQ *+5
     JMP $F983
     LDA SHFL
     EOR #$FF
     STA SHFL
     JMP GETKEY
TOGI LDA INVF
     EOR #$80
     STA INVF
     JMP GETKEY
