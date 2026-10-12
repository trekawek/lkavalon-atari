( Wladcy Ciemnosci v1 10-kernel.fth: target 0E80..2A75 )
( Hexadecimal. BYTES emits bytes; CELL emits 16-bit cells. )
( LIT8/LIT16 compile literals; branches retain signed )
( offsets. )
( 6502 mnemonics use 06-assembler.fth; operands follow )
( words. )
3 T-DISK
0E80 T-ORG
( Boot loader, copy-protection bypass and cold-start )
( settings )
BYTES 00F2800EEB1E
( 6502 code at 0E86..0EA1 )
JSR.ABS E465         ( 0E86 )
LDA.# 00             ( 0E89 )
STA.ZP 0A            ( 0E8B )
LDA.# 0F             ( 0E8D )
STA.ZP 0B            ( 0E8F )
LDA.# 76             ( 0E91 )
STA.ABS 02E7         ( 0E93 )
STA.ZP 0E            ( 0E96 )
LDA.# 2A             ( 0E98 )
STA.ABS 02E8         ( 0E9A )
STA.ZP 0F            ( 0E9D )
CLC                  ( 0E9F )
CLD                  ( 0EA0 )
RTS                  ( 0EA1 )
BYTES 0000000000000000000000000000AD0B03C903D017AD0A03C98BD008
BYTES A0908C0303843060A0018C03038430604C53E4000000000000002055
BYTES 6E70726F2D20746563742062793A2047554D49202620204B52415743
BYTES 4F200000000000000000EA4CF51EEA4C221F0400D25E15877E008004
BYTES BC00FF0100011F000100588758878A2A0000000000

( LIT | NFA 0F27 CFA 0F2D )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 0F27
( Header: flags, saved name and link )
BYTES 834C49D40000
CELL 0F2F ( native entry point )
LDA.INDY CA          ( 0F2F )
PHA                  ( 0F31 )
INC.ZP CA            ( 0F32 )
BNE 0F38             ( 0F34 )
INC.ZP CB            ( 0F36 )
LDA.INDY CA          ( 0F38 )
INC.ZP CA            ( 0F3A )
BNE 0F40             ( 0F3C )
INC.ZP CB            ( 0F3E )
DEX                  ( 0F40 )
DEX                  ( 0F41 )
STA.ZPX 01           ( 0F42 )
PLA                  ( 0F44 )
STA.ZPX 00           ( 0F45 )
LDY.# 01             ( 0F47 )
LDA.INDY CA          ( 0F49 )
STA.ZP CE            ( 0F4B )
DEY                  ( 0F4D )
LDA.INDY CA          ( 0F4E )
STA.ZP CD            ( 0F50 )
CLC                  ( 0F52 )
LDA.ZP CA            ( 0F53 )
ADC.# 02             ( 0F55 )
STA.ZP CA            ( 0F57 )
BCC 0F5D             ( 0F59 )
INC.ZP CB            ( 0F5B )
JMP.ABS 00CC         ( 0F5D )
AT 0F60

( CLIT | NFA 0F60 CFA 0F67 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 0F60
( Header: flags, saved name and link )
BYTES 84000000D4270F
CELL 0F69 ( native entry point )
LDA.INDY CA          ( 0F69 )
PHA                  ( 0F6B )
TYA                  ( 0F6C )
BEQ 0F3A             ( 0F6D )
ASL.A                ( 0F6F )
STA.ZP C1            ( 0F70 )
LDA.ZPX 00           ( 0F72 )
STA.ABSY 00C2        ( 0F74 )
INX                  ( 0F77 )
INY                  ( 0F78 )
CPY.ZP C1            ( 0F79 )
BNE 0F72             ( 0F7B )
LDY.# 00             ( 0F7D )
RTS                  ( 0F7F )
AT 0F80

( EXECUTE | NFA 0F80 CFA 0F8A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 0F80
( Header: flags, saved name and link )
BYTES 87000000000000C5600F
CELL 0F8C ( native entry point )
LDA.ZPX 00           ( 0F8C )
STA.ZP CD            ( 0F8E )
LDA.ZPX 01           ( 0F90 )
STA.ZP CE            ( 0F92 )
INX                  ( 0F94 )
INX                  ( 0F95 )
JMP.ABS 00CC         ( 0F96 )
AT 0F99

( BRANCH | NFA 0F99 CFA 0FA2 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 0F99
( Header: flags, saved name and link )
BYTES 860000000000C8800F
CELL 0FA4 ( native entry point )
CLC                  ( 0FA4 )
LDA.INDY CA          ( 0FA5 )
ADC.ZP CA            ( 0FA7 )
PHA                  ( 0FA9 )
INY                  ( 0FAA )
LDA.INDY CA          ( 0FAB )
ADC.ZP CB            ( 0FAD )
STA.ZP CB            ( 0FAF )
PLA                  ( 0FB1 )
STA.ZP CA            ( 0FB2 )
JMP.ABS 0F49         ( 0FB4 )
AT 0FB7

( 0BRANCH | NFA 0FB7 CFA 0FC1 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 0FB7
( Header: flags, saved name and link )
BYTES 87000000000000C8990F
CELL 0FC3 ( native entry point )
INX                  ( 0FC3 )
INX                  ( 0FC4 )
LDA.ZPX FE           ( 0FC5 )
ORA.ZPX FF           ( 0FC7 )
BEQ 0FA4             ( 0FC9 )
CLC                  ( 0FCB )
LDA.ZP CA            ( 0FCC )
ADC.# 02             ( 0FCE )
STA.ZP CA            ( 0FD0 )
BCC 0FD6             ( 0FD2 )
INC.ZP CB            ( 0FD4 )
JMP.ABS 0F47         ( 0FD6 )
AT 0FD9

( [LOOP] | NFA 0FD9 CFA 0FE2 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 0FD9
( Header: flags, saved name and link )
BYTES 860000000000A9B70F
CELL 0FE4 ( native entry point )
STX.ZP D1            ( 0FE4 )
TSX                  ( 0FE6 )
INC.ABSX 0101        ( 0FE7 )
BNE 0FEF             ( 0FEA )
INC.ABSX 0102        ( 0FEC )
CLC                  ( 0FEF )
LDA.ABSX 0103        ( 0FF0 )
SBC.ABSX 0101        ( 0FF3 )
LDA.ABSX 0104        ( 0FF6 )
SBC.ABSX 0102        ( 0FF9 )
LDX.ZP D1            ( 0FFC )
ASL.A                ( 0FFE )
BCC 0FA4             ( 0FFF )
PLA                  ( 1001 )
PLA                  ( 1002 )
PLA                  ( 1003 )
PLA                  ( 1004 )
JMP.ABS 0FCB         ( 1005 )
AT 1008

( [+LOOP] | NFA 1008 CFA 1012 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1008
( Header: flags, saved name and link )
BYTES 87000000000000A9D90F
CELL 1014 ( native entry point )
INX                  ( 1014 )
INX                  ( 1015 )
STX.ZP D1            ( 1016 )
LDA.ZPX FF           ( 1018 )
PHA                  ( 101A )
PHA                  ( 101B )
LDA.ZPX FE           ( 101C )
TSX                  ( 101E )
INX                  ( 101F )
INX                  ( 1020 )
CLC                  ( 1021 )
ADC.ABSX 0101        ( 1022 )
STA.ABSX 0101        ( 1025 )
PLA                  ( 1028 )
ADC.ABSX 0102        ( 1029 )
STA.ABSX 0102        ( 102C )
PLA                  ( 102F )
BPL 0FEF             ( 1030 )
CLC                  ( 1032 )
LDA.ABSX 0101        ( 1033 )
SBC.ABSX 0103        ( 1036 )
LDA.ABSX 0102        ( 1039 )
SBC.ABSX 0104        ( 103C )
JMP.ABS 0FFC         ( 103F )
AT 1042

( [DO] | NFA 1042 CFA 1049 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1042
( Header: flags, saved name and link )
BYTES 84000000A90810
CELL 104B ( native entry point )
LDA.ZPX 03           ( 104B )
PHA                  ( 104D )
LDA.ZPX 02           ( 104E )
PHA                  ( 1050 )
LDA.ZPX 01           ( 1051 )
PHA                  ( 1053 )
LDA.ZPX 00           ( 1054 )
PHA                  ( 1056 )
INX                  ( 1057 )
INX                  ( 1058 )
INX                  ( 1059 )
INX                  ( 105A )
JMP.ABS 0F47         ( 105B )
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
SEC                  ( 106E )
LDA.ZPX 02           ( 106F )
SBC.# 30             ( 1071 )
BMI 108D             ( 1073 )
CMP.# 0A             ( 1075 )
BMI 1080             ( 1077 )
SEC                  ( 1079 )
SBC.# 07             ( 107A )
CMP.# 0A             ( 107C )
BMI 108D             ( 107E )
CMP.ZPX 00           ( 1080 )
BPL 108D             ( 1082 )
STA.ZPX 02           ( 1084 )
LDA.# 01             ( 1086 )
PHA                  ( 1088 )
TYA                  ( 1089 )
JMP.ABS 0F42         ( 108A )
TYA                  ( 108D )
PHA                  ( 108E )
INX                  ( 108F )
INX                  ( 1090 )
JMP.ABS 0F42         ( 1091 )
AT 1094

( [FIND] | NFA 1094 CFA 109D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1094
( Header: flags, saved name and link )
BYTES 860000000000A96410
CELL 109F ( native entry point )
LDA.# 02             ( 109F )
JSR.ABS 0F6F         ( 10A1 )
STX.ZP D1            ( 10A4 )
LDY.# 00             ( 10A6 )
LDA.INDY C2          ( 10A8 )
EOR.INDY C4          ( 10AA )
AND.# 3F             ( 10AC )
BNE 10DD             ( 10AE )
INY                  ( 10B0 )
LDA.INDY C2          ( 10B1 )
EOR.INDY C4          ( 10B3 )
ASL.A                ( 10B5 )
BNE 10DB             ( 10B6 )
BCC 10B0             ( 10B8 )
LDX.ZP D1            ( 10BA )
DEX                  ( 10BC )
DEX                  ( 10BD )
DEX                  ( 10BE )
DEX                  ( 10BF )
CLC                  ( 10C0 )
TYA                  ( 10C1 )
ADC.# 05             ( 10C2 )
ADC.ZP C2            ( 10C4 )
STA.ZPX 02           ( 10C6 )
LDY.# 00             ( 10C8 )
TYA                  ( 10CA )
ADC.ZP C3            ( 10CB )
STA.ZPX 03           ( 10CD )
STY.ZPX 01           ( 10CF )
LDA.INDY C2          ( 10D1 )
STA.ZPX 00           ( 10D3 )
LDA.# 01             ( 10D5 )
PHA                  ( 10D7 )
JMP.ABS 0F40         ( 10D8 )
BCS 10E2             ( 10DB )
INY                  ( 10DD )
LDA.INDY C2          ( 10DE )
BPL 10DD             ( 10E0 )
INY                  ( 10E2 )
LDA.INDY C2          ( 10E3 )
TAX                  ( 10E5 )
INY                  ( 10E6 )
LDA.INDY C2          ( 10E7 )
STA.ZP C3            ( 10E9 )
STX.ZP C2            ( 10EB )
ORA.ZP C2            ( 10ED )
BNE 10A6             ( 10EF )
LDX.ZP D1            ( 10F1 )
LDA.# 00             ( 10F3 )
PHA                  ( 10F5 )
JMP.ABS 0F40         ( 10F6 )
AT 10F9

( ENCLOSE | NFA 10F9 CFA 1103 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 10F9
( Header: flags, saved name and link )
BYTES 87000000000000C59410
CELL 1105 ( native entry point )
LDA.# 02             ( 1105 )
JSR.ABS 0F6F         ( 1107 )
TXA                  ( 110A )
SEC                  ( 110B )
SBC.# 08             ( 110C )
TAX                  ( 110E )
STY.ZPX 03           ( 110F )
STY.ZPX 01           ( 1111 )
DEY                  ( 1113 )
INY                  ( 1114 )
LDA.INDY C4          ( 1115 )
CMP.ZP C2            ( 1117 )
BEQ 1114             ( 1119 )
STY.ZPX 04           ( 111B )
LDA.INDY C4          ( 111D )
BNE 112F             ( 111F )
STY.ZPX 02           ( 1121 )
STY.ZPX 00           ( 1123 )
TYA                  ( 1125 )
CMP.ZPX 04           ( 1126 )
BNE 112C             ( 1128 )
INC.ZPX 02           ( 112A )
JMP.ABS 0F47         ( 112C )
STY.ZPX 02           ( 112F )
INY                  ( 1131 )
CMP.ZP C2            ( 1132 )
BNE 111D             ( 1134 )
STY.ZPX 00           ( 1136 )
JMP.ABS 0F47         ( 1138 )
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
LDA.# 03             ( 116B )
JSR.ABS 0F6F         ( 116D )
CPY.ZP C2            ( 1170 )
BNE 117B             ( 1172 )
DEC.ZP C3            ( 1174 )
BPL 117B             ( 1176 )
JMP.ABS 0F47         ( 1178 )
LDA.INDY C6          ( 117B )
STA.INDY C4          ( 117D )
INY                  ( 117F )
BNE 1170             ( 1180 )
INC.ZP C7            ( 1182 )
INC.ZP C5            ( 1184 )
JMP.ABS 1170         ( 1186 )
AT 1189

( U* | NFA 1189 CFA 118E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1189
( Header: flags, saved name and link )
BYTES 8200AA6111
CELL 1190 ( native entry point )
LDA.ZPX 02           ( 1190 )
STA.ZP C2            ( 1192 )
STY.ZPX 02           ( 1194 )
LDA.ZPX 03           ( 1196 )
STA.ZP C3            ( 1198 )
STY.ZPX 03           ( 119A )
LDY.# 10             ( 119C )
ASL.ZPX 02           ( 119E )
ROL.ZPX 03           ( 11A0 )
ROL.ZPX 00           ( 11A2 )
ROL.ZPX 01           ( 11A4 )
BCC 11BB             ( 11A6 )
CLC                  ( 11A8 )
LDA.ZP C2            ( 11A9 )
ADC.ZPX 02           ( 11AB )
STA.ZPX 02           ( 11AD )
LDA.ZP C3            ( 11AF )
ADC.ZPX 03           ( 11B1 )
STA.ZPX 03           ( 11B3 )
LDA.# 00             ( 11B5 )
ADC.ZPX 00           ( 11B7 )
STA.ZPX 00           ( 11B9 )
DEY                  ( 11BB )
BNE 119E             ( 11BC )
JMP.ABS 0F47         ( 11BE )
AT 11C1

( U/ | NFA 11C1 CFA 11C6 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 11C1
( Header: flags, saved name and link )
BYTES 8200AF8911
CELL 11C8 ( native entry point )
LDA.ZPX 04           ( 11C8 )
LDY.ZPX 02           ( 11CA )
STY.ZPX 04           ( 11CC )
ASL.A                ( 11CE )
STA.ZPX 02           ( 11CF )
LDA.ZPX 05           ( 11D1 )
LDY.ZPX 03           ( 11D3 )
STY.ZPX 05           ( 11D5 )
ROL.A                ( 11D7 )
STA.ZPX 03           ( 11D8 )
LDA.# 10             ( 11DA )
STA.ZP C2            ( 11DC )
ROL.ZPX 04           ( 11DE )
ROL.ZPX 05           ( 11E0 )
SEC                  ( 11E2 )
LDA.ZPX 04           ( 11E3 )
SBC.ZPX 00           ( 11E5 )
TAY                  ( 11E7 )
LDA.ZPX 05           ( 11E8 )
SBC.ZPX 01           ( 11EA )
BCC 11F2             ( 11EC )
STY.ZPX 04           ( 11EE )
STA.ZPX 05           ( 11F0 )
ROL.ZPX 02           ( 11F2 )
ROL.ZPX 03           ( 11F4 )
DEC.ZP C2            ( 11F6 )
BNE 11DE             ( 11F8 )
JMP.ABS 1059         ( 11FA )
AT 11FD

( AND | NFA 11FD CFA 1203 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 11FD
( Header: flags, saved name and link )
BYTES 830000C4C111
CELL 1205 ( native entry point )
LDA.ZPX 00           ( 1205 )
AND.ZPX 02           ( 1207 )
PHA                  ( 1209 )
LDA.ZPX 01           ( 120A )
AND.ZPX 03           ( 120C )
INX                  ( 120E )
INX                  ( 120F )
JMP.ABS 0F42         ( 1210 )
AT 1213

( OR | NFA 1213 CFA 1218 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1213
( Header: flags, saved name and link )
BYTES 8200D2FD11
CELL 121A ( native entry point )
LDA.ZPX 00           ( 121A )
ORA.ZPX 02           ( 121C )
PHA                  ( 121E )
LDA.ZPX 01           ( 121F )
ORA.ZPX 03           ( 1221 )
INX                  ( 1223 )
INX                  ( 1224 )
JMP.ABS 0F42         ( 1225 )
AT 1228

( XOR | NFA 1228 CFA 122E )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1228
( Header: flags, saved name and link )
BYTES 830000D21312
CELL 1230 ( native entry point )
LDA.ZPX 00           ( 1230 )
EOR.ZPX 02           ( 1232 )
PHA                  ( 1234 )
LDA.ZPX 01           ( 1235 )
EOR.ZPX 03           ( 1237 )
INX                  ( 1239 )
INX                  ( 123A )
JMP.ABS 0F42         ( 123B )
AT 123E

( SP@ | NFA 123E CFA 1244 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 123E
( Header: flags, saved name and link )
BYTES 830000C02812
CELL 1246 ( native entry point )
TXA                  ( 1246 )
PHA                  ( 1247 )
LDA.# 00             ( 1248 )
JMP.ABS 0F40         ( 124A )
AT 124D

( SP! | NFA 124D CFA 1253 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 124D
( Header: flags, saved name and link )
BYTES 830000A13E12
CELL 1255 ( native entry point )
LDY.# 06             ( 1255 )
LDA.INDY CF          ( 1257 )
TAX                  ( 1259 )
JMP.ABS 0F47         ( 125A )
AT 125D

( RP! | NFA 125D CFA 1263 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 125D
( Header: flags, saved name and link )
BYTES 830000A14D12
CELL 1265 ( native entry point )
STX.ZP D1            ( 1265 )
LDY.# 08             ( 1267 )
LDA.INDY CF          ( 1269 )
TAX                  ( 126B )
TXS                  ( 126C )
LDX.ZP D1            ( 126D )
JMP.ABS 0F47         ( 126F )
AT 1272

( ;S | NFA 1272 CFA 1277 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1272
( Header: flags, saved name and link )
BYTES 8200D35D12
CELL 1279 ( native entry point )
PLA                  ( 1279 )
STA.ZP CA            ( 127A )
PLA                  ( 127C )
STA.ZP CB            ( 127D )
JMP.ABS 0F47         ( 127F )
AT 1282

( LEAVE | NFA 1282 CFA 128A )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1282
( Header: flags, saved name and link )
BYTES 8500000000C57212
CELL 128C ( native entry point )
STX.ZP D1            ( 128C )
TSX                  ( 128E )
LDA.ABSX 0101        ( 128F )
STA.ABSX 0103        ( 1292 )
LDA.ABSX 0102        ( 1295 )
STA.ABSX 0104        ( 1298 )
LDX.ZP D1            ( 129B )
JMP.ABS 0F47         ( 129D )
AT 12A0

( >R | NFA 12A0 CFA 12A5 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 12A0
( Header: flags, saved name and link )
BYTES 8200D28212
CELL 12A7 ( native entry point )
LDA.ZPX 01           ( 12A7 )
PHA                  ( 12A9 )
LDA.ZPX 00           ( 12AA )
PHA                  ( 12AC )
INX                  ( 12AD )
INX                  ( 12AE )
JMP.ABS 0F47         ( 12AF )
AT 12B2

( R> | NFA 12B2 CFA 12B7 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 12B2
( Header: flags, saved name and link )
BYTES 8200BEA012
CELL 12B9 ( native entry point )
DEX                  ( 12B9 )
DEX                  ( 12BA )
PLA                  ( 12BB )
STA.ZPX 00           ( 12BC )
PLA                  ( 12BE )
STA.ZPX 01           ( 12BF )
JMP.ABS 0F47         ( 12C1 )
AT 12C4

( R | NFA 12C4 CFA 12C8 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 12C4
( Header: flags, saved name and link )
BYTES 81D2B212
CELL 12CA ( native entry point )
STX.ZP D1            ( 12CA )
TSX                  ( 12CC )
LDA.ABSX 0101        ( 12CD )
PHA                  ( 12D0 )
LDA.ABSX 0102        ( 12D1 )
LDX.ZP D1            ( 12D4 )
JMP.ABS 0F40         ( 12D6 )
AT 12D9

( 0= | NFA 12D9 CFA 12DE )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 12D9
( Header: flags, saved name and link )
BYTES 8200BDC412
CELL 12E0 ( native entry point )
LDA.ZPX 00           ( 12E0 )
ORA.ZPX 01           ( 12E2 )
STY.ZPX 01           ( 12E4 )
BNE 12E9             ( 12E6 )
INY                  ( 12E8 )
STY.ZPX 00           ( 12E9 )
JMP.ABS 0F47         ( 12EB )
AT 12EE

( 0< | NFA 12EE CFA 12F3 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 12EE
( Header: flags, saved name and link )
BYTES 8200BCD912
CELL 12F5 ( native entry point )
ASL.ZPX 01           ( 12F5 )
TYA                  ( 12F7 )
ROL.A                ( 12F8 )
STY.ZPX 01           ( 12F9 )
STA.ZPX 00           ( 12FB )
JMP.ABS 0F47         ( 12FD )
AT 1300

( + | NFA 1300 CFA 1304 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 1300
( Header: flags, saved name and link )
BYTES 81ABEE12
CELL 1306 ( native entry point )
CLC                  ( 1306 )
LDA.ZPX 00           ( 1307 )
ADC.ZPX 02           ( 1309 )
STA.ZPX 02           ( 130B )
LDA.ZPX 01           ( 130D )
ADC.ZPX 03           ( 130F )
STA.ZPX 03           ( 1311 )
INX                  ( 1313 )
INX                  ( 1314 )
JMP.ABS 0F47         ( 1315 )
AT 1318

( D+ | NFA 1318 CFA 131D )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1318
( Header: flags, saved name and link )
BYTES 8200AB0013
CELL 131F ( native entry point )
CLC                  ( 131F )
LDA.ZPX 02           ( 1320 )
ADC.ZPX 06           ( 1322 )
STA.ZPX 06           ( 1324 )
LDA.ZPX 03           ( 1326 )
ADC.ZPX 07           ( 1328 )
STA.ZPX 07           ( 132A )
LDA.ZPX 00           ( 132C )
ADC.ZPX 04           ( 132E )
STA.ZPX 04           ( 1330 )
LDA.ZPX 01           ( 1332 )
ADC.ZPX 05           ( 1334 )
STA.ZPX 05           ( 1336 )
JMP.ABS 1057         ( 1338 )
AT 133B

( MINUS | NFA 133B CFA 1343 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 133B
( Header: flags, saved name and link )
BYTES 8500000000D31813
CELL 1345 ( native entry point )
SEC                  ( 1345 )
TYA                  ( 1346 )
SBC.ZPX 00           ( 1347 )
STA.ZPX 00           ( 1349 )
TYA                  ( 134B )
SBC.ZPX 01           ( 134C )
STA.ZPX 01           ( 134E )
JMP.ABS 0F47         ( 1350 )
AT 1353

( DMINUS | NFA 1353 CFA 135C )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1353
( Header: flags, saved name and link )
BYTES 860000000000D33B13
CELL 135E ( native entry point )
SEC                  ( 135E )
TYA                  ( 135F )
SBC.ZPX 02           ( 1360 )
STA.ZPX 02           ( 1362 )
TYA                  ( 1364 )
SBC.ZPX 03           ( 1365 )
STA.ZPX 03           ( 1367 )
JMP.ABS 1346         ( 1369 )
AT 136C

( OVER | NFA 136C CFA 1373 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 136C
( Header: flags, saved name and link )
BYTES 84000000D25313
CELL 1375 ( native entry point )
LDA.ZPX 02           ( 1375 )
PHA                  ( 1377 )
LDA.ZPX 03           ( 1378 )
JMP.ABS 0F40         ( 137A )
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
LDA.ZPX 02           ( 138F )
PHA                  ( 1391 )
LDA.ZPX 00           ( 1392 )
STA.ZPX 02           ( 1394 )
LDA.ZPX 03           ( 1396 )
LDY.ZPX 01           ( 1398 )
STY.ZPX 03           ( 139A )
JMP.ABS 0F42         ( 139C )
AT 139F

( DUP | NFA 139F CFA 13A5 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 139F
( Header: flags, saved name and link )
BYTES 830000D08613
CELL 13A7 ( native entry point )
LDA.ZPX 00           ( 13A7 )
PHA                  ( 13A9 )
LDA.ZPX 01           ( 13AA )
JMP.ABS 0F40         ( 13AC )
AT 13AF

( +! | NFA 13AF CFA 13B4 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 13AF
( Header: flags, saved name and link )
BYTES 8200A19F13
CELL 13B6 ( native entry point )
CLC                  ( 13B6 )
LDA.INDX 00          ( 13B7 )
ADC.ZPX 02           ( 13B9 )
STA.INDX 00          ( 13BB )
INC.ZPX 00           ( 13BD )
BNE 13C3             ( 13BF )
INC.ZPX 01           ( 13C1 )
LDA.INDX 00          ( 13C3 )
ADC.ZPX 03           ( 13C5 )
STA.INDX 00          ( 13C7 )
JMP.ABS 1057         ( 13C9 )
AT 13CC

( TOGGLE | NFA 13CC CFA 13D5 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 13CC
( Header: flags, saved name and link )
BYTES 860000000000C5AF13
CELL 13D7 ( native entry point )
LDA.INDX 02          ( 13D7 )
EOR.ZPX 00           ( 13D9 )
STA.INDX 02          ( 13DB )
JMP.ABS 1057         ( 13DD )
AT 13E0

( @ | NFA 13E0 CFA 13E4 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 13E0
( Header: flags, saved name and link )
BYTES 81C0CC13
CELL 13E6 ( native entry point )
LDA.INDX 00          ( 13E6 )
PHA                  ( 13E8 )
INC.ZPX 00           ( 13E9 )
BNE 13EF             ( 13EB )
INC.ZPX 01           ( 13ED )
LDA.INDX 00          ( 13EF )
JMP.ABS 0F42         ( 13F1 )
AT 13F4

( C@ | NFA 13F4 CFA 13F9 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 13F4
( Header: flags, saved name and link )
BYTES 8200C0E013
CELL 13FB ( native entry point )
LDA.INDX 00          ( 13FB )
STA.ZPX 00           ( 13FD )
STY.ZPX 01           ( 13FF )
JMP.ABS 0F47         ( 1401 )
AT 1404

( ! | NFA 1404 CFA 1408 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 1404
( Header: flags, saved name and link )
BYTES 81A1F413
CELL 140A ( native entry point )
LDA.ZPX 02           ( 140A )
STA.INDX 00          ( 140C )
INC.ZPX 00           ( 140E )
BNE 1414             ( 1410 )
INC.ZPX 01           ( 1412 )
LDA.ZPX 03           ( 1414 )
STA.INDX 00          ( 1416 )
JMP.ABS 1057         ( 1418 )
AT 141B

( C! | NFA 141B CFA 1420 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 141B
( Header: flags, saved name and link )
BYTES 8200A10414
CELL 1422 ( native entry point )
LDA.ZPX 02           ( 1422 )
STA.INDX 00          ( 1424 )
JMP.ABS 1057         ( 1426 )
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
( Trailing code/data at 1441; retained exactly )
( 6502 code at 1441..1455 )
LDA.ZP CB            ( 1441 )
PHA                  ( 1443 )
LDA.ZP CA            ( 1444 )
PHA                  ( 1446 )
CLC                  ( 1447 )
LDA.ZP CD            ( 1448 )
ADC.# 02             ( 144A )
STA.ZP CA            ( 144C )
TYA                  ( 144E )
ADC.ZP CE            ( 144F )
STA.ZP CB            ( 1451 )
JMP.ABS 0F47         ( 1453 )
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
( Trailing code/data at 147D; retained exactly )
( 6502 code at 147D..1487 )
LDY.# 02             ( 147D )
LDA.INDY CD          ( 147F )
PHA                  ( 1481 )
INY                  ( 1482 )
LDA.INDY CD          ( 1483 )
JMP.ABS 0F40         ( 1485 )
AT 1488

( VARIABLE | NFA 1488 CFA 1493 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1488
( Header: flags, saved name and link )
BYTES 8800000000000000C56814
DOCOL
t.CONSTANT t.(;CODE)
( Trailing code/data at 1499; retained exactly )
( 6502 code at 1499..14A4 )
CLC                  ( 1499 )
LDA.ZP CD            ( 149A )
ADC.# 02             ( 149C )
PHA                  ( 149E )
TYA                  ( 149F )
ADC.ZP CE            ( 14A0 )
JMP.ABS 0F40         ( 14A2 )
AT 14A5

( USER | NFA 14A5 CFA 14AC )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 14A5
( Header: flags, saved name and link )
BYTES 84000000D28814
DOCOL
t.CONSTANT t.(;CODE)
( Trailing code/data at 14B2; retained exactly )
( 6502 code at 14B2..14C0 )
LDY.# 02             ( 14B2 )
CLC                  ( 14B4 )
LDA.INDY CD          ( 14B5 )
ADC.ZP CF            ( 14B7 )
PHA                  ( 14B9 )
LDA.# 00             ( 14BA )
ADC.ZP D0            ( 14BC )
JMP.ABS 0F40         ( 14BE )
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
SEC                  ( 169D )
LDA.ZPX 02           ( 169E )
SBC.ZPX 00           ( 16A0 )
LDA.ZPX 03           ( 16A2 )
SBC.ZPX 01           ( 16A4 )
STY.ZPX 03           ( 16A6 )
BVC 16AC             ( 16A8 )
EOR.# 80             ( 16AA )
BPL 16AF             ( 16AC )
INY                  ( 16AE )
STY.ZPX 02           ( 16AF )
JMP.ABS 1059         ( 16B1 )
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
( Trailing code/data at 18D8; retained exactly )
( 6502 code at 18D8..18F5 )
LDA.ZP CB            ( 18D8 )
PHA                  ( 18DA )
LDA.ZP CA            ( 18DB )
PHA                  ( 18DD )
LDY.# 02             ( 18DE )
LDA.INDY CD          ( 18E0 )
STA.ZP CA            ( 18E2 )
INY                  ( 18E4 )
LDA.INDY CD          ( 18E5 )
STA.ZP CB            ( 18E7 )
CLC                  ( 18E9 )
LDA.ZP CD            ( 18EA )
ADC.# 04             ( 18EC )
PHA                  ( 18EE )
LDA.ZP CE            ( 18EF )
ADC.# 00             ( 18F1 )
JMP.ABS 0F40         ( 18F3 )
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

( \x00 | NFA 19D4 CFA 19D8 )
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
( Trailing code/data at 1E30; retained exactly )
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
( Trailing code/data at 1ED0; retained exactly )
BYTES 146669672D464F5254482020312E31202020202020401E581E981E60
AT 1EEC

( COLD | NFA 1EEC CFA 1EF3 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 1EEC
( Header: flags, saved name and link )
BYTES 84000000C4BC1E
CELL 1EF5 ( native entry point )
LDA.# 00             ( 1EF5 )
STA.ZP 0A            ( 1EF7 )
STA.ZP 0C            ( 1EF9 )
LDA.# 0F             ( 1EFB )
STA.ZP 0B            ( 1EFD )
STA.ZP 0D            ( 1EFF )
LDA.# 76             ( 1F01 )
STA.ABS 02E7         ( 1F03 )
STA.ZP 0E            ( 1F06 )
LDA.# 2A             ( 1F08 )
STA.ABS 02E8         ( 1F0A )
STA.ZP 0F            ( 1F0D )
JSR.ABS 22BE         ( 1F0F )
LDA.ABS 0F0C         ( 1F12 )
STA.ABS 1E46         ( 1F15 )
LDA.ABS 0F0D         ( 1F18 )
STA.ABS 1E47         ( 1F1B )
LDY.# 15             ( 1F1E )
BNE 1F24             ( 1F20 )
LDY.# 0F             ( 1F22 )
LDA.ABS 0F10         ( 1F24 )
STA.ZP CF            ( 1F27 )
LDA.ABS 0F11         ( 1F29 )
STA.ZP D0            ( 1F2C )
LDA.ABSY 0F0C        ( 1F2E )
STA.INDY CF          ( 1F31 )
DEY                  ( 1F33 )
BPL 1F2E             ( 1F34 )
LDA.# 1E             ( 1F36 )
STA.ZP CB            ( 1F38 )
LDA.# C6             ( 1F3A )
STA.ZP CA            ( 1F3C )
CLD                  ( 1F3E )
LDA.# 6C             ( 1F3F )
STA.ZP CC            ( 1F41 )
JMP.ABS 1265         ( 1F43 )
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
( Trailing code/data at 22BE; retained exactly )
( 6502 code at 22BE..2302 )
LDX.# 10             ( 22BE )
LDA.# 03             ( 22C0 )
STA.ABSX 0344        ( 22C2 )
LDA.# 23             ( 22C5 )
STA.ABSX 0345        ( 22C7 )
LDA.# 04             ( 22CA )
JSR.ABS 22F2         ( 22CC )
LDX.# 20             ( 22CF )
LDA.# 04             ( 22D1 )
STA.ABSX 0344        ( 22D3 )
LDA.# 23             ( 22D6 )
STA.ABSX 0345        ( 22D8 )
LDA.# 0C             ( 22DB )
JSR.ABS 22F2         ( 22DD )
LDX.# 60             ( 22E0 )
LDA.# 05             ( 22E2 )
STA.ABSX 0344        ( 22E4 )
LDA.# 23             ( 22E7 )
STA.ABSX 0345        ( 22E9 )
LDA.# 08             ( 22EC )
JSR.ABS 22F2         ( 22EE )
RTS                  ( 22F1 )
STA.ABSX 034A        ( 22F2 )
LDA.# 00             ( 22F5 )
STA.ABSX 034B        ( 22F7 )
LDA.# 03             ( 22FA )
STA.ABSX 0342        ( 22FC )
JSR.ABS E456         ( 22FF )
RTS                  ( 2302 )
BYTES 4B4550
( 6502 code at 2306..2385 )
TYA                  ( 2306 )
SEC                  ( 2307 )
LDY.# 1A             ( 2308 )
ADC.INDY CF          ( 230A )
STA.INDY CF          ( 230C )
INY                  ( 230E )
LDA.# 00             ( 230F )
ADC.INDY CF          ( 2311 )
STA.INDY CF          ( 2313 )
LDA.ZPX 00           ( 2315 )
JSR.ABS 232B         ( 2317 )
LDY.ABS 1B0F         ( 231A )
BEQ 2328             ( 231D )
LDA.ZPX 00           ( 231F )
STX.ZP D1            ( 2321 )
LDX.# 60             ( 2323 )
JSR.ABS 232F         ( 2325 )
JMP.ABS 1059         ( 2328 )
STX.ZP D1            ( 232B )
LDX.# 20             ( 232D )
PHA                  ( 232F )
LDA.# 0B             ( 2330 )
STA.ABSX 0342        ( 2332 )
LDA.# 00             ( 2335 )
STA.ABSX 0348        ( 2337 )
STA.ABSX 0349        ( 233A )
PLA                  ( 233D )
JSR.ABS E456         ( 233E )
LDX.ZP D1            ( 2341 )
RTS                  ( 2343 )
STX.ZP D1            ( 2344 )
LDX.# 10             ( 2346 )
LDA.# 07             ( 2348 )
STA.ABSX 0342        ( 234A )
LDA.# 00             ( 234D )
STA.ABSX 0348        ( 234F )
STA.ABSX 0349        ( 2352 )
JSR.ABS E456         ( 2355 )
CPY.# 80             ( 2358 )
BNE 235F             ( 235A )
LDA.# 9B             ( 235C )
NOP                  ( 235E )
LDX.ZP D1            ( 235F )
JMP.ABS 1247         ( 2361 )
LDA.ABS 02FC         ( 2364 )
EOR.# FF             ( 2367 )
BEQ 236D             ( 2369 )
LDA.# 01             ( 236B )
JMP.ABS 1247         ( 236D )
LDA.# 9B             ( 2370 )
JSR.ABS 232B         ( 2372 )
LDA.ABS 1B0F         ( 2375 )
BEQ 2383             ( 2378 )
LDA.# 9B             ( 237A )
STX.ZP D1            ( 237C )
LDX.# 60             ( 237E )
JSR.ABS 232F         ( 2380 )
JMP.ABS 0F47         ( 2383 )
AT 2386

( EXPECT | NFA 2386 CFA 238F )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 2386
( Header: flags, saved name and link )
BYTES 860000000000D49C22
CELL 2391 ( native entry point )
LDY.# 20             ( 2391 )
LDA.# 05             ( 2393 )
STA.ABSY 0342        ( 2395 )
LDA.ZPX 00           ( 2398 )
STA.ABSY 0348        ( 239A )
LDA.ZPX 01           ( 239D )
STA.ABSY 0349        ( 239F )
LDA.ZPX 02           ( 23A2 )
STA.ABSY 0344        ( 23A4 )
STA.ZP C2            ( 23A7 )
LDA.ZPX 03           ( 23A9 )
STA.ABSY 0345        ( 23AB )
STA.ZP C3            ( 23AE )
STX.ZP C4            ( 23B0 )
LDX.# 20             ( 23B2 )
JSR.ABS E456         ( 23B4 )
CPY.# 80             ( 23B7 )
BNE 23C0             ( 23B9 )
LDX.ZP C4            ( 23BB )
JMP.ABS 2391         ( 23BD )
LDA.ABSX 0348        ( 23C0 )
SEC                  ( 23C3 )
SBC.# 01             ( 23C4 )
TAY                  ( 23C6 )
LDA.# 00             ( 23C7 )
STA.INDY C2          ( 23C9 )
CLC                  ( 23CB )
LDA.ABS 1B1B         ( 23CC )
BEQ 23EC             ( 23CF )
TYA                  ( 23D1 )
BEQ 23E7             ( 23D2 )
ADC.ABS 0291         ( 23D4 )
CMP.ZP 53            ( 23D7 )
BCC 23E0             ( 23D9 )
SBC.ZP 53            ( 23DB )
CLC                  ( 23DD )
ADC.ZP 52            ( 23DE )
STA.ABS 0291         ( 23E0 )
CMP.ZP 52            ( 23E3 )
BEQ 2402             ( 23E5 )
DEC.ABS 0290         ( 23E7 )
BPL 2402             ( 23EA )
TYA                  ( 23EC )
BEQ 2400             ( 23ED )
ADC.ZP 55            ( 23EF )
CMP.ZP 53            ( 23F1 )
BCC 23FA             ( 23F3 )
SBC.ZP 53            ( 23F5 )
CLC                  ( 23F7 )
ADC.ZP 52            ( 23F8 )
STA.ZP 55            ( 23FA )
CMP.ZP 52            ( 23FC )
BEQ 2402             ( 23FE )
DEC.ZP 54            ( 2400 )
LDA.# 20             ( 2402 )
JSR.ABS 232B         ( 2404 )
LDX.ZP C4            ( 2407 )
LDY.# 00             ( 2409 )
JMP.ABS 1057         ( 240B )
AT 240E

( -DISK | NFA 240E CFA 2416 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 240E
( Header: flags, saved name and link )
BYTES 8500000000CB8623
CELL 2418 ( native entry point )
LDY.# 52             ( 2418 )
LDA.ZPX 00           ( 241A )
BNE 2420             ( 241C )
LDY.# 57             ( 241E )
STY.ABS 0302         ( 2420 )
LDA.ZPX 02           ( 2423 )
STA.ABS 0301         ( 2425 )
LDA.ZPX 04           ( 2428 )
STA.ABS 030A         ( 242A )
LDA.ZPX 05           ( 242D )
STA.ABS 030B         ( 242F )
LDA.ZPX 06           ( 2432 )
STA.ABS 0304         ( 2434 )
LDA.ZPX 07           ( 2437 )
STA.ABS 0305         ( 2439 )
STX.ZP D1            ( 243C )
JSR.ABS 0EB0         ( 243E )
LDX.ZP D1            ( 2441 )
INX                  ( 2443 )
INX                  ( 2444 )
LDA.ABS 0303         ( 2445 )
BMI 244C             ( 2448 )
LDA.# 00             ( 244A )
STA.ZPX 04           ( 244C )
LDA.# 00             ( 244E )
STA.ZPX 05           ( 2450 )
JMP.ABS 1057         ( 2452 )
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
LDA.# 04             ( 2822 )
JSR.ABS 0F6F         ( 2824 )
DEX                  ( 2827 )
DEX                  ( 2828 )
DEX                  ( 2829 )
DEX                  ( 282A )
STY.ZPX 00           ( 282B )
STY.ZPX 01           ( 282D )
STY.ZPX 03           ( 282F )
LDY.# FF             ( 2831 )
INY                  ( 2833 )
CPY.ZP C2            ( 2834 )
BEQ 2862             ( 2836 )
LDA.INDY C4          ( 2838 )
CMP.INDY C8          ( 283A )
BEQ 2833             ( 283C )
INC.ZP C8            ( 283E )
BNE 2844             ( 2840 )
INC.ZP C9            ( 2842 )
INC.ZPX 00           ( 2844 )
BNE 284A             ( 2846 )
INC.ZPX 01           ( 2848 )
LDA.ZP C6            ( 284A )
BNE 2850             ( 284C )
DEC.ZP C7            ( 284E )
DEC.ZP C6            ( 2850 )
LDA.ZP C6            ( 2852 )
CMP.ZP C2            ( 2854 )
LDA.ZP C7            ( 2856 )
SBC.ZP C3            ( 2858 )
BCS 2831             ( 285A )
LDY.ZP C6            ( 285C )
LDA.# 00             ( 285E )
BEQ 2864             ( 2860 )
LDA.# 01             ( 2862 )
STA.ZPX 02           ( 2864 )
CLC                  ( 2866 )
TYA                  ( 2867 )
ADC.ZPX 00           ( 2868 )
PHA                  ( 286A )
LDA.# 00             ( 286B )
ADC.ZPX 01           ( 286D )
JMP.ABS 0F42         ( 286F )
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
LDA.# 01             ( 2925 )
STA.ABS 0244         ( 2927 )
JMP.IND FFFC         ( 292A )
AT 292D

( [FMT] | NFA 292D CFA 2935 )
( Same NFA/CFA and header shape as the APX fig-FORTH )
( kernel, verified against the AD2044 reconstruction. )
AT 292D
( Header: flags, saved name and link )
BYTES 8500000000A91C29
CELL 2937 ( native entry point )
LDA.ZPX 00           ( 2937 )
STA.ABS 0301         ( 2939 )
LDA.# 21             ( 293C )
STA.ABS 0302         ( 293E )
STX.ZP D1            ( 2941 )
JSR.ABS E453         ( 2943 )
TYA                  ( 2946 )
PHA                  ( 2947 )
LDA.# 00             ( 2948 )
LDX.ZP D1            ( 294A )
JMP.ABS 0F42         ( 294C )
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
STX.ZP D1            ( 29B0 )
LDA.ZPX 00           ( 29B2 )
STA.ABS 2A00         ( 29B4 )
STA.ABS 0E81         ( 29B7 )
LDA.# 01             ( 29BA )
STA.ABS 0301         ( 29BC )
LDA.# 57             ( 29BF )
STA.ABS 0302         ( 29C1 )
LDA.# 80             ( 29C4 )
STA.ABS 0304         ( 29C6 )
LDA.# 0E             ( 29C9 )
STA.ABS 0305         ( 29CB )
LDA.# 01             ( 29CE )
STA.ABS 030A         ( 29D0 )
LDA.# 00             ( 29D3 )
STA.ABS 030B         ( 29D5 )
JSR.ABS E453         ( 29D8 )
BMI 2A01             ( 29DB )
LDA.ABS 0304         ( 29DD )
CLC                  ( 29E0 )
ADC.# 80             ( 29E1 )
STA.ABS 0304         ( 29E3 )
LDA.ABS 0305         ( 29E6 )
ADC.# 00             ( 29E9 )
STA.ABS 0305         ( 29EB )
INC.ABS 030A         ( 29EE )
BNE 29F6             ( 29F1 )
INC.ABS 030B         ( 29F3 )
DEC.ABS 2A00         ( 29F6 )
BNE 29D8             ( 29F9 )
LDX.ZP D1            ( 29FB )
JMP.ABS 1059         ( 29FD )
( 2A00: SAVE sector counter; mutable data )
BYTES BB
JMP.ABS 1EF3         ( 2A01 )
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
STX.ZP D1            ( 2A1D )
LDA.ZPX 02           ( 2A1F )
STA.ABS 0E81         ( 2A21 )
LDX.# 30             ( 2A24 )
LDA.# 03             ( 2A26 )
STA.ABSX 0342        ( 2A28 )
LDA.# 08             ( 2A2B )
STA.ABSX 034A        ( 2A2D )
LDA.# 80             ( 2A30 )
STA.ABSX 034B        ( 2A32 )
LDA.# 75             ( 2A35 )
STA.ABSX 0344        ( 2A37 )
LDA.# 2A             ( 2A3A )
STA.ABSX 0345        ( 2A3C )
JSR.ABS E456         ( 2A3F )
BMI 2A01             ( 2A42 )
LDA.# 0B             ( 2A44 )
STA.ABSX 0342        ( 2A46 )
LDA.# 80             ( 2A49 )
STA.ABSX 0344        ( 2A4B )
LDA.# 0E             ( 2A4E )
STA.ABSX 0345        ( 2A50 )
LDY.ZP D1            ( 2A53 )
LDA.ABSY 0000        ( 2A55 )
STA.ABSX 0348        ( 2A58 )
LDA.ABSY 0001        ( 2A5B )
STA.ABSX 0349        ( 2A5E )
JSR.ABS E456         ( 2A61 )
BMI 2A01             ( 2A64 )
LDA.# 0C             ( 2A66 )
STA.ABSX 0342        ( 2A68 )
JSR.ABS E456         ( 2A6B )
BMI 2A01             ( 2A6E )
LDX.ZP D1            ( 2A70 )
JMP.ABS 1057         ( 2A72 )
( 2A75: Cassette filename: ASCII C )
BYTES 43
AT 2A76
