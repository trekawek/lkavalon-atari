( Wladcy Ciemnosci v1 10-kernel.fth: target 0E80..2A75 )
( Hexadecimal. BYTES emits bytes; CELL emits 16-bit cells. )
( LIT8/LIT16 compile literals; branches retain signed )
( offsets. )
3 T-DISK
0E80 T-ORG
( Boot loader, copy-protection bypass and cold-start )
( settings )
BYTES 00F2800EEB1E2065E4A900850AA90F850BA9768DE702850EA92A8DE8
BYTES 02850F18D8600000000000000000000000000000AD0B03C903D017AD
BYTES 0A03C98BD008A0908C0303843060A0018C03038430604C53E4000000
BYTES 0000000020556E70726F2D20746563742062793A2047554D49202620
BYTES 204B524157434F200000000000000000EA4CF51EEA4C221F0400D25E
BYTES 15877E008004BC00FF0100011F000100588758878A2A0000000000

( LIT | NFA 0F27 CFA 0F2D )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 0F27
( Header: flags, saved name and link )
BYTES 834C49D40000
CELL 0F2F ( native entry point )
BYTES B1CA ( 0F2F: LDA [$ca],Y )
BYTES 48 ( 0F31: PHA )
BYTES E6CA ( 0F32: INC $ca )
BYTES D002 ( 0F34: BNE $0f38 )
BYTES E6CB ( 0F36: INC $cb )
BYTES B1CA ( 0F38: LDA [$ca],Y )
BYTES E6CA ( 0F3A: INC $ca )
BYTES D002 ( 0F3C: BNE $0f40 )
BYTES E6CB ( 0F3E: INC $cb )
BYTES CA ( 0F40: DEX )
BYTES CA ( 0F41: DEX )
BYTES 9501 ( 0F42: STA $01,X )
BYTES 68 ( 0F44: PLA )
BYTES 9500 ( 0F45: STA $00,X )
BYTES A001 ( 0F47: LDY #$01 )
BYTES B1CA ( 0F49: LDA [$ca],Y )
BYTES 85CE ( 0F4B: STA $ce )
BYTES 88 ( 0F4D: DEY )
BYTES B1CA ( 0F4E: LDA [$ca],Y )
BYTES 85CD ( 0F50: STA $cd )
BYTES 18 ( 0F52: CLC )
BYTES A5CA ( 0F53: LDA $ca )
BYTES 6902 ( 0F55: ADC #$02 )
BYTES 85CA ( 0F57: STA $ca )
BYTES 9002 ( 0F59: BCC $0f5d )
BYTES E6CB ( 0F5B: INC $cb )
BYTES 4CCC00 ( 0F5D: JMP $00cc )
AT 0F60

( CLIT | NFA 0F60 CFA 0F67 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 0F60
( Header: flags, saved name and link )
BYTES 84000000D4270F
CELL 0F69 ( native entry point )
BYTES B1CA ( 0F69: LDA [$ca],Y )
BYTES 48 ( 0F6B: PHA )
BYTES 98 ( 0F6C: TYA )
BYTES F0CB ( 0F6D: BEQ $0f3a )
BYTES 0A ( 0F6F: ASL A )
BYTES 85C1 ( 0F70: STA $c1 )
BYTES B500 ( 0F72: LDA $00,X )
BYTES 99C200 ( 0F74: STA $00c2,Y )
BYTES E8 ( 0F77: INX )
BYTES C8 ( 0F78: INY )
BYTES C4C1 ( 0F79: CPY $c1 )
BYTES D0F5 ( 0F7B: BNE $0f72 )
BYTES A000 ( 0F7D: LDY #$00 )
BYTES 60 ( 0F7F: RTS )
AT 0F80

( EXECUTE | NFA 0F80 CFA 0F8A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 0F80
( Header: flags, saved name and link )
BYTES 87000000000000C5600F
CELL 0F8C ( native entry point )
BYTES B500 ( 0F8C: LDA $00,X )
BYTES 85CD ( 0F8E: STA $cd )
BYTES B501 ( 0F90: LDA $01,X )
BYTES 85CE ( 0F92: STA $ce )
BYTES E8 ( 0F94: INX )
BYTES E8 ( 0F95: INX )
BYTES 4CCC00 ( 0F96: JMP $00cc )
AT 0F99

( BRANCH | NFA 0F99 CFA 0FA2 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 0F99
( Header: flags, saved name and link )
BYTES 860000000000C8800F
CELL 0FA4 ( native entry point )
BYTES 18 ( 0FA4: CLC )
BYTES B1CA ( 0FA5: LDA [$ca],Y )
BYTES 65CA ( 0FA7: ADC $ca )
BYTES 48 ( 0FA9: PHA )
BYTES C8 ( 0FAA: INY )
BYTES B1CA ( 0FAB: LDA [$ca],Y )
BYTES 65CB ( 0FAD: ADC $cb )
BYTES 85CB ( 0FAF: STA $cb )
BYTES 68 ( 0FB1: PLA )
BYTES 85CA ( 0FB2: STA $ca )
BYTES 4C490F ( 0FB4: JMP $0f49 )
AT 0FB7

( 0BRANCH | NFA 0FB7 CFA 0FC1 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 0FB7
( Header: flags, saved name and link )
BYTES 87000000000000C8990F
CELL 0FC3 ( native entry point )
BYTES E8 ( 0FC3: INX )
BYTES E8 ( 0FC4: INX )
BYTES B5FE ( 0FC5: LDA $fe,X )
BYTES 15FF ( 0FC7: ORA $ff,X )
BYTES F0D9 ( 0FC9: BEQ $0fa4 )
BYTES 18 ( 0FCB: CLC )
BYTES A5CA ( 0FCC: LDA $ca )
BYTES 6902 ( 0FCE: ADC #$02 )
BYTES 85CA ( 0FD0: STA $ca )
BYTES 9002 ( 0FD2: BCC $0fd6 )
BYTES E6CB ( 0FD4: INC $cb )
BYTES 4C470F ( 0FD6: JMP $0f47 )
AT 0FD9

( [LOOP] | NFA 0FD9 CFA 0FE2 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 0FD9
( Header: flags, saved name and link )
BYTES 860000000000A9B70F
CELL 0FE4 ( native entry point )
BYTES 86D1 ( 0FE4: STX $d1 )
BYTES BA ( 0FE6: TSX )
BYTES FE0101 ( 0FE7: INC $0101,X )
BYTES D003 ( 0FEA: BNE $0fef )
BYTES FE0201 ( 0FEC: INC $0102,X )
BYTES 18 ( 0FEF: CLC )
BYTES BD0301 ( 0FF0: LDA $0103,X )
BYTES FD0101 ( 0FF3: SBC $0101,X )
BYTES BD0401 ( 0FF6: LDA $0104,X )
BYTES FD0201 ( 0FF9: SBC $0102,X )
BYTES A6D1 ( 0FFC: LDX $d1 )
BYTES 0A ( 0FFE: ASL A )
BYTES 90A3 ( 0FFF: BCC $0fa4 )
BYTES 68 ( 1001: PLA )
BYTES 68 ( 1002: PLA )
BYTES 68 ( 1003: PLA )
BYTES 68 ( 1004: PLA )
BYTES 4CCB0F ( 1005: JMP $0fcb )
AT 1008

( [+LOOP] | NFA 1008 CFA 1012 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1008
( Header: flags, saved name and link )
BYTES 87000000000000A9D90F
CELL 1014 ( native entry point )
BYTES E8 ( 1014: INX )
BYTES E8 ( 1015: INX )
BYTES 86D1 ( 1016: STX $d1 )
BYTES B5FF ( 1018: LDA $ff,X )
BYTES 48 ( 101A: PHA )
BYTES 48 ( 101B: PHA )
BYTES B5FE ( 101C: LDA $fe,X )
BYTES BA ( 101E: TSX )
BYTES E8 ( 101F: INX )
BYTES E8 ( 1020: INX )
BYTES 18 ( 1021: CLC )
BYTES 7D0101 ( 1022: ADC $0101,X )
BYTES 9D0101 ( 1025: STA $0101,X )
BYTES 68 ( 1028: PLA )
BYTES 7D0201 ( 1029: ADC $0102,X )
BYTES 9D0201 ( 102C: STA $0102,X )
BYTES 68 ( 102F: PLA )
BYTES 10BD ( 1030: BPL $0fef )
BYTES 18 ( 1032: CLC )
BYTES BD0101 ( 1033: LDA $0101,X )
BYTES FD0301 ( 1036: SBC $0103,X )
BYTES BD0201 ( 1039: LDA $0102,X )
BYTES FD0401 ( 103C: SBC $0104,X )
BYTES 4CFC0F ( 103F: JMP $0ffc )
AT 1042

( [DO] | NFA 1042 CFA 1049 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1042
( Header: flags, saved name and link )
BYTES 84000000A90810
CELL 104B ( native entry point )
BYTES B503 ( 104B: LDA $03,X )
BYTES 48 ( 104D: PHA )
BYTES B502 ( 104E: LDA $02,X )
BYTES 48 ( 1050: PHA )
BYTES B501 ( 1051: LDA $01,X )
BYTES 48 ( 1053: PHA )
BYTES B500 ( 1054: LDA $00,X )
BYTES 48 ( 1056: PHA )
BYTES E8 ( 1057: INX )
BYTES E8 ( 1058: INX )
BYTES E8 ( 1059: INX )
BYTES E8 ( 105A: INX )
BYTES 4C470F ( 105B: JMP $0f47 )
AT 105E

( I | NFA 105E CFA 1062 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 105E
( Header: flags, saved name and link )
BYTES 81C94210
CELL 12CA ( native entry point )
AT 1064

( DIGIT | NFA 1064 CFA 106C )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1064
( Header: flags, saved name and link )
BYTES 8500000000D45E10
CELL 106E ( native entry point )
BYTES 38 ( 106E: SEC )
BYTES B502 ( 106F: LDA $02,X )
BYTES E930 ( 1071: SBC #$30 )
BYTES 3018 ( 1073: BMI $108d )
BYTES C90A ( 1075: CMP #$0a )
BYTES 3007 ( 1077: BMI $1080 )
BYTES 38 ( 1079: SEC )
BYTES E907 ( 107A: SBC #$07 )
BYTES C90A ( 107C: CMP #$0a )
BYTES 300D ( 107E: BMI $108d )
BYTES D500 ( 1080: CMP $00,X )
BYTES 1009 ( 1082: BPL $108d )
BYTES 9502 ( 1084: STA $02,X )
BYTES A901 ( 1086: LDA #$01 )
BYTES 48 ( 1088: PHA )
BYTES 98 ( 1089: TYA )
BYTES 4C420F ( 108A: JMP $0f42 )
BYTES 98 ( 108D: TYA )
BYTES 48 ( 108E: PHA )
BYTES E8 ( 108F: INX )
BYTES E8 ( 1090: INX )
BYTES 4C420F ( 1091: JMP $0f42 )
AT 1094

( [FIND] | NFA 1094 CFA 109D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1094
( Header: flags, saved name and link )
BYTES 860000000000A96410
CELL 109F ( native entry point )
BYTES A902 ( 109F: LDA #$02 )
BYTES 206F0F ( 10A1: JSR $0f6f )
BYTES 86D1 ( 10A4: STX $d1 )
BYTES A000 ( 10A6: LDY #$00 )
BYTES B1C2 ( 10A8: LDA [$c2],Y )
BYTES 51C4 ( 10AA: EOR [$c4],Y )
BYTES 293F ( 10AC: AND #$3f )
BYTES D02D ( 10AE: BNE $10dd )
BYTES C8 ( 10B0: INY )
BYTES B1C2 ( 10B1: LDA [$c2],Y )
BYTES 51C4 ( 10B3: EOR [$c4],Y )
BYTES 0A ( 10B5: ASL A )
BYTES D023 ( 10B6: BNE $10db )
BYTES 90F6 ( 10B8: BCC $10b0 )
BYTES A6D1 ( 10BA: LDX $d1 )
BYTES CA ( 10BC: DEX )
BYTES CA ( 10BD: DEX )
BYTES CA ( 10BE: DEX )
BYTES CA ( 10BF: DEX )
BYTES 18 ( 10C0: CLC )
BYTES 98 ( 10C1: TYA )
BYTES 6905 ( 10C2: ADC #$05 )
BYTES 65C2 ( 10C4: ADC $c2 )
BYTES 9502 ( 10C6: STA $02,X )
BYTES A000 ( 10C8: LDY #$00 )
BYTES 98 ( 10CA: TYA )
BYTES 65C3 ( 10CB: ADC $c3 )
BYTES 9503 ( 10CD: STA $03,X )
BYTES 9401 ( 10CF: STY $01,X )
BYTES B1C2 ( 10D1: LDA [$c2],Y )
BYTES 9500 ( 10D3: STA $00,X )
BYTES A901 ( 10D5: LDA #$01 )
BYTES 48 ( 10D7: PHA )
BYTES 4C400F ( 10D8: JMP $0f40 )
BYTES B005 ( 10DB: BCS $10e2 )
BYTES C8 ( 10DD: INY )
BYTES B1C2 ( 10DE: LDA [$c2],Y )
BYTES 10FB ( 10E0: BPL $10dd )
BYTES C8 ( 10E2: INY )
BYTES B1C2 ( 10E3: LDA [$c2],Y )
BYTES AA ( 10E5: TAX )
BYTES C8 ( 10E6: INY )
BYTES B1C2 ( 10E7: LDA [$c2],Y )
BYTES 85C3 ( 10E9: STA $c3 )
BYTES 86C2 ( 10EB: STX $c2 )
BYTES 05C2 ( 10ED: ORA $c2 )
BYTES D0B5 ( 10EF: BNE $10a6 )
BYTES A6D1 ( 10F1: LDX $d1 )
BYTES A900 ( 10F3: LDA #$00 )
BYTES 48 ( 10F5: PHA )
BYTES 4C400F ( 10F6: JMP $0f40 )
AT 10F9

( ENCLOSE | NFA 10F9 CFA 1103 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 10F9
( Header: flags, saved name and link )
BYTES 87000000000000C59410
CELL 1105 ( native entry point )
BYTES A902 ( 1105: LDA #$02 )
BYTES 206F0F ( 1107: JSR $0f6f )
BYTES 8A ( 110A: TXA )
BYTES 38 ( 110B: SEC )
BYTES E908 ( 110C: SBC #$08 )
BYTES AA ( 110E: TAX )
BYTES 9403 ( 110F: STY $03,X )
BYTES 9401 ( 1111: STY $01,X )
BYTES 88 ( 1113: DEY )
BYTES C8 ( 1114: INY )
BYTES B1C4 ( 1115: LDA [$c4],Y )
BYTES C5C2 ( 1117: CMP $c2 )
BYTES F0F9 ( 1119: BEQ $1114 )
BYTES 9404 ( 111B: STY $04,X )
BYTES B1C4 ( 111D: LDA [$c4],Y )
BYTES D00E ( 111F: BNE $112f )
BYTES 9402 ( 1121: STY $02,X )
BYTES 9400 ( 1123: STY $00,X )
BYTES 98 ( 1125: TYA )
BYTES D504 ( 1126: CMP $04,X )
BYTES D002 ( 1128: BNE $112c )
BYTES F602 ( 112A: INC $02,X )
BYTES 4C470F ( 112C: JMP $0f47 )
BYTES 9402 ( 112F: STY $02,X )
BYTES C8 ( 1131: INY )
BYTES C5C2 ( 1132: CMP $c2 )
BYTES D0E7 ( 1134: BNE $111d )
BYTES 9400 ( 1136: STY $00,X )
BYTES 4C470F ( 1138: JMP $0f47 )
AT 113B

( EMIT | NFA 113B CFA 1142 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 113B
( Header: flags, saved name and link )
BYTES 84000000D4F910
CELL 2306 ( native entry point )
AT 1144

( KEY | NFA 1144 CFA 114A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1144
( Header: flags, saved name and link )
BYTES 830000D93B11
CELL 2344 ( native entry point )
AT 114C

( ?TERMINAL | NFA 114C CFA 1158 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 114C
( Header: flags, saved name and link )
BYTES 890000000000000000CC4411
CELL 2364 ( native entry point )
AT 115A

( CR | NFA 115A CFA 115F )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 115A
( Header: flags, saved name and link )
BYTES 8200D24C11
CELL 2370 ( native entry point )
AT 1161

( CMOVE | NFA 1161 CFA 1169 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1161
( Header: flags, saved name and link )
BYTES 8500000000C55A11
CELL 116B ( native entry point )
BYTES A903 ( 116B: LDA #$03 )
BYTES 206F0F ( 116D: JSR $0f6f )
BYTES C4C2 ( 1170: CPY $c2 )
BYTES D007 ( 1172: BNE $117b )
BYTES C6C3 ( 1174: DEC $c3 )
BYTES 1003 ( 1176: BPL $117b )
BYTES 4C470F ( 1178: JMP $0f47 )
BYTES B1C6 ( 117B: LDA [$c6],Y )
BYTES 91C4 ( 117D: STA [$c4],Y )
BYTES C8 ( 117F: INY )
BYTES D0EE ( 1180: BNE $1170 )
BYTES E6C7 ( 1182: INC $c7 )
BYTES E6C5 ( 1184: INC $c5 )
BYTES 4C7011 ( 1186: JMP $1170 )
AT 1189

( U* | NFA 1189 CFA 118E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1189
( Header: flags, saved name and link )
BYTES 8200AA6111
CELL 1190 ( native entry point )
BYTES B502 ( 1190: LDA $02,X )
BYTES 85C2 ( 1192: STA $c2 )
BYTES 9402 ( 1194: STY $02,X )
BYTES B503 ( 1196: LDA $03,X )
BYTES 85C3 ( 1198: STA $c3 )
BYTES 9403 ( 119A: STY $03,X )
BYTES A010 ( 119C: LDY #$10 )
BYTES 1602 ( 119E: ASL $02,X )
BYTES 3603 ( 11A0: ROL $03,X )
BYTES 3600 ( 11A2: ROL $00,X )
BYTES 3601 ( 11A4: ROL $01,X )
BYTES 9013 ( 11A6: BCC $11bb )
BYTES 18 ( 11A8: CLC )
BYTES A5C2 ( 11A9: LDA $c2 )
BYTES 7502 ( 11AB: ADC $02,X )
BYTES 9502 ( 11AD: STA $02,X )
BYTES A5C3 ( 11AF: LDA $c3 )
BYTES 7503 ( 11B1: ADC $03,X )
BYTES 9503 ( 11B3: STA $03,X )
BYTES A900 ( 11B5: LDA #$00 )
BYTES 7500 ( 11B7: ADC $00,X )
BYTES 9500 ( 11B9: STA $00,X )
BYTES 88 ( 11BB: DEY )
BYTES D0E0 ( 11BC: BNE $119e )
BYTES 4C470F ( 11BE: JMP $0f47 )
AT 11C1

( U/ | NFA 11C1 CFA 11C6 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 11C1
( Header: flags, saved name and link )
BYTES 8200AF8911
CELL 11C8 ( native entry point )
BYTES B504 ( 11C8: LDA $04,X )
BYTES B402 ( 11CA: LDY $02,X )
BYTES 9404 ( 11CC: STY $04,X )
BYTES 0A ( 11CE: ASL A )
BYTES 9502 ( 11CF: STA $02,X )
BYTES B505 ( 11D1: LDA $05,X )
BYTES B403 ( 11D3: LDY $03,X )
BYTES 9405 ( 11D5: STY $05,X )
BYTES 2A ( 11D7: ROL A )
BYTES 9503 ( 11D8: STA $03,X )
BYTES A910 ( 11DA: LDA #$10 )
BYTES 85C2 ( 11DC: STA $c2 )
BYTES 3604 ( 11DE: ROL $04,X )
BYTES 3605 ( 11E0: ROL $05,X )
BYTES 38 ( 11E2: SEC )
BYTES B504 ( 11E3: LDA $04,X )
BYTES F500 ( 11E5: SBC $00,X )
BYTES A8 ( 11E7: TAY )
BYTES B505 ( 11E8: LDA $05,X )
BYTES F501 ( 11EA: SBC $01,X )
BYTES 9004 ( 11EC: BCC $11f2 )
BYTES 9404 ( 11EE: STY $04,X )
BYTES 9505 ( 11F0: STA $05,X )
BYTES 3602 ( 11F2: ROL $02,X )
BYTES 3603 ( 11F4: ROL $03,X )
BYTES C6C2 ( 11F6: DEC $c2 )
BYTES D0E4 ( 11F8: BNE $11de )
BYTES 4C5910 ( 11FA: JMP $1059 )
AT 11FD

( AND | NFA 11FD CFA 1203 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 11FD
( Header: flags, saved name and link )
BYTES 830000C4C111
CELL 1205 ( native entry point )
BYTES B500 ( 1205: LDA $00,X )
BYTES 3502 ( 1207: AND $02,X )
BYTES 48 ( 1209: PHA )
BYTES B501 ( 120A: LDA $01,X )
BYTES 3503 ( 120C: AND $03,X )
BYTES E8 ( 120E: INX )
BYTES E8 ( 120F: INX )
BYTES 4C420F ( 1210: JMP $0f42 )
AT 1213

( OR | NFA 1213 CFA 1218 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1213
( Header: flags, saved name and link )
BYTES 8200D2FD11
CELL 121A ( native entry point )
BYTES B500 ( 121A: LDA $00,X )
BYTES 1502 ( 121C: ORA $02,X )
BYTES 48 ( 121E: PHA )
BYTES B501 ( 121F: LDA $01,X )
BYTES 1503 ( 1221: ORA $03,X )
BYTES E8 ( 1223: INX )
BYTES E8 ( 1224: INX )
BYTES 4C420F ( 1225: JMP $0f42 )
AT 1228

( XOR | NFA 1228 CFA 122E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1228
( Header: flags, saved name and link )
BYTES 830000D21312
CELL 1230 ( native entry point )
BYTES B500 ( 1230: LDA $00,X )
BYTES 5502 ( 1232: EOR $02,X )
BYTES 48 ( 1234: PHA )
BYTES B501 ( 1235: LDA $01,X )
BYTES 5503 ( 1237: EOR $03,X )
BYTES E8 ( 1239: INX )
BYTES E8 ( 123A: INX )
BYTES 4C420F ( 123B: JMP $0f42 )
AT 123E

( SP@ | NFA 123E CFA 1244 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 123E
( Header: flags, saved name and link )
BYTES 830000C02812
CELL 1246 ( native entry point )
BYTES 8A ( 1246: TXA )
BYTES 48 ( 1247: PHA )
BYTES A900 ( 1248: LDA #$00 )
BYTES 4C400F ( 124A: JMP $0f40 )
AT 124D

( SP! | NFA 124D CFA 1253 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 124D
( Header: flags, saved name and link )
BYTES 830000A13E12
CELL 1255 ( native entry point )
BYTES A006 ( 1255: LDY #$06 )
BYTES B1CF ( 1257: LDA [$cf],Y )
BYTES AA ( 1259: TAX )
BYTES 4C470F ( 125A: JMP $0f47 )
AT 125D

( RP! | NFA 125D CFA 1263 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 125D
( Header: flags, saved name and link )
BYTES 830000A14D12
CELL 1265 ( native entry point )
BYTES 86D1 ( 1265: STX $d1 )
BYTES A008 ( 1267: LDY #$08 )
BYTES B1CF ( 1269: LDA [$cf],Y )
BYTES AA ( 126B: TAX )
BYTES 9A ( 126C: TXS )
BYTES A6D1 ( 126D: LDX $d1 )
BYTES 4C470F ( 126F: JMP $0f47 )
AT 1272

( ;S | NFA 1272 CFA 1277 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1272
( Header: flags, saved name and link )
BYTES 8200D35D12
CELL 1279 ( native entry point )
BYTES 68 ( 1279: PLA )
BYTES 85CA ( 127A: STA $ca )
BYTES 68 ( 127C: PLA )
BYTES 85CB ( 127D: STA $cb )
BYTES 4C470F ( 127F: JMP $0f47 )
AT 1282

( LEAVE | NFA 1282 CFA 128A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1282
( Header: flags, saved name and link )
BYTES 8500000000C57212
CELL 128C ( native entry point )
BYTES 86D1 ( 128C: STX $d1 )
BYTES BA ( 128E: TSX )
BYTES BD0101 ( 128F: LDA $0101,X )
BYTES 9D0301 ( 1292: STA $0103,X )
BYTES BD0201 ( 1295: LDA $0102,X )
BYTES 9D0401 ( 1298: STA $0104,X )
BYTES A6D1 ( 129B: LDX $d1 )
BYTES 4C470F ( 129D: JMP $0f47 )
AT 12A0

( >R | NFA 12A0 CFA 12A5 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 12A0
( Header: flags, saved name and link )
BYTES 8200D28212
CELL 12A7 ( native entry point )
BYTES B501 ( 12A7: LDA $01,X )
BYTES 48 ( 12A9: PHA )
BYTES B500 ( 12AA: LDA $00,X )
BYTES 48 ( 12AC: PHA )
BYTES E8 ( 12AD: INX )
BYTES E8 ( 12AE: INX )
BYTES 4C470F ( 12AF: JMP $0f47 )
AT 12B2

( R> | NFA 12B2 CFA 12B7 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 12B2
( Header: flags, saved name and link )
BYTES 8200BEA012
CELL 12B9 ( native entry point )
BYTES CA ( 12B9: DEX )
BYTES CA ( 12BA: DEX )
BYTES 68 ( 12BB: PLA )
BYTES 9500 ( 12BC: STA $00,X )
BYTES 68 ( 12BE: PLA )
BYTES 9501 ( 12BF: STA $01,X )
BYTES 4C470F ( 12C1: JMP $0f47 )
AT 12C4

( R | NFA 12C4 CFA 12C8 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 12C4
( Header: flags, saved name and link )
BYTES 81D2B212
CELL 12CA ( native entry point )
BYTES 86D1 ( 12CA: STX $d1 )
BYTES BA ( 12CC: TSX )
BYTES BD0101 ( 12CD: LDA $0101,X )
BYTES 48 ( 12D0: PHA )
BYTES BD0201 ( 12D1: LDA $0102,X )
BYTES A6D1 ( 12D4: LDX $d1 )
BYTES 4C400F ( 12D6: JMP $0f40 )
AT 12D9

( 0= | NFA 12D9 CFA 12DE )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 12D9
( Header: flags, saved name and link )
BYTES 8200BDC412
CELL 12E0 ( native entry point )
BYTES B500 ( 12E0: LDA $00,X )
BYTES 1501 ( 12E2: ORA $01,X )
BYTES 9401 ( 12E4: STY $01,X )
BYTES D001 ( 12E6: BNE $12e9 )
BYTES C8 ( 12E8: INY )
BYTES 9400 ( 12E9: STY $00,X )
BYTES 4C470F ( 12EB: JMP $0f47 )
AT 12EE

( 0< | NFA 12EE CFA 12F3 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 12EE
( Header: flags, saved name and link )
BYTES 8200BCD912
CELL 12F5 ( native entry point )
BYTES 1601 ( 12F5: ASL $01,X )
BYTES 98 ( 12F7: TYA )
BYTES 2A ( 12F8: ROL A )
BYTES 9401 ( 12F9: STY $01,X )
BYTES 9500 ( 12FB: STA $00,X )
BYTES 4C470F ( 12FD: JMP $0f47 )
AT 1300

( + | NFA 1300 CFA 1304 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 1300
( Header: flags, saved name and link )
BYTES 81ABEE12
CELL 1306 ( native entry point )
BYTES 18 ( 1306: CLC )
BYTES B500 ( 1307: LDA $00,X )
BYTES 7502 ( 1309: ADC $02,X )
BYTES 9502 ( 130B: STA $02,X )
BYTES B501 ( 130D: LDA $01,X )
BYTES 7503 ( 130F: ADC $03,X )
BYTES 9503 ( 1311: STA $03,X )
BYTES E8 ( 1313: INX )
BYTES E8 ( 1314: INX )
BYTES 4C470F ( 1315: JMP $0f47 )
AT 1318

( D+ | NFA 1318 CFA 131D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1318
( Header: flags, saved name and link )
BYTES 8200AB0013
CELL 131F ( native entry point )
BYTES 18 ( 131F: CLC )
BYTES B502 ( 1320: LDA $02,X )
BYTES 7506 ( 1322: ADC $06,X )
BYTES 9506 ( 1324: STA $06,X )
BYTES B503 ( 1326: LDA $03,X )
BYTES 7507 ( 1328: ADC $07,X )
BYTES 9507 ( 132A: STA $07,X )
BYTES B500 ( 132C: LDA $00,X )
BYTES 7504 ( 132E: ADC $04,X )
BYTES 9504 ( 1330: STA $04,X )
BYTES B501 ( 1332: LDA $01,X )
BYTES 7505 ( 1334: ADC $05,X )
BYTES 9505 ( 1336: STA $05,X )
BYTES 4C5710 ( 1338: JMP $1057 )
AT 133B

( MINUS | NFA 133B CFA 1343 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 133B
( Header: flags, saved name and link )
BYTES 8500000000D31813
CELL 1345 ( native entry point )
BYTES 38 ( 1345: SEC )
BYTES 98 ( 1346: TYA )
BYTES F500 ( 1347: SBC $00,X )
BYTES 9500 ( 1349: STA $00,X )
BYTES 98 ( 134B: TYA )
BYTES F501 ( 134C: SBC $01,X )
BYTES 9501 ( 134E: STA $01,X )
BYTES 4C470F ( 1350: JMP $0f47 )
AT 1353

( DMINUS | NFA 1353 CFA 135C )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1353
( Header: flags, saved name and link )
BYTES 860000000000D33B13
CELL 135E ( native entry point )
BYTES 38 ( 135E: SEC )
BYTES 98 ( 135F: TYA )
BYTES F502 ( 1360: SBC $02,X )
BYTES 9502 ( 1362: STA $02,X )
BYTES 98 ( 1364: TYA )
BYTES F503 ( 1365: SBC $03,X )
BYTES 9503 ( 1367: STA $03,X )
BYTES 4C4613 ( 1369: JMP $1346 )
AT 136C

( OVER | NFA 136C CFA 1373 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 136C
( Header: flags, saved name and link )
BYTES 84000000D25313
CELL 1375 ( native entry point )
BYTES B502 ( 1375: LDA $02,X )
BYTES 48 ( 1377: PHA )
BYTES B503 ( 1378: LDA $03,X )
BYTES 4C400F ( 137A: JMP $0f40 )
AT 137D

( DROP | NFA 137D CFA 1384 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 137D
( Header: flags, saved name and link )
BYTES 84000000D06C13
CELL 1059 ( native entry point )
AT 1386

( SWAP | NFA 1386 CFA 138D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1386
( Header: flags, saved name and link )
BYTES 84000000D07D13
CELL 138F ( native entry point )
BYTES B502 ( 138F: LDA $02,X )
BYTES 48 ( 1391: PHA )
BYTES B500 ( 1392: LDA $00,X )
BYTES 9502 ( 1394: STA $02,X )
BYTES B503 ( 1396: LDA $03,X )
BYTES B401 ( 1398: LDY $01,X )
BYTES 9403 ( 139A: STY $03,X )
BYTES 4C420F ( 139C: JMP $0f42 )
AT 139F

( DUP | NFA 139F CFA 13A5 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 139F
( Header: flags, saved name and link )
BYTES 830000D08613
CELL 13A7 ( native entry point )
BYTES B500 ( 13A7: LDA $00,X )
BYTES 48 ( 13A9: PHA )
BYTES B501 ( 13AA: LDA $01,X )
BYTES 4C400F ( 13AC: JMP $0f40 )
AT 13AF

( +! | NFA 13AF CFA 13B4 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 13AF
( Header: flags, saved name and link )
BYTES 8200A19F13
CELL 13B6 ( native entry point )
BYTES 18 ( 13B6: CLC )
BYTES A100 ( 13B7: LDA [$00,X] )
BYTES 7502 ( 13B9: ADC $02,X )
BYTES 8100 ( 13BB: STA [$00,X] )
BYTES F600 ( 13BD: INC $00,X )
BYTES D002 ( 13BF: BNE $13c3 )
BYTES F601 ( 13C1: INC $01,X )
BYTES A100 ( 13C3: LDA [$00,X] )
BYTES 7503 ( 13C5: ADC $03,X )
BYTES 8100 ( 13C7: STA [$00,X] )
BYTES 4C5710 ( 13C9: JMP $1057 )
AT 13CC

( TOGGLE | NFA 13CC CFA 13D5 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 13CC
( Header: flags, saved name and link )
BYTES 860000000000C5AF13
CELL 13D7 ( native entry point )
BYTES A102 ( 13D7: LDA [$02,X] )
BYTES 5500 ( 13D9: EOR $00,X )
BYTES 8102 ( 13DB: STA [$02,X] )
BYTES 4C5710 ( 13DD: JMP $1057 )
AT 13E0

( @ | NFA 13E0 CFA 13E4 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 13E0
( Header: flags, saved name and link )
BYTES 81C0CC13
CELL 13E6 ( native entry point )
BYTES A100 ( 13E6: LDA [$00,X] )
BYTES 48 ( 13E8: PHA )
BYTES F600 ( 13E9: INC $00,X )
BYTES D002 ( 13EB: BNE $13ef )
BYTES F601 ( 13ED: INC $01,X )
BYTES A100 ( 13EF: LDA [$00,X] )
BYTES 4C420F ( 13F1: JMP $0f42 )
AT 13F4

( C@ | NFA 13F4 CFA 13F9 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 13F4
( Header: flags, saved name and link )
BYTES 8200C0E013
CELL 13FB ( native entry point )
BYTES A100 ( 13FB: LDA [$00,X] )
BYTES 9500 ( 13FD: STA $00,X )
BYTES 9401 ( 13FF: STY $01,X )
BYTES 4C470F ( 1401: JMP $0f47 )
AT 1404

( ! | NFA 1404 CFA 1408 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 1404
( Header: flags, saved name and link )
BYTES 81A1F413
CELL 140A ( native entry point )
BYTES B502 ( 140A: LDA $02,X )
BYTES 8100 ( 140C: STA [$00,X] )
BYTES F600 ( 140E: INC $00,X )
BYTES D002 ( 1410: BNE $1414 )
BYTES F601 ( 1412: INC $01,X )
BYTES B503 ( 1414: LDA $03,X )
BYTES 8100 ( 1416: STA [$00,X] )
BYTES 4C5710 ( 1418: JMP $1057 )
AT 141B

( C! | NFA 141B CFA 1420 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 141B
( Header: flags, saved name and link )
BYTES 8200A10414
CELL 1422 ( native entry point )
BYTES B502 ( 1422: LDA $02,X )
BYTES 8100 ( 1424: STA [$00,X] )
BYTES 4C5710 ( 1426: JMP $1057 )
AT 1429

( : | NFA 1429 CFA 142D )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 1429
( Header: flags, saved name and link )
BYTES C1BA1B14
DOCOL
t.?EXEC t.!CSP t.CURRENT t.@ t.CONTEXT t.! t.CREATE t.]
t.(;CODE)
( Trailing native code/data at 1441; retained exactly )
BYTES A5CB48A5CA4818A5CD690285CA9865CE85CB4C470F
AT 1456

( ; | NFA 1456 CFA 145A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 1456
( Header: flags, saved name and link )
BYTES C1BB2914
DOCOL
t.?CSP t.COMPILE t.;S t.SMUDGE t.[ t.;S
AT 1468

( CONSTANT | NFA 1468 CFA 1473 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1468
( Header: flags, saved name and link )
BYTES 8800000000000000D45614
DOCOL
t.CREATE t.SMUDGE t., t.(;CODE)
( Trailing native code/data at 147D; retained exactly )
BYTES A002B1CD48C8B1CD4C400F
AT 1488

( VARIABLE | NFA 1488 CFA 1493 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1488
( Header: flags, saved name and link )
BYTES 8800000000000000C56814
DOCOL
t.CONSTANT t.(;CODE)
( Trailing native code/data at 1499; retained exactly )
BYTES 18A5CD6902489865CE4C400F
AT 14A5

( USER | NFA 14A5 CFA 14AC )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 14A5
( Header: flags, saved name and link )
BYTES 84000000D28814
DOCOL
t.CONSTANT t.(;CODE)
( Trailing native code/data at 14B2; retained exactly )
BYTES A00218B1CD65CF48A90065D04C400F
AT 14C1

( 0 | NFA 14C1 CFA 14C5 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 14C1
( Header: flags, saved name and link )
BYTES 81B0A514
DOCON
CELL 0000
AT 14C9

( 1 | NFA 14C9 CFA 14CD )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 14C9
( Header: flags, saved name and link )
BYTES 81B1C114
DOCON
CELL 0001
AT 14D1

( 2 | NFA 14D1 CFA 14D5 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 14D1
( Header: flags, saved name and link )
BYTES 81B2C914
DOCON
CELL 0002
AT 14D9

( 3 | NFA 14D9 CFA 14DD )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 14D9
( Header: flags, saved name and link )
BYTES 81B3D114
DOCON
CELL 0003
AT 14E1

( BL | NFA 14E1 CFA 14E6 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 14E1
( Header: flags, saved name and link )
BYTES 8200CCD914
DOCON
CELL 0020
AT 14EA

( C/L | NFA 14EA CFA 14F0 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 14EA
( Header: flags, saved name and link )
BYTES 830000CCE114
DOCON
CELL 0040
AT 14F4

( FIRST | NFA 14F4 CFA 14FC )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 14F4
( Header: flags, saved name and link )
BYTES 8500000000D4EA14
DOCON
CELL 0600
AT 1500

( LIMIT | NFA 1500 CFA 1508 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1500
( Header: flags, saved name and link )
BYTES 8500000000D4F414
DOCON
CELL 0E40
AT 150C

( B/BUF | NFA 150C CFA 1514 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 150C
( Header: flags, saved name and link )
BYTES 8500000000C60015
DOCON
CELL 0080
AT 1518

( B/SCR | NFA 1518 CFA 1520 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1518
( Header: flags, saved name and link )
BYTES 8500000000D20C15
DOCON
CELL 0008
AT 1524

( +ORIGIN | NFA 1524 CFA 152E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1524
( Header: flags, saved name and link )
BYTES 87000000000000CE1815
DOCOL
LIT16 0F00 t.+ t.;S
AT 1538

( TIB | NFA 1538 CFA 153E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1538
( Header: flags, saved name and link )
BYTES 830000C22415
DOUSER
BYTES 0A
AT 1541

( WIDTH | NFA 1541 CFA 1549 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1541
( Header: flags, saved name and link )
BYTES 8500000000C83815
DOUSER
BYTES 0C
AT 154C

( WARNING | NFA 154C CFA 1556 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 154C
( Header: flags, saved name and link )
BYTES 87000000000000C74115
DOUSER
BYTES 0E
AT 1559

( FENCE | NFA 1559 CFA 1561 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1559
( Header: flags, saved name and link )
BYTES 8500000000C54C15
DOUSER
BYTES 10
AT 1564

( DP | NFA 1564 CFA 1569 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1564
( Header: flags, saved name and link )
BYTES 8200D05915
DOUSER
BYTES 12
AT 156C

( VOC-LINK | NFA 156C CFA 1577 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 156C
( Header: flags, saved name and link )
BYTES 8800000000000000CB6415
DOUSER
BYTES 14
AT 157A

( BLK | NFA 157A CFA 1580 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 157A
( Header: flags, saved name and link )
BYTES 830000CB6C15
DOUSER
BYTES 16
AT 1583

( IN | NFA 1583 CFA 1588 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1583
( Header: flags, saved name and link )
BYTES 8200CE7A15
DOUSER
BYTES 18
AT 158B

( OUT | NFA 158B CFA 1591 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 158B
( Header: flags, saved name and link )
BYTES 830000D48315
DOUSER
BYTES 1A
AT 1594

( SCR | NFA 1594 CFA 159A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1594
( Header: flags, saved name and link )
BYTES 830000D28B15
DOUSER
BYTES 1C
AT 159D

( OFFSET | NFA 159D CFA 15A6 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 159D
( Header: flags, saved name and link )
BYTES 860000000000D49415
DOUSER
BYTES 1E
AT 15A9

( CONTEXT | NFA 15A9 CFA 15B3 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 15A9
( Header: flags, saved name and link )
BYTES 87000000000000D49D15
DOUSER
BYTES 20
AT 15B6

( CURRENT | NFA 15B6 CFA 15C0 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 15B6
( Header: flags, saved name and link )
BYTES 87000000000000D4A915
DOUSER
BYTES 22
AT 15C3

( STATE | NFA 15C3 CFA 15CB )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 15C3
( Header: flags, saved name and link )
BYTES 8500000000C5B615
DOUSER
BYTES 24
AT 15CE

( BASE | NFA 15CE CFA 15D5 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 15CE
( Header: flags, saved name and link )
BYTES 84000000C5C315
DOUSER
BYTES 26
AT 15D8

( DPL | NFA 15D8 CFA 15DE )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 15D8
( Header: flags, saved name and link )
BYTES 830000CCCE15
DOUSER
BYTES 28
AT 15E1

( FLD | NFA 15E1 CFA 15E7 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 15E1
( Header: flags, saved name and link )
BYTES 830000C4D815
DOUSER
BYTES 2A
AT 15EA

( CSP | NFA 15EA CFA 15F0 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 15EA
( Header: flags, saved name and link )
BYTES 830000D0E115
DOUSER
BYTES 2C
AT 15F3

( R# | NFA 15F3 CFA 15F8 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 15F3
( Header: flags, saved name and link )
BYTES 8200A3EA15
DOUSER
BYTES 2E
AT 15FB

( HLD | NFA 15FB CFA 1601 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 15FB
( Header: flags, saved name and link )
BYTES 830000C4F315
DOUSER
BYTES 30
AT 1604

( 1+ | NFA 1604 CFA 1609 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1604
( Header: flags, saved name and link )
BYTES 8200ABFB15
DOCOL
t.1 t.+ t.;S
AT 1611

( 2+ | NFA 1611 CFA 1616 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1611
( Header: flags, saved name and link )
BYTES 8200AB0416
DOCOL
t.2 t.+ t.;S
AT 161E

( HERE | NFA 161E CFA 1625 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 161E
( Header: flags, saved name and link )
BYTES 84000000C51116
DOCOL
t.DP t.@ t.;S
AT 162D

( ALLOT | NFA 162D CFA 1635 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 162D
( Header: flags, saved name and link )
BYTES 8500000000D41E16
DOCOL
t.DP t.+! t.;S
AT 163D

( , | NFA 163D CFA 1641 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 163D
( Header: flags, saved name and link )
BYTES 81AC2D16
DOCOL
t.HERE t.! t.2 t.ALLOT t.;S
AT 164D

( C, | NFA 164D CFA 1652 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 164D
( Header: flags, saved name and link )
BYTES 8200AC3D16
DOCOL
t.HERE t.C! t.1 t.ALLOT t.;S
AT 165E

( - | NFA 165E CFA 1662 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 165E
( Header: flags, saved name and link )
BYTES 81AD4D16
DOCOL
t.MINUS t.+ t.;S
AT 166A

( = | NFA 166A CFA 166E )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 166A
( Header: flags, saved name and link )
BYTES 81BD5E16
DOCOL
t.- t.0=_12DE t.;S
AT 1676

( U< | NFA 1676 CFA 167B )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1676
( Header: flags, saved name and link )
BYTES 8200BC6A16
DOCOL
t.2DUP t.XOR t.0<_12F3
t.0BRANCH CELL 000C ( -> 1691 )
t.DROP t.0<_12F3 t.0=_12DE
t.BRANCH CELL 0006 ( -> 1695 )
( label 1691 )
t.- t.0<_12F3
( label 1695 )
t.;S
AT 1697

( < | NFA 1697 CFA 169B )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 1697
( Header: flags, saved name and link )
BYTES 81BC7616
CELL 169D ( native entry point )
BYTES 38 ( 169D: SEC )
BYTES B502 ( 169E: LDA $02,X )
BYTES F500 ( 16A0: SBC $00,X )
BYTES B503 ( 16A2: LDA $03,X )
BYTES F501 ( 16A4: SBC $01,X )
BYTES 9403 ( 16A6: STY $03,X )
BYTES 5002 ( 16A8: BVC $16ac )
BYTES 4980 ( 16AA: EOR #$80 )
BYTES 1001 ( 16AC: BPL $16af )
BYTES C8 ( 16AE: INY )
BYTES 9402 ( 16AF: STY $02,X )
BYTES 4C5910 ( 16B1: JMP $1059 )
AT 16B4

( > | NFA 16B4 CFA 16B8 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 16B4
( Header: flags, saved name and link )
BYTES 81BE9716
DOCOL
t.SWAP t.< t.;S
AT 16C0

( ROT | NFA 16C0 CFA 16C6 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 16C0
( Header: flags, saved name and link )
BYTES 830000D4B416
DOCOL
t.>R t.SWAP t.R> t.SWAP t.;S
AT 16D2

( SPACE | NFA 16D2 CFA 16DA )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 16D2
( Header: flags, saved name and link )
BYTES 8500000000C5C016
DOCOL
t.BL t.EMIT t.;S
AT 16E2

( -DUP | NFA 16E2 CFA 16E9 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 16E2
( Header: flags, saved name and link )
BYTES 84000000D0D216
DOCOL
t.DUP
t.0BRANCH CELL 0004 ( -> 16F3 )
t.DUP
( label 16F3 )
t.;S
AT 16F5

( TRAVERSE | NFA 16F5 CFA 1700 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 16F5
( Header: flags, saved name and link )
BYTES 8800000000000000C5E216
DOCOL
t.SWAP
( label 1704 )
t.OVER t.+ LIT8 7F t.OVER t.C@ t.<
t.0BRANCH CELL FFF1 ( -> 1704 )
t.SWAP t.DROP t.;S
AT 171B

( LATEST | NFA 171B CFA 1724 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 171B
( Header: flags, saved name and link )
BYTES 860000000000D4F516
DOCOL
t.CURRENT t.@ t.@ t.;S
AT 172E

( LFA | NFA 172E CFA 1734 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 172E
( Header: flags, saved name and link )
BYTES 830000C11B17
DOCOL
LIT8 04 t.- t.;S
AT 173D

( CFA | NFA 173D CFA 1743 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 173D
( Header: flags, saved name and link )
BYTES 830000C12E17
DOCOL
t.2 t.- t.;S
AT 174B

( NFA | NFA 174B CFA 1751 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 174B
( Header: flags, saved name and link )
BYTES 830000C13D17
DOCOL
LIT8 05 t.- LIT16 FFFF t.TRAVERSE t.;S
AT 1760

( PFA | NFA 1760 CFA 1766 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1760
( Header: flags, saved name and link )
BYTES 830000C14B17
DOCOL
t.1 t.TRAVERSE LIT8 05 t.+ t.;S
AT 1773

( !CSP | NFA 1773 CFA 177A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1773
( Header: flags, saved name and link )
BYTES 84000000D06017
DOCOL
t.SP@ t.CSP t.! t.;S
AT 1784

( ?ERROR | NFA 1784 CFA 178D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1784
( Header: flags, saved name and link )
BYTES 860000000000D27317
DOCOL
t.SWAP
t.0BRANCH CELL 0008 ( -> 179B )
t.ERROR
t.BRANCH CELL 0004 ( -> 179D )
( label 179B )
t.DROP
( label 179D )
t.;S
AT 179F

( ?COMP | NFA 179F CFA 17A7 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 179F
( Header: flags, saved name and link )
BYTES 8500000000D08417
DOCOL
t.STATE t.@ t.0=_12DE LIT8 11 t.?ERROR t.;S
AT 17B6

( ?EXEC | NFA 17B6 CFA 17BE )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 17B6
( Header: flags, saved name and link )
BYTES 8500000000C39F17
DOCOL
t.STATE t.@ LIT8 12 t.?ERROR t.;S
AT 17CB

( ?PAIRS | NFA 17CB CFA 17D4 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 17CB
( Header: flags, saved name and link )
BYTES 860000000000D3B617
DOCOL
t.- LIT8 13 t.?ERROR t.;S
AT 17DF

( ?CSP | NFA 17DF CFA 17E6 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 17DF
( Header: flags, saved name and link )
BYTES 84000000D0CB17
DOCOL
t.SP@ t.CSP t.@ t.- LIT8 14 t.?ERROR t.;S
AT 17F7

( ?LOADING | NFA 17F7 CFA 1802 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 17F7
( Header: flags, saved name and link )
BYTES 8800000000000000C7DF17
DOCOL
t.BLK t.@ t.0=_12DE LIT8 16 t.?ERROR t.;S
AT 1811

( COMPILE | NFA 1811 CFA 181B )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1811
( Header: flags, saved name and link )
BYTES 87000000000000C5F717
DOCOL
t.?COMP t.R> t.DUP t.2+ t.>R t.@ t., t.;S
AT 182D

( [ | NFA 182D CFA 1831 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 182D
( Header: flags, saved name and link )
BYTES C1DB1118
DOCOL
t.0 t.STATE t.! t.;S
AT 183B

( ] | NFA 183B CFA 183F )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 183B
( Header: flags, saved name and link )
BYTES 81DD2D18
DOCOL
LIT8 C0 t.STATE t.! t.;S
AT 184A

( SMUDGE | NFA 184A CFA 1853 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 184A
( Header: flags, saved name and link )
BYTES 860000000000C53B18
DOCOL
t.LATEST LIT8 20 t.TOGGLE t.;S
AT 185E

( HEX | NFA 185E CFA 1864 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 185E
( Header: flags, saved name and link )
BYTES 830000D84A18
DOCOL
LIT8 10 t.BASE t.! t.;S
AT 186F

( DECIMAL | NFA 186F CFA 1879 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 186F
( Header: flags, saved name and link )
BYTES 87000000000000CC5E18
DOCOL
LIT8 0A t.BASE t.! t.;S
AT 1884

( [;CODE] | NFA 1884 CFA 188E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1884
( Header: flags, saved name and link )
BYTES 87000000000000A96F18
DOCOL
t.R> t.LATEST t.PFA t.CFA t.! t.;S
AT 189C

( ;CODE | NFA 189C CFA 18A4 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 189C
( Header: flags, saved name and link )
BYTES C500000000C58418
DOCOL
t.?CSP t.COMPILE t.(;CODE) t.[ t.ASSEMBLER t.;S
AT 18B2

( <BUILDS | NFA 18B2 CFA 18BC )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 18B2
( Header: flags, saved name and link )
BYTES 87000000000000D39C18
DOCOL
t.0 t.CONSTANT t.;S
AT 18C4

( DOES> | NFA 18C4 CFA 18CC )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 18C4
( Header: flags, saved name and link )
BYTES 8500000000BEB218
DOCOL
t.R> t.LATEST t.PFA t.! t.(;CODE)
( Trailing native code/data at 18D8; retained exactly )
BYTES A5CB48A5CA48A002B1CD85CAC8B1CD85CB18A5CD690448A5CE69004C
BYTES 400F
AT 18F6

( COUNT | NFA 18F6 CFA 18FE )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 18F6
( Header: flags, saved name and link )
BYTES 8500000000D4C418
DOCOL
t.DUP t.1+ t.SWAP t.C@ t.;S
AT 190A

( TYPE | NFA 190A CFA 1911 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 190A
( Header: flags, saved name and link )
BYTES 84000000C5F618
DOCOL
t.-DUP
t.0BRANCH CELL 001D ( -> 1934 )
t.OVER t.+ t.SWAP t.(DO)
( label 1921 )
t.I t.C@ LIT8 7F t.AND t.EMIT
t.(LOOP) CELL FFF3 ( -> 1921 )
t.BRANCH CELL 0004 ( -> 1936 )
( label 1934 )
t.DROP
( label 1936 )
t.;S
AT 1938

( -TRAILING | NFA 1938 CFA 1944 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1938
( Header: flags, saved name and link )
BYTES 890000000000000000C70A19
DOCOL
t.DUP t.0 t.(DO)
( label 194C )
t.OVER t.OVER t.+ t.1 t.- t.C@ t.BL t.-
t.0BRANCH CELL 0008 ( -> 1966 )
t.LEAVE
t.BRANCH CELL 0006 ( -> 196A )
( label 1966 )
t.1 t.-
( label 196A )
t.(LOOP) CELL FFE0 ( -> 194C )
t.;S
AT 1970

( [."] | NFA 1970 CFA 1977 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1970
( Header: flags, saved name and link )
BYTES 84000000A93819
DOCOL
t.R t.COUNT t.DUP t.1+ t.R> t.+ t.>R t.TYPE t.;S
AT 198B

( ." | NFA 198B CFA 1990 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 198B
( Header: flags, saved name and link )
BYTES C200A27019
DOCOL
LIT8 22 t.STATE t.@
t.0BRANCH CELL 0014 ( -> 19AF )
t.COMPILE t.(.") t.WORD t.HERE t.C@ t.1+ t.ALLOT
t.BRANCH CELL 000A ( -> 19B7 )
( label 19AF )
t.WORD t.HERE t.COUNT t.TYPE
( label 19B7 )
t.;S
AT 19B9

( QUERY | NFA 19B9 CFA 19C1 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 19B9
( Header: flags, saved name and link )
BYTES 8500000000D98B19
DOCOL
t.TIB t.@ LIT8 50 t.EXPECT t.0 t.IN t.! t.;S
AT 19D4

(   | NFA 19D4 CFA 19D8 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 19D4
( Header: flags, saved name and link )
BYTES C180B919
DOCOL
t.BLK t.@
t.0BRANCH CELL 002A ( -> 1A0A )
t.1 t.BLK t.+! t.0 t.IN t.! t.BLK t.@ t.0 t.B/SCR t.U/ t.DROP
t.0=_12DE
t.0BRANCH CELL 0008 ( -> 1A06 )
t.?EXEC t.R> t.DROP
( label 1A06 )
t.BRANCH CELL 0006 ( -> 1A0E )
( label 1A0A )
t.R> t.DROP
( label 1A0E )
t.;S
AT 1A10

( FILL | NFA 1A10 CFA 1A17 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1A10
( Header: flags, saved name and link )
BYTES 84000000CCD419
DOCOL
t.SWAP t.>R t.OVER t.C! t.DUP t.1+ t.R> t.1 t.- t.CMOVE t.;S
AT 1A2F

( ERASE | NFA 1A2F CFA 1A37 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1A2F
( Header: flags, saved name and link )
BYTES 8500000000C5101A
DOCOL
t.0 t.FILL t.;S
AT 1A3F

( BLANKS | NFA 1A3F CFA 1A48 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1A3F
( Header: flags, saved name and link )
BYTES 860000000000D32F1A
DOCOL
t.BL t.FILL t.;S
AT 1A50

( HOLD | NFA 1A50 CFA 1A57 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1A50
( Header: flags, saved name and link )
BYTES 84000000C43F1A
DOCOL
LIT16 FFFF t.HLD t.+! t.HLD t.@ t.C! t.;S
AT 1A69

( PAD | NFA 1A69 CFA 1A6F )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1A69
( Header: flags, saved name and link )
BYTES 830000C4501A
DOCOL
t.HERE LIT8 80 t.+ t.;S
AT 1A7A

( NEXT | NFA 1A7A CFA 1A81 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1A7A
( Header: flags, saved name and link )
BYTES 84000000D4691A
DOCON
CELL 0F47
AT 1A85

( PUSH | NFA 1A85 CFA 1A8C )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1A85
( Header: flags, saved name and link )
BYTES 84000000C87A1A
DOCON
CELL 0F40
AT 1A90

( PUT | NFA 1A90 CFA 1A96 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1A90
( Header: flags, saved name and link )
BYTES 830000D4851A
DOCON
CELL 0F42
AT 1A9A

( PUSH0A | NFA 1A9A CFA 1AA3 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1A9A
( Header: flags, saved name and link )
BYTES 860000000000C1901A
DOCON
CELL 1247
AT 1AA7

( POP | NFA 1AA7 CFA 1AAD )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1AA7
( Header: flags, saved name and link )
BYTES 830000D09A1A
DOCON
CELL 1059
AT 1AB1

( POPTWO | NFA 1AB1 CFA 1ABA )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1AB1
( Header: flags, saved name and link )
BYTES 860000000000CFA71A
DOCON
CELL 1057
AT 1ABE

( BINARY | NFA 1ABE CFA 1AC7 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1ABE
( Header: flags, saved name and link )
BYTES 860000000000D9B11A
DOCON
CELL 120E
AT 1ACB

( IP | NFA 1ACB CFA 1AD0 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1ACB
( Header: flags, saved name and link )
BYTES 8200D0BE1A
DOCON
CELL 00CA
AT 1AD4

( W | NFA 1AD4 CFA 1AD8 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 1AD4
( Header: flags, saved name and link )
BYTES 81D7CB1A
DOCON
CELL 00CD
AT 1ADC

( N | NFA 1ADC CFA 1AE0 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 1ADC
( Header: flags, saved name and link )
BYTES 81CED41A
DOCON
CELL 00C2
AT 1AE4

( XSAVE | NFA 1AE4 CFA 1AEC )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1AE4
( Header: flags, saved name and link )
BYTES 8500000000C5DC1A
DOCON
CELL 00D1
AT 1AF0

( UP | NFA 1AF0 CFA 1AF5 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1AF0
( Header: flags, saved name and link )
BYTES 8200D0E41A
DOCON
CELL 00CF
AT 1AF9

( SETUP | NFA 1AF9 CFA 1B01 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1AF9
( Header: flags, saved name and link )
BYTES 8500000000D0F01A
DOCON
CELL 0F6F
AT 1B05

( PFLAG | NFA 1B05 CFA 1B0D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1B05
( Header: flags, saved name and link )
BYTES 8500000000C7F91A
DOVAR
CELL 0000
AT 1B11

( GFLAG | NFA 1B11 CFA 1B19 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1B11
( Header: flags, saved name and link )
BYTES 8500000000C7051B
DOVAR
CELL 0000
AT 1B1D

( WORD | NFA 1B1D CFA 1B24 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1B1D
( Header: flags, saved name and link )
BYTES 84000000C4111B
DOCOL
t.BLK t.@
t.0BRANCH CELL 000C ( -> 1B38 )
t.BLK t.@ t.BLOCK
t.BRANCH CELL 0006 ( -> 1B3C )
( label 1B38 )
t.TIB t.@
( label 1B3C )
t.IN t.@ t.+ t.SWAP t.ENCLOSE t.HERE LIT8 22 t.BLANKS t.IN
t.+! t.OVER t.- t.>R t.R t.HERE t.C! t.+ t.HERE t.1+ t.R>
t.CMOVE t.;S
AT 1B69

( [NUMBER] | NFA 1B69 CFA 1B74 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1B69
( Header: flags, saved name and link )
BYTES 8800000000000000A91D1B
DOCOL
( label 1B76 )
t.1+ t.DUP t.>R t.C@ t.BASE t.@ t.DIGIT
t.0BRANCH CELL 002C ( -> 1BB2 )
t.SWAP t.BASE t.@ t.U* t.DROP t.ROT t.BASE t.@ t.U* t.D+ t.DPL
t.@ t.1+
t.0BRANCH CELL 0008 ( -> 1BAC )
t.1 t.DPL t.+!
( label 1BAC )
t.R>
t.BRANCH CELL FFC6 ( -> 1B76 )
( label 1BB2 )
t.R> t.;S
AT 1BB6

( NUMBER | NFA 1BB6 CFA 1BBF )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1BB6
( Header: flags, saved name and link )
BYTES 860000000000D2691B
DOCOL
t.0 t.0 t.ROT t.DUP t.1+ t.C@ LIT8 2D t.= t.DUP t.>R t.+
LIT16 FFFF
( label 1BDC )
t.DPL t.! t.(NUMBER) t.DUP t.C@ t.BL t.-
t.0BRANCH CELL 0015 ( -> 1C01 )
t.DUP t.C@ LIT8 2E t.- t.0 t.?ERROR t.0
t.BRANCH CELL FFDD ( -> 1BDC )
( label 1C01 )
t.DROP t.R>
t.0BRANCH CELL 0004 ( -> 1C0B )
t.DMINUS
( label 1C0B )
t.;S
AT 1C0D

( -FIND | NFA 1C0D CFA 1C15 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1C0D
( Header: flags, saved name and link )
BYTES 8500000000C4B61B
DOCOL
t.BL t.WORD t.HERE t.CONTEXT t.@ t.@ t.(FIND) t.DUP t.0=_12DE
t.0BRANCH CELL 000A ( -> 1C35 )
t.DROP t.HERE t.LATEST t.(FIND)
( label 1C35 )
t.;S
AT 1C37

( [ABORT] | NFA 1C37 CFA 1C41 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1C37
( Header: flags, saved name and link )
BYTES 87000000000000A90D1C
DOCOL
t.ABORT t.;S
AT 1C47

( ERROR | NFA 1C47 CFA 1C4F )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1C47
( Header: flags, saved name and link )
BYTES 8500000000D2371C
DOCOL
t.WARNING t.@ t.0<_12F3
t.0BRANCH CELL 0004 ( -> 1C5D )
t.(ABORT)
( label 1C5D )
t.HERE t.COUNT t.TYPE
( ATASCII text:   ?  )
t.(.")
BYTES 0420203F20
t.MESSAGE t.SP! t.DROP t.DROP t.IN t.@ t.BLK t.@ t.QUIT t.;S
AT 1C7E

( ID. | NFA 1C7E CFA 1C84 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1C7E
( Header: flags, saved name and link )
BYTES 830000AE471C
DOCOL
t.PAD LIT8 20 LIT8 5F t.FILL t.DUP t.PFA t.LFA t.OVER t.-
t.PAD t.SWAP t.CMOVE t.PAD t.COUNT LIT8 1F t.AND t.TYPE
t.SPACE t.;S
AT 1CAF

( CREATE | NFA 1CAF CFA 1CB8 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1CAF
( Header: flags, saved name and link )
BYTES 860000000000C57E1C
DOCOL
LIT16 02E5 t.@ t.HERE LIT8 80 t.+ t.U< t.2 t.?ERROR t.-FIND
t.0BRANCH CELL 000F ( -> 1CE0 )
t.DROP t.NFA t.ID. LIT8 04 t.MESSAGE t.SPACE
( label 1CE0 )
t.HERE t.DUP t.C@ t.WIDTH t.@ t.MIN t.1+ t.ALLOT t.DP t.C@
LIT8 FD t.= t.ALLOT t.DUP LIT8 A0 t.TOGGLE t.HERE t.1 t.-
LIT8 80 t.TOGGLE t.LATEST t., t.CURRENT t.@ t.! t.HERE t.2+
t., t.;S
AT 1D1F

( [COMPILE] | NFA 1D1F CFA 1D2B )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1D1F
( Header: flags, saved name and link )
BYTES C90000000000000000DDAF1C
DOCOL
t.-FIND t.0=_12DE t.0 t.?ERROR t.DROP t.CFA t., t.;S
AT 1D3D

( LITERAL | NFA 1D3D CFA 1D47 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1D3D
( Header: flags, saved name and link )
BYTES C7000000000000CC1F1D
DOCOL
t.STATE t.@
t.0BRANCH CELL 0008 ( -> 1D57 )
t.COMPILE t.LIT t.,
( label 1D57 )
t.;S
AT 1D59

( DLITERAL | NFA 1D59 CFA 1D64 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1D59
( Header: flags, saved name and link )
BYTES C800000000000000CC3D1D
DOCOL
t.STATE t.@
t.0BRANCH CELL 0008 ( -> 1D74 )
t.SWAP t.LITERAL t.LITERAL
( label 1D74 )
t.;S
AT 1D76

( ?STACK | NFA 1D76 CFA 1D7F )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1D76
( Header: flags, saved name and link )
BYTES 860000000000CB591D
DOCOL
t.SP@ LIT8 BC t.SWAP t.U< t.1 t.?ERROR t.SP@ LIT8 80 t.U<
LIT8 07 t.?ERROR t.;S
AT 1D9C

( INTERPRET | NFA 1D9C CFA 1DA8 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1D9C
( Header: flags, saved name and link )
BYTES 890000000000000000D4761D
DOCOL
( label 1DAA )
t.-FIND
t.0BRANCH CELL 001E ( -> 1DCC )
t.STATE t.@ t.<
t.0BRANCH CELL 000A ( -> 1DC2 )
t.CFA t.,
t.BRANCH CELL 0006 ( -> 1DC6 )
( label 1DC2 )
t.CFA t.EXECUTE
( label 1DC6 )
t.?STACK
t.BRANCH CELL 001C ( -> 1DE6 )
( label 1DCC )
t.HERE t.NUMBER t.DPL t.@ t.1+
t.0BRANCH CELL 0008 ( -> 1DE0 )
t.DLITERAL
t.BRANCH CELL 0006 ( -> 1DE4 )
( label 1DE0 )
t.DROP t.LITERAL
( label 1DE4 )
t.?STACK
( label 1DE6 )
t.BRANCH CELL FFC2 ( -> 1DAA )
t.;S
AT 1DEC

( IMMEDIATE | NFA 1DEC CFA 1DF8 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1DEC
( Header: flags, saved name and link )
BYTES 890000000000000000C59C1D
DOCOL
t.LATEST LIT8 40 t.TOGGLE t.;S
AT 1E03

( VOCABULARY | NFA 1E03 CFA 1E10 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1E03
( Header: flags, saved name and link )
BYTES 8A000000000000000000D9EC1D
DOCOL
t.<BUILDS LIT16 A081 t., t.CURRENT t.@ t.CFA t., t.HERE
t.VOC-LINK t.@ t., t.VOC-LINK t.! t.DOES>
( Trailing native code/data at 1E30; retained exactly )
BYTES 1616B31508147712
AT 1E38

( FORTH | NFA 1E38 CFA 1E40 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1E38
( Header: flags, saved name and link )
BYTES C500000000C8031E
DODOES
( DOES> thread at 1E30 )
BYTES 301E81A015870000
AT 1E4A

( DEFINITIONS | NFA 1E4A CFA 1E58 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1E4A
( Header: flags, saved name and link )
BYTES 8B00000000000000000000D3381E
DOCOL
t.CONTEXT t.@ t.CURRENT t.! t.;S
AT 1E64

( PROMPT | NFA 1E64 CFA 1E6D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1E64
( Header: flags, saved name and link )
BYTES 860000000000D44A1E
DOCOL
t.PFLAG t.@ t.0 t.PFLAG t.!
( ATASCII text: ok )
t.(.")
BYTES 026F6B
t.PFLAG t.! t.;S
AT 1E84

( [ | NFA 1E84 CFA 1E88 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 1E84
( Header: flags, saved name and link )
BYTES C1A8641E
DOCOL
LIT8 29 t.WORD t.;S
AT 1E91

( QUIT | NFA 1E91 CFA 1E98 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1E91
( Header: flags, saved name and link )
BYTES 84000000D4841E
DOCOL
t.0 t.BLK t.! t.[
( label 1EA2 )
t.RP! t.CR t.QUERY t.INTERPRET t.STATE t.@ t.0=_12DE
t.0BRANCH CELL 0004 ( -> 1EB6 )
t.PROMPT
( label 1EB6 )
t.BRANCH CELL FFEA ( -> 1EA2 )
t.;S
AT 1EBC

( ABORT | NFA 1EBC CFA 1EC4 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
( Decoded text: Retired startup banner, not executed )
( retired startup banner $1ED1: fig-FORTH  1.1       )
AT 1EBC
( Header: flags, saved name and link )
BYTES 8500000000D4911E
DOCOL
t.SP! t.DECIMAL t.DR0 t.CR t.BOOT-TITLE-AND-GAME
( Trailing native code/data at 1ED0; retained exactly )
BYTES 146669672D464F5254482020312E31202020202020401E581E981E60
AT 1EEC

( COLD | NFA 1EEC CFA 1EF3 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1EEC
( Header: flags, saved name and link )
BYTES 84000000C4BC1E
CELL 1EF5 ( native entry point )
BYTES A900 ( 1EF5: LDA #$00 )
BYTES 850A ( 1EF7: STA $0a )
BYTES 850C ( 1EF9: STA $0c )
BYTES A90F ( 1EFB: LDA #$0f )
BYTES 850B ( 1EFD: STA $0b )
BYTES 850D ( 1EFF: STA $0d )
BYTES A976 ( 1F01: LDA #$76 )
BYTES 8DE702 ( 1F03: STA $02e7 )
BYTES 850E ( 1F06: STA $0e )
BYTES A92A ( 1F08: LDA #$2a )
BYTES 8DE802 ( 1F0A: STA $02e8 )
BYTES 850F ( 1F0D: STA $0f )
BYTES 20BE22 ( 1F0F: JSR $22be )
BYTES AD0C0F ( 1F12: LDA $0f0c )
BYTES 8D461E ( 1F15: STA $1e46 )
BYTES AD0D0F ( 1F18: LDA $0f0d )
BYTES 8D471E ( 1F1B: STA $1e47 )
BYTES A015 ( 1F1E: LDY #$15 )
BYTES D002 ( 1F20: BNE $1f24 )
BYTES A00F ( 1F22: LDY #$0f )
BYTES AD100F ( 1F24: LDA $0f10 )
BYTES 85CF ( 1F27: STA $cf )
BYTES AD110F ( 1F29: LDA $0f11 )
BYTES 85D0 ( 1F2C: STA $d0 )
BYTES B90C0F ( 1F2E: LDA $0f0c,Y )
BYTES 91CF ( 1F31: STA [$cf],Y )
BYTES 88 ( 1F33: DEY )
BYTES 10F8 ( 1F34: BPL $1f2e )
BYTES A91E ( 1F36: LDA #$1e )
BYTES 85CB ( 1F38: STA $cb )
BYTES A9C6 ( 1F3A: LDA #$c6 )
BYTES 85CA ( 1F3C: STA $ca )
BYTES D8 ( 1F3E: CLD )
BYTES A96C ( 1F3F: LDA #$6c )
BYTES 85CC ( 1F41: STA $cc )
BYTES 4C6512 ( 1F43: JMP $1265 )
AT 1F46

( S->D | NFA 1F46 CFA 1F4D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1F46
( Header: flags, saved name and link )
BYTES 84000000C4EC1E
DOCOL
t.DUP t.0<_12F3 t.MINUS t.;S
AT 1F57

( +- | NFA 1F57 CFA 1F5C )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1F57
( Header: flags, saved name and link )
BYTES 8200AD461F
DOCOL
t.0<_12F3
t.0BRANCH CELL 0004 ( -> 1F66 )
t.MINUS
( label 1F66 )
t.;S
AT 1F68

( D+- | NFA 1F68 CFA 1F6E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1F68
( Header: flags, saved name and link )
BYTES 830000AD571F
DOCOL
t.0<_12F3
t.0BRANCH CELL 0004 ( -> 1F78 )
t.DMINUS
( label 1F78 )
t.;S
AT 1F7A

( ABS | NFA 1F7A CFA 1F80 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1F7A
( Header: flags, saved name and link )
BYTES 830000D3681F
DOCOL
t.DUP t.+- t.;S
AT 1F88

( DABS | NFA 1F88 CFA 1F8F )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1F88
( Header: flags, saved name and link )
BYTES 84000000D37A1F
DOCOL
t.DUP t.D+- t.;S
AT 1F97

( MIN | NFA 1F97 CFA 1F9D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1F97
( Header: flags, saved name and link )
BYTES 830000CE881F
DOCOL
t.OVER t.OVER t.>
t.0BRANCH CELL 0004 ( -> 1FAB )
t.SWAP
( label 1FAB )
t.DROP t.;S
AT 1FAF

( MAX | NFA 1FAF CFA 1FB5 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1FAF
( Header: flags, saved name and link )
BYTES 830000D8971F
DOCOL
t.OVER t.OVER t.<
t.0BRANCH CELL 0004 ( -> 1FC3 )
t.SWAP
( label 1FC3 )
t.DROP t.;S
AT 1FC7

( M* | NFA 1FC7 CFA 1FCC )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1FC7
( Header: flags, saved name and link )
BYTES 8200AAAF1F
DOCOL
t.OVER t.OVER t.XOR t.>R t.ABS t.SWAP t.ABS t.U* t.R> t.D+-
t.;S
AT 1FE4

( M/ | NFA 1FE4 CFA 1FE9 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1FE4
( Header: flags, saved name and link )
BYTES 8200AFC71F
DOCOL
t.OVER t.>R t.>R t.DABS t.R t.ABS t.U/ t.R> t.R t.XOR t.+-
t.SWAP t.R> t.+- t.SWAP t.;S
AT 200B

( * | NFA 200B CFA 200F )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 200B
( Header: flags, saved name and link )
BYTES 81AAE41F
DOCOL
t.U* t.DROP t.;S
AT 2017

( /MOD | NFA 2017 CFA 201E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2017
( Header: flags, saved name and link )
BYTES 84000000C40B20
DOCOL
t.>R t.S->D t.R> t.M/ t.;S
AT 202A

( / | NFA 202A CFA 202E )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 202A
( Header: flags, saved name and link )
BYTES 81AF1720
DOCOL
t./MOD t.SWAP t.DROP t.;S
AT 2038

( MOD | NFA 2038 CFA 203E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2038
( Header: flags, saved name and link )
BYTES 830000C42A20
DOCOL
t./MOD t.DROP t.;S
AT 2046

( */MOD | NFA 2046 CFA 204E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2046
( Header: flags, saved name and link )
BYTES 8500000000C43820
DOCOL
t.>R t.M* t.R> t.M/ t.;S
AT 205A

( */ | NFA 205A CFA 205F )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 205A
( Header: flags, saved name and link )
BYTES 8200AF4620
DOCOL
t.*/MOD t.SWAP t.DROP t.;S
AT 2069

( M/MOD | NFA 2069 CFA 2071 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2069
( Header: flags, saved name and link )
BYTES 8500000000C45A20
DOCOL
t.>R t.0 t.R t.U/ t.R> t.SWAP t.>R t.U/ t.R> t.;S
AT 2087

( USE | NFA 2087 CFA 208D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2087
( Header: flags, saved name and link )
BYTES 830000C56920
DOVAR
CELL 0810
AT 2091

( PREV | NFA 2091 CFA 2098 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2091
( Header: flags, saved name and link )
BYTES 84000000D68720
DOVAR
CELL 078C
AT 209C

( +BUF | NFA 209C CFA 20A3 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 209C
( Header: flags, saved name and link )
BYTES 84000000C69120
DOCOL
LIT16 0084 t.+ t.DUP t.LIMIT t.=
t.0BRANCH CELL 0006 ( -> 20B9 )
t.DROP t.FIRST
( label 20B9 )
t.DUP t.PREV t.@ t.- t.;S
AT 20C3

( UPDATE | NFA 20C3 CFA 20CC )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 20C3
( Header: flags, saved name and link )
BYTES 860000000000C59C20
DOCOL
t.PREV t.@ t.@ LIT16 8000 t.OR t.PREV t.@ t.! t.;S
AT 20E2

( FLUSH | NFA 20E2 CFA 20EA )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 20E2
( Header: flags, saved name and link )
BYTES 8500000000C8C320
DOCOL
t.LIMIT t.FIRST t.- t.B/BUF LIT8 04 t.+ t./ t.1+ t.0 t.(DO)
( label 2101 )
LIT16 7FFF t.BUFFER t.DROP
t.(LOOP) CELL FFF6 ( -> 2101 )
t.;S
AT 210F

( EMPTY-BUFFERS | NFA 210F CFA 211F )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 210F
( Header: flags, saved name and link )
BYTES 8D000000000000000000000000D3E220
DOCOL
t.FIRST t.LIMIT t.OVER t.- t.ERASE t.;S
AT 212D

( DR0 | NFA 212D CFA 2133 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 212D
( Header: flags, saved name and link )
BYTES 830000B00F21
DOCOL
t.0 t.OFFSET t.! t.;S
AT 213D

( DR1 | NFA 213D CFA 2143 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 213D
( Header: flags, saved name and link )
BYTES 830000B12D21
DOCOL
LIT16 02D0 t.OFFSET t.! t.;S
AT 214F

( BUFFER | NFA 214F CFA 2158 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 214F
( Header: flags, saved name and link )
BYTES 860000000000D23D21
DOCOL
t.USE t.@ t.DUP t.>R
( label 2162 )
t.+BUF
t.0BRANCH CELL FFFC ( -> 2162 )
t.USE t.! t.R t.@ t.0<_12F3
t.0BRANCH CELL 0014 ( -> 2188 )
t.R t.2+ t.R t.@ LIT16 7FFF t.AND t.0 t.R/W
( label 2188 )
t.R t.! t.R t.PREV t.! t.R> t.2+ t.;S
AT 2198

( BLOCK | NFA 2198 CFA 21A0 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2198
( Header: flags, saved name and link )
BYTES 8500000000CB4F21
DOCOL
t.OFFSET t.@ t.+ t.>R t.PREV t.@ t.DUP t.@ t.R t.- t.DUP t.+
t.0BRANCH CELL 0034 ( -> 21F0 )
( label 21BE )
t.+BUF t.0=_12DE
t.0BRANCH CELL 0014 ( -> 21D8 )
t.DROP t.R t.BUFFER t.DUP t.R t.1 t.R/W t.2 t.-
( label 21D8 )
t.DUP t.@ t.R t.- t.DUP t.+ t.0=_12DE
t.0BRANCH CELL FFD6 ( -> 21BE )
t.DUP t.PREV t.!
( label 21F0 )
t.R> t.DROP t.2+ t.;S
AT 21F8

( [LINE] | NFA 21F8 CFA 2201 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 21F8
( Header: flags, saved name and link )
BYTES 860000000000A99821
DOCOL
t.>R t.C/L t.B/BUF t.*/MOD t.R> t.B/SCR t.* t.+ t.BLOCK t.+
t.C/L t.;S
AT 221B

( .LINE | NFA 221B CFA 2223 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 221B
( Header: flags, saved name and link )
BYTES 8500000000C5F821
DOCOL
t.(LINE) t.-TRAILING t.TYPE t.;S
AT 222D

( MESSAGE | NFA 222D CFA 2237 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 222D
( Header: flags, saved name and link )
BYTES 87000000000000C51B22
DOCOL
t.WARNING t.@
t.0BRANCH CELL 001B ( -> 225A )
t.-DUP
t.0BRANCH CELL 0011 ( -> 2256 )
LIT8 0E t.OFFSET t.@ t.B/SCR t./ t.- t..LINE
( label 2256 )
t.BRANCH CELL 000D ( -> 2265 )
( label 225A )
( ATASCII text: MSG #  )
t.(.")
BYTES 064D5347202320
t..
( label 2265 )
t.CR t.;S
AT 2269

( LOAD | NFA 2269 CFA 2270 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2269
( Header: flags, saved name and link )
BYTES 84000000C42D22
DOCOL
t.BLK t.@ t.>R t.IN t.@ t.>R t.0 t.IN t.! t.B/SCR t.* t.BLK
t.! t.INTERPRET t.R> t.IN t.! t.R> t.BLK t.! t.;S
AT 229C

( --> | NFA 229C CFA 22A2 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 229C
( Header: flags, saved name and link )
BYTES C30000BE6922
DOCOL
t.?LOADING t.0 t.IN t.! t.B/SCR t.BLK t.@ t.OVER t.MOD t.-
t.BLK t.+! t.;S
( Trailing native code/data at 22BE; retained exactly )
BYTES A210A9039D4403A9239D4503A90420F222A220A9049D4403A9239D45
BYTES 03A90C20F222A260A9059D4403A9239D4503A90820F222609D4A03A9
BYTES 009D4B03A9039D42032056E4604B45509838A01A71CF91CFC8A90071
BYTES CF91CFB500202B23AC0F1BF009B50086D1A260202F234C591086D1A2
BYTES 2048A90B9D4203A9009D48039D4903682056E4A6D16086D1A210A907
BYTES 9D4203A9009D48039D49032056E4C080D003A99BEAA6D14C4712ADFC
BYTES 0249FFF002A9014C4712A99B202B23AD0F1BF009A99B86D1A260202F
BYTES 234C470F
AT 2386

( EXPECT | NFA 2386 CFA 238F )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2386
( Header: flags, saved name and link )
BYTES 860000000000D49C22
CELL 2391 ( native entry point )
BYTES A020 ( 2391: LDY #$20 )
BYTES A905 ( 2393: LDA #$05 )
BYTES 994203 ( 2395: STA $0342,Y )
BYTES B500 ( 2398: LDA $00,X )
BYTES 994803 ( 239A: STA $0348,Y )
BYTES B501 ( 239D: LDA $01,X )
BYTES 994903 ( 239F: STA $0349,Y )
BYTES B502 ( 23A2: LDA $02,X )
BYTES 994403 ( 23A4: STA $0344,Y )
BYTES 85C2 ( 23A7: STA $c2 )
BYTES B503 ( 23A9: LDA $03,X )
BYTES 994503 ( 23AB: STA $0345,Y )
BYTES 85C3 ( 23AE: STA $c3 )
BYTES 86C4 ( 23B0: STX $c4 )
BYTES A220 ( 23B2: LDX #$20 )
BYTES 2056E4 ( 23B4: JSR $e456 )
BYTES C080 ( 23B7: CPY #$80 )
BYTES D005 ( 23B9: BNE $23c0 )
BYTES A6C4 ( 23BB: LDX $c4 )
BYTES 4C9123 ( 23BD: JMP $2391 )
BYTES BD4803 ( 23C0: LDA $0348,X )
BYTES 38 ( 23C3: SEC )
BYTES E901 ( 23C4: SBC #$01 )
BYTES A8 ( 23C6: TAY )
BYTES A900 ( 23C7: LDA #$00 )
BYTES 91C2 ( 23C9: STA [$c2],Y )
BYTES 18 ( 23CB: CLC )
BYTES AD1B1B ( 23CC: LDA $1b1b )
BYTES F01B ( 23CF: BEQ $23ec )
BYTES 98 ( 23D1: TYA )
BYTES F013 ( 23D2: BEQ $23e7 )
BYTES 6D9102 ( 23D4: ADC $0291 )
BYTES C553 ( 23D7: CMP $53 )
BYTES 9005 ( 23D9: BCC $23e0 )
BYTES E553 ( 23DB: SBC $53 )
BYTES 18 ( 23DD: CLC )
BYTES 6552 ( 23DE: ADC $52 )
BYTES 8D9102 ( 23E0: STA $0291 )
BYTES C552 ( 23E3: CMP $52 )
BYTES F01B ( 23E5: BEQ $2402 )
BYTES CE9002 ( 23E7: DEC $0290 )
BYTES 1016 ( 23EA: BPL $2402 )
BYTES 98 ( 23EC: TYA )
BYTES F011 ( 23ED: BEQ $2400 )
BYTES 6555 ( 23EF: ADC $55 )
BYTES C553 ( 23F1: CMP $53 )
BYTES 9005 ( 23F3: BCC $23fa )
BYTES E553 ( 23F5: SBC $53 )
BYTES 18 ( 23F7: CLC )
BYTES 6552 ( 23F8: ADC $52 )
BYTES 8555 ( 23FA: STA $55 )
BYTES C552 ( 23FC: CMP $52 )
BYTES F002 ( 23FE: BEQ $2402 )
BYTES C654 ( 2400: DEC $54 )
BYTES A920 ( 2402: LDA #$20 )
BYTES 202B23 ( 2404: JSR $232b )
BYTES A6C4 ( 2407: LDX $c4 )
BYTES A000 ( 2409: LDY #$00 )
BYTES 4C5710 ( 240B: JMP $1057 )
AT 240E

( -DISK | NFA 240E CFA 2416 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 240E
( Header: flags, saved name and link )
BYTES 8500000000CB8623
CELL 2418 ( native entry point )
BYTES A052 ( 2418: LDY #$52 )
BYTES B500 ( 241A: LDA $00,X )
BYTES D002 ( 241C: BNE $2420 )
BYTES A057 ( 241E: LDY #$57 )
BYTES 8C0203 ( 2420: STY $0302 )
BYTES B502 ( 2423: LDA $02,X )
BYTES 8D0103 ( 2425: STA $0301 )
BYTES B504 ( 2428: LDA $04,X )
BYTES 8D0A03 ( 242A: STA $030a )
BYTES B505 ( 242D: LDA $05,X )
BYTES 8D0B03 ( 242F: STA $030b )
BYTES B506 ( 2432: LDA $06,X )
BYTES 8D0403 ( 2434: STA $0304 )
BYTES B507 ( 2437: LDA $07,X )
BYTES 8D0503 ( 2439: STA $0305 )
BYTES 86D1 ( 243C: STX $d1 )
BYTES 20B00E ( 243E: JSR $0eb0 )
BYTES A6D1 ( 2441: LDX $d1 )
BYTES E8 ( 2443: INX )
BYTES E8 ( 2444: INX )
BYTES AD0303 ( 2445: LDA $0303 )
BYTES 3002 ( 2448: BMI $244c )
BYTES A900 ( 244A: LDA #$00 )
BYTES 9504 ( 244C: STA $04,X )
BYTES A900 ( 244E: LDA #$00 )
BYTES 9505 ( 2450: STA $05,X )
BYTES 4C5710 ( 2452: JMP $1057 )
AT 2455

( R/W | NFA 2455 CFA 245B )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2455
( Header: flags, saved name and link )
BYTES 830000D70E24
DOCOL
t.SWAP t.1+ LIT16 0409 t./MOD t.1+ t.DUP LIT8 04 t.> LIT8 06
t.?ERROR t.ROT t.-DISK t.-DUP
t.0BRANCH CELL 0009 ( -> 2486 )
t.. LIT8 08 t.?ERROR
( label 2486 )
t.;S
AT 2488

( ' | NFA 2488 CFA 248C )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2488
( Header: flags, saved name and link )
BYTES C1A75524
DOCOL
t.-FIND t.0=_12DE t.0 t.?ERROR t.DROP t.LITERAL t.;S
AT 249C

( FORGET | NFA 249C CFA 24A5 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 249C
( Header: flags, saved name and link )
BYTES 860000000000D48824
DOCOL
t.' t.NFA t.DUP t.FENCE t.@ t.U< LIT8 15 t.?ERROR t.>R
t.VOC-LINK t.@
( label 24BE )
t.R t.OVER t.U<
t.0BRANCH CELL 0012 ( -> 24D8 )
t.FORTH t.DEFINITIONS t.@ t.DUP t.VOC-LINK t.!
t.BRANCH CELL FFE8 ( -> 24BE )
( label 24D8 )
t.DUP LIT8 04 t.-
( label 24DF )
t.PFA t.LFA t.@ t.DUP t.R t.U<
t.0BRANCH CELL FFF2 ( -> 24DF )
t.OVER t.2 t.- t.! t.@ t.-DUP t.0=_12DE
t.0BRANCH CELL FFD9 ( -> 24D8 )
t.R> t.DP t.! t.;S
AT 2509

( BACK | NFA 2509 CFA 2510 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2509
( Header: flags, saved name and link )
BYTES 84000000CB9C24
DOCOL
t.HERE t.- t., t.;S
AT 251A

( BEGIN | NFA 251A CFA 2522 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 251A
( Header: flags, saved name and link )
BYTES C500000000CE0925
DOCOL
t.?COMP t.HERE t.1 t.;S
AT 252C

( ENDIF | NFA 252C CFA 2534 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 252C
( Header: flags, saved name and link )
BYTES C500000000C61A25
DOCOL
t.?COMP t.2 t.?PAIRS t.HERE t.OVER t.- t.SWAP t.! t.;S
AT 2548

( THEN | NFA 2548 CFA 254F )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2548
( Header: flags, saved name and link )
BYTES C4000000CE2C25
DOCOL
t.ENDIF t.;S
AT 2555

( DO | NFA 2555 CFA 255A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2555
( Header: flags, saved name and link )
BYTES C200CF4825
DOCOL
t.COMPILE t.(DO) t.HERE t.3 t.;S
AT 2566

( LOOP | NFA 2566 CFA 256D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2566
( Header: flags, saved name and link )
BYTES C4000000D05525
DOCOL
t.3 t.?PAIRS t.COMPILE t.(LOOP) t.BACK t.;S
AT 257B

( +LOOP | NFA 257B CFA 2583 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 257B
( Header: flags, saved name and link )
BYTES C500000000D06625
DOCOL
t.3 t.?PAIRS t.COMPILE t.(+LOOP) t.BACK t.;S
AT 2591

( UNTIL | NFA 2591 CFA 2599 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2591
( Header: flags, saved name and link )
BYTES C500000000CC7B25
DOCOL
t.1 t.?PAIRS t.COMPILE t.0BRANCH t.BACK t.;S
AT 25A7

( END | NFA 25A7 CFA 25AD )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 25A7
( Header: flags, saved name and link )
BYTES C30000C49125
DOCOL
t.UNTIL t.;S
AT 25B3

( AGAIN | NFA 25B3 CFA 25BB )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 25B3
( Header: flags, saved name and link )
BYTES C500000000CEA725
DOCOL
t.1 t.?PAIRS t.COMPILE t.BRANCH t.BACK t.;S
AT 25C9

( REPEAT | NFA 25C9 CFA 25D2 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 25C9
( Header: flags, saved name and link )
BYTES C60000000000D4B325
DOCOL
t.>R t.>R t.AGAIN t.R> t.R> t.2 t.- t.ENDIF t.;S
AT 25E6

( IF | NFA 25E6 CFA 25EB )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 25E6
( Header: flags, saved name and link )
BYTES C200C6C925
DOCOL
t.COMPILE t.0BRANCH t.HERE t.0 t., t.2 t.;S
AT 25FB

( ELSE | NFA 25FB CFA 2602 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 25FB
( Header: flags, saved name and link )
BYTES C4000000C5E625
DOCOL
t.2 t.?PAIRS t.COMPILE t.BRANCH t.HERE t.0 t., t.SWAP t.2
t.ENDIF t.2 t.;S
AT 261C

( WHILE | NFA 261C CFA 2624 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 261C
( Header: flags, saved name and link )
BYTES C500000000C5FB25
DOCOL
t.IF t.2+ t.;S
AT 262C

( SPACES | NFA 262C CFA 2635 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 262C
( Header: flags, saved name and link )
BYTES 860000000000D31C26
DOCOL
t.0 t.MAX t.-DUP
t.0BRANCH CELL 000C ( -> 264B )
t.0 t.(DO)
( label 2645 )
t.SPACE
t.(LOOP) CELL FFFC ( -> 2645 )
( label 264B )
t.;S
AT 264D

( <# | NFA 264D CFA 2652 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 264D
( Header: flags, saved name and link )
BYTES 8200A32C26
DOCOL
t.PAD t.HLD t.! t.;S
AT 265C

( #> | NFA 265C CFA 2661 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 265C
( Header: flags, saved name and link )
BYTES 8200BE4D26
DOCOL
t.DROP t.DROP t.HLD t.@ t.PAD t.OVER t.- t.;S
AT 2673

( SIGN | NFA 2673 CFA 267A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2673
( Header: flags, saved name and link )
BYTES 84000000CE5C26
DOCOL
t.ROT t.0<_12F3
t.0BRANCH CELL 0007 ( -> 2689 )
LIT8 2D t.HOLD
( label 2689 )
t.;S
AT 268B

( # | NFA 268B CFA 268F )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 268B
( Header: flags, saved name and link )
BYTES 81A37326
DOCOL
t.BASE t.@ t.M/MOD t.ROT LIT8 09 t.OVER t.<
t.0BRANCH CELL 0007 ( -> 26A9 )
LIT8 07 t.+
( label 26A9 )
LIT8 30 t.+ t.HOLD t.;S
AT 26B2

( #S | NFA 26B2 CFA 26B7 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 26B2
( Header: flags, saved name and link )
BYTES 8200D38B26
DOCOL
( label 26B9 )
t.#_268F t.OVER t.OVER t.OR t.0=_12DE
t.0BRANCH CELL FFF4 ( -> 26B9 )
t.;S
AT 26C9

( D.R | NFA 26C9 CFA 26CF )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 26C9
( Header: flags, saved name and link )
BYTES 830000D2B226
DOCOL
t.>R t.SWAP t.OVER t.DABS t.<# t.#S t.SIGN t.#> t.R> t.OVER
t.- t.SPACES t.TYPE t.;S
AT 26ED

( D. | NFA 26ED CFA 26F2 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 26ED
( Header: flags, saved name and link )
BYTES 8200AEC926
DOCOL
t.0 t.D.R t.SPACE t.;S
AT 26FC

( .R | NFA 26FC CFA 2701 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 26FC
( Header: flags, saved name and link )
BYTES 8200D2ED26
DOCOL
t.>R t.S->D t.R> t.D.R t.;S
AT 270D

( . | NFA 270D CFA 2711 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 270D
( Header: flags, saved name and link )
BYTES 81AEFC26
DOCOL
t.S->D t.D. t.;S
AT 2719

( ? | NFA 2719 CFA 271D )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2719
( Header: flags, saved name and link )
BYTES 81BF0D27
DOCOL
t.@ t.. t.;S
AT 2725

( U. | NFA 2725 CFA 272A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2725
( Header: flags, saved name and link )
BYTES 8200AE1927
DOCOL
t.0 t.D. t.;S
AT 2732

( C? | NFA 2732 CFA 2737 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2732
( Header: flags, saved name and link )
BYTES 8200BF2527
DOCOL
t.C@ t.. t.;S
AT 273F

( D@ | NFA 273F CFA 2744 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 273F
( Header: flags, saved name and link )
BYTES 8200C03227
DOCOL
t.DUP t.@ t.SWAP t.2+ t.@ t.SWAP t.;S
AT 2754

( D! | NFA 2754 CFA 2759 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2754
( Header: flags, saved name and link )
BYTES 8200A13F27
DOCOL
t.DUP t.>R t.! t.R> t.2+ t.! t.;S
AT 2769

( 2DUP | NFA 2769 CFA 2770 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2769
( Header: flags, saved name and link )
BYTES 84000000D05427
DOCOL
t.OVER t.OVER t.;S
AT 2778

( 2DROP | NFA 2778 CFA 2780 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2778
( Header: flags, saved name and link )
BYTES 8500000000D06927
DOCOL
t.DROP t.DROP t.;S
AT 2788

( 2SWAP | NFA 2788 CFA 2790 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2788
( Header: flags, saved name and link )
BYTES 8500000000D07827
DOCOL
t.ROT t.>R t.ROT t.R> t.;S
AT 279C

( 2OVER | NFA 279C CFA 27A4 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 279C
( Header: flags, saved name and link )
BYTES 8500000000D28827
DOCOL
t.2SWAP t.2DUP t.>R t.>R t.2SWAP t.R> t.R> t.;S
AT 27B6

( ok | NFA 27B6 CFA 27BB )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 27B6
( Header: flags, saved name and link )
BYTES 8200EB9C27
DOCOL
LIT8 7E t.DUP t.EMIT t.DUP t.EMIT t.EMIT t.;S
AT 27CC

( U? | NFA 27CC CFA 27D1 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 27CC
( Header: flags, saved name and link )
BYTES 8200BFB627
DOCOL
t.@ t.U. t.;S
AT 27D9

( LIST | NFA 27D9 CFA 27E0 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 27D9
( Header: flags, saved name and link )
BYTES 84000000D4CC27
DOCOL
t.DECIMAL t.CR t.DUP t.SCR t.!
( ATASCII text: SCR #  )
t.(.")
BYTES 06534352202320
t.. LIT8 10 t.0 t.(DO)
( label 27FE )
t.CR t.I t.3 t..R t.SPACE t.I t.SCR t.@ t..LINE
t.(LOOP) CELL FFEC ( -> 27FE )
t.CR t.;S
AT 2818

( MATCH | NFA 2818 CFA 2820 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2818
( Header: flags, saved name and link )
BYTES 8500000000C8D927
CELL 2822 ( native entry point )
BYTES A904 ( 2822: LDA #$04 )
BYTES 206F0F ( 2824: JSR $0f6f )
BYTES CA ( 2827: DEX )
BYTES CA ( 2828: DEX )
BYTES CA ( 2829: DEX )
BYTES CA ( 282A: DEX )
BYTES 9400 ( 282B: STY $00,X )
BYTES 9401 ( 282D: STY $01,X )
BYTES 9403 ( 282F: STY $03,X )
BYTES A0FF ( 2831: LDY #$ff )
BYTES C8 ( 2833: INY )
BYTES C4C2 ( 2834: CPY $c2 )
BYTES F02A ( 2836: BEQ $2862 )
BYTES B1C4 ( 2838: LDA [$c4],Y )
BYTES D1C8 ( 283A: CMP [$c8],Y )
BYTES F0F5 ( 283C: BEQ $2833 )
BYTES E6C8 ( 283E: INC $c8 )
BYTES D002 ( 2840: BNE $2844 )
BYTES E6C9 ( 2842: INC $c9 )
BYTES F600 ( 2844: INC $00,X )
BYTES D002 ( 2846: BNE $284a )
BYTES F601 ( 2848: INC $01,X )
BYTES A5C6 ( 284A: LDA $c6 )
BYTES D002 ( 284C: BNE $2850 )
BYTES C6C7 ( 284E: DEC $c7 )
BYTES C6C6 ( 2850: DEC $c6 )
BYTES A5C6 ( 2852: LDA $c6 )
BYTES C5C2 ( 2854: CMP $c2 )
BYTES A5C7 ( 2856: LDA $c7 )
BYTES E5C3 ( 2858: SBC $c3 )
BYTES B0D5 ( 285A: BCS $2831 )
BYTES A4C6 ( 285C: LDY $c6 )
BYTES A900 ( 285E: LDA #$00 )
BYTES F002 ( 2860: BEQ $2864 )
BYTES A901 ( 2862: LDA #$01 )
BYTES 9502 ( 2864: STA $02,X )
BYTES 18 ( 2866: CLC )
BYTES 98 ( 2867: TYA )
BYTES 7500 ( 2868: ADC $00,X )
BYTES 48 ( 286A: PHA )
BYTES A900 ( 286B: LDA #$00 )
BYTES 7501 ( 286D: ADC $01,X )
BYTES 4C420F ( 286F: JMP $0f42 )
AT 2872

( INDEX | NFA 2872 CFA 287A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2872
( Header: flags, saved name and link )
BYTES 8500000000D81828
DOCOL
t.CR t.1+ t.SWAP t.(DO)
( label 2884 )
t.CR t.I t.3 t..R t.SPACE t.0 t.I t..LINE t.?TERMINAL
t.0BRANCH CELL 0004 ( -> 289C )
t.LEAVE
( label 289C )
t.(LOOP) CELL FFE6 ( -> 2884 )
t.;S
AT 28A2

( TRIAD | NFA 28A2 CFA 28AA )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 28A2
( Header: flags, saved name and link )
BYTES 8500000000C47228
DOCOL
t.3 t./ t.3 t.* t.3 t.OVER t.+ t.SWAP t.(DO)
( label 28BE )
t.CR t.I t.LIST
t.(LOOP) CELL FFF8 ( -> 28BE )
t.CR LIT8 0F t.MESSAGE t.CR t.;S
AT 28D3

( VLIST | NFA 28D3 CFA 28DB )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 28D3
( Header: flags, saved name and link )
BYTES 8500000000D4A228
DOCOL
LIT8 80 t.OUT t.! t.CONTEXT t.@ t.@
( label 28EA )
t.OUT t.@ t.C/L t.>
t.0BRANCH CELL 000A ( -> 28FE )
t.CR t.0 t.OUT t.!
( label 28FE )
t.DUP t.ID. t.SPACE t.SPACE t.PFA t.LFA t.@ t.DUP t.0=_12DE
t.?TERMINAL t.OR
t.0BRANCH CELL FFD4 ( -> 28EA )
t.DROP t.;S
AT 291C

( BOOT | NFA 291C CFA 2923 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 291C
( Header: flags, saved name and link )
BYTES 84000000D4D328
CELL 2925 ( native entry point )
BYTES A901 ( 2925: LDA #$01 )
BYTES 8D4402 ( 2927: STA $0244 )
BYTES 6CFCFF ( 292A: JMP [$fffc] )
AT 292D

( [FMT] | NFA 292D CFA 2935 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 292D
( Header: flags, saved name and link )
BYTES 8500000000A91C29
CELL 2937 ( native entry point )
BYTES B500 ( 2937: LDA $00,X )
BYTES 8D0103 ( 2939: STA $0301 )
BYTES A921 ( 293C: LDA #$21 )
BYTES 8D0203 ( 293E: STA $0302 )
BYTES 86D1 ( 2941: STX $d1 )
BYTES 2053E4 ( 2943: JSR $e453 )
BYTES 98 ( 2946: TYA )
BYTES 48 ( 2947: PHA )
BYTES A900 ( 2948: LDA #$00 )
BYTES A6D1 ( 294A: LDX $d1 )
BYTES 4C420F ( 294C: JMP $0f42 )
AT 294F

( [SAVE] | NFA 294F CFA 2958 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 294F
( Header: flags, saved name and link )
BYTES 860000000000A92D29
DOCOL
t.FORTH t.DEFINITIONS t.LATEST LIT8 0C t.+ORIGIN t.! t.HERE
LIT8 1C t.+ORIGIN t.! t.HERE LIT8 1E t.+ORIGIN t.! t.VOC-LINK
t.@ LIT8 20 t.+ORIGIN t.! t.HERE LIT8 06 t.+ LIT16 FF80
t.+ORIGIN t.- LIT8 7F t.+ LIT8 80 t./ t.;S
AT 299F

( SAVE | NFA 299F CFA 29A6 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 299F
( Header: flags, saved name and link )
BYTES 84000000C54F29
DOCOL
t.(SAVE) t.SAVE-DISK-PRIMITIVE t.;S
AT 29AE

( SAVE-DISK-PRIMITIVE | NFA 29AE CFA 29AE )
( Inferred descriptive name: headerless native CFA called )
( by stock fig-FORTH SAVE. )
AT 29AE
( Headerless native CFA )
CELL 29B0 ( native entry point )
BYTES 86D1 ( 29B0: STX $d1 )
BYTES B500 ( 29B2: LDA $00,X )
BYTES 8D002A ( 29B4: STA $2a00 )
BYTES 8D810E ( 29B7: STA $0e81 )
BYTES A901 ( 29BA: LDA #$01 )
BYTES 8D0103 ( 29BC: STA $0301 )
BYTES A957 ( 29BF: LDA #$57 )
BYTES 8D0203 ( 29C1: STA $0302 )
BYTES A980 ( 29C4: LDA #$80 )
BYTES 8D0403 ( 29C6: STA $0304 )
BYTES A90E ( 29C9: LDA #$0e )
BYTES 8D0503 ( 29CB: STA $0305 )
BYTES A901 ( 29CE: LDA #$01 )
BYTES 8D0A03 ( 29D0: STA $030a )
BYTES A900 ( 29D3: LDA #$00 )
BYTES 8D0B03 ( 29D5: STA $030b )
BYTES 2053E4 ( 29D8: JSR $e453 )
BYTES 3024 ( 29DB: BMI $2a01 )
BYTES AD0403 ( 29DD: LDA $0304 )
BYTES 18 ( 29E0: CLC )
BYTES 6980 ( 29E1: ADC #$80 )
BYTES 8D0403 ( 29E3: STA $0304 )
BYTES AD0503 ( 29E6: LDA $0305 )
BYTES 6900 ( 29E9: ADC #$00 )
BYTES 8D0503 ( 29EB: STA $0305 )
BYTES EE0A03 ( 29EE: INC $030a )
BYTES D003 ( 29F1: BNE $29f6 )
BYTES EE0B03 ( 29F3: INC $030b )
BYTES CE002A ( 29F6: DEC $2a00 )
BYTES D0DD ( 29F9: BNE $29d8 )
BYTES A6D1 ( 29FB: LDX $d1 )
BYTES 4C5910 ( 29FD: JMP $1059 )
BYTES BB ( 2A00: ??? )
BYTES 4CF31E ( 2A01: JMP $1ef3 )
AT 2A04

( CSAVE | NFA 2A04 CFA 2A0C )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2A04
( Header: flags, saved name and link )
BYTES 8500000000C59F29
DOCOL
t.(SAVE) t.DUP LIT8 80 t.* t.SAVE-CASSETTE-PRIMITIVE t.;S
AT 2A1B

( SAVE-CASSETTE-PRIMITIVE | NFA 2A1B CFA 2A1B )
( Inferred descriptive name: headerless native CFA called )
( by stock fig-FORTH CSAVE. )
AT 2A1B
( Headerless native CFA )
CELL 2A1D ( native entry point )
BYTES 86D1 ( 2A1D: STX $d1 )
BYTES B502 ( 2A1F: LDA $02,X )
BYTES 8D810E ( 2A21: STA $0e81 )
BYTES A230 ( 2A24: LDX #$30 )
BYTES A903 ( 2A26: LDA #$03 )
BYTES 9D4203 ( 2A28: STA $0342,X )
BYTES A908 ( 2A2B: LDA #$08 )
BYTES 9D4A03 ( 2A2D: STA $034a,X )
BYTES A980 ( 2A30: LDA #$80 )
BYTES 9D4B03 ( 2A32: STA $034b,X )
BYTES A975 ( 2A35: LDA #$75 )
BYTES 9D4403 ( 2A37: STA $0344,X )
BYTES A92A ( 2A3A: LDA #$2a )
BYTES 9D4503 ( 2A3C: STA $0345,X )
BYTES 2056E4 ( 2A3F: JSR $e456 )
BYTES 30BD ( 2A42: BMI $2a01 )
BYTES A90B ( 2A44: LDA #$0b )
BYTES 9D4203 ( 2A46: STA $0342,X )
BYTES A980 ( 2A49: LDA #$80 )
BYTES 9D4403 ( 2A4B: STA $0344,X )
BYTES A90E ( 2A4E: LDA #$0e )
BYTES 9D4503 ( 2A50: STA $0345,X )
BYTES A4D1 ( 2A53: LDY $d1 )
BYTES B90000 ( 2A55: LDA $0000,Y )
BYTES 9D4803 ( 2A58: STA $0348,X )
BYTES B90100 ( 2A5B: LDA $0001,Y )
BYTES 9D4903 ( 2A5E: STA $0349,X )
BYTES 2056E4 ( 2A61: JSR $e456 )
BYTES 309B ( 2A64: BMI $2a01 )
BYTES A90C ( 2A66: LDA #$0c )
BYTES 9D4203 ( 2A68: STA $0342,X )
BYTES 2056E4 ( 2A6B: JSR $e456 )
BYTES 3091 ( 2A6E: BMI $2a01 )
BYTES A6D1 ( 2A70: LDX $d1 )
BYTES 4C5710 ( 2A72: JMP $1057 )
BYTES 43 ( 2A75: ??? )
AT 2A76
