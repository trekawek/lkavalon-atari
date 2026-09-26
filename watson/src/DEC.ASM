* hex-dec conversion

CONV EQU *
     LDA #3
     JSR OPENW
     LDX #10
     LDY #9
     JSR SETPOS
     JSR PRINT
 DTA D'00000=$0000',B($5B)
     LDY #$0
     STY HLP1
     STY HLP2
     LDY #0
GCK  TYA
     PHA
     LDY #10
     LDA HLP1
     JSR DSPB
     LDA HLP2
     JSR DSPB
     LDY #4
     LDA HLP1
     STA TMP+3
     LDA HLP2
     STA TMP+4
     JSR BID2
     LDA TMP
     JSR DSPB
     LDA TMP+1
     JSR DSPB
     LDA TMP+2
     JSR DSPD
     PLA
     TAY
     JSR GETKEY
     AND #$3F
     CMP #44
     BNE *+5
     JMP TAB
     CMP #28
     BNE *+5
     JMP CVEN
     CMP #12
     BNE *+5
     JMP CVEN
     CMP #33
     BEQ AAAB
     CMP #6
     BNE M7
     JSR CRLF
     JMP GCK
M7   CMP #7
     BNE DIG
AAAB JSR CRT
     JMP GCK
DIG  TAX
     LDA $FB51,X
     JSR XGET
     BCC *+5
     JMP GCK
     CPY #7
     BMI DECC
     CPY #9
     BMI *+6
     LDX #0
     BEQ *+4
     LDX #1
     PHA
     TYA
     LSR @
     BCC FIST
     PLA
     ASL @
     ASL @
     ASL @
     ASL @
     PHA
     LDA HLP1,X
     AND #$0F
     STA HLP1,X
     PLA
     ORA HLP1,X
     STA HLP1,X
     JSR CRT
     JMP GCK
FIST LDA HLP1,X
     AND #$F0
     STA HLP1,X
     PLA
     ORA HLP1,X
     STA HLP1,X
     JSR CRT
     JMP GCK

DECC CMP #10
     BMI *+5
     JMP GCK
     ORA #$10
     STA (SCRA),Y
     JSR TODC
     JSR CRT
     JMP GCK
*- moves of cursor -
*--- cursor left ---
CRLF CPY #0
     BNE *+3
     RTS
     CPY #7
     BNE *+4
     DEY
     DEY
     DEY
     RTS
*-- cursor right --
CRT CPY #10
     BNE *+3
     RTS
     CPY #4
     BNE *+4
     INY
     INY
     INY
     RTS
*- decimal to binary
TODC EQU *
     TYA
     PHA
     LDY #0
     STY TMP
     STY TMP+1
CLHP JSR MULT
     BCS OVER
     LDA (SCRA),Y
     AND #$0F
     ADC TMP
     STA TMP
     BCC *+4
     INC TMP+1
     INY
     CPY #5
     BNE CLHP
     LDA TMP
     STA HLP1
     LDA TMP+1
     STA HLP2
     PLA
     TAY
     RTS
OVER LDA #0
     STA HLP1
     STA HLP2
     PLA
     TAY
     RTS
*----- 10 X -------
MULT LDA TMP+1
     PHA
     LDA TMP
     PHA
     ASL TMP
     ROL TMP+1
     BCS RET
     ASL TMP
     ROL TMP+1
     BCS RET
     CLC
     PLA
     ADC TMP
     STA TMP
     PLA
     ADC TMP+1
     STA TMP+1
     ASL TMP
     ROL TMP+1
     RTS
RET  PLA
     PLA
     RTS
CVEN LDA #3
     JMP CLOSEW

TAB  CPY #7
     BCC MNIE
     LDY #0
     JMP GCK
MNIE LDY #7
     JMP GCK
