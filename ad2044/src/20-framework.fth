( AD 2044 20-framework.fth: target 2A1B..7B4E )
( Hexadecimal. BYTES emits hex bytes; CELL emits a 16-bit )
( cell. )
( LIT8/LIT16 compile literals; branch cells are signed )
( offsets. )
( 6502 mnemonics use 06-assembler.fth; operands follow )
( words. )

( SAVE-CASSETTE-PRIMITIVE | NFA 2A1B CFA 2A1B )
( Inferred descriptive name: headerless native CFA called )
( by stock fig-FORTH CSAVE. )
AT 2A1B
( Headerless internal native entry point )
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

( ASSEMBLER | NFA 2A76 CFA 2A82 )
( GAM FORTH 09_A_Forth.ATR CFA $2A82, corresponding word in )
( contiguous 252-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 2A76
( Saved dictionary header: flags, name bytes, link )
BYTES C90000000000000000D2042A
DODOES
( DOES> thread at 1E30 )
BYTES 301E81A0AA2F481E
AT 2A8C

( INDEX | NFA 2A8C CFA 2A94 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2A8C
( Saved dictionary header: flags, name bytes, link )
BYTES 85494E4445D8441E
DOVAR
BYTES 090905151501118009800D1D19808080800004141480808080800C1C
BYTES 1C80802C
AT 2AB6

( MODE | NFA 2AB6 CFA 2ABD )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2AB6
( Saved dictionary header: flags, name bytes, link )
BYTES 844D4F44C58C2A
DOVAR
CELL 0002
AT 2AC1

( .A | NFA 2AC1 CFA 2AC6 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2AC1
( Saved dictionary header: flags, name bytes, link )
BYTES 822EC1B62A
DOCOL
t.0 t.MODE t.! t.;S
AT 2AD0

( # | NFA 2AD0 CFA 2AD4 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2AD0
( Saved dictionary header: flags, name bytes, link )
BYTES 81A3C12A
DOCOL
t.1 t.MODE t.! t.;S
AT 2ADE

( MEM | NFA 2ADE CFA 2AE4 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2ADE
( Saved dictionary header: flags, name bytes, link )
BYTES 834D45CDD02A
DOCOL
t.2 t.MODE t.! t.;S
AT 2AEE

( ,X | NFA 2AEE CFA 2AF3 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2AEE
( Saved dictionary header: flags, name bytes, link )
BYTES 822CD8DE2A
DOCOL
t.3 t.MODE t.! t.;S
AT 2AFD

( ,Y | NFA 2AFD CFA 2B02 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2AFD
( Saved dictionary header: flags, name bytes, link )
BYTES 822CD9EE2A
DOCOL
LIT16 0004 t.MODE t.! t.;S
AT 2B0E

( X] | NFA 2B0E CFA 2B13 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2B0E
( Saved dictionary header: flags, name bytes, link )
BYTES 8258A9FD2A
DOCOL
LIT16 0005 t.MODE t.! t.;S
AT 2B1F

( ]Y | NFA 2B1F CFA 2B24 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2B1F
( Saved dictionary header: flags, name bytes, link )
BYTES 8229D90E2B
DOCOL
LIT16 0006 t.MODE t.! t.;S
AT 2B30

( ] | NFA 2B30 CFA 2B34 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2B30
( Saved dictionary header: flags, name bytes, link )
BYTES 81A91F2B
DOCOL
LIT16 000F t.MODE t.! t.;S
AT 2B40

( BOT | NFA 2B40 CFA 2B46 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2B40
( Saved dictionary header: flags, name bytes, link )
BYTES 83424FD4302B
DOCOL
t.,X t.0 t.;S
AT 2B4E

( SEC | NFA 2B4E CFA 2B54 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2B4E
( Saved dictionary header: flags, name bytes, link )
BYTES 835345C3402B
DOCOL
t.,X t.2 t.;S
AT 2B5C

( RP] | NFA 2B5C CFA 2B62 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2B5C
( Saved dictionary header: flags, name bytes, link )
BYTES 835250A94E2B
DOCOL
t.,X LIT16 0101 t.;S
AT 2B6C

( UPMODE | NFA 2B6C CFA 2B75 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2B6C
( Saved dictionary header: flags, name bytes, link )
BYTES 8655504D4F44C55C2B
DOCOL
t.0BRANCH CELL 001A ( -> 2B93 )
t.MODE t.@ LIT16 0008 t.AND t.0=_12DE
t.0BRANCH CELL 000A ( -> 2B93 )
LIT16 0008 t.MODE t.+!
( label 2B93 )
t.1 t.MODE t.@ LIT16 000F t.AND t.-DUP
t.0BRANCH CELL 000E ( -> 2BB1 )
t.0 t.(DO)
( label 2BA9 )
t.DUP t.+
t.(LOOP) CELL FFFA ( -> 2BA9 )
( label 2BB1 )
t.OVER t.1+ t.@ t.AND t.0=_12DE t.;S
AT 2BBD

( CPU | NFA 2BBD CFA 2BC3 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2BBD
( Saved dictionary header: flags, name bytes, link )
BYTES 834350D56C2B
DOCOL
t.<BUILDS t.C, t.DOES>
( Trailing code/data at 2BCB; retained exactly )
BYTES F9135216E42A7712
AT 2BD3

( BRK, | NFA 2BD3 CFA 2BDA )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2BD3
( Saved dictionary header: flags, name bytes, link )
BYTES 8442524BACBD2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B00
AT 2BDF

( CLC, | NFA 2BDF CFA 2BE6 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2BDF
( Saved dictionary header: flags, name bytes, link )
BYTES 84434C43ACD32B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B18
AT 2BEB

( CLD, | NFA 2BEB CFA 2BF2 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2BEB
( Saved dictionary header: flags, name bytes, link )
BYTES 84434C44ACDF2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2BD8
AT 2BF7

( CLI, | NFA 2BF7 CFA 2BFE )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2BF7
( Saved dictionary header: flags, name bytes, link )
BYTES 84434C49ACEB2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B58
AT 2C03

( CLV, | NFA 2C03 CFA 2C0A )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C03
( Saved dictionary header: flags, name bytes, link )
BYTES 84434C56ACF72B
DODOES
( DOES> thread at 2BCB )
BYTES CB2BB8
AT 2C0F

( DEX, | NFA 2C0F CFA 2C16 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C0F
( Saved dictionary header: flags, name bytes, link )
BYTES 84444558AC032C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BCA
AT 2C1B

( DEY, | NFA 2C1B CFA 2C22 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C1B
( Saved dictionary header: flags, name bytes, link )
BYTES 84444559AC0F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B88
AT 2C27

( INX, | NFA 2C27 CFA 2C2E )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C27
( Saved dictionary header: flags, name bytes, link )
BYTES 84494E58AC1B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BE8
AT 2C33

( INY, | NFA 2C33 CFA 2C3A )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C33
( Saved dictionary header: flags, name bytes, link )
BYTES 84494E59AC272C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BC8
AT 2C3F

( NOP, | NFA 2C3F CFA 2C46 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C3F
( Saved dictionary header: flags, name bytes, link )
BYTES 844E4F50AC332C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BEA
AT 2C4B

( PHA, | NFA 2C4B CFA 2C52 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C4B
( Saved dictionary header: flags, name bytes, link )
BYTES 84504841AC3F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B48
AT 2C57

( PHP, | NFA 2C57 CFA 2C5E )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C57
( Saved dictionary header: flags, name bytes, link )
BYTES 84504850AC4B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B08
AT 2C63

( PLA, | NFA 2C63 CFA 2C6A )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C63
( Saved dictionary header: flags, name bytes, link )
BYTES 84504C41AC572C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B68
AT 2C6F

( PLP, | NFA 2C6F CFA 2C76 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C6F
( Saved dictionary header: flags, name bytes, link )
BYTES 84504C50AC632C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B28
AT 2C7B

( RTI, | NFA 2C7B CFA 2C82 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C7B
( Saved dictionary header: flags, name bytes, link )
BYTES 84525449AC6F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B40
AT 2C87

( RTS, | NFA 2C87 CFA 2C8E )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C87
( Saved dictionary header: flags, name bytes, link )
BYTES 84525453AC7B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B60
AT 2C93

( SEC, | NFA 2C93 CFA 2C9A )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C93
( Saved dictionary header: flags, name bytes, link )
BYTES 84534543AC872C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B38
AT 2C9F

( SED, | NFA 2C9F CFA 2CA6 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2C9F
( Saved dictionary header: flags, name bytes, link )
BYTES 84534544AC932C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BF8
AT 2CAB

( SEI, | NFA 2CAB CFA 2CB2 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2CAB
( Saved dictionary header: flags, name bytes, link )
BYTES 84534549AC9F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B78
AT 2CB7

( TAX, | NFA 2CB7 CFA 2CBE )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2CB7
( Saved dictionary header: flags, name bytes, link )
BYTES 84544158ACAB2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BAA
AT 2CC3

( TAY, | NFA 2CC3 CFA 2CCA )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2CC3
( Saved dictionary header: flags, name bytes, link )
BYTES 84544159ACB72C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BA8
AT 2CCF

( TSX, | NFA 2CCF CFA 2CD6 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2CCF
( Saved dictionary header: flags, name bytes, link )
BYTES 84545358ACC32C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BBA
AT 2CDB

( TXA, | NFA 2CDB CFA 2CE2 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2CDB
( Saved dictionary header: flags, name bytes, link )
BYTES 84545841ACCF2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B8A
AT 2CE7

( TXS, | NFA 2CE7 CFA 2CEE )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2CE7
( Saved dictionary header: flags, name bytes, link )
BYTES 84545853ACDB2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B9A
AT 2CF3

( TYA, | NFA 2CF3 CFA 2CFA )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2CF3
( Saved dictionary header: flags, name bytes, link )
BYTES 84545941ACE72C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B98
AT 2CFF

( MCP | NFA 2CFF CFA 2D05 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2CFF
( Saved dictionary header: flags, name bytes, link )
BYTES 834D43D0F32C
DOCOL
t.<BUILDS t.C, t., t.DOES>
( Trailing code/data at 2D0F; retained exactly )
BYTES A5130916E4132D0F80000312C10F0A002D0F1000BD2AB41373132D0F
BYTES 00FF0312752B752BC10F0E00E42A5F112417841CDD144F1CF913BD2A
BYTES F913942A0413F91304135216BD2AF9132D0F07000312C10F1E00BD2A
BYTES F9132D0F0F0003122D0F07009B16C10F08005216A20F04004116E42A
BYTES 7712
AT 2D81

( ADC, | NFA 2D81 CFA 2D88 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2D81
( Saved dictionary header: flags, name bytes, link )
BYTES 84414443ACFF2C
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D606E1C
AT 2D8F

( AND, | NFA 2D8F CFA 2D96 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2D8F
( Saved dictionary header: flags, name bytes, link )
BYTES 84414E44AC812D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D206E1C
AT 2D9D

( CMP, | NFA 2D9D CFA 2DA4 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2D9D
( Saved dictionary header: flags, name bytes, link )
BYTES 84434D50AC8F2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC06E1C
AT 2DAB

( EOR, | NFA 2DAB CFA 2DB2 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2DAB
( Saved dictionary header: flags, name bytes, link )
BYTES 84454F52AC9D2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D406E1C
AT 2DB9

( LDA, | NFA 2DB9 CFA 2DC0 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2DB9
( Saved dictionary header: flags, name bytes, link )
BYTES 844C4441ACAB2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA06E1C
AT 2DC7

( ORA, | NFA 2DC7 CFA 2DCE )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2DC7
( Saved dictionary header: flags, name bytes, link )
BYTES 844F5241ACB92D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D006E1C
AT 2DD5

( SBC, | NFA 2DD5 CFA 2DDC )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2DD5
( Saved dictionary header: flags, name bytes, link )
BYTES 84534243ACC72D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE06E1C
AT 2DE3

( STA, | NFA 2DE3 CFA 2DEA )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2DE3
( Saved dictionary header: flags, name bytes, link )
BYTES 84535441ACD52D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D806C1C
AT 2DF1

( ASL, | NFA 2DF1 CFA 2DF8 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2DF1
( Saved dictionary header: flags, name bytes, link )
BYTES 8441534CACE32D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D010D0D
AT 2DFF

( DEC, | NFA 2DFF CFA 2E06 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2DFF
( Saved dictionary header: flags, name bytes, link )
BYTES 84444543ACF12D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC10C0C
AT 2E0D

( INC, | NFA 2E0D CFA 2E14 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E0D
( Saved dictionary header: flags, name bytes, link )
BYTES 84494E43ACFF2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE10C0C
AT 2E1B

( LSR, | NFA 2E1B CFA 2E22 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E1B
( Saved dictionary header: flags, name bytes, link )
BYTES 844C5352AC0D2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D410D0D
AT 2E29

( ROL, | NFA 2E29 CFA 2E30 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E29
( Saved dictionary header: flags, name bytes, link )
BYTES 84524F4CAC1B2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D210D0D
AT 2E37

( ROR, | NFA 2E37 CFA 2E3E )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E37
( Saved dictionary header: flags, name bytes, link )
BYTES 84524F52AC292E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D610D0D
AT 2E45

( STX, | NFA 2E45 CFA 2E4C )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E45
( Saved dictionary header: flags, name bytes, link )
BYTES 84535458AC372E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D811404
AT 2E53

( CPX, | NFA 2E53 CFA 2E5A )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E53
( Saved dictionary header: flags, name bytes, link )
BYTES 84435058AC452E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE08604
AT 2E61

( CPY, | NFA 2E61 CFA 2E68 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E61
( Saved dictionary header: flags, name bytes, link )
BYTES 84435059AC532E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC08604
AT 2E6F

( LDX, | NFA 2E6F CFA 2E76 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E6F
( Saved dictionary header: flags, name bytes, link )
BYTES 844C4458AC612E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA29614
AT 2E7D

( LDY, | NFA 2E7D CFA 2E84 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E7D
( Saved dictionary header: flags, name bytes, link )
BYTES 844C4459AC6F2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA08E0C
AT 2E8B

( STY, | NFA 2E8B CFA 2E92 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E8B
( Saved dictionary header: flags, name bytes, link )
BYTES 84535459AC7D2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D808C04
AT 2E99

( JSR, | NFA 2E99 CFA 2EA0 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2E99
( Saved dictionary header: flags, name bytes, link )
BYTES 844A5352AC8B2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D148004
AT 2EA7

( JMP, | NFA 2EA7 CFA 2EAE )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2EA7
( Saved dictionary header: flags, name bytes, link )
BYTES 844A4D50AC992E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D408084
AT 2EB5

( BIT, | NFA 2EB5 CFA 2EBC )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2EB5
( Saved dictionary header: flags, name bytes, link )
BYTES 84424954ACA72E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D208404
AT 2EC3

( BEGIN, | NFA 2EC3 CFA 2ECC )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2EC3
( Saved dictionary header: flags, name bytes, link )
BYTES C6424547494EACB52E
DOCOL
t.HERE t.1 t.;S
AT 2ED4

( UNTIL, | NFA 2ED4 CFA 2EDD )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2ED4
( Saved dictionary header: flags, name bytes, link )
BYTES C6554E54494CACC32E
DOCOL
t.?EXEC t.>R t.1 t.?PAIRS t.R> t.C, t.HERE t.1+ t.- t.C, t.;S
AT 2EF5

( IF, | NFA 2EF5 CFA 2EFB )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2EF5
( Saved dictionary header: flags, name bytes, link )
BYTES C34946ACD42E
DOCOL
t.C, t.HERE t.0 t.C, t.2 t.;S
AT 2F09

( THEN, | NFA 2F09 CFA 2F11 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2F09
( Saved dictionary header: flags, name bytes, link )
BYTES C55448454EACF52E
DOCOL
t.?EXEC t.2 t.?PAIRS t.HERE t.OVER t.C@
t.0BRANCH CELL 000A ( -> 2F2B )
t.SWAP t.!
t.BRANCH CELL 000C ( -> 2F35 )
( label 2F2B )
t.OVER t.1+ t.- t.SWAP t.C!
( label 2F35 )
t.;S
AT 2F37

( ELSE, | NFA 2F37 CFA 2F3F )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2F37
( Saved dictionary header: flags, name bytes, link )
BYTES C5454C5345AC092F
DOCOL
t.2 t.?PAIRS t.HERE t.1+ t.1 t.JMP, t.SWAP t.HERE t.OVER t.1+
t.- t.SWAP t.C! t.2 t.;S
AT 2F5F

( NOT | NFA 2F5F CFA 2F65 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2F5F
( Saved dictionary header: flags, name bytes, link )
BYTES 834E4FD4372F
DOCOL
LIT16 0020 t.+ t.;S
AT 2F6F

( CS | NFA 2F6F CFA 2F74 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2F6F
( Saved dictionary header: flags, name bytes, link )
BYTES 8243D35F2F
DOCON
CELL 0090
AT 2F78

( 0= | NFA 2F78 CFA 2F7D )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2F78
( Saved dictionary header: flags, name bytes, link )
BYTES 8230BD6F2F
DOCON
CELL 00D0
AT 2F81

( 0< | NFA 2F81 CFA 2F86 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2F81
( Saved dictionary header: flags, name bytes, link )
BYTES 8230BC782F
DOCON
CELL 0010
AT 2F8A

( >= | NFA 2F8A CFA 2F8F )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2F8A
( Saved dictionary header: flags, name bytes, link )
BYTES 823EBD812F
DOCON
CELL 0090
AT 2F93

( C; | NFA 2F93 CFA 2F98 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2F93
( Saved dictionary header: flags, name bytes, link )
BYTES C243BB8A2F
DOCOL
t.CURRENT t.@ t.CONTEXT t.! t.?EXEC t.?CSP t.SMUDGE t.;S
AT 2FAA

( END-CODE | NFA 2FAA CFA 2FB5 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 2FAA
( Saved dictionary header: flags, name bytes, link )
BYTES C8454E442D434F44C5932F
DOCOL
t.C; t.;S
AT 2FBB

( CODE | NFA 2FBB CFA 2FC2 )
( GAM FORTH 09_A_Forth.ATR CFA $2FC2, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 2FBB
( Saved dictionary header: flags, name bytes, link )
BYTES C4000000C5762A
DOCOL
t.?EXEC t.CREATE t.ASSEMBLER t.MEM t.!CSP t.;S
AT 2FD0

( MAC | NFA 2FD0 CFA 2FD6 )
( GAM FORTH 09_A_Forth.ATR CFA $2FD6, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 2FD0
( Saved dictionary header: flags, name bytes, link )
BYTES C30000C3BB2F
DOCOL
t.-FIND t.0=_12DE t.0 t.?ERROR t.DROP LIT16 0020 t.C, t., t.;S
AT 2FEC

( FREE | NFA 2FEC CFA 2FF3 )
( GAM FORTH 09_A_Forth.ATR CFA $30A9, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 2FEC
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C5D02F
DOCOL
LIT16 02E5 t.@ t.HERE t.- t.U.
( ATASCII text: bytes )
t.(.")
BYTES 056279746573
t.CR t.;S
AT 300D

( BEEP | NFA 300D CFA 3014 )
( GAM FORTH 09_A_Forth.ATR CFA $3014, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 300D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D0EC2F
DOCOL
LIT16 00C0 t.0 t.(DO)
( label 301E )
LIT16 0008 LIT16 D01F t.C! LIT16 0006 t.0 t.(DO)
( label 3030 )
t.(LOOP) CELL FFFE ( -> 3030 )
LIT16 0000 LIT16 D01F t.C! LIT16 0006 t.0 t.(DO)
( label 3046 )
t.(LOOP) CELL FFFE ( -> 3046 )
t.(LOOP) CELL FFD2 ( -> 301E )
t.;S
AT 3050

( #GGE | NFA 3050 CFA 3057 )
( GAM FORTH 09_A_Forth.ATR CFA $3444, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3050
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C50D30
DOVAR
CELL 0081
AT 305B

( GGE | NFA 305B CFA 3061 )
( GAM FORTH 09_A_Forth.ATR CFA $344E, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 305B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C55030
DOCOL
t.#GGE t.@ t.;S
AT 3069

( INSTR | NFA 3069 CFA 3071 )
( GAM FORTH 09_A_Forth.ATR CFA $345E, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3069
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D25B30
CELL 3073 ( native entry point )
LDA.ZPX 02           ( 3073 )
STA.ZP D3            ( 3075 )
LDA.ZPX 03           ( 3077 )
STA.ZP D4            ( 3079 )
LDY.# 00             ( 307B )
LDA.INDY D3          ( 307D )
CMP.ZPX 04           ( 307F )
BNE 3089             ( 3081 )
LDA.# 01             ( 3083 )
INY                  ( 3085 )
JMP.ABS 3098         ( 3086 )
INY                  ( 3089 )
TYA                  ( 308A )
CMP.ZPX 00           ( 308B )
BNE 3096             ( 308D )
LDA.# 01             ( 308F )
LDY.# 00             ( 3091 )
JMP.ABS 3098         ( 3093 )
LDA.# 00             ( 3096 )
CMP.# 01             ( 3098 )
BNE 307D             ( 309A )
STY.ZPX 04           ( 309C )
JMP.ABS 1057         ( 309E )
AT 30A1

( SELECT | NFA 30A1 CFA 30AA )
( GAM FORTH 09_A_Forth.ATR CFA $3497, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 30A1
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000D46930
DOCOL
t.<BUILDS t.SMUDGE t.] t.DOES>
( Trailing code/data at 30B4; retained exactly )
BYTES 8D13D5140F200413E4138A0F7712
AT 30C2

( BNAG | NFA 30C2 CFA 30C9 )
( GAM FORTH 09_A_Forth.ATR CFA $34B6, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 30C2
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C7A130
DOCON
CELL 007F
AT 30CD

( 4 | NFA 30CD CFA 30D1 )
( GAM FORTH 09_A_Forth.ATR CFA $34BE, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 30CD
( Saved dictionary header: flags, name bytes, link )
BYTES 81B4C230
DOCON
CELL 0004
AT 30D5

( 8 | NFA 30D5 CFA 30D9 )
( GAM FORTH 09_A_Forth.ATR CFA $34C6, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 30D5
( Saved dictionary header: flags, name bytes, link )
BYTES 81B8CD30
DOCON
CELL 0008
AT 30DD

( 16 | NFA 30DD CFA 30E2 )
( GAM FORTH 09_A_Forth.ATR CFA $34CF, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 30DD
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B6D530
DOCON
CELL 0010
AT 30E6

( 32 | NFA 30E6 CFA 30EB )
( GAM FORTH 09_A_Forth.ATR CFA $34D8, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 30E6
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B2DD30
DOCON
CELL 0020
AT 30EF

( 64 | NFA 30EF CFA 30F4 )
( GAM FORTH 09_A_Forth.ATR CFA $34E1, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 30EF
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B4E630
DOCON
CELL 0040
AT 30F8

( 128 | NFA 30F8 CFA 30FE )
( GAM FORTH 09_A_Forth.ATR CFA $34EB, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 30F8
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B8EF30
DOCON
CELL 0080
AT 3102

( #FP | NFA 3102 CFA 3108 )
( GAM FORTH 09_A_Forth.ATR CFA $34F5, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3102
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D0F830
DOVAR
CELL 003E
AT 310C

( #F | NFA 310C CFA 3111 )
( GAM FORTH 09_A_Forth.ATR CFA $34FE, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 310C
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C60231
DOVAR
CELL 0001
AT 3115

( FP2@ | NFA 3115 CFA 311C )
( GAM FORTH 09_A_Forth.ATR CFA $3509, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3115
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C00C31
DOCOL
t.#FP t.@ t.#F t.@ t.AND t.0=_12DE t.0=_12DE t.;S
AT 312E

( FP2! | NFA 312E CFA 3135 )
( GAM FORTH 09_A_Forth.ATR CFA $3522, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 312E
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A11531
DOCOL
t.>R t.#F t.@ t.#FP t.@ t.R>
t.0BRANCH CELL 0008 ( -> 314D )
t.OR
t.BRANCH CELL 0004 ( -> 314F )
( label 314D )
t.XOR
( label 314F )
t.#FP t.! t.;S
AT 3155

( C2^ | NFA 3155 CFA 315B )
( GAM FORTH 09_A_Forth.ATR CFA $3548, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3155
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DE2E31
DODOES
( DOES> thread at 30B4 )
BYTES B430CD14D514D130D930E230EB30F430FE307712
AT 3171

( POZ-NAG | NFA 3171 CFA 317B )
( GAM FORTH 09_A_Forth.ATR CFA $3568, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3171
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C75531
DOCOL
t.8 t./MOD t.BNAG t.BLOCK t.+ t.SWAP t.C2^ t.;S
AT 318D

( NAG | NFA 318D CFA 3193 )
( GAM FORTH 09_A_Forth.ATR CFA $3580, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 318D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C77131
DOCOL
t.POZ-NAG t.SWAP t.C@ t.AND t.0=_12DE t.0=_12DE t.;S
AT 31A3

( SAV-NAG | NFA 31A3 CFA 31AD )
( GAM FORTH 09_A_Forth.ATR CFA $359A, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 31A3
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C78D31
DOCOL
t.OVER t.NAG t.=
t.0BRANCH CELL 0008 ( -> 31BF )
t.DROP
t.BRANCH CELL 0008 ( -> 31C5 )
( label 31BF )
t.POZ-NAG t.TOGGLE t.UPDATE
( label 31C5 )
t.;S
AT 31C7

( $=$ | NFA 31C7 CFA 31CD )
( GAM FORTH 09_A_Forth.ATR CFA $35BA, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 31C7
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A4A331
DOCOL
t.>R
( label 31D1 )
t.R> t.1 t.- t.>R t.OVER t.R t.+ t.C@ t.OVER t.R t.+ t.C@ t.=
t.0=_12DE t.R t.0=_12DE t.+
t.0BRANCH CELL FFDC ( -> 31D1 )
t.2DROP t.R> t.0=_12DE t.;S
AT 31FF

( SP$=$ | NFA 31FF CFA 3207 )
( GAM FORTH 09_A_Forth.ATR CFA $35F4, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 31FF
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A4C731
DOCOL
t.SWAP t.DUP t.1 t.- t.C@ t.BL t.= t.>R t.SWAP t.$=$ t.R> t.*
t.;S
AT 3223

( D$ | NFA 3223 CFA 3228 )
( GAM FORTH 09_A_Forth.ATR CFA $3615, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3223
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A4FF31
DOVAR
CELL 0040
AT 322C

( INSTR$ | NFA 322C CFA 3235 )
( GAM FORTH 09_A_Forth.ATR CFA $3622, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 322C
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000A42332
DOCOL
t.0 t.>R t.D$ t.!
( label 323F )
t.OVER t.COUNT t.>R t.C@ t.OVER t.D$ t.@ t.R> t.- t.R t.- t.1+
t.SWAP t.R t.+ t.SWAP t.INSTR t.DUP t.0=_12DE
t.0BRANCH CELL 000E ( -> 3275 )
t.R> t.DROP t.>R t.1
t.BRANCH CELL 0020 ( -> 3293 )
( label 3275 )
t.R> t.+ t.>R t.OVER t.COUNT t.>R t.OVER t.1 t.- t.R> t.SWAP
t.R t.+ t.SWAP t.SP$=$
( label 3293 )
t.0BRANCH CELL FFAA ( -> 323F )
t.2DROP t.R> t.;S
AT 329D

( INSTR$$ | NFA 329D CFA 32A7 )
( GAM FORTH 09_A_Forth.ATR CFA $3694, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 329D
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000A42C32
DOCOL
t.COUNT t.INSTR$ t.;S
AT 32AF

( OSF | NFA 32AF CFA 32B5 )
( GAM FORTH 09_A_Forth.ATR CFA $36A2, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 32AF
( Saved dictionary header: flags, name bytes, link )
BYTES C30000C69D32
DODOES
( DOES> thread at 1E30 )
BYTES 301E81A0C6338A2A
AT 32BF

( POPRAW | NFA 32BF CFA 32C8 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 32BF
( Saved dictionary header: flags, name bytes, link )
BYTES 86504F505241D7441E
DOCOL
t.FP2@
t.0BRANCH CELL 003E ( -> 330C )
t.BLK t.@ t.BLOCK t.IN t.@ t.+ t.HERE t.C@ t.- LIT16 000A t.-
t.DUP t.3 t.BLANKS t.SWAP t.S->D t.<# t.#_268F t.#_268F
t.#_268F t.#> t.>R t.SWAP t.R> t.CMOVE t.UPDATE t.FLUSH
t.BRANCH CELL 0004 ( -> 330E )
( label 330C )
t.DROP
( label 330E )
t.;S
AT 3310

( LIN0 | NFA 3310 CFA 3317 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3310
( Saved dictionary header: flags, name bytes, link )
BYTES 844C494EB0BF32
DOCOL
t.PAD t.SWAP t.B/SCR t.* t.1 t.R/W t.;S
AT 3327

( Y-SLO | NFA 3327 CFA 332F )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3327
( Saved dictionary header: flags, name bytes, link )
BYTES 85592D534CCF1033
DOCOL
t.LIN0 t.HERE t.PAD t.64 t.INSTR$ t.;S
AT 333D

( SZUK-SLO | NFA 333D CFA 3348 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 333D
( Saved dictionary header: flags, name bytes, link )
BYTES 88535A554B2D534CCF2733
DOCOL
t.0 t.GGE t.1 t.(DO)
( label 3352 )
t.I t.NAG
t.0BRANCH CELL 0016 ( -> 336E )
t.I t.Y-SLO
t.0BRANCH CELL 000E ( -> 336E )
t.I t.POPRAW t.DROP t.I t.1 t.LEAVE
( label 336E )
t.(LOOP) CELL FFE2 ( -> 3352 )
t.;S
AT 3374

( PH | NFA 3374 CFA 3379 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3374
( Saved dictionary header: flags, name bytes, link )
BYTES 8250C83D33
DOCOL
t.HERE t.C@ t.1+ t.HERE t.C! t.BL t.HERE t.DUP t.C@ t.+ t.C!
t.;S
AT 3393

( F0! | NFA 3393 CFA 3399 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3393
( Saved dictionary header: flags, name bytes, link )
BYTES 834630A17433
DOCOL
t.PAD t.BNAG t.1 t.1 t.-DISK
t.0BRANCH CELL 001D ( -> 33C4 )
t.1 t.#F t.! t.CR
( ATASCII text: BLAD DYSKOWY )
t.(.")
BYTES 0C424C4144204459534B4F5759
t.CR t.ABORT
( label 33C4 )
t.;S
AT 33C6

( ?KOMU | NFA 33C6 CFA 33CE )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 33C6
( Saved dictionary header: flags, name bytes, link )
BYTES 853F4B4F4DD59333
DOCOL
t.DUP
t.0BRANCH CELL 0027 ( -> 33FB )
t.CR t.HERE t.COUNT t.TYPE
( ATASCII text:  SCR#  )
t.(.")
BYTES 06205343522320
t.OVER t.BASE t.@ t.DECIMAL t.SWAP t.. t.BASE t.!
t.BRANCH CELL 0073 ( -> 346C )
( label 33FB )
t.BEEP t.CR
( ATASCII text: Brak na dysku slowa:  )
t.(.")
BYTES 154272616B206E61206479736B7520736C6F77613A20
t.HERE t.COUNT t.TYPE t.CR t.CR
( ATASCII text: RETURN-inna dyskietka )
t.(.")
BYTES 1552455455524E2D696E6E61206479736B6965746B61
t.CR
( ATASCII text: inny klawisz ABORT )
t.(.")
BYTES 12696E6E79206B6C617769737A2041424F5254
t.KEY LIT16 009B t.=
t.0BRANCH CELL 000A ( -> 3464 )
t.0 t.FP2!
t.BRANCH CELL 000A ( -> 346C )
( label 3464 )
t.1 t.#F t.! t.ABORT
( label 346C )
t.;S
AT 346E

( LOAD" | NFA 346E CFA 3476 )
( GAM FORTH 09_A_Forth.ATR CFA $3863, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 346E
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A2AF32
DOCOL
t.-FIND t.PH t.#F t.@ t.2 t.* t.#F t.! t.1 t.FP2!
t.0BRANCH CELL 000A ( -> 3498 )
t.2DROP t.DROP
t.BRANCH CELL 0022 ( -> 34B8 )
( label 3498 )
t.DUP t.F0! t.Y-SLO
t.0BRANCH CELL 0008 ( -> 34A8 )
t.LOAD
t.BRANCH CELL 0012 ( -> 34B8 )
( label 34A8 )
t.DROP
( label 34AA )
t.EMPTY-BUFFERS t.F0! t.SZUK-SLO t.?KOMU
t.0BRANCH CELL FFF6 ( -> 34AA )
t.LOAD
( label 34B8 )
t.FP2@ t.0=_12DE
t.0BRANCH CELL 0020 ( -> 34DE )
t.CR
( ATASCII text: Dyskietka 1 i RETURN  )
t.(.")
BYTES 154479736B6965746B61203120692052455455524E20
t.KEY t.DROP
( label 34DE )
t.#F t.@ t.2 t./ t.#F t.! t.;S
AT 34EC

( <=< | NFA 34EC CFA 34F2 )
( GAM FORTH 09_A_Forth.ATR CFA $38DF, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 34EC
( Saved dictionary header: flags, name bytes, link )
BYTES 830000BC6E34
DOCOL
t.OVER t.> t.>R t.< t.R> t.* t.;S
AT 3502

( % | NFA 3502 CFA 3506 )
( GAM FORTH 09_A_Forth.ATR CFA $38F3, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 3502
( Saved dictionary header: flags, name bytes, link )
BYTES C1A5EC34
DOCOL
t.COMPILE t.CLIT t.BL t.WORD t.HERE t.NUMBER t.DROP LIT16 FFFF
t.OVER LIT16 0100 t.<=< t.0=_12DE
t.0BRANCH CELL 0014 ( -> 353A )
t.CR
( ATASCII text: Error: %  )
t.(.")
BYTES 094572726F723A202520
t.DUP t..
( label 353A )
t.C, t.;S
AT 353E

( DIRB | NFA 353E CFA 3545 )
( GAM FORTH 09_A_Forth.ATR CFA $3932, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 353E
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C20235
DOCON
CELL 01F4
AT 3549

( S-L | NFA 3549 CFA 354F )
( GAM FORTH 09_A_Forth.ATR CFA $393C, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3549
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC3E35
DOVAR
CELL 0000
AT 3553

( BDISK | NFA 3553 CFA 355B )
( GAM FORTH 09_A_Forth.ATR CFA $3948, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 3553
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CB4935
DOCOL
t.OVER t.+ t.OVER t.1 t.- t.OVER t.DIRB t.SWAP t.<=< t.0=_12DE
t.0=_12DE t.+ t.SWAP t.(DO)
( label 3579 )
t.I t.DIRB t.=
t.0BRANCH CELL 0008 ( -> 3589 )
t.R> t.1+ t.>R
( label 3589 )
t.DUP t.I t.1 t.S-L t.@ t.-DISK
t.0BRANCH CELL 000C ( -> 35A3 )
t.DROP t.0 t.LEAVE
t.BRANCH CELL 0006 ( -> 35A7 )
( label 35A3 )
t.B/BUF t.+
( label 35A7 )
t.(LOOP) CELL FFD0 ( -> 3579 )
t.0=_12DE t.;S
AT 35AF

( HE | NFA 35AF CFA 35B4 )
( GAM FORTH 09_A_Forth.ATR CFA $39A1, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 35AF
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C55335
DOCON
CELL 8CA0
AT 35B8

( SP& | NFA 35B8 CFA 35BE )
( GAM FORTH 09_A_Forth.ATR CFA $39AB, corresponding word in )
( contiguous 33-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 35B8
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A6AF35
DOVAR
CELL 0CFF
AT 35C2

( ASC-PEEK | NFA 35C2 CFA 35CD )
( GAM FORTH 11_A_Graf.ATR CFA $3303, corresponding word in )
( contiguous 10-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 35C2
( Saved dictionary header: flags, name bytes, link )
BYTES 8800000000000000CBB835
CELL 35CF ( native entry point )
STX.ZP D1            ( 35CF )
LDA.ZPX 00           ( 35D1 )
TAY                  ( 35D3 )
INX                  ( 35D4 )
INX                  ( 35D5 )
LDA.ZPX 00           ( 35D6 )
STA.ZP D3            ( 35D8 )
INX                  ( 35DA )
LDA.ZPX 00           ( 35DB )
STA.ZP D4            ( 35DD )
DEY                  ( 35DF )
LDA.INDY D3          ( 35E0 )
LDX.# 01             ( 35E2 )
CMP.# 80             ( 35E4 )
BPL 35F1             ( 35E6 )
CMP.# 20             ( 35E8 )
BPL 35EE             ( 35EA )
LDX.# 00             ( 35EC )
JMP.ABS 35F7         ( 35EE )
CMP.# A0             ( 35F1 )
BPL 35F7             ( 35F3 )
LDX.# 00             ( 35F5 )
CPX.# 00             ( 35F7 )
BNE 3602             ( 35F9 )
CLC                  ( 35FB )
ADC.# 40             ( 35FC )
CLC                  ( 35FE )
JMP.ABS 3619         ( 35FF )
CMP.# 80             ( 3602 )
BPL 3611             ( 3604 )
CMP.# 60             ( 3606 )
BPL 360E             ( 3608 )
SEC                  ( 360A )
SBC.# 20             ( 360B )
CLC                  ( 360D )
JMP.ABS 3619         ( 360E )
CMP.# E0             ( 3611 )
BPL 3619             ( 3613 )
SEC                  ( 3615 )
SBC.# 20             ( 3616 )
CLC                  ( 3618 )
STA.INDY D3          ( 3619 )
CPY.# 00             ( 361B )
BNE 35DF             ( 361D )
LDX.ZP D1            ( 361F )
JMP.ABS 1057         ( 3621 )
AT 3624

( PEEK-ASC | NFA 3624 CFA 362F )
( GAM FORTH 11_A_Graf.ATR CFA $3365, corresponding word in )
( contiguous 10-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3624
( Saved dictionary header: flags, name bytes, link )
BYTES 8800000000000000C3C235
DOCOL
t.OVER t.OVER LIT8 02 LIT8 00 t.(DO)
( label 363D )
t.ASC-PEEK
t.(LOOP) CELL FFFC ( -> 363D )
t.;S
AT 3645

( X! | NFA 3645 CFA 364A )
( GAM FORTH 09_A_Forth.ATR CFA $3B7E, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 3645
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A12436
DOCOL
LIT8 55 t.! t.;S
AT 3653

( Y! | NFA 3653 CFA 3658 )
( GAM FORTH 09_A_Forth.ATR CFA $3B8C, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 3653
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A14536
DOCOL
LIT8 54 t.C! t.;S
AT 3661

( X@ | NFA 3661 CFA 3666 )
( GAM FORTH 09_A_Forth.ATR CFA $3B9A, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 3661
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C05336
DOCOL
LIT8 55 t.@ t.;S
AT 366F

( Y@ | NFA 366F CFA 3674 )
( GAM FORTH 09_A_Forth.ATR CFA $3BA8, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 366F
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C06136
DOCOL
LIT8 54 t.C@ t.;S
AT 367D

( POS | NFA 367D CFA 3683 )
( GAM FORTH 09_A_Forth.ATR CFA $3BB7, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 367D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D36F36
DOCOL
t.Y! t.X! t.;S
AT 368B

( STYPE | NFA 368B CFA 3693 )
( GAM FORTH 11_A_Graf.ATR CFA $33C9, corresponding word in )
( contiguous 10-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 368B
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C57D36
DOCOL
t.OVER t.OVER t.ASC-PEEK t.OVER t.OVER t.DUP t.>R LIT8 58 t.@
LIT8 55 t.@ t.DUP t.>R t.+ LIT8 54 t.C@ LIT8 28 t.* t.+ t.SWAP
t.R> t.R> t.+ LIT16 0055 t.! LIT8 1E t.EMIT LIT16 001F t.EMIT
t.CMOVE t.PEEK-ASC t.;S
AT 36DE

( [S"] | NFA 36DE CFA 36E5 )
( GAM FORTH 11_A_Graf.ATR CFA $341B, corresponding word in )
( contiguous 10-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 36DE
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A98B36
DOCOL
t.R t.COUNT t.DUP t.1+ t.R> t.+ t.>R t.STYPE t.;S
AT 36F9

( S" | NFA 36F9 CFA 36FE )
( GAM FORTH 11_A_Graf.ATR CFA $3434, corresponding word in )
( contiguous 10-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 36F9
( Saved dictionary header: flags, name bytes, link )
BYTES C200A2DE36
DOCOL
LIT16 36E5 LIT16 199F t.! t.." LIT16 1977 LIT16 199F t.! t.;S
AT 3718

( GAM-DISK-VOCABULARY | NFA 3718 CFA 371E )
( Inferred descriptive name, not recovered original: DODOES )
( vocabulary using the shared VOCABULARY runtime $1E30; its )
( private dictionary head points to DSL at NFA $382E, with )
( LDIR, DIRS and DIRL in that chain. )
AT 3718
( Saved dictionary header: flags, name bytes, link )
BYTES C30000CFF936
DODOES
( DOES> thread at 1E30 )
BYTES 301E81A02E38BD32
AT 3728

( ADIR | NFA 3728 CFA 372F )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3728
( Saved dictionary header: flags, name bytes, link )
BYTES 84414449D2441E
DOVAR
CELL 8E01
AT 3733

( SEP | NFA 3733 CFA 3739 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3733
( Saved dictionary header: flags, name bytes, link )
BYTES 835345D02837
DOVAR
CELL 02C2
AT 373D

( LDIR | NFA 373D CFA 3744 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 373D
( Saved dictionary header: flags, name bytes, link )
BYTES 844C4449D23337
DOCOL
t.0 t.OVER t.B/BUF t.<=<
t.0BRANCH CELL 0088 ( -> 37D8 )
t.PAD t.B/BUF t.+ t.DUP t.ADIR t.! t.DIRB t.1 t.1 t.-DISK
t.0=_12DE
t.0BRANCH CELL 0066 ( -> 37D0 )
t.1 t.128 t.1 t.(DO)
( label 3774 )
t.OVER t.I t.=
t.0BRANCH CELL 002C ( -> 37A8 )
t.SWAP t.DROP t.DUP t.DIRB t.> t.0=_12DE t.0=_12DE t.+ t.ADIR
t.@ t.I t.+ t.C@ t.2DUP t.+ t.SEP t.! t.0 t.LEAVE
t.BRANCH CELL 0022 ( -> 37C8 )
( label 37A8 )
t.ADIR t.@ t.I t.+ t.C@ t.-DUP t.0 t.=
t.0BRANCH CELL 000C ( -> 37C6 )
t.2DROP t.3 t.LEAVE
t.BRANCH CELL 0004 ( -> 37C8 )
( label 37C6 )
t.+
( label 37C8 )
t.(LOOP) CELL FFAA ( -> 3774 )
t.BRANCH CELL 0006 ( -> 37D4 )
( label 37D0 )
t.DROP t.1
( label 37D4 )
t.BRANCH CELL 0007 ( -> 37DD )
( label 37D8 )
t.DROP LIT8 04
( label 37DD )
t.;S
AT 37DF

( DIRS | NFA 37DF CFA 37E6 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 37DF
( Saved dictionary header: flags, name bytes, link )
BYTES 84444952D33D37
DOCOL
t.0 t.S-L t.! t.SWAP t.>R t.LDIR t.>R t.-DUP t.0=_12DE
t.0BRANCH CELL 0005 ( -> 3801 )
LIT8 FF
( label 3801 )
t.R> t.R> t.;S
AT 3807

( DIRL | NFA 3807 CFA 380E )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3807
( Saved dictionary header: flags, name bytes, link )
BYTES 84444952CCDF37
DOCOL
t.1 t.S-L t.! t.SWAP t.>R t.LDIR t.R> t.SWAP t.ROT t.;S
AT 3824

( -SE | NFA 3824 CFA 382A )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3824
( Saved dictionary header: flags, name bytes, link )
BYTES 832D53C50738
DOVAR
CELL 0000
AT 382E

( DSL | NFA 382E CFA 3834 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 382E
( Saved dictionary header: flags, name bytes, link )
BYTES 834453CC2438
DOCOL
t.>R t.-DUP t.0=_12DE
t.0BRANCH CELL 0028 ( -> 3866 )
t.R t.- t.DUP t.-SE t.! t.0<_12F3 t.0=_12DE
t.0BRANCH CELL 000A ( -> 385A )
t.R> t.BDISK
t.BRANCH CELL 000A ( -> 3862 )
( label 385A )
t.R> t.DROP t.2DROP t.2
( label 3862 )
t.BRANCH CELL 0008 ( -> 386C )
( label 3866 )
t.SWAP t.R> t.2DROP
( label 386C )
t.;S
AT 386E

( BLOAD | NFA 386E CFA 3876 )
( GAM FORTH 11_A_Graf.ATR CFA $365C, matching dependency at )
( corresponding token in recovered DLOAD [game CFA $3A29]; )
( complete parent token streams agree after name relocation )
AT 386E
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C41837
DOCOL
t.DIRL t.DSL t.;S
AT 387E

( LIST-GAM-DIRECTORY | NFA 387E CFA 3885 )
( Inferred descriptive name, not recovered original: )
( Iterates group indices 1 through B/BUF-1, invokes LDIR, )
( prints group index and returned sector/count fields with )
( .R, and stops on directory/error status or ?TERMINAL. )
AT 387E
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D26E38
DOCOL
t.0 t.CR t.B/BUF t.1 t.(DO)
( label 3891 )
t.CR t.I t.LDIR t.-DUP t.0=_12DE
t.0BRANCH CELL 0016 ( -> 38B3 )
t.I t.3 t..R t.SWAP t.4 t..R t.4 t..R
t.BRANCH CELL 0014 ( -> 38C5 )
( label 38B3 )
t.1 t.=
t.0BRANCH CELL 000A ( -> 38C3 )
t.1+ t.LEAVE
t.BRANCH CELL 0004 ( -> 38C5 )
( label 38C3 )
t.LEAVE
( label 38C5 )
t.?TERMINAL
t.0BRANCH CELL 0004 ( -> 38CD )
t.LEAVE
( label 38CD )
t.(LOOP) CELL FFC2 ( -> 3891 )
t.;S
AT 38D3

( +DOD | NFA 38D3 CFA 38DA )
( GAM FORTH 11_A_Graf.ATR CFA $37FB, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 38D3
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C47E38
DOVAR
CELL 0002
AT 38DE

( LIC | NFA 38DE CFA 38E4 )
( GAM FORTH 11_A_Graf.ATR CFA $3805, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 38DE
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C3D338
DOVAR
CELL 0000
AT 38E8

( ZK | NFA 38E8 CFA 38ED )
( GAM FORTH 11_A_Graf.ATR CFA $380E, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 38E8
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CBDE38
DOCON
CELL 00D2
AT 38F1

( DK | NFA 38F1 CFA 38F6 )
( GAM FORTH 11_A_Graf.ATR CFA $3817, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 38F1
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CBE838
DOCON
CELL 00D4
AT 38FA

( L- | NFA 38FA CFA 3900 )
( GAM FORTH 11_A_Graf.ATR CFA $3820, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 38FA
( Saved dictionary header: flags, name bytes, link )
BYTES 82002DA0F138
CELL 3902 ( native entry point )
PHA                  ( 3902 )
SEC                  ( 3903 )
LDA.ABS 38E6         ( 3904 )
SBC.ABS 38DC         ( 3907 )
STA.ABS 38E6         ( 390A )
LDA.ABS 38E7         ( 390D )
SBC.ABS 38DD         ( 3910 )
STA.ABS 38E7         ( 3913 )
PLA                  ( 3916 )
RTS                  ( 3917 )
AT 3918

( ZK+ | NFA 3918 CFA 391E )
( GAM FORTH 11_A_Graf.ATR CFA $383E, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3918
( Saved dictionary header: flags, name bytes, link )
BYTES 830000ABFA38
CELL 3920 ( native entry point )
PHA                  ( 3920 )
LDA.ZP D2            ( 3921 )
CLC                  ( 3923 )
ADC.ABS 38DC         ( 3924 )
STA.ZP D2            ( 3927 )
LDA.ZP D3            ( 3929 )
ADC.ABS 38DD         ( 392B )
STA.ZP D3            ( 392E )
PLA                  ( 3930 )
RTS                  ( 3931 )
AT 3932

( DK+ | NFA 3932 CFA 3938 )
( GAM FORTH 11_A_Graf.ATR CFA $3858, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3932
( Saved dictionary header: flags, name bytes, link )
BYTES 830000AB1839
CELL 393A ( native entry point )
PHA                  ( 393A )
LDA.ZP D4            ( 393B )
CLC                  ( 393D )
ADC.ABS 38DC         ( 393E )
STA.ZP D4            ( 3941 )
LDA.ZP D5            ( 3943 )
ADC.ABS 38DD         ( 3945 )
STA.ZP D5            ( 3948 )
PLA                  ( 394A )
RTS                  ( 394B )
AT 394C

( WD | NFA 394C CFA 3951 )
( GAM FORTH 11_A_Graf.ATR CFA $3871, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 394C
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C43239
CELL 3953 ( native entry point )
LDA.ZPX 00           ( 3953 )
STA.ABS 38E6         ( 3955 )
LDA.ZPX 01           ( 3958 )
STA.ABS 38E7         ( 395A )
LDA.ZPX 02           ( 395D )
STA.ZP D4            ( 395F )
LDA.ZPX 03           ( 3961 )
STA.ZP D5            ( 3963 )
LDA.ZPX 04           ( 3965 )
STA.ZP D2            ( 3967 )
LDA.ZPX 05           ( 3969 )
STA.ZP D3            ( 396B )
RTS                  ( 396D )
AT 396E

( DYC | NFA 396E CFA 3974 )
( GAM FORTH 11_A_Graf.ATR CFA $3894, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 396E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C34C39
CELL 3976 ( native entry point )
STX.ZP D1            ( 3976 )
LDA.ZPX 00           ( 3978 )
STA.ZP D2            ( 397A )
LDA.ZPX 01           ( 397C )
STA.ZP D3            ( 397E )
LDA.ZPX 02           ( 3980 )
LDY.# 00             ( 3982 )
TAX                  ( 3984 )
BEQ 39A6             ( 3985 )
LDA.INDY D2          ( 3987 )
STA.ABS 38DC         ( 3989 )
INY                  ( 398C )
LDA.INDY D2          ( 398D )
STA.ABS 38DD         ( 398F )
DEY                  ( 3992 )
JSR.ABS 3920         ( 3993 )
LDA.# 02             ( 3996 )
STA.ABS 38DC         ( 3998 )
LDA.# 00             ( 399B )
STA.ABS 38DD         ( 399D )
JSR.ABS 3920         ( 39A0 )
DEX                  ( 39A3 )
BNE 3987             ( 39A4 )
LDX.ZP D1            ( 39A6 )
JMP.ABS 1057         ( 39A8 )
AT 39AB

( DYNAMIC | NFA 39AB CFA 39B5 )
( GAM FORTH 11_A_Graf.ATR CFA $38D5, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 39AB
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C36E39
DOCOL
t.<BUILDS t.DUP t., t.ALLOT t.DOES>
( Trailing code/data at 39C1; retained exactly )
BYTES 16167439ED38E4137712
AT 39CB

( OUNT | NFA 39CB CFA 39D2 )
( GAM FORTH 11_A_Graf.ATR CFA $38F2, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 39CB
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D4AB39
DOCOL
t.DUP t.>R t.2+ t.R> t.@ t.;S
AT 39E0

( <=TXT | NFA 39E0 CFA 39E8 )
( GAM FORTH 11_A_Graf.ATR CFA $3908, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 39E0
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D4CB39
DOCOL
LIT16 0022 t.WORD t.HERE t.1+ t.OVER t.2+ t.HERE t.C@ t.CMOVE
t.HERE t.C@ t.SWAP t.! t.;S
AT 3A08

( DDLU | NFA 3A08 CFA 3A0F )
( GAM FORTH 11_A_Graf.ATR CFA $392F, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3A08
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D5E039
DOCOL
t.>R t.R t.DYC t.ZK t.@ t.R> t.- t.;S
AT 3A21

( DLOAD | NFA 3A21 CFA 3A29 )
( GAM FORTH 11_A_Graf.ATR CFA $3949, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3A21
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C4083A
DOCOL
t.>R t.DUP t.2 t.- t.@ t.B/BUF t./ t.R> t.BLOAD t.;S
AT 3A3F

( 0DL | NFA 3A3F CFA 3A45 )
( GAM FORTH 42_A_GrafDos.ATR CFA $41BA, corresponding word )
( in contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3A3F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC213A
DOVAR
BYTES 120040AC40AC0C00FE03704240ACFE1702411DAC2020
AT 3A5D

( TYTDL | NFA 3A5D CFA 3A65 )
( GAM FORTH 42_A_GrafDos.ATR CFA $41DA, corresponding word )
( in contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3A5D
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CC3F3A
DOVAR
BYTES 1D00D8B998A9170070704E98A9FE280E4E00B0FE3E0E44D8B9FE0C04
BYTES 4110A9202020
AT 3A89

( PEN | NFA 3A89 CFA 3A8F )
( GAM FORTH 42_A_GrafDos.ATR CFA $4204, corresponding word )
( in contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3A89
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CE5D3A
CELL 3A91 ( native entry point )
LDA.INDY D2          ( 3A91 )
CMP.# FE             ( 3A93 )
BNE 3ACD             ( 3A95 )
STY.ABS 38DC         ( 3A97 )
JSR.ABS 3902         ( 3A9A )
JSR.ABS 3920         ( 3A9D )
JSR.ABS 393A         ( 3AA0 )
LDY.# 01             ( 3AA3 )
LDA.INDY D2          ( 3AA5 )
STA.ABS 38DC         ( 3AA7 )
LDY.# 02             ( 3AAA )
LDA.INDY D2          ( 3AAC )
LDY.# 00             ( 3AAE )
STA.INDY D4          ( 3AB0 )
INY                  ( 3AB2 )
CPY.ABS 38DC         ( 3AB3 )
BNE 3AB0             ( 3AB6 )
LDY.# 00             ( 3AB8 )
JSR.ABS 393A         ( 3ABA )
LDA.# 03             ( 3ABD )
STA.ABS 38DC         ( 3ABF )
JSR.ABS 3920         ( 3AC2 )
JSR.ABS 3902         ( 3AC5 )
LDX.# 00             ( 3AC8 )
JMP.ABS 3AD2         ( 3ACA )
STA.INDY D4          ( 3ACD )
INY                  ( 3ACF )
LDX.# 01             ( 3AD0 )
RTS                  ( 3AD2 )
AT 3AD3

( <M | NFA 3AD3 CFA 3AD8 )
( GAM FORTH 42_A_GrafDos.ATR CFA $424D, corresponding word )
( in contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3AD3
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CD893A
CELL 3ADA ( native entry point )
STX.ZP D1            ( 3ADA )
JSR.ABS 3953         ( 3ADC )
LDA.# 00             ( 3ADF )
STA.ABS 38DD         ( 3AE1 )
LDA.ABS 38E7         ( 3AE4 )
BNE 3AF9             ( 3AE7 )
LDY.# 00             ( 3AE9 )
JSR.ABS 3A91         ( 3AEB )
CPY.ABS 38E6         ( 3AEE )
BNE 3AEB             ( 3AF1 )
LDX.ZP D1            ( 3AF3 )
RTS                  ( 3AF5 )
JMP.ABS 3B0D         ( 3AF6 )
LDY.# 00             ( 3AF9 )
JSR.ABS 3A91         ( 3AFB )
CPY.# 00             ( 3AFE )
BNE 3AFB             ( 3B00 )
CPX.# 01             ( 3B02 )
BNE 3B0D             ( 3B04 )
DEC.ABS 38E7         ( 3B06 )
INC.ZP D3            ( 3B09 )
INC.ZP D5            ( 3B0B )
LDA.# 01             ( 3B0D )
BNE 3AE4             ( 3B0F )
AT 3B11

( [<M] | NFA 3B11 CFA 3B18 )
( GAM FORTH 42_A_GrafDos.ATR CFA $428D, corresponding word )
( in contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3B11
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A9D33A
CELL 3B1A ( native entry point )
JSR.ABS 3ADA         ( 3B1A )
INX                  ( 3B1D )
INX                  ( 3B1E )
JMP.ABS 1057         ( 3B1F )
AT 3B22

( <MOVE | NFA 3B22 CFA 3B2A )
( GAM FORTH 42_A_GrafDos.ATR CFA $429F, corresponding word )
( in contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3B22
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C5113B
DOCOL
t.>R t.OUNT t.R> t.SWAP t.(<M) t.;S
AT 3B38

( ADGR | NFA 3B38 CFA 3B3F )
( GAM FORTH 42_A_GrafDos.ATR CFA $42B4, corresponding word )
( in contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3B38
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D2223B
DOVAR
CELL 0000
AT 3B43

( ?DL | NFA 3B43 CFA 3B49 )
( GAM FORTH 42_A_GrafDos.ATR CFA $42BE, corresponding word )
( in contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3B43
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC383B
DOCOL
t.2+ t.DUP t.@ LIT16 0058 t.! t.2+ t.DUP t.@ t.ADGR t.! t.2+
t.DUP t.DUP t.@ t.+ t.@ t.DUP t.>R t.<MOVE t.R> LIT16 0230 t.!
t.;S
AT 3B7D

( INIT-TEXT-DISPLAY | NFA 3B7D CFA 3B84 )
( Inferred descriptive name, not recovered original: )
( Installs display-list descriptor 0DL through ?DL, emits )
( ATASCII clear-screen $7D, and selects the ROM character )
( set with CHBAS [$02F4]=$E0. )
AT 3B7D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000B0433B
DOCOL
t.0DL t.?DL LIT8 7D t.EMIT LIT16 00E0 LIT16 02F4 t.C! t.;S
AT 3B9B

( INIT-GRAPHICS-DISPLAY | NFA 3B9B CFA 3BA6 )
( Inferred descriptive name, not recovered original: )
( Installs TYTDL through ?DL, clears $1040 bytes at ADGR )
( [160x104 four-color bitmap], and emits $7D to clear the )
( accompanying text area. )
AT 3B9B
( Saved dictionary header: flags, name bytes, link )
BYTES 8800000000000000B37D3B
DOCOL
t.TYTDL t.?DL t.ADGR t.@ LIT16 1040 t.ERASE LIT8 7D t.EMIT
t.;S
AT 3BBD

( INIT-GRAPHICS-B800-FONT | NFA 3BBD CFA 3BC9 )
( Inferred descriptive name, not recovered original: Runs )
( graphics-display initialization at $3BA6 then sets CHBAS )
( [$02F4]=$B8, selecting character data at $B800. )
AT 3BBD
( Saved dictionary header: flags, name bytes, link )
BYTES 890000000000000000B39B3B
DOCOL
t.INIT-GRAPHICS-DISPLAY LIT16 00B8 LIT16 02F4 t.C! t.;S
AT 3BD9

( RCM | NFA 3BD9 CFA 3BDF )
( GAM FORTH 11_A_Graf.ATR CFA $49B1, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 3BD9
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CDBD3B
DOCON
CELL 00D7
AT 3BE3

( P-CCM | NFA 3BE3 CFA 3BEB )
( GAM FORTH 11_A_Graf.ATR CFA $49BD, corresponding word in )
( contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3BE3
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CDD93B
DOVAR
BYTES 000005414C4C2800
AT 3BF5

( CC# | NFA 3BF5 CFA 3BFB )
( GAM FORTH 11_A_Graf.ATR CFA $49CD, corresponding word in )
( contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3BF5
( Saved dictionary header: flags, name bytes, link )
BYTES C30000A3E33B
DODOES
( DOES> thread at 1E30 )
BYTES 301E81A0A53D2637
AT 3C05

( PK | NFA 3C05 CFA 3C0A )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3C05
( Saved dictionary header: flags, name bytes, link )
BYTES 8250CB441E
DOCON
CELL 00D8
AT 3C0E

( NK | NFA 3C0E CFA 3C13 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3C0E
( Saved dictionary header: flags, name bytes, link )
BYTES 824ECB053C
DOCON
CELL 00D9
AT 3C17

( CHW | NFA 3C17 CFA 3C1D )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3C17
( Saved dictionary header: flags, name bytes, link )
BYTES 834348D70E3C
DOCON
CELL 00DA
AT 3C21

( MAS1 | NFA 3C21 CFA 3C28 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3C21
( Saved dictionary header: flags, name bytes, link )
BYTES 844D4153B1173C
DOCON
CELL 00D6
AT 3C2C

( [SP] | NFA 3C2C CFA 3C33 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3C2C
( Saved dictionary header: flags, name bytes, link )
BYTES 84285350A9213C
CELL 3C35 ( native entry point )
CPX.# 01             ( 3C35 )
BEQ 3C48             ( 3C37 )
LSR.ZP D6            ( 3C39 )
LSR.ZP D6            ( 3C3B )
LDA.INDY D2          ( 3C3D )
AND.ZP D6            ( 3C3F )
ASL.ZP D6            ( 3C41 )
ASL.ZP D6            ( 3C43 )
JMP.ABS 3C4A         ( 3C45 )
LDA.ZP D9            ( 3C48 )
RTS                  ( 3C4A )
AT 3C4B

( [SL] | NFA 3C4B CFA 3C52 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3C4B
( Saved dictionary header: flags, name bytes, link )
BYTES 8428534CA92C3C
CELL 3C54 ( native entry point )
CPX.# 02             ( 3C54 )
BEQ 3C67             ( 3C56 )
ASL.ZP D6            ( 3C58 )
ASL.ZP D6            ( 3C5A )
LDA.INDY D2          ( 3C5C )
AND.ZP D6            ( 3C5E )
LSR.ZP D6            ( 3C60 )
LSR.ZP D6            ( 3C62 )
JMP.ABS 3C69         ( 3C64 )
LDA.ZP D8            ( 3C67 )
RTS                  ( 3C69 )
AT 3C6A

( [MVS] | NFA 3C6A CFA 3C72 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3C6A
( Saved dictionary header: flags, name bytes, link )
BYTES 85284D5653A94B3C
CELL 3C74 ( native entry point )
LDA.ZP D6            ( 3C74 )
EOR.# FF             ( 3C76 )
AND.INDY D4          ( 3C78 )
STA.ZP DA            ( 3C7A )
LDA.ZP D6            ( 3C7C )
AND.INDY D2          ( 3C7E )
BNE 3CA4             ( 3C80 )
JSR.ABS 3C54         ( 3C82 )
CMP.# 00             ( 3C85 )
BEQ 3C90             ( 3C87 )
LDA.ZP DA            ( 3C89 )
STA.INDY D4          ( 3C8B )
JMP.ABS 3CA1         ( 3C8D )
LDA.ZP D7            ( 3C90 )
CMP.# 03             ( 3C92 )
BNE 3CA1             ( 3C94 )
JSR.ABS 3C35         ( 3C96 )
CMP.# 00             ( 3C99 )
BEQ 3CA1             ( 3C9B )
LDA.ZP DA            ( 3C9D )
STA.INDY D4          ( 3C9F )
JMP.ABS 3CA9         ( 3CA1 )
CLC                  ( 3CA4 )
ADC.ZP DA            ( 3CA5 )
STA.INDY D4          ( 3CA7 )
LSR.ZP D6            ( 3CA9 )
LSR.ZP D6            ( 3CAB )
RTS                  ( 3CAD )
AT 3CAE

( MVPL | NFA 3CAE CFA 3CB5 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3CAE
( Saved dictionary header: flags, name bytes, link )
BYTES 844D5650CC6A3C
CELL 3CB7 ( native entry point )
LDA.# C0             ( 3CB7 )
STA.ZP D6            ( 3CB9 )
LDX.# 02             ( 3CBB )
JSR.ABS 3C74         ( 3CBD )
LDX.# 00             ( 3CC0 )
JSR.ABS 3C74         ( 3CC2 )
JSR.ABS 3C74         ( 3CC5 )
LDX.# 01             ( 3CC8 )
JSR.ABS 3C74         ( 3CCA )
RTS                  ( 3CCD )
AT 3CCE

( [MVS1] | NFA 3CCE CFA 3CD7 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3CCE
( Saved dictionary header: flags, name bytes, link )
BYTES 86284D565331A9AE3C
CELL 3CD9 ( native entry point )
LDA.ZP D6            ( 3CD9 )
AND.INDY D2          ( 3CDB )
STA.ZP DA            ( 3CDD )
BEQ 3CEB             ( 3CDF )
LDA.ZP D6            ( 3CE1 )
EOR.# FF             ( 3CE3 )
AND.INDY D4          ( 3CE5 )
ORA.ZP DA            ( 3CE7 )
STA.INDY D4          ( 3CE9 )
LSR.ZP D6            ( 3CEB )
LSR.ZP D6            ( 3CED )
RTS                  ( 3CEF )
AT 3CF0

( [CM] | NFA 3CF0 CFA 3CF7 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3CF0
( Saved dictionary header: flags, name bytes, link )
BYTES 8428434DA9CE3C
CELL 3CF9 ( native entry point )
LDA.# 00             ( 3CF9 )
STA.ZP D9            ( 3CFB )
LDY.ABS 38E6         ( 3CFD )
LDA.ZP D7            ( 3D00 )
BNE 3D10             ( 3D02 )
DEY                  ( 3D04 )
LDA.INDY D2          ( 3D05 )
STA.INDY D4          ( 3D07 )
CPY.# 00             ( 3D09 )
BNE 3D04             ( 3D0B )
JMP.ABS 3D4B         ( 3D0D )
LDA.ZP D7            ( 3D10 )
CMP.# 01             ( 3D12 )
BNE 3D2E             ( 3D14 )
DEY                  ( 3D16 )
LDA.# C0             ( 3D17 )
STA.ZP D6            ( 3D19 )
JSR.ABS 3CD9         ( 3D1B )
JSR.ABS 3CD9         ( 3D1E )
JSR.ABS 3CD9         ( 3D21 )
JSR.ABS 3CD9         ( 3D24 )
CPY.# 00             ( 3D27 )
BNE 3D16             ( 3D29 )
JMP.ABS 3D4B         ( 3D2B )
DEY                  ( 3D2E )
BNE 3D36             ( 3D2F )
LDA.# 00             ( 3D31 )
JMP.ABS 3D3C         ( 3D33 )
DEY                  ( 3D36 )
LDA.# 03             ( 3D37 )
AND.INDY D2          ( 3D39 )
INY                  ( 3D3B )
STA.ZP D8            ( 3D3C )
JSR.ABS 3CB7         ( 3D3E )
LDA.# C0             ( 3D41 )
AND.INDY D2          ( 3D43 )
STA.ZP D9            ( 3D45 )
CPY.# 00             ( 3D47 )
BNE 3D2E             ( 3D49 )
RTS                  ( 3D4B )
AT 3D4C

( CIL | NFA 3D4C CFA 3D52 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3D4C
( Saved dictionary header: flags, name bytes, link )
BYTES 834349CCF03C
DOVAR
CELL 0000
AT 3D56

( [CCM] | NFA 3D56 CFA 3D5E )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3D56
( Saved dictionary header: flags, name bytes, link )
BYTES 852843434DA94C3D
CELL 3D60 ( native entry point )
STX.ZP D1            ( 3D60 )
LDA.ABS 3BF1         ( 3D62 )
STA.ABS 38E6         ( 3D65 )
LDA.ABS 3BF2         ( 3D68 )
STA.ABS 3D54         ( 3D6B )
LDA.ABS 3BED         ( 3D6E )
STA.ZP D2            ( 3D71 )
LDA.ABS 3BEE         ( 3D73 )
STA.ZP D3            ( 3D76 )
LDA.ABS 3BEF         ( 3D78 )
STA.ZP D4            ( 3D7B )
LDA.ABS 3BF0         ( 3D7D )
STA.ZP D5            ( 3D80 )
JSR.ABS 3CF9         ( 3D82 )
LDA.ABS 38E6         ( 3D85 )
STA.ABS 38DC         ( 3D88 )
JSR.ABS 3920         ( 3D8B )
LDA.ABS 3BF3         ( 3D8E )
STA.ABS 38DC         ( 3D91 )
LDA.ABS 3BF4         ( 3D94 )
STA.ABS 38DD         ( 3D97 )
JSR.ABS 393A         ( 3D9A )
DEC.ABS 3D54         ( 3D9D )
BNE 3D82             ( 3DA0 )
LDX.ZP D1            ( 3DA2 )
RTS                  ( 3DA4 )
AT 3DA5

( C-V | NFA 3DA5 CFA 3DAB )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3DA5
( Saved dictionary header: flags, name bytes, link )
BYTES 83432DD6563D
CELL 3DAD ( native entry point )
JSR.ABS 3D60         ( 3DAD )
JMP.ABS 0F47         ( 3DB0 )
AT 3DB3

( CCMOV | NFA 3DB3 CFA 3DBB )
( GAM FORTH 11_A_Graf.ATR CFA $4B8D, corresponding word in )
( contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3DB3
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D6F53B
DOCOL
t.C-V t.;S
AT 3DC1

( ZD-CCM! | NFA 3DC1 CFA 3DCB )
( GAM FORTH 11_A_Graf.ATR CFA $4B9D, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 3DC1
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000A1B33D
DOCOL
t.P-CCM t.2+ t.! t.P-CCM t.! t.;S
AT 3DD9

( XY-CCM! | NFA 3DD9 CFA 3DE3 )
( GAM FORTH 11_A_Graf.ATR CFA $4BB5, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 3DD9
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000A1C13D
DOCOL
t.P-CCM LIT16 0005 t.+ t.C! t.P-CCM t.4 t.+ t.C! t.;S
AT 3DF9

( POSOBJ | NFA 3DF9 CFA 3E02 )
( GAM FORTH 11_A_Graf.ATR CFA $4BD4, corresponding word in )
( contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3DF9
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000CAD93D
DOCOL
t.P-CCM LIT16 0006 t.+ t.@ t.* t.+ t.ADGR t.@ t.+ t.P-CCM t.2+
t.! t.;S
AT 3E20

( ?OBJ | NFA 3E20 CFA 3E27 )
( GAM FORTH 11_A_Graf.ATR CFA $4BF9, corresponding word in )
( contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3E20
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CAF93D
DOCOL
t.DUP t.@ t.P-CCM t.4 t.+ t.! t.2+ t.P-CCM t.! t.CCMOV t.;S
AT 3E3F

( OXY | NFA 3E3F CFA 3E45 )
( GAM FORTH 11_A_Graf.ATR CFA $41E3, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 3E3F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D9203E
DOCOL
t.DUP t.C@ t.SWAP t.1+ t.C@ t.;S
AT 3E53

( ?POBJ | NFA 3E53 CFA 3E5B )
( GAM FORTH 11_A_Graf.ATR CFA $4C19, corresponding word in )
( contiguous 4-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3E53
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CA3F3E
DOCOL
t.DUP t.OXY t.POSOBJ t.2+ t.?OBJ t.;S
AT 3E69

( ADC | NFA 3E69 CFA 3E6F )
( GAM FORTH 11_A_Graf.ATR CFA $4C2D, corresponding word in )
( contiguous 4-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3E69
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C3533E
DOVAR
CELL 4002
AT 3E73

( ILC | NFA 3E73 CFA 3E79 )
( GAM FORTH 11_A_Graf.ATR CFA $4C37, corresponding word in )
( contiguous 4-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3E73
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C3693E
DOVAR
CELL 0003
AT 3E7D

( ?PCOBJ | NFA 3E7D CFA 3E86 )
( GAM FORTH 11_A_Graf.ATR CFA $4C44, corresponding word in )
( contiguous 4-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3E7D
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000CA733E
DOCOL
t.DUP t.OUNT t.+ t.1 t.- t.>R t.R t.C@ t.1 t.>
t.0BRANCH CELL 000E ( -> 3EAC )
t.FIRST t.<MOVE t.FIRST t.?POBJ
t.BRANCH CELL 0006 ( -> 3EB0 )
( label 3EAC )
t.2+ t.?POBJ
( label 3EB0 )
t.R t.C@ t.2 t.MOD
t.0BRANCH CELL 0013 ( -> 3ECD )
t.R LIT8 05 t.- t.ADC t.@ t.ILC t.@ t.CMOVE
( label 3ECD )
t.R> t.DROP t.;S
AT 3ED3

( RESOURCE-BASE | NFA 3ED3 CFA 3ED9 )
( Inferred descriptive name, not recovered original: )
( Variable read by CFA3EE3; startup selects $96C8 for )
( intro, then $9150 for gameplay. )
AT 3ED3
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C17D3E
DOVAR
CELL 9150
AT 3EDD

( RESOURCE-BASE@ | NFA 3EDD CFA 3EE3 )
( Inferred descriptive name, not recovered original: )
( Fetches the resource-base variable CFA3ED9. )
AT 3EDD
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B0D33E
DOCOL
t.RESOURCE-BASE t.@ t.;S
AT 3EEB

( PRINT-RESOURCE-FREE-SPACE | NFA 3EEB CFA 3EF2 )
( Inferred descriptive name, not recovered original: Prints )
( RESOURCE-BASE@ minus HERE minus 32 with U.; this is free )
( space below the resource buffer, not total machine RAM. )
AT 3EEB
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C5DD3E
DOCOL
t.RESOURCE-BASE@ t.HERE t.- t.32 t.- t.U. t.;S
AT 3F02

( RESOURCE-ADDR | NFA 3F02 CFA 3F09 )
( Inferred descriptive name, not recovered original: Uses )
( resource-base, DYC record lookup, and fetches ZK. )
AT 3F02
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C2EB3E
DOCOL
t.RESOURCE-BASE@ t.DYC t.ZK t.@ t.;S
AT 3F15

( CLEAR-RESOURCE-BUFFER | NFA 3F15 CFA 3F1D )
( Inferred descriptive name, not recovered original: ERASEs )
( the half-open range [RESOURCE-BASE@,$A8FC]. Both )
( asset-group loaders call it before loading resources. )
( Stack: -- )
AT 3F15
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C2023F
DOCOL
t.RESOURCE-BASE@ t.DUP LIT16 A8FC t.SWAP t.- t.ERASE t.;S
AT 3F2F

( GAME-FONT-BASE | NFA 3F2F CFA 3F37 )
( Inferred descriptive name, not recovered original: )
( Constant $BC00; INSTALL-SCENE-ASSETS copies resource 1 )
( here and selects CHBAS=$BC. Glyph selection $5B69 adds )
( eight times the glyph number to this base. )
( Stack: -- addr )
AT 3F2F
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CB153F
DOCON
CELL BC00
AT 3F3B

( INSTALL-SCENE-ASSETS | NFA 3F3B CFA 3F41 )
( Inferred descriptive name, not recovered original: )
( Initializes display, moves resource zero into ADGR, )
( copies resource one and sets CHBAS. )
AT 3F3B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC2F3F
DOCOL
t.INIT-GRAPHICS-DISPLAY t.0 t.RESOURCE-ADDR t.ADGR t.@ t.<MOVE
t.1 t.RESOURCE-ADDR t.OUNT t.GAME-FONT-BASE t.SWAP t.CMOVE
LIT8 BC LIT16 02F4 t.C! t.;S
AT 3F66

( LOAD-ASSET-GROUP | NFA 3F66 CFA 3F6C )
( Inferred descriptive name, not recovered original: Loads )
( the requested group with BLOAD, retries on error, prints )
( inverse ERROR. )
AT 3F66
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D43B3F
DOCOL
t.>R t.CLEAR-RESOURCE-BUFFER
( label 3F72 )
t.0 t.RESOURCE-ADDR LIT8 50 t.R t.BLOAD t.DUP
t.0BRANCH CELL 000E ( -> 3F8F )
t.INIT-TEXT-DISPLAY
( Game text:  ERROR  )
t.(S")
BYTES 07A0C5D2D2CFD2A0
( label 3F8F )
t.0=_12DE
t.0BRANCH CELL FFDF ( -> 3F72 )
t.R> t.DROP t.;S
AT 3F9B

( LOAD-GAME-ASSETS | NFA 3F9B CFA 3FA1 )
( Inferred descriptive name, not recovered original: Calls )
( LOAD-ASSET-GROUP with group 4. )
AT 3F9B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC663F
DOCOL
t.4 t.LOAD-ASSET-GROUP t.;S
AT 3FA9

( PAUSE | NFA 3FA9 CFA 3FB1 )
( GAM FORTH 11_A_Graf.ATR CFA $4F82, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 3FA9
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C59B3F
DOCOL
t.0 t.(DO)
( label 3FB7 )
LIT8 14 t.C@
( label 3FBC )
t.DUP LIT8 14 t.C@ t.= t.0=_12DE
t.0BRANCH CELL FFF3 ( -> 3FBC )
t.DROP
t.(LOOP) CELL FFE8 ( -> 3FB7 )
t.;S
AT 3FD3

( GAME-DISPLAY-LIST | NFA 3FD3 CFA 3FDA )
( Inferred descriptive name, not recovered original: )
( Constant $A910, matching the TYTDL display-list )
( destination. Game and title color initialization set DLI )
( bits in entries at this base. )
( Stack: -- addr )
AT 3FD3
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CCA93F
DOCON
CELL A910
AT 3FDE

( ENABLE-DLI-AT | NFA 3FDE CFA 3FE4 )
( Inferred descriptive name, not recovered original: Sets )
( bit $80 in the byte at the supplied address. Callers pass )
( display-list instruction addresses, marking those scan )
( lines for DLI. )
( Stack: addr -- )
AT 3FDE
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1D33F
DOCOL
t.DUP t.C@ LIT16 0080 t.OR t.SWAP t.C! t.;S
AT 3FF6

( GAME-COLOR-TABLE | NFA 3FF6 CFA 4000 )
( Inferred descriptive name, not recovered original: The )
( game DLI uses this byte table through zero-page pointer )
( $DB. Initial first triple $24,$F8,$FC supplies COLPF0..2; )
( byte +6 also initializes COLOR3 shadow $02C7. )
( Stack: -- addr )
AT 3FF6
( Saved dictionary header: flags, name bytes, link )
BYTES 8600000000004CA0DE3F
DOVAR
BYTES 24F8FCE42C28CA5420202020202020202020
AT 4014

( DLI-COLOR-OFFSET | NFA 4014 CFA 401A )
( Inferred descriptive name, not recovered original: Byte )
( at PFA $401C is the offset into the color table: handler )
( $403C reads a triple, advances it by three, and resets it )
( to zero when VCOUNT reaches $40. )
( Stack: -- addr )
AT 4014
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D3F63F
DOVAR
CELL 0000
AT 401E

( DLI-COLOR-POINTER | NFA 401E CFA 4025 )
( Inferred descriptive name, not recovered original: )
( Constant $00DB, the address of the zero-page pointer used )
( by LDA [$DB],Y in color DLI $403C. Game/title )
( initialization stores the active color-table address here. )
( Stack: -- addr )
AT 401E
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CC1440
DOCON
CELL 00DB
AT 4029

( NMI-ENABLE-SHADOW | NFA 4029 CFA 402F )
( Inferred descriptive name, not recovered original: Stored )
( byte mirrors values written to ANTIC NMIEN $D40E by )
( $4070/$40B2: $E0 with color DLI enabled, $60 when it is )
( disabled. )
( Stack: -- addr )
AT 4029
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C91E40
DOVAR
CELL 0060
AT 4033

( COLOR-TABLE-DLI | NFA 4033 CFA 403A )
( Inferred descriptive name, not recovered original: Native )
( interrupt routine at $403C saves A/Y/status, writes three )
( successive bytes from [$DB],Y to COLPF0..2 )
( [$D016..$D018], advances/reset table index using VCOUNT )
( $D40B, then RTI. )
AT 4033
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A92940
CELL 403C ( native entry point )
PHP                  ( 403C )
PHA                  ( 403D )
TYA                  ( 403E )
PHA                  ( 403F )
LDY.ABS 401C         ( 4040 )
CLC                  ( 4043 )
LDA.INDY DB          ( 4044 )
STA.ABS D016         ( 4046 )
INY                  ( 4049 )
LDA.INDY DB          ( 404A )
STA.ABS D017         ( 404C )
INY                  ( 404F )
LDA.INDY DB          ( 4050 )
STA.ABS D018         ( 4052 )
INY                  ( 4055 )
LDA.ABS D40B         ( 4056 )
CMP.# 40             ( 4059 )
BMI 405F             ( 405B )
LDY.# 00             ( 405D )
STY.ABS 401C         ( 405F )
PLA                  ( 4062 )
TAY                  ( 4063 )
PLA                  ( 4064 )
PLP                  ( 4065 )
RTI                  ( 4066 )
AT 4067

( INSTALL-COLOR-DLI | NFA 4067 CFA 4070 )
( Inferred descriptive name, not recovered original: Stores )
( the supplied entry address in VDSLST $0200, clears )
( DLI-COLOR-OFFSET, ORs $E0 into NMI-ENABLE-SHADOW and )
( writes NMIEN $D40E. )
( Stack: entry -- )
AT 4067
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000C93340
DOCOL
LIT16 0200 t.! t.0 t.DLI-COLOR-OFFSET t.! t.NMI-ENABLE-SHADOW
t.C@ LIT16 00E0 t.OR t.DUP t.NMI-ENABLE-SHADOW t.C! LIT16 D40E
t.C! t.;S
AT 4096

( ENABLE-COLOR-DLI | NFA 4096 CFA 409E )
( Inferred descriptive name, not recovered original: Passes )
( native handler address $403C to INSTALL-COLOR-DLI. )
( Stack: -- )
AT 4096
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CC6740
DOCOL
LIT16 403C t.INSTALL-COLOR-DLI t.;S
AT 40A8

( DISABLE-COLOR-DLI | NFA 40A8 CFA 40B2 )
( Inferred descriptive name, not recovered original: Sets )
( shadow NMI mask $60, waits one frame, copies the active )
( table first triple to COLOR0..2 shadows $02C4..$02C6, )
( writes NMIEN=$60, and copies the same triple to )
( $D016..$D018. )
( Stack: -- )
AT 40A8
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C99640
DOCOL
LIT16 0060 t.NMI-ENABLE-SHADOW t.C! t.1 t.PAUSE
t.DLI-COLOR-POINTER t.@ LIT16 02C4 LIT16 0003 t.CMOVE
LIT16 0060 LIT16 D40E t.C! t.DLI-COLOR-POINTER t.@ LIT16 D016
LIT16 0003 t.CMOVE t.;S
AT 40E8

( INIT-GAME-COLOR-DLI | NFA 40E8 CFA 40EF )
( Inferred descriptive name, not recovered original: )
( Selects GAME-COLOR-TABLE via $DB, sets DLI bits at )
( display-list offsets 1 and $6D, installs the color DLI, )
( and writes color-table byte +6 to COLOR3 $02C7. )
( Stack: -- )
AT 40E8
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D0A840
DOCOL
t.GAME-COLOR-TABLE t.DLI-COLOR-POINTER t.! t.GAME-DISPLAY-LIST
t.1+ t.ENABLE-DLI-AT t.GAME-DISPLAY-LIST LIT16 006D t.+
t.ENABLE-DLI-AT t.ENABLE-COLOR-DLI t.GAME-COLOR-TABLE
LIT16 0006 t.+ t.C@ LIT16 02C7 t.C! t.;S
AT 411B

( BYTE-ARRAY | NFA 411B CFA 4124 )
( Inferred descriptive name, not recovered original: )
( Defining word <BUILDS ALLOT DOES> + ;. Instances such as )
( ROOM-EXIT-MASKS add a byte index to their data base; )
( unlike ARRAY, the index is not doubled. )
AT 411B
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000D9E840
DOCOL
t.<BUILDS t.ALLOT t.DOES>
( Trailing code/data at 412C; retained exactly )
BYTES 04137712
AT 4130

( ARRAY | NFA 4130 CFA 4138 )
( GAM FORTH 11_A_Graf.ATR CFA $3C7B, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 4130
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D91B41
DOCOL
t.<BUILDS t.2 t.* t.ALLOT t.DOES>
( Trailing code/data at 4144; retained exactly )
BYTES 8D13D5140F2004137712
AT 414E

( INVENTORY-BLOCK-SIZE | NFA 414E CFA 4154 )
( Inferred descriptive name, not recovered original: )
( Constant $0200 used as the stride and transfer length for )
( cached inventory blocks in $557C,$5594,$55A8 and the )
( nine-block copy loop $55D3. )
( Stack: -- bytes )
AT 414E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC3041
DOCON
CELL 0200
AT 4158

( INVENTORY-BLOCK-BUFFER | NFA 4158 CFA 415E )
( Inferred descriptive name, not recovered original: )
( 512-byte working block exchanged with extended-memory )
( inventory slots by $5594/$55A8 using $4154 as length. )
( $5366 returns this buffer plus two as its record )
( collection. Allocation contains stale source bytes )
( initially. )
( Stack: -- addr )
AT 4158
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DA4E41
DOVAR
BYTES 000005414C4C4F542020202020202020202020202020202020202020
BYTES 202020202020202014DB00834E4DC97C419914600084284450A98741
BYTES 9A4108489848AC7A4118B1DB8D16D0C8B1DB8D17D0C8B1DB20282023
BYTES 4B4F4D20234F42204D4150204B494552202029202020202020202020
BYTES 20202020202020202020202020202020202020202020202020202020
BYTES 202020203A204152524159203C4255494C44532032202A20414C4C4F
BYTES 5420444F45533E2020202020535741502032202A202B203B20202020
BYTES 2020202020202020202020202D0F0ED420148341E4132D0F16D02D0F
BYTES 030069117712843F4449D0064241145E418341081439410916434139
BYTES 412D0F6D0004134341FC415E412D0F06000413F9132D0FC702201477
BYTES 12864341525241D946424114BC183516CC18041377128541525241D9
BYTES 79424114BC18D5140F203516CC188D13D5140F2004137712833142CC
BYTES 8E427D140002832352DAAC429914000005414C4C4F54202020202020
BYTES 20202020202020202020202020202020202020202020000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000202820234B4F4D20234F42204D4150204B49
BYTES 45522020292020202020202020202020202020202020202020202020
BYTES 2020202020202020202020202020202020203A204152524159203C42
BYTES 55494C44532032202A20
AT 4362

( CURRENT-ROOM | NFA 4362 CFA 4369 )
( Inferred descriptive name, not recovered original: $5AEC )
( stores the incoming room number here before loading its )
( resource group. Rendering, map, exit-mask and )
( object-action code read this value. )
( Stack: -- addr )
AT 4362
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CD5841
DOVAR
CELL 0000
AT 436D

( ENERGY | NFA 436D CFA 4377 )
( Inferred descriptive name, not recovered original: )
( Counter starts at 30; entering a room decrements it )
( through $6DD5 and compares hunger-message thresholds. )
( Eating/drinking actions add to it, smoking subtracts 30 )
( with a minimum of one, and input handling checks for )
( exhaustion. )
( Stack: -- addr )
AT 436D
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C16243
DOVAR
CELL 001E
AT 437B

( w4381 | NFA 437B CFA 4381 )
( Unknown erased name; CFA identifier )
AT 437B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D26D43
DOVAR
CELL 0001
AT 4385

( ROOM-OBJECT-STATE | NFA 4385 CFA 438B )
( Inferred descriptive name, not recovered original: )
( Mutable nested u16-length records indexed by $520C with )
( [room view]. The returned per-view object-ID lists are )
( modified by $70A2/$70FC; the whole block is included in )
( saved game state. )
( Stack: -- addr )
AT 4385
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C27B43
DOVAR
BYTES 11000300000000060000050666670002000068030001000006000100
BYTES 000100000A0002000000010000010000070002000000010000130001
BYTES 0000010000010000030000000003007A000009000100000100000100
BYTES 0016000400000000000200006B0100000300006A6C02000000140006
BYTES 00000600000000060000000000000002007800150002000000010000
BYTES 02000069030000000003000000000400020000010300010000080003
BYTES 000000000100001200050000000000000100000200006E0200006D09
BYTES 0001000301000601000003000100010A000200000001000001000007
BYTES 000200000001000006000100000100000F0001000002000073020000
BYTES 72020000700C00030000000002007403010000060001000001000005
BYTES 0003000100000E000300000000010000010000010000070001000002
BYTES 0000000400020000000A000400000000000200000012000400000000
BYTES 000100000300000000020000000F0004000000000003000400000200
BYTES 00000900030000000002000000080002000200020003000800030002
BYTES 00000100000400020000000B0003000400000100000100000E000200
BYTES 00000300036F00030004000004000200000003000100000000000000
BYTES 0000000000000000000000000006
AT 455B

( ROOM-TABLE-CAPACITY | NFA 455B CFA 4563 )
( Inferred descriptive name, not recovered original: )
( Constant 90; the room map table allocates 90 cells and )
( exit-mask table 90 bytes. $4B2D uses capacity-1 to find )
( the final exit-mask byte for the saved-state extent. )
( Stack: -- count )
AT 455B
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CD8543
DOCON
CELL 005A
AT 4567

( INVENTORY-SLOT-RECORDS | NFA 4567 CFA 456E )
( Inferred descriptive name, not recovered original: Four )
( mutable three-byte records, accessed by $773C as )
( base+3*slot; initial triples contain zero object IDs and )
( paired display coordinates [2,25],[6,25],[2,56],[6,56]. )
( Stack: -- addr )
AT 4567
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C55B45
DOVAR
BYTES 0002190006190002380006382020
AT 457E

( ROOM-MAP-DESCRIPTORS | NFA 457E CFA 4584 )
( Inferred descriptive name, not recovered original: )
( Cell-array indexed by room. First byte packs map )
( position; second byte low three bits give facing for )
( $6ECA, bit 3 is the visited flag used by $5BF6/$7763, and )
( upper bits select map glyphs in $5B9E. )
( Stack: room -- addr )
AT 457E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D06745
DODOES
( DOES> thread at 4144 )
BYTES 44410221122022112332330000002402142301231130212132103121
BYTES 30104100313232123332342243014401242331323203222222031223
BYTES 02330110030200130121110131323203110100000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 0000000000000000000000000000
AT 463C

( PUZZLE-STATE-CELLS | NFA 463C CFA 4642 )
( Inferred descriptive name, not recovered original: )
( Cell-array fetched/stored through $8230/$823F. Game )
( actions use its elements as flags, exclusive selections )
( and counters: $82B0/$82EA increment/decrement and )
( $8453/$8470 add/subtract action parameters. )
( Stack: index -- addr )
AT 463C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D97E45
DODOES
( DOES> thread at 4144 )
BYTES 44410000000000000000000000000000000000000000010001000000
BYTES 000000000800
AT 4666

( CURRENT-MAP-FLOOR | NFA 4666 CFA 466D )
( Inferred descriptive name, not recovered original: Stores )
( the floor/section chosen from a room number by $5C36. )
( $5C86 renders its number; $5CF6 and $6EE6 use its )
( room-range limits while drawing/navigating the map. )
( Stack: -- addr )
AT 4666
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000DA3C46
DOVAR
CELL 0002
AT 4671

( ROOM-EXIT-MASKS | NFA 4671 CFA 4678 )
( Inferred descriptive name, not recovered original: )
( Byte-array base $467C indexed by room. $6F8A tests )
( 1<<direction in the current room byte; $7BD6 sets the bit )
( and $7C04 clears it. Returned address and indexing )
( verified by executing the original 6502 Forth. )
( Stack: room -- addr )
AT 4671
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D26646
DODOES
( DOES> thread at 412C )
BYTES 2C41000B060D08040604040604040404080904040604040408020800
BYTES 04060404080804080200000300010000000000000000000000000000
BYTES 000000000020CE85494C4B4FCDE3447D145A008423525AC5B9469914
BYTES 0002190006190002
AT 46D6

( SAVE-GAM-GROUP | NFA 46D6 CFA 46DE )
( Inferred descriptive name, not recovered original: Uses )
( DIRS/DSL with write direction, preserving requested )
( count/group on the return stack. Updates the cached )
( directory count; if the previous group count was zero and )
( the transfer succeeded, writes the directory sector DIRB. )
( Stack: addr count group -- error )
AT 46D6
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C57146
DOCOL
t.>R t.>R t.DUP t.R> t.R> t.2DUP t.>R t.>R t.DIRS t.DSL t.SWAP
t.DROP t.R> t.R> t.ADIR t.@ t.+ t.DUP t.C@ t.>R t.C! t.DUP
t.0=_12DE t.R> t.0=_12DE t.*
t.0BRANCH CELL 0014 ( -> 472A )
t.DROP t.ADIR t.@ t.DIRB t.1 t.0 t.-DISK t.0=_12DE t.0=_12DE
( label 472A )
t.;S
AT 472C

( BYTE+! | NFA 472C CFA 4732 )
( Inferred descriptive name, not recovered original: SWAP )
( OVER C@ + SWAP C!: adds a value to the byte at addr, )
( storing modulo 256. Used by byte counters and palette )
( fades. Original 6502 execution confirms 250+10 stores 4 )
( and leaves no stack result. )
( Stack: delta addr -- )
AT 472C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1D646
DOCOL
t.SWAP t.OVER t.C@ t.+ t.SWAP t.C! t.;S
AT 4742

( READ-AND-CLEAR-KEYCODE | NFA 4742 CFA 4748 )
( Inferred descriptive name, not recovered original: )
( Returns CH [$02FC] and writes $FF back to that )
( keyboard-code latch; unlike KEY it neither waits nor )
( converts the scan code. Original 6502 execution confirms )
( a latched 42 is returned and CH becomes 255. )
( Stack: -- keycode )
AT 4742
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C12C47
DOCOL
LIT16 02FC t.C@ LIT16 00FF LIT16 02FC t.C! t.;S
AT 475C

( LENGTH-RECORD-ADDR | NFA 475C CFA 4763 )
( Inferred descriptive name, not recovered original: Calls )
( DYC to skip index u16-length records from base, then )
( returns its zero-page source pointer ZK. The result )
( points at the selected record length cell. Original 6502 )
( execution on a synthetic [length=2,payload=2bytes] first )
( record returns base+4 for index one. )
( Stack: index base -- record )
AT 475C
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C44247
DOCOL
t.DYC t.ZK t.@ t.;S
AT 476D

( ILEL | NFA 476D CFA 4774 )
( GAM FORTH 11_A_Graf.ATR CFA $9AAD, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 476D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CC5C47
DOCOL
LIT16 0104 t.0 t.(DO)
( label 477E )
t.DUP t.@ t.DUP t.0=_12DE
t.0BRANCH CELL 000C ( -> 4794 )
t.2DROP t.I t.LEAVE
t.BRANCH CELL 0006 ( -> 4798 )
( label 4794 )
t.+ t.2+
( label 4798 )
t.(LOOP) CELL FFE4 ( -> 477E )
t.;S
AT 479E

( TEXT-CLEAR-ENABLED | NFA 479E CFA 47A4 )
( Inferred descriptive name, not recovered original: )
( CLEAR-TEXT-AREA checks this cell before erasing. Setting )
( zero suppresses one clearing pass; CLEAR-TEXT-AREA always )
( resets it to one on return. )
( Stack: -- addr )
AT 479E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D36D47
DOVAR
CELL 0001
AT 47A8

( CLEAR-TEXT-AREA | NFA 47A8 CFA 47AD )
( Inferred descriptive name, not recovered original: When )
( text-dirty flag is set, positions at 0,0 and erases $208 )
( bytes at the screen address. )
AT 47A8
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C59E47
DOCOL
t.TEXT-CLEAR-ENABLED t.@
t.0BRANCH CELL 0019 ( -> 47CE )
t.0 t.0 t.POS
( ATASCII text:  [1E] )
t.(.")
BYTES 02201E
LIT16 0058 t.@ LIT16 0208 t.ERASE
( label 47CE )
t.1 t.TEXT-CLEAR-ENABLED t.! t.;S
AT 47D6

( PAUSE-COLOR-DLI | NFA 47D6 CFA 47DC )
( Inferred descriptive name, not recovered original: )
( Wrapper around DISABLE-COLOR-DLI, called before disk )
( transfers and scene changes to stabilize playfield colors. )
( Stack: -- )
AT 47D6
( Saved dictionary header: flags, name bytes, link )
BYTES 830000BDA847
DOCOL
t.DISABLE-COLOR-DLI t.;S
AT 47E2

( RESUME-COLOR-DLI | NFA 47E2 CFA 47E9 )
( Inferred descriptive name, not recovered original: )
( Wrapper around ENABLE-COLOR-DLI, called after disk/scene )
( work and while showing disk prompts. )
( Stack: -- )
AT 47E2
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000BED647
DOCOL
t.ENABLE-COLOR-DLI t.;S
AT 47EF

( SAVED-DMACTL | NFA 47EF CFA 47F5 )
( Inferred descriptive name, not recovered original: Stores )
( prior value of Atari SDMCTL [$022F]. )
AT 47EF
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C7E247
DOVAR
CELL 0000
AT 47F9

( DISABLE-DISPLAY-DMA | NFA 47F9 CFA 4800 )
( Inferred descriptive name, not recovered original: Saves )
( SDMCTL [$022F], then stores zero there. )
AT 47F9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D3EF47
DOCOL
LIT16 022F t.C@ t.SAVED-DMACTL t.! t.0 LIT16 022F t.C! t.;S
AT 4816

( RESTORE-DISPLAY-DMA | NFA 4816 CFA 481E )
( Inferred descriptive name, not recovered original: )
( Restores SDMCTL [$022F] from CFA47F5. )
AT 4816
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C3F947
DOCOL
t.SAVED-DMACTL t.@ LIT16 022F t.C! t.;S
AT 482C

( INIT-GAME-DISPLAY | NFA 482C CFA 4834 )
( Inferred descriptive name, not recovered original: Loads )
( group 4, disables DMA, installs assets/display state and )
( restores DMA. )
AT 482C
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CE1648
DOCOL
t.LOAD-GAME-ASSETS t.DISABLE-DISPLAY-DMA
t.INSTALL-SCENE-ASSETS t.INIT-GAME-COLOR-DLI
t.RESTORE-DISPLAY-DMA t.;S
AT 4842

( TEXT-FRAME-VOCABULARY | NFA 4842 CFA 4847 )
( Inferred descriptive name, not recovered original: DODOES )
( vocabulary using $1E30; its private dictionary chain )
( contains #RT, #RTC, EKP, G#D, G#, D#, S# and [RAM], which )
( draw character-cell frames. )
AT 4842
( Saved dictionary header: flags, name bytes, link )
BYTES C200D22C48
DODOES
( DOES> thread at 1E30 )
BYTES 301E81A00449033C
AT 4851

( #RT | NFA 4851 CFA 4857 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 4851
( Saved dictionary header: flags, name bytes, link )
BYTES 832352D4441E
DOVAR
BYTES 000005
AT 485C

( #RTC | NFA 485C CFA 4863 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 485C
( Saved dictionary header: flags, name bytes, link )
BYTES 84235254C35148
DOVAR
BYTES 515745411D445A58432020
AT 4870

( EKP | NFA 4870 CFA 4876 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 4870
( Saved dictionary header: flags, name bytes, link )
BYTES 83454BD05C48
DOCON
CELL 00D2
AT 487A

( #L | NFA 487A CFA 487F )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 487A
( Saved dictionary header: flags, name bytes, link )
BYTES 8223CC7048
DOCON
CELL 00D4
AT 4883

( 40+ | NFA 4883 CFA 4889 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 4883
( Saved dictionary header: flags, name bytes, link )
BYTES 833430AB7A48
CELL 488B ( native entry point )
CLC                  ( 488B )
LDA.ZP D2            ( 488C )
ADC.# 28             ( 488E )
STA.ZP D2            ( 4890 )
LDA.ZP D3            ( 4892 )
ADC.# 00             ( 4894 )
STA.ZP D3            ( 4896 )
RTS                  ( 4898 )
AT 4899

( G#D | NFA 4899 CFA 489F )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 4899
( Saved dictionary header: flags, name bytes, link )
BYTES 834723C48348
CELL 48A1 ( native entry point )
LDY.# 00             ( 48A1 )
LDA.ABS 4859         ( 48A3 )
STA.INDY D2          ( 48A6 )
INY                  ( 48A8 )
LDA.ABS 485A         ( 48A9 )
STA.INDY D2          ( 48AC )
INY                  ( 48AE )
TYA                  ( 48AF )
LDX.ZP D1            ( 48B0 )
CMP.ZPX 02           ( 48B2 )
BNE 48A9             ( 48B4 )
DEY                  ( 48B6 )
LDA.ABS 485B         ( 48B7 )
STA.INDY D2          ( 48BA )
RTS                  ( 48BC )
AT 48BD

( G# | NFA 48BD CFA 48C2 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 48BD
( Saved dictionary header: flags, name bytes, link )
BYTES 8247A39948
CELL 48C4 ( native entry point )
STX.ZP D1            ( 48C4 )
JSR.ABS 48A1         ( 48C6 )
JSR.ABS 488B         ( 48C9 )
LDX.ZP D1            ( 48CC )
JMP.ABS 0F47         ( 48CE )
AT 48D1

( D# | NFA 48D1 CFA 48D6 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 48D1
( Saved dictionary header: flags, name bytes, link )
BYTES 8244A3BD48
CELL 48D8 ( native entry point )
STX.ZP D1            ( 48D8 )
JSR.ABS 48A1         ( 48DA )
LDX.ZP D1            ( 48DD )
JMP.ABS 1057         ( 48DF )
AT 48E2

( S# | NFA 48E2 CFA 48E7 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 48E2
( Saved dictionary header: flags, name bytes, link )
BYTES 8253A3D148
CELL 48E9 ( native entry point )
STX.ZP D1            ( 48E9 )
LDA.# 02             ( 48EB )
STA.ZP D4            ( 48ED )
JSR.ABS 48A1         ( 48EF )
JSR.ABS 488B         ( 48F2 )
INC.ZP D4            ( 48F5 )
LDA.ZP D4            ( 48F7 )
LDX.ZP D1            ( 48F9 )
CMP.ZPX 00           ( 48FB )
BNE 48EF             ( 48FD )
LDX.ZP D1            ( 48FF )
JMP.ABS 0F47         ( 4901 )
AT 4904

( [RAM] | NFA 4904 CFA 490C )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 4904
( Saved dictionary header: flags, name bytes, link )
BYTES 852852414DA9E248
DOCOL
t.#RTC t.#RT t.3 t.CMOVE t.G# t.#RTC t.3 t.+ t.#RT t.3 t.CMOVE
t.S# t.#RTC LIT16 0006 t.+ t.#RT t.3 t.CMOVE t.D# t.;S
AT 4938

( DRAW-TEXT-FRAME | NFA 4938 CFA 4940 )
( Inferred descriptive name, not recovered original: )
( Computes SAVMSC [$58]+40*Y@+X@ into EKP, invokes [RAM] )
( with supplied width/height, then increments both text )
( coordinates to enter the frame interior. )
( Stack: width height -- )
AT 4938
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C14248
DOCOL
LIT16 0058 t.@ t.Y@ LIT16 0028 t.* t.+ t.X@ t.+ t.EKP t.!
t.(RAM) t.X@ t.1+ t.X! t.Y@ t.1+ t.Y! t.;S
AT 496A

( DRAW-CENTERED-TEXT-FRAME | NFA 496A CFA 4973 )
( Inferred descriptive name, not recovered original: Sets X )
( to 20-floor[width/2], then calls DRAW-TEXT-FRAME with the )
( original width and height. Used for menus, direction )
( lists and disk prompts. )
( Stack: width height -- )
AT 496A
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000C13849
DOCOL
t.OVER t.2 t./ LIT16 0014 t.SWAP t.- t.X! t.DRAW-TEXT-FRAME
t.;S
AT 4989

( OBJECT-RECORD-BASE | NFA 4989 CFA 498F )
( Inferred descriptive name, not recovered original: )
( Constant 2 added by $56A7 after doubling an object )
( number, forming its picture-record index while reserving )
( records 0/1. )
( Stack: -- index )
AT 4989
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B06A49
DOCON
CELL 0002
AT 4993

( ROOM-GROUP-OFFSET | NFA 4993 CFA 499A )
( Inferred descriptive name, not recovered original: )
( Constant 5 added to side-one room numbers by $59E9 to )
( obtain resource group numbers. Rooms beyond the side-one )
( threshold use the alternate side-two formula. )
( Stack: -- offset )
AT 4993
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000B08949
DOCON
CELL 0005
AT 499E

( NEXT-TEXT-ROW-AT-X | NFA 499E CFA 49A3 )
( Inferred descriptive name, not recovered original: )
( Duplicates x into X!, increments Y through Y@ 1+ Y!, and )
( leaves x on the data stack for a later margin restore. )
( Used between disk-prompt lines. )
( Stack: x -- x )
AT 499E
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CC9349
DOCOL
t.DUP t.X! t.Y@ t.1+ t.Y! t.;S
AT 49B1

( PROMPT-DISK-READ-ERROR | NFA 49B1 CFA 49B7 )
( Inferred descriptive name, not recovered original: Draws )
( a centered 28x4 frame, prints BLAD ODCZYTU Z DYSKU and )
( NACISNIJ DOWOLNY KLAWISZ, beeps, waits for KEY, and )
( clears the prompt. )
( Stack: -- )
AT 49B1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D29E49
DOCOL
t.CLEAR-TEXT-AREA t.RESUME-COLOR-DLI t.CR LIT16 001C t.4
t.DRAW-CENTERED-TEXT-FRAME t.X@
( Game text:    BLAD ODCZYTU Z DYSKU )
t.(S")
BYTES 173D3D3D426C61443D4F44435A5954553D5A3D4459534B55
t.NEXT-TEXT-ROW-AT-X
( Game text:  NACISNIJ DOWOLNY KLAWISZ )
t.(S")
BYTES 193D4E414349734E494A3D444F574F4C4E593D4B4C415749535A
t.BEEP t.KEY t.2DROP t.CLEAR-TEXT-AREA t.PAUSE-COLOR-DLI t.;S
AT 4A0D

( PROMPT-FLIP-DISK | NFA 4A0D CFA 4A14 )
( Inferred descriptive name, not recovered original: Draws )
( a centered 30x4 frame, prints ODWROC DYSKIETKE and I )
( NACISNIJ DOWOLNY KLAWISZ, waits for KEY, and clears the )
( prompt. )
( Stack: -- )
AT 4A0D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D2B149
DOCOL
t.CLEAR-TEXT-AREA t.RESUME-COLOR-DLI t.CR LIT16 001E t.4
t.DRAW-CENTERED-TEXT-FRAME t.X@
( Game text:       ODWROC DYSKIETKE )
t.(S")
BYTES 163D3D3D3D3D3D4F4457526F633D4459534B4945544B65
t.NEXT-TEXT-ROW-AT-X
( Game text:  I NACISNIJ DOWOLNY KLAWISZ )
t.(S")
BYTES 1B3D493D4E414349534E494A3D444F574F4C4E593D4B4C415749535A
t.KEY t.2DROP t.CLEAR-TEXT-AREA t.PAUSE-COLOR-DLI t.;S
AT 4A69

( REQUIRED-DISK-SIDE | NFA 4A69 CFA 4A6F )
( Inferred descriptive name, not recovered original: )
( Desired side marker compared by $4AC8 with the first byte )
( read from directory sector DIRB. Room loading sets it )
( from $59E9; restart/save/menu paths select side one. )
( Stack: -- addr )
AT 4A69
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C40D4A
DOVAR
CELL 0001
AT 4A73

( READ-DISK-SIDE | NFA 4A73 CFA 4A79 )
( Inferred descriptive name, not recovered original: Reads )
( directory sector DIRB into PAD on drive one. On success )
( returns PAD C@ followed by zero; on failure returns a )
( nonzero error flag. )
( Stack: -- side 0 | error )
AT 4A73
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C4694A
DOCOL
t.PAD t.DIRB t.1 t.1 t.-DISK t.0=_12DE t.0=_12DE t.DUP
t.0=_12DE
t.0BRANCH CELL 0008 ( -> 4A97 )
t.PAD t.C@ t.SWAP
( label 4A97 )
t.;S
AT 4A99

( TRANSFER-BUFFER | NFA 4A99 CFA 4A9F )
( Inferred descriptive name, not recovered original: Retry )
( loop $4AC8 saves the caller buffer address here and )
( reuses it for each BLOAD/SAVE-GAM-GROUP attempt. )
( Stack: -- addr )
AT 4A99
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A9734A
DOVAR
CELL 436B
AT 4AA3

( TRANSFER-SECTOR-COUNT | NFA 4AA3 CFA 4AA9 )
( Inferred descriptive name, not recovered original: Retry )
( loop $4AC8 saves its sector-count/buffer-capacity )
( argument here and passes it back to BLOAD or )
( SAVE-GAM-GROUP. )
( Stack: -- addr )
AT 4AA3
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A9994A
DOVAR
CELL 0007
AT 4AAD

( TRANSFER-GROUP | NFA 4AAD CFA 4AB3 )
( Inferred descriptive name, not recovered original: Retry )
( loop $4AC8 saves the resource group number here and uses )
( it on each transfer attempt. )
( Stack: -- addr )
AT 4AAD
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A9A34A
DOVAR
CELL 0014
AT 4AB7

( TRANSFER-IS-LOAD | NFA 4AB7 CFA 4ABC )
( Inferred descriptive name, not recovered original: )
( Nonzero selects BLOAD in retry loop $4AC8; zero selects )
( SAVE-GAM-GROUP. Used by state and inventory read/write )
( wrappers. )
( Stack: -- addr )
AT 4AB7
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D3AD4A
DOVAR
CELL 0000
AT 4AC0

( RETRY-GROUP-TRANSFER | NFA 4AC0 CFA 4AC8 )
( Inferred descriptive name, not recovered original: Caches )
( buffer/count/group, reads and checks REQUIRED-DISK-SIDE, )
( calls BLOAD or SAVE-GAM-GROUP according to )
( TRANSFER-IS-LOAD, and retries after the appropriate )
( error/flip-disk prompt until success. )
( Stack: addr count group -- )
AT 4AC0
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A9B74A
DOCOL
t.TRANSFER-GROUP t.! t.TRANSFER-SECTOR-COUNT t.!
t.TRANSFER-BUFFER t.!
( label 4AD6 )
t.READ-DISK-SIDE t.0=_12DE
t.0BRANCH CELL 0042 ( -> 4B1E )
t.REQUIRED-DISK-SIDE t.@ t.=
t.0BRANCH CELL 0030 ( -> 4B16 )
t.TRANSFER-BUFFER t.@ t.TRANSFER-SECTOR-COUNT t.@
t.TRANSFER-GROUP t.@ t.TRANSFER-IS-LOAD t.@
t.0BRANCH CELL 0008 ( -> 4B02 )
t.BLOAD
t.BRANCH CELL 0004 ( -> 4B04 )
( label 4B02 )
t.SAVE-GAM-GROUP
( label 4B04 )
t.0BRANCH CELL 000A ( -> 4B10 )
t.PROMPT-DISK-READ-ERROR t.0
t.BRANCH CELL 0004 ( -> 4B12 )
( label 4B10 )
t.1
( label 4B12 )
t.BRANCH CELL 0006 ( -> 4B1A )
( label 4B16 )
t.PROMPT-FLIP-DISK t.0
( label 4B1A )
t.BRANCH CELL 0006 ( -> 4B22 )
( label 4B1E )
t.PROMPT-DISK-READ-ERROR t.0
( label 4B22 )
t.0BRANCH CELL FFB2 ( -> 4AD6 )
t.;S
AT 4B28

( GAME-STATE-DISK-RANGE | NFA 4B28 CFA 4B2D )
( Inferred descriptive name, not recovered original: )
( Returns CURRENT-ROOM storage address followed by the )
( sector count covering state through )
( ROOM-EXIT-MASKS[ROOM-TABLE-CAPACITY-1], computed as byte )
( distance/B/BUF+1. Original 6502 execution returns address )
( $436B and seven sectors. )
( Stack: -- addr sectors )
AT 4B28
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C9C04A
DOCOL
t.CURRENT-ROOM t.ROOM-TABLE-CAPACITY t.1 t.- t.ROOM-EXIT-MASKS
t.OVER t.- t.B/BUF t./ t.1+ t.;S
AT 4B45

( LOAD-INITIAL-STATE | NFA 4B45 CFA 4B4C )
( Inferred descriptive name, not recovered original: Sets )
( TRANSFER-IS-LOAD and reads group $13 [19] into )
( GAME-STATE-DISK-RANGE. Called by new-game initialization )
( and the ending restart path. )
( Stack: -- )
AT 4B45
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C3284B
DOCOL
t.1 t.TRANSFER-IS-LOAD t.! t.GAME-STATE-DISK-RANGE LIT8 13
t.RETRY-GROUP-TRANSFER t.;S
AT 4B5D

( LOAD-SAVED-STATE | NFA 4B5D CFA 4B64 )
( Inferred descriptive name, not recovered original: Sets )
( TRANSFER-IS-LOAD and reads group $14 [20] into )
( GAME-STATE-DISK-RANGE; the game load-command wrapper )
( invokes it after restoring inventory. )
( Stack: -- )
AT 4B5D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CE454B
DOCOL
t.1 t.TRANSFER-IS-LOAD t.! t.GAME-STATE-DISK-RANGE LIT8 14
t.RETRY-GROUP-TRANSFER t.;S
AT 4B75

( SAVE-GAME-STATE | NFA 4B75 CFA 4B7C )
( Inferred descriptive name, not recovered original: Clears )
( TRANSFER-IS-LOAD and writes GAME-STATE-DISK-RANGE to )
( group $14 [20]; the game save-command wrapper invokes it )
( after saving inventory. )
( Stack: -- )
AT 4B75
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CE5D4B
DOCOL
t.0 t.TRANSFER-IS-LOAD t.! t.GAME-STATE-DISK-RANGE LIT8 14
t.RETRY-GROUP-TRANSFER t.;S
AT 4B8D

( LOAD-RESOURCE-GROUP | NFA 4B8D CFA 4B95 )
( Inferred descriptive name, not recovered original: Clears )
( the resource buffer, selects load direction, and calls )
( RETRY-GROUP-TRANSFER with resource base and capacity $50 )
( sectors, preserving the supplied group number. )
( Stack: group -- )
AT 4B8D
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C2754B
DOCOL
t.CLEAR-RESOURCE-BUFFER t.1 t.TRANSFER-IS-LOAD t.! t.0
t.RESOURCE-ADDR LIT8 50 t.ROT t.RETRY-GROUP-TRANSFER t.;S
AT 4BAC

( CPM | NFA 4BAC CFA 4BB2 )
( GAM FORTH 42_A_GrafDos.ATR CFA $8BB5, corresponding word )
( in contiguous 9-definition sequence matching name )
( length/suffix, flags, word kind )
AT 4BAC
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CD8D4B
DOVAR
BYTES 00AEA8A04C4C
AT 4BBA

( =>COL | NFA 4BBA CFA 4BC2 )
( GAM FORTH 42_A_GrafDos.ATR CFA $8BC5, corresponding word )
( in contiguous 9-definition sequence matching name )
( length/suffix, flags, word kind )
AT 4BBA
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CCAC4B
DOCOL
t.CPM t.+ t.C! t.;S
AT 4BCC

( ?COL-PM | NFA 4BCC CFA 4BD6 )
( GAM FORTH 42_A_GrafDos.ATR CFA $8BD9, corresponding word )
( in contiguous 9-definition sequence matching name )
( length/suffix, flags, word kind )
AT 4BCC
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000CDBA4B
DOCOL
t.CPM LIT16 02C0 t.4 t.CMOVE t.;S
AT 4BE4

( PMA# | NFA 4BE4 CFA 4BEB )
( GAM FORTH 42_A_GrafDos.ATR CFA $8BF0, corresponding word )
( in contiguous 5-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 4BE4
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A3CC4B
DOVAR
CELL 0000
AT 4BEF

( PMBASE@ | NFA 4BEF CFA 4BF9 )
( GAM FORTH 42_A_GrafDos.ATR CFA $8BFE, identical body )
( after known address relocation; surviving name length and )
( suffix match )
AT 4BEF
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C0E44B
DOCOL
t.PMA# t.@ LIT16 0500 t.+ t.;S
AT 4C07

( PMBASE! | NFA 4C07 CFA 4C11 )
( GAM FORTH 42_A_GrafDos.ATR CFA $8C16, identical body )
( after known address relocation; surviving name length and )
( suffix match )
AT 4C07
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000A1EF4B
DOCOL
t.DUP LIT16 D407 t.C! LIT16 0100 t.* t.PMA# t.! t.;S
AT 4C27

( C-PM | NFA 4C27 CFA 4C2E )
( GAM FORTH 42_A_GrafDos.ATR CFA $8C33, identical body )
( after known address relocation; surviving name length and )
( suffix match )
AT 4C27
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CD074C
DOCOL
t.PMBASE@ LIT16 02FF t.ERASE t.;S
AT 4C3A

( ON-PM | NFA 4C3A CFA 4C42 )
( GAM FORTH 11_A_Graf.ATR CFA $9305, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 4C3A
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CD274C
DOCOL
t.3 LIT16 D01D t.C! t.;S
AT 4C4E

( OFF-PM | NFA 4C4E CFA 4C57 )
( GAM FORTH 42_A_GrafDos.ATR CFA $8C5C, corresponding word )
( in contiguous 9-definition sequence matching name )
( length/suffix, flags, word kind )
AT 4C4E
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000CD3A4C
DOCOL
LIT16 D000 t.8 t.ERASE t.0 LIT16 D01D t.C! t.;S
AT 4C6B

( XR# | NFA 4C6B CFA 4C71 )
( GAM FORTH 42_A_GrafDos.ATR CFA $8CA2, corresponding word )
( in contiguous 5-definition sequence matching name )
( length/suffix, flags, word kind )
AT 4C6B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A34E4C
DOVAR
BYTES 000005414C
AT 4C78

( XPM! | NFA 4C78 CFA 4C7F )
( GAM FORTH 42_A_GrafDos.ATR CFA $8CB0, corresponding word )
( in contiguous 5-definition sequence matching name )
( length/suffix, flags, word kind )
AT 4C78
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A16B4C
DOCOL
t.XR# t.3 t.ROT t.FILL t.XR# LIT16 D001 t.3 t.1 t.PAUSE
t.CMOVE t.;S
AT 4C99

( ST# | NFA 4C99 CFA 4C9F )
( GAM FORTH 11_A_Graf.ATR CFA $935E, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 4C99
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A3784C
DOCOL
( Trailing code/data at 4CA1; retained exactly )
INCBIN graphics/packed/cursor-players.bin
BYTES 7712
AT 4CCA

( ILPM | NFA 4CCA CFA 4CD1 )
( GAM FORTH 42_A_GrafDos.ATR CFA $8CFE, corresponding word )
( in contiguous 5-definition sequence matching name )
( length/suffix, flags, word kind )
AT 4CCA
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CD994C
DOVAR
CELL 0000
AT 4CD5

( ZD-PM! | NFA 4CD5 CFA 4CDE )
( GAM FORTH 11_A_Graf.ATR CFA $939D, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 4CD5
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000A1CA4C
DOCOL
t.DK t.! t.ZK t.! t.;S
AT 4CEA

( PM-COPY-PARAMETERS! | NFA 4CEA CFA 4CF3 )
( Inferred descriptive name, not recovered original: Stores )
( plane count in ILPM and bytes per plane in +DOD; cursor-Y )
( placement supplies 13 bytes and three planes. Same )
( dataflow appears as DL-IL! in GAM source screen 7. )
( Stack: bytes-per-plane planes -- )
AT 4CEA
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000A1D54C
DOCOL
t.ILPM t.! t.+DOD t.! t.;S
AT 4CFF

( COPY-PM-PLANES | NFA 4CFF CFA 4D05 )
( Inferred descriptive name, not recovered original: Native )
( code copies +DOD bytes from ZK to DK for ILPM planes, )
( advances source by +DOD and destination by $100 per )
( plane, preserving Forth X and returning through NEXT. )
( Stack: -- )
AT 4CFF
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A6EA4C
CELL 4D07 ( native entry point )
STX.ZP D1            ( 4D07 )
LDX.ABS 4CD3         ( 4D09 )
LDY.# 00             ( 4D0C )
LDA.INDY D2          ( 4D0E )
STA.INDY D4          ( 4D10 )
INY                  ( 4D12 )
CPY.ABS 38DC         ( 4D13 )
BNE 4D0E             ( 4D16 )
INC.ZP D5            ( 4D18 )
JSR.ABS 3920         ( 4D1A )
DEX                  ( 4D1D )
BNE 4D0C             ( 4D1E )
LDX.ZP D1            ( 4D20 )
JMP.ABS 0F47         ( 4D22 )
AT 4D25

( SET-CURSOR-PM-Y | NFA 4D25 CFA 4D2C )
( Inferred descriptive name, not recovered original: Copies )
( the fixed three 13-byte cursor planes at $4CA1 to )
( PMBASE@+y using ZD-PM!, PM-COPY-PARAMETERS! and )
( COPY-PM-PLANES after a frame wait. )
( Stack: y -- )
AT 4D25
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1FF4C
DOCOL
LIT16 4CA1 t.SWAP t.PMBASE@ t.+ t.ZD-PM! LIT8 0D t.3
t.PM-COPY-PARAMETERS! t.1 t.PAUSE t.COPY-PM-PLANES t.;S
AT 4D49

( VARRAY | NFA 4D49 CFA 4D52 )
( GAM FORTH 11_A_Graf.ATR CFA $940D, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 4D49
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000D9254D
DOCOL
t.<BUILDS t., t.ALLOT t.DOES>
( Trailing code/data at 4D5C; retained exactly )
BYTES A513E413E413041316167712
AT 4D68

( CURSOR-CONTEXT | NFA 4D68 CFA 4D70 )
( Inferred descriptive name, not recovered original: Index )
( variable shared by the four VARRAY cursor tables. Even )
( entries select X and adjacent odd entries select Y; )
( contexts 0/2/4/6 select different screen regions. GAM )
( screen 8 describes the analogous GDZIE variable as )
( selecting the serviced area. )
( Stack: -- addr )
AT 4D68
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C5494D
DOVAR
CELL 0000
AT 4D74

( CURSOR-ORIGIN | NFA 4D74 CFA 4D7C )
( Inferred descriptive name, not recovered original: VARRAY )
( indexed implicitly by CURSOR-CONTEXT; supplies the origin )
( added to index*step by $4DD8/$4E3E. Adjacent bytes hold )
( X/Y origins; $518C and $6FF4 update them for scene/menu )
( placement. )
( Stack: -- addr )
AT 4D74
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000B0684D
DODOES
( DOES> thread at 4D5C )
BYTES 5C4D724D531C3634202020202020
AT 4D8C

( CURSOR-GRID-POS | NFA 4D8C CFA 4D92 )
( Inferred descriptive name, not recovered original: VARRAY )
( indexed by CURSOR-CONTEXT, holding the current grid index )
( for the selected axis. $4DD8 sets it; $4E3E changes it )
( after movement; callers also access adjacent X/Y bytes. )
( Stack: -- addr )
AT 4D8C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D0744D
DODOES
( DOES> thread at 4D5C )
BYTES 5C4D724D00000000202020202020
AT 4DA2

( CURSOR-GRID-STEP | NFA 4DA2 CFA 4DA9 )
( Inferred descriptive name, not recovered original: VARRAY )
( indexed by CURSOR-CONTEXT, supplying pixels per grid )
( step. X/Y steps initially 4 and 6; $4DD8 computes )
( origin+index*step and $4E3E animates across that interval. )
( Stack: -- addr )
AT 4DA2
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C48C4D
DODOES
( DOES> thread at 4D5C )
BYTES 5C4D724D04060F1F202004082020
AT 4DB9

( CURSOR-GRID-LIMIT | NFA 4DB9 CFA 4DC1 )
( Inferred descriptive name, not recovered original: VARRAY )
( indexed by CURSOR-CONTEXT, storing maximum permitted grid )
( index. $51B9 writes hit-map width-1/height-1; $4EA4 )
( compares current index against these limits. )
( Stack: -- addr )
AT 4DB9
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D8A24D
DODOES
( DOES> thread at 4D5C )
BYTES 5C4D724D130E0101202000202020
AT 4DD1

( SET-CURSOR-GRID-INDEX | NFA 4DD1 CFA 4DD8 )
( Inferred descriptive name, not recovered original: Stores )
( index in CURSOR-GRID-POS for the active context and )
( returns index*CURSOR-GRID-STEP+CURSOR-ORIGIN. Original )
( 6502 execution with index=3, step=4 and origin=40 returns )
( 52 and stores grid index 3. )
( Stack: index -- pixel )
AT 4DD1
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1B94D
DOCOL
t.DUP t.CURSOR-GRID-POS t.C! t.CURSOR-GRID-STEP t.C@ t.*
t.CURSOR-ORIGIN t.C@ t.+ t.;S
AT 4DEE

( SET-CURSOR-X | NFA 4DEE CFA 4DF4 )
( Inferred descriptive name, not recovered original: )
( Converts/stores the grid index with $4DD8 then passes the )
( resulting horizontal hardware coordinate to XPM!. )
( Stack: index -- )
AT 4DEE
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1D14D
DOCOL
t.SET-CURSOR-GRID-INDEX t.XPM! t.;S
AT 4DFC

( SET-CURSOR-Y | NFA 4DFC CFA 4E02 )
( Inferred descriptive name, not recovered original: )
( Temporarily increments CURSOR-CONTEXT to its paired Y )
( entry, converts/stores the grid index, copies the cursor )
( planes at the resulting Y position, then restores context. )
( Stack: index -- )
AT 4DFC
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1EE4D
DOCOL
t.1 t.CURSOR-CONTEXT t.+! t.SET-CURSOR-GRID-INDEX
t.SET-CURSOR-PM-Y LIT16 FFFF t.CURSOR-CONTEXT t.+! t.;S
AT 4E18

( SET-CURSOR-PIXEL | NFA 4E18 CFA 4E1F )
( Inferred descriptive name, not recovered original: )
( Selects SET-CURSOR-PM-Y for odd CURSOR-CONTEXT and XPM! )
( for even contexts. The input is already a hardware pixel )
( coordinate, not a grid index. )
( Stack: pixel -- )
AT 4E18
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1FC4D
DOCOL
t.CURSOR-CONTEXT t.@ t.2 t.MOD
t.0BRANCH CELL 0008 ( -> 4E33 )
t.SET-CURSOR-PM-Y
t.BRANCH CELL 0004 ( -> 4E35 )
( label 4E33 )
t.XPM!
( label 4E35 )
t.;S
AT 4E37

( ANIMATE-CURSOR-STEP | NFA 4E37 CFA 4E3E )
( Inferred descriptive name, not recovered original: For a )
( nonzero signed grid delta, derives the current hardware )
( position, iterates intermediate positions through )
( SET-CURSOR-PIXEL using delta as loop step, then updates )
( CURSOR-GRID-POS by delta. Zero delta is discarded. )
( Stack: delta -- )
AT 4E37
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000AB184E
DOCOL
t.>R t.CURSOR-GRID-POS t.C@ t.CURSOR-GRID-STEP t.C@ t.*
t.CURSOR-ORIGIN t.C@ t.+ t.R t.0=_12DE
t.0BRANCH CELL 000A ( -> 4E62 )
t.R> t.2DROP
t.BRANCH CELL 003A ( -> 4E9A )
( label 4E62 )
t.R t.SWAP t.R t.+ t.DUP t.CURSOR-GRID-STEP t.C@ t.R t.* t.+
t.DUP t.R t.- t.SWAP t.ROT t.(DO)
( label 4E82 )
t.I t.SET-CURSOR-PIXEL t.OVER
t.(+LOOP) CELL FFF8 ( -> 4E82 )
t.2DROP t.CURSOR-GRID-POS t.C@ t.R> t.+ t.CURSOR-GRID-POS t.C!
( label 4E9A )
t.;S
AT 4E9C

( STEP-CURSOR-BOUNDED | NFA 4E9C CFA 4EA4 )
( Inferred descriptive name, not recovered original: )
( Accepts the joystick step -1/0/+1; negative motion runs )
( only above index zero, positive motion only below )
( CURSOR-GRID-LIMIT, then calls ANIMATE-CURSOR-STEP. It is )
( not a general clamp for arbitrary multi-cell deltas. )
( Stack: delta -- )
AT 4E9C
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A1374E
DOCOL
t.DUP t.0<_12F3
t.0BRANCH CELL 001A ( -> 4EC6 )
t.CURSOR-GRID-POS t.C@ t.0 t.>
t.0BRANCH CELL 0008 ( -> 4EC0 )
t.ANIMATE-CURSOR-STEP
t.BRANCH CELL 0004 ( -> 4EC2 )
( label 4EC0 )
t.DROP
( label 4EC2 )
t.BRANCH CELL 0018 ( -> 4EDC )
( label 4EC6 )
t.CURSOR-GRID-POS t.C@ t.CURSOR-GRID-LIMIT t.C@ t.<
t.0BRANCH CELL 0008 ( -> 4EDA )
t.ANIMATE-CURSOR-STEP
t.BRANCH CELL 0004 ( -> 4EDC )
( label 4EDA )
t.DROP
( label 4EDC )
t.;S
AT 4EDE

( STEP-CURSOR-X | NFA 4EDE CFA 4EE5 )
( Inferred descriptive name, not recovered original: )
( Wrapper around STEP-CURSOR-BOUNDED for the current even/X )
( context. WAIT-GAME-INPUT calls it after applying Y motion. )
( Stack: dx -- )
AT 4EDE
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A19C4E
DOCOL
t.STEP-CURSOR-BOUNDED t.;S
AT 4EEB

( STEP-CURSOR-Y | NFA 4EEB CFA 4EF2 )
( Inferred descriptive name, not recovered original: )
( Temporarily increments CURSOR-CONTEXT to the paired Y )
( entry, calls STEP-CURSOR-BOUNDED, then restores the )
( context. )
( Stack: dy -- )
AT 4EEB
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1DE4E
DOCOL
t.1 t.CURSOR-CONTEXT t.+! t.STEP-CURSOR-BOUNDED LIT16 FFFF
t.CURSOR-CONTEXT t.+! t.;S
AT 4F06

( TG0 | NFA 4F06 CFA 4F0C )
( GAM FORTH 11_A_Graf.ATR CFA $95D7, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 4F06
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B0EB4E
DOCON
CELL D010
AT 4F10

( JS0 | NFA 4F10 CFA 4F16 )
( GAM FORTH 11_A_Graf.ATR CFA $95E1, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 4F10
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B0064F
DOCON
CELL 0278
AT 4F1A

( TRIGGER@ | NFA 4F1A CFA 4F22 )
( Inferred descriptive name, not recovered original: Reads )
( byte TG0+controller-index and masks bit zero. )
AT 4F1A
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C7104F
DOCOL
t.TG0 t.+ t.C@ t.1 t.AND t.;S
AT 4F30

( JOYSTICK@ | NFA 4F30 CFA 4F38 )
( Inferred descriptive name, not recovered original: Reads )
( byte JS0+controller-index. )
AT 4F30
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CB1A4F
DOCOL
t.JS0 t.+ t.C@ t.;S
AT 4F42

( -1 | NFA 4F42 CFA 4F47 )
( GAM FORTH 11_A_Graf.ATR CFA $9612, identical body after )
( known address relocation; surviving name length and )
( suffix match )
AT 4F42
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B1304F
DOCON
CELL FFFF
AT 4F4B

( STICK-X-DELTA-TABLE | NFA 4F4B CFA 4F51 )
( Inferred descriptive name, not recovered original: SELECT )
( vector for raw STICK code minus five, containing )
( [1,1,1,0,-1,-1,-1,0,0,0,0]. $4F98 combines it with the Y )
( table; the same vector is XST in GAM source screen 10. )
( Stack: index -- dx )
AT 4F4B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D4424F
DODOES
( DOES> thread at 30B4 )
BYTES B430CD14CD14CD14C514474F474F474FC514C514C514C5147712
AT 4F6D

( STICK-Y-DELTA-TABLE | NFA 4F6D CFA 4F73 )
( Inferred descriptive name, not recovered original: SELECT )
( vector for raw STICK code minus five, containing )
( [1,-1,0,0,1,-1,0,0,1,-1,0]. $4F98 combines it with the X )
( table; the same vector is YST in GAM source screen 10. )
( Stack: index -- dy )
AT 4F6D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D44B4F
DODOES
( DOES> thread at 30B4 )
BYTES B430CD14474FC514C514CD14474FC514C514CD14474FC5147712
AT 4F8F

( STICK>DELTAS | NFA 4F8F CFA 4F98 )
( Inferred descriptive name, not recovered original: )
( Subtracts five from a raw OS STICK nibble, then executes )
( the X and Y selector vectors. Examples: 15->0,0; )
( 14->0,-1; 13->0,1; 11->-1,0; 7->1,0. Input is a STICK )
( value, not a controller number. GAM screen 10 documents )
( the same STI>XY stack effect. Original 6502 execution )
( confirms all nine valid direction/neutral nibble values. )
( Stack: stick -- dx dy )
AT 4F8F
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000D96D4F
DOCOL
LIT16 0005 t.- t.DUP t.STICK-X-DELTA-TABLE t.SWAP
t.STICK-Y-DELTA-TABLE t.;S
AT 4FAA

( INIT-CURSOR-PLAYERS | NFA 4FAA CFA 4FB4 )
( Inferred descriptive name, not recovered original: Sets )
( SDMCTL $022F=$3E and GPRIOR $026F=1, chooses PMBASE )
( $A000, clears/configures/enables player graphics, and )
( positions X/Y using the stored cursor grid indices. )
( Stack: -- )
AT 4FAA
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000CD8F4F
DOCOL
LIT16 003E LIT16 022F t.C! t.1 LIT16 026F t.C! LIT16 00A0
t.PMBASE! t.C-PM t.?COL-PM t.ON-PM t.CURSOR-GRID-POS t.C@
t.SET-CURSOR-X t.CURSOR-GRID-POS t.1+ t.C@ t.SET-CURSOR-Y t.;S
AT 4FE4

( HIT-MAP-BUFFER | NFA 4FE4 CFA 4FEB )
( Inferred descriptive name, not recovered original: )
( Decoded hit-map buffer: first bytes are width and height, )
( followed by one object/hit ID per cell. $5147 indexes )
( x+y*width+2, $5261 decompresses resource masks here, and )
( $51B9 derives cursor limits. Allocation initially )
( contains stale Forth/source bytes. )
( Stack: -- addr )
AT 4FE4
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C2AA4F
DOVAR
BYTES 000005414C4C4F542020202020202020202020202020202020202020
BYTES 202020202020202014B816C10F08009C4FA20F04008413A20F1800F0
BYTES 4EF9131F4FF9139B16C10F08009C4FA20F0400841377128458502BA1
BYTES FA4F4114025077128459502BA13C504114CD14CE4EB41302502D0FFF
BYTES FFCE4EB4137712835447B049507D1410D0834A53B064507D14780285
BYTES 53545249C76E5041146A500413F913CD14031277128553544943CB78
BYTES 50411474500413F9137712822DB18E507D14FFFF835853D4A050D818
BYTES B430CD14CD14CD14C514A550A550A550C514C514C514C51477128359
BYTES 53D4A950D818B430CD14A550C514C514CD14A550C514C514CD14A550
BYTES C5147712865354493E58D9CB5041142D0F05006216A513AF508D13D1
BYTES 50771287494E49432D50CDED5041142D0F3E002D0F2F022014CD142D
BYTES 0F6F0220142D00000000000000000000000101010101000000000000
BYTES 13604F
AT 5140

( HIT-MAP-CELL@ | NFA 5140 CFA 5147 )
( Inferred descriptive name, not recovered original: )
( Calculates HIT-MAP-BUFFER+2+x+y*width and fetches the )
( byte; HANDLE-GAME-INPUT uses it to obtain the selected )
( object ID. )
( Stack: x y -- object )
AT 5140
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C0E44F
DOCOL
t.HIT-MAP-BUFFER t.C@ t.* t.+ t.HIT-MAP-BUFFER t.+ t.2+ t.C@
t.;S
AT 515B

( COPY-HIT-MAP | NFA 515B CFA 5162 )
( Inferred descriptive name, not recovered original: Skips )
( the length-prefixed picture with DUP @ + 2+, then )
( expands/copies the following record into HIT-MAP-BUFFER )
( using <MOVE. )
( Stack: record -- )
AT 515B
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C24051
DOCOL
t.DUP t.@ t.+ t.2+ t.HIT-MAP-BUFFER t.<MOVE t.;S
AT 5172

( XR | NFA 5172 CFA 5177 )
( GAM FORTH 42_A_GrafDos.ATR CFA $91A9, identical body )
( after known address relocation; surviving name length and )
( suffix match )
AT 5172
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D25B51
DOCON
CELL 0029
AT 517B

( YR | NFA 517B CFA 5180 )
( GAM FORTH 42_A_GrafDos.ATR CFA $91B2, identical body )
( after known address relocation; surviving name length and )
( suffix match )
AT 517B
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D27251
DOCON
CELL 0014
AT 5184

( SET-HIT-MAP-ORIGIN | NFA 5184 CFA 518C )
( Inferred descriptive name, not recovered original: )
( Converts FIRST's picture x/y into cursor origins: )
( x*current horizontal step+XR and y+YR, storing the two )
( bytes in $4D7C. )
( Stack: -- )
AT 5184
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000B07B51
DOCOL
t.FIRST t.C@ t.CURSOR-GRID-STEP t.C@ t.* t.XR t.+
t.CURSOR-ORIGIN t.C! t.FIRST t.1+ t.C@ t.YR t.+
t.CURSOR-ORIGIN t.1+ t.C! t.;S
AT 51B2

( SET-HIT-MAP-LIMITS | NFA 51B2 CFA 51B9 )
( Inferred descriptive name, not recovered original: Stores )
( HIT-MAP-BUFFER width-1 and height-1 in the two )
( cursor-limit bytes at $4DC1. )
( Stack: -- )
AT 51B2
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D88451
DOCOL
t.HIT-MAP-BUFFER t.C@ t.1 t.- t.CURSOR-GRID-LIMIT t.C!
t.HIT-MAP-BUFFER t.1+ t.C@ t.1 t.- t.CURSOR-GRID-LIMIT t.1+
t.C! t.;S
AT 51D9

( DRAW-PICTURE-WITH-HIT-MAP | NFA 51D9 CFA 51E0 )
( Inferred descriptive name, not recovered original: Finds )
( and draws a resource using ?PCOBJ, derives cursor origin, )
( copies its following hit-map, and sets cursor limits; )
( resource 2 forces hit-map height 16. )
( Stack: resource -- )
AT 51D9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D2B251
DOCOL
t.DUP t.>R t.RESOURCE-ADDR t.DUP t.?PCOBJ t.SET-HIT-MAP-ORIGIN
t.COPY-HIT-MAP t.R> t.2 t.=
t.0BRANCH CELL 000A ( -> 5202 )
t.16 t.HIT-MAP-BUFFER t.1+ t.C!
( label 5202 )
t.SET-HIT-MAP-LIMITS t.;S
AT 5206

( ROOM-VIEW-OBJECTS | NFA 5206 CFA 520C )
( Inferred descriptive name, not recovered original: )
( Indexes mutable ROOM-OBJECT-STATE at $438B by room, then )
( indexes that record's payload by view. $70A2/$70FC remove )
( and insert IDs in the returned length-prefixed list. )
( Stack: room view -- record )
AT 5206
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C2D951
DOCOL
t.SWAP t.ROOM-OBJECT-STATE t.LENGTH-RECORD-ADDR t.2+
t.LENGTH-RECORD-ADDR t.;S
AT 521A

( PICTURE-COLORS-PTR | NFA 521A CFA 521F )
( Inferred descriptive name, not recovered original: $522A )
( stores the address of five color bytes immediately before )
( a picture's odd flag. $588D copies its first three bytes )
( to ADC's palette destination. )
( Stack: -- address )
AT 521A
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C30652
DOVAR
CELL 0000
AT 5223

( EXPAND-PICTURE | NFA 5223 CFA 522A )
( Inferred descriptive name, not recovered original: )
( Locates the resource's final flag, remembers trailing )
( colors when the flag is odd, and expands the record into )
( FIRST using <MOVE. )
( Stack: resource -- )
AT 5223
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C61A52
DOCOL
t.RESOURCE-ADDR t.DUP t.OUNT t.+ t.1 t.- t.DUP t.C@ t.2 t.MOD
t.0BRANCH CELL 0010 ( -> 5252 )
LIT16 0005 t.- t.PICTURE-COLORS-PTR t.!
t.BRANCH CELL 0004 ( -> 5254 )
( label 5252 )
t.DROP
( label 5254 )
t.FIRST t.<MOVE t.;S
AT 525A

( LOAD-HIT-MAP | NFA 525A CFA 5261 )
( Inferred descriptive name, not recovered original: Looks )
( up the resource with RESOURCE-ADDR and expands it into )
( HIT-MAP-BUFFER using <MOVE. )
( Stack: resource -- )
AT 525A
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D42352
DOCOL
t.RESOURCE-ADDR t.HIT-MAP-BUFFER t.<MOVE t.;S
AT 526B

( OVERLAY-X-OFFSET | NFA 526B CFA 5270 )
( Inferred descriptive name, not recovered original: $52A1 )
( stores overlay x minus base-picture x; $5308 uses the )
( same byte-column offset when composing the corresponding )
( hit-map. )
( Stack: -- address )
AT 526B
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D85A52
DOVAR
CELL 0000
AT 5274

( OVERLAY-Y-OFFSET | NFA 5274 CFA 5279 )
( Inferred descriptive name, not recovered original: $52A1 )
( stores overlay y minus base-picture y; $5308 divides this )
( difference by six when locating the overlay in the )
( hit-map. )
( Stack: -- address )
AT 5274
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D96B52
DOVAR
CELL 0000
AT 527D

( BLIT-ROW-STRIDE! | NFA 527D CFA 5283 )
( Inferred descriptive name, not recovered original: Stores )
( the cell in P-CCM+6, the destination row-step documented )
( by GAM FORTH 11_B_Graf.TXT screen 84/89. )
( Stack: stride -- )
AT 527D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A17452
DOCOL
t.P-CCM LIT16 0006 t.+ t.! t.;S
AT 5291

( OVERLAY-PICTURE-BUFFER | NFA 5291 CFA 5296 )
( Inferred descriptive name, not recovered original: )
( Constant $A4E8 is the scratch destination where $52A1 )
( expands a picture before copying its pixels into FIRST. )
( Stack: -- address )
AT 5291
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C47D52
DOCON
CELL A4E8
AT 529A

( COMPOSE-PICTURE-OVERLAY | NFA 529A CFA 52A1 )
( Inferred descriptive name, not recovered original: )
( Expands a positioned picture at $A4E8, computes relative )
( x/y, sets CCMOV source and destination inside FIRST, )
( copies with the base picture's row width, then restores )
( stride 40. )
( Stack: resource -- )
AT 529A
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C69152
DOCOL
t.RESOURCE-ADDR t.OVERLAY-PICTURE-BUFFER t.<MOVE
t.OVERLAY-PICTURE-BUFFER t.2+ t.OXY t.XY-CCM!
t.OVERLAY-PICTURE-BUFFER t.4 t.+ t.OVERLAY-PICTURE-BUFFER t.C@
t.FIRST t.C@ t.- t.DUP t.OVERLAY-X-OFFSET t.!
t.OVERLAY-PICTURE-BUFFER t.1+ t.C@ t.FIRST t.1+ t.C@ t.- t.DUP
t.OVERLAY-Y-OFFSET t.! t.FIRST t.2+ t.C@ t.* t.+ t.FIRST t.+
t.4 t.+ t.ZD-CCM! t.FIRST t.2+ t.C@ t.BLIT-ROW-STRIDE! t.CCMOV
LIT16 0028 t.BLIT-ROW-STRIDE! t.;S
AT 5301

( COMPOSE-HIT-MAP-OVERLAY | NFA 5301 CFA 5308 )
( Inferred descriptive name, not recovered original: )
( Temporarily sets RCM=0, expands a mask into PAD, computes )
( its destination in HIT-MAP-BUFFER from saved overlay )
( offsets, calls CCMOV, and restores RCM and stride 40. )
( Stack: resource -- )
AT 5301
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D49A52
DOCOL
t.RCM t.C@ t.SWAP t.0 t.RCM t.C! t.RESOURCE-ADDR t.PAD t.<MOVE
t.PAD t.OXY t.XY-CCM! t.PAD t.2+ t.OVERLAY-X-OFFSET t.@
t.OVERLAY-Y-OFFSET t.@ LIT16 0006 t./MOD t.SWAP t.0=_12DE
t.0=_12DE t.+ t.HIT-MAP-BUFFER t.C@ t.* t.+ t.HIT-MAP-BUFFER
t.+ t.2+ t.ZD-CCM! t.HIT-MAP-BUFFER t.C@ t.BLIT-ROW-STRIDE!
t.CCMOV LIT16 0028 t.BLIT-ROW-STRIDE! t.RCM t.C! t.;S
AT 5360

( INVENTORY-RESOURCE-BASE | NFA 5360 CFA 5366 )
( Inferred descriptive name, not recovered original: )
( Returns INVENTORY-BLOCK-BUFFER+2. $5374 patches )
( RESOURCE-ADDR's first threaded call to this word when )
( accessing the current 512-byte inventory block. )
( Stack: -- address )
AT 5360
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B00153
DOCOL
t.INVENTORY-BLOCK-BUFFER t.2+ t.;S
AT 536E

( USE-INVENTORY-RESOURCES | NFA 536E CFA 5374 )
( Inferred descriptive name, not recovered original: )
( Patches the CFA operand at $3F0B to $5366, selecting the )
( inventory-block resource base, and sets the graphics copy )
( mode RCM to 2. )
( Stack: -- )
AT 536E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DA6053
DOCOL
LIT16 5368 t.CFA LIT16 3F0B t.! t.2 t.RCM t.C! t.;S
AT 538A

( USE-SCENE-RESOURCES | NFA 538A CFA 5390 )
( Inferred descriptive name, not recovered original: )
( Restores the CFA at $3F0B to RESOURCE-BASE@ [$3EE3] and )
( sets RCM to zero after inventory resource access. )
( Stack: -- )
AT 538A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000BE6E53
DOCOL
LIT16 3EE5 t.CFA LIT16 3F0B t.! t.0 t.RCM t.C! t.;S
AT 53A6

( SPLIT-CELL-BYTES | NFA 53A6 CFA 53B0 )
( Inferred descriptive name, not recovered original: Native )
( $53B2 saves the original high byte, allocates one )
( data-stack cell, leaves original low and high as separate )
( zero-extended cells, then jumps to NEXT. )
( Stack: u -- low high )
AT 53A6
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C28A53
CELL 53B2 ( native entry point )
LDA.ZPX 01           ( 53B2 )
DEX                  ( 53B4 )
DEX                  ( 53B5 )
STA.ZPX 00           ( 53B6 )
LDA.# 00             ( 53B8 )
STA.ZPX 03           ( 53BA )
STA.ZPX 01           ( 53BC )
JMP.ABS 0F47         ( 53BE )
AT 53C1

( PATCH-VBI-CALL | NFA 53C1 CFA 53C9 )
( Inferred descriptive name, not recovered original: Parses )
( a Forth name with -FIND, computes buffer+1+3*slot, writes )
( JSR opcode $20 and that word's PFA; prints ERROR VBI if )
( lookup fails. )
( Stack: slot buffer -- )
AT 53C1
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A9A653
DOCOL
t.-FIND
t.0BRANCH CELL 0025 ( -> 53F4 )
t.DROP t.SWAP t.1+ t.ROT LIT8 03 t.* t.+ t.DUP t.>R t.1+ t.!
LIT16 0020 t.R> t.C!
t.BRANCH CELL 0010 ( -> 5402 )
( label 53F4 )
t.DROP
( ATASCII text: ERROR VBI )
t.(.")
BYTES 094552524F5220564249
( label 5402 )
t.;S
AT 5404

( VBI-CALL-BUFFER | NFA 5404 CFA 540C )
( Inferred descriptive name, not recovered original: )
( Contains NOP slots, JSR $54E5 and terminal JMP $5F6F. )
( RUN-VBI1 installs entry $540F; $5438 patches three-byte )
( calls in this buffer. )
( Stack: -- address )
AT 5404
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000B1C153
DOVAR
BYTES EAEAEAEA20E554EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEA
BYTES EAEAEA4C6F5F20
AT 5431

( SET-VBI-CALL | NFA 5431 CFA 5438 )
( Inferred descriptive name, not recovered original: Passes )
( VBI-CALL-BUFFER to $53C9, which parses a word name and )
( writes its JSR entry into the selected VBI slot. )
( Stack: slot -- )
AT 5431
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000B10454
DOCOL
t.VBI-CALL-BUFFER t.PATCH-VBI-CALL t.;S
AT 5440

( EXIT-DEFERRED-VBI | NFA 5440 CFA 5448 )
( Inferred descriptive name, not recovered original: Native )
( body is JMP $E462, the Atari OS deferred-VBI exit vector )
( XITVBV. No Forth NEXT is executed on this path. )
( Stack: -- )
AT 5440
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A93154
CELL 544A ( native entry point )
JMP.ABS E462         ( 544A )
AT 544D

( RUN-VBI1 | NFA 544D CFA 5457 )
( GAM FORTH 09_A_Forth.TXT SCR 27 native implementation: )
( SETVBV deferred-VBI vector $540F, matching the $VBI1 )
( handler )
AT 544D
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000B14054
CELL 5459 ( native entry point )
STX.ZP D1            ( 5459 )
LDX.# 54             ( 545B )
LDY.# 0F             ( 545D )
LDA.# 07             ( 545F )
JSR.ABS E45C         ( 5461 )
LDX.ZP D1            ( 5464 )
JMP.ABS 0F47         ( 5466 )
AT 5469

( STOP-VBI1 | NFA 5469 CFA 5474 )
( GAM FORTH 09_A_Forth.TXT SCR 27 native implementation: )
( SETVBV deferred-VBI vector $E462 [OS default] )
AT 5469
( Saved dictionary header: flags, name bytes, link )
BYTES 8800000000000000B14D54
CELL 5476 ( native entry point )
STX.ZP D1            ( 5476 )
LDX.# E4             ( 5478 )
LDY.# 62             ( 547A )
LDA.# 07             ( 547C )
JSR.ABS E45C         ( 547E )
LDX.ZP D1            ( 5481 )
JMP.ABS 0F47         ( 5483 )
AT 5486

( OS-RAM-COPY-LENGTH | NFA 5486 CFA 548C )
( Inferred descriptive name, not recovered original: $5514 )
( stores the requested byte length; native $54AB copies its )
( high-byte count of full pages followed by the low-byte )
( tail. The author tutorial 1-2/93 describes the related )
( PDL/Z%/D%/PMOVE parameter roles, but its native )
( copy/banking implementation differs from this game. )
( Stack: -- address )
AT 5486
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC6954
DOVAR
CELL 0000
AT 5490

( Z% | NFA 5490 CFA 5495 )
( GAM FORTH 42_A_GrafDos.ATR CFA $9A8A, identical body )
( after known address relocation; surviving name length and )
( suffix match )
AT 5490
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A58654
DOCON
CELL 00DD
AT 5499

( OS-RAM-COPY-DEST | NFA 5499 CFA 549E )
( Inferred descriptive name, not recovered original: )
( Constant $00DF is the zero-page destination pointer for )
( native $54AB; paired with Z% at $00DD for the source. The )
( author tutorial 1-2/93 describes the related )
( PDL/Z%/D%/PMOVE parameter roles, but its native )
( copy/banking implementation differs from this game. )
( Stack: -- address )
AT 5499
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A59054
DOCON
CELL 00DF
AT 54A2

( COPY-OS-RAM-BYTES | NFA 54A2 CFA 54A9 )
( Inferred descriptive name, not recovered original: Native )
( $54AB reads source [$DD],Y and writes destination )
( [$DF],Y, copying full pages and a remaining tail from )
( $548E/$548F; returns with RTS for the VBI wrapper. Ends )
( in RTS; invoked as an assembly subroutine, not directly )
( through the Forth interpreter, consistent with the author )
( tutorial 9/92. )
( 6502 subroutine: JSR/RTS; not directly Forth-callable )
AT 54A2
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A99954
CELL 54AB ( native entry point )
LDX.ABS 548F         ( 54AB )
LDY.# 00             ( 54AE )
CPX.# 00             ( 54B0 )
BEQ 54C2             ( 54B2 )
LDA.INDY DD          ( 54B4 )
STA.INDY DF          ( 54B6 )
DEY                  ( 54B8 )
BNE 54B4             ( 54B9 )
INC.ZP DE            ( 54BB )
INC.ZP E0            ( 54BD )
DEX                  ( 54BF )
BNE 54B4             ( 54C0 )
LDA.ABS 548E         ( 54C2 )
BEQ 54D3             ( 54C5 )
LDY.ABS 548E         ( 54C7 )
DEY                  ( 54CA )
LDA.INDY DD          ( 54CB )
STA.INDY DF          ( 54CD )
CPY.# 00             ( 54CF )
BNE 54CA             ( 54D1 )
RTS                  ( 54D3 )
AT 54D4

( OS-RAM-COPY-PENDING | NFA 54D4 CFA 54D9 )
( Inferred descriptive name, not recovered original: $5514 )
( sets this flag and waits until it clears. $54E5 tests it )
( before the VBI RAM copy and clears it after restoring the )
( OS ROM mapping. )
( Stack: -- address )
AT 54D4
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C4A254
DOVAR
CELL 0000
AT 54DD

( VBI-COPY-UNDER-OS | NFA 54DD CFA 54E3 )
( Inferred descriptive name, not recovered original: If a )
( copy is pending, native $54E5 saves X, disables DLI via )
( NMIEN=$60, sets PORTB=$FE to expose RAM under the OS ROM, )
( copies via $54AB, restores PORTB=$FF/NMIEN, and clears )
( the flag. Ends in RTS; invoked as an assembly subroutine, )
( not directly through the Forth interpreter, consistent )
( with the author tutorial 9/92. )
( 6502 subroutine: JSR/RTS; not directly Forth-callable )
AT 54DD
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D6D454
CELL 54E5 ( native entry point )
LDA.ABS 54DB         ( 54E5 )
BEQ 550B             ( 54E8 )
STX.ZP D1            ( 54EA )
LDA.# 60             ( 54EC )
STA.ABS D40E         ( 54EE )
LDA.# FE             ( 54F1 )
STA.ABS D301         ( 54F3 )
JSR.ABS 54AB         ( 54F6 )
LDA.# FF             ( 54F9 )
STA.ABS D301         ( 54FB )
LDA.ABS 4031         ( 54FE )
STA.ABS D40E         ( 5501 )
LDX.ZP D1            ( 5504 )
LDA.# 00             ( 5506 )
STA.ABS 54DB         ( 5508 )
RTS                  ( 550B )
AT 550C

( COPY-UNDER-OS | NFA 550C CFA 5514 )
( Inferred descriptive name, not recovered original: Stores )
( source in Z%, destination at $DF and length at $548E, )
( sets the pending flag, and waits for the VBI handler to )
( finish the RAM-under-OS transfer. The author tutorial )
( 1-2/93 describes the related PDL/Z%/D%/PMOVE parameter )
( roles, but its native copy/banking implementation differs )
( from this game. )
( Stack: source destination length -- )
AT 550C
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C5DD54
DOCOL
t.OS-RAM-COPY-LENGTH t.! t.OS-RAM-COPY-DEST t.! t.Z% t.! t.1
t.OS-RAM-COPY-PENDING t.!
( label 5528 )
t.OS-RAM-COPY-PENDING t.C@ t.0=_12DE
t.0BRANCH CELL FFF8 ( -> 5528 )
t.;S
AT 5534

( INITIAL-INVENTORY-GROUP | NFA 5534 CFA 553A )
( Inferred descriptive name, not recovered original: )
( Constant 21 selects the nine-block initial inventory )
( resource group; $5655 loads it through the common )
( inventory-group transfer. )
( Stack: -- group )
AT 5534
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DA0C55
DOCON
CELL 0015
AT 553E

( SAVED-INVENTORY-GROUP | NFA 553E CFA 5544 )
( Inferred descriptive name, not recovered original: )
( Constant 23 selects the saved inventory resource group; )
( $5634 writes it and $5644 loads it. )
( Stack: -- group )
AT 553E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DA3455
DOCON
CELL 0017
AT 5548

( CURRENT-INVENTORY-BLOCK | NFA 5548 CFA 554E )
( Inferred descriptive name, not recovered original: )
( Indexes one of nine 512-byte blocks cached under OS ROM. )
( $5674 switches the index when resolving an inventory )
( object. )
( Stack: -- address )
AT 5548
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC3E55
DOVAR
CELL 0000
AT 5552

( INVENTORY-CACHE-BYTES | NFA 5552 CFA 5558 )
( Inferred descriptive name, not recovered original: )
( Constant $1200=4608 is nine 512-byte collections; $55BA )
( divides it by 128 to obtain the disk-transfer sector )
( count. )
( Stack: -- bytes )
AT 5552
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC4855
DOCON
CELL 1200
AT 555C

( INVENTORY-CACHE-BASE | NFA 555C CFA 5563 )
( Inferred descriptive name, not recovered original: )
( Variable initialized to $D800; its value is the )
( RAM-under-OS base for the nine inventory resource blocks. )
( Stack: -- address )
AT 555C
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000B05255
DOVAR
CELL D800
AT 5567

( INVENTORY-CACHE-BASE@ | NFA 5567 CFA 556D )
( Inferred descriptive name, not recovered original: )
( Fetches the base address stored by INVENTORY-CACHE-BASE )
( [$5563]. )
( Stack: -- address )
AT 5567
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B05C55
DOCOL
t.INVENTORY-CACHE-BASE t.@ t.;S
AT 5575

( INVENTORY-CACHED-BLOCK | NFA 5575 CFA 557C )
( Inferred descriptive name, not recovered original: )
( Returns inventory-cache base plus CURRENT-INVENTORY-BLOCK )
( times the 512-byte block size at $4154. )
( Stack: -- address )
AT 5575
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C16755
DOCOL
t.CURRENT-INVENTORY-BLOCK t.@ t.INVENTORY-BLOCK-SIZE t.*
t.INVENTORY-CACHE-BASE@ t.+ t.;S
AT 558C

( STORE-INVENTORY-BLOCK | NFA 558C CFA 5594 )
( Inferred descriptive name, not recovered original: Copies )
( the visible INVENTORY-BLOCK-BUFFER to its selected )
( 512-byte cache block under OS ROM through $5514. )
( Stack: -- )
AT 558C
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C17555
DOCOL
t.INVENTORY-BLOCK-BUFFER t.INVENTORY-CACHED-BLOCK
t.INVENTORY-BLOCK-SIZE t.COPY-UNDER-OS t.;S
AT 55A0

( FETCH-INVENTORY-BLOCK | NFA 55A0 CFA 55A8 )
( Inferred descriptive name, not recovered original: Copies )
( the selected 512-byte cache block under OS ROM into )
( visible INVENTORY-BLOCK-BUFFER through $5514. )
( Stack: -- )
AT 55A0
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000DA8C55
DOCOL
t.INVENTORY-CACHED-BLOCK t.INVENTORY-BLOCK-BUFFER
t.INVENTORY-BLOCK-SIZE t.COPY-UNDER-OS t.;S
AT 55B4

( TRANSFER-INVENTORY-GROUP | NFA 55B4 CFA 55BA )
( Inferred descriptive name, not recovered original: Uses )
( resource zero as the staging address, divides $1200 by )
( 128 for 36 sectors, and invokes the retrying group )
( transfer at $4AC8. )
( Stack: group -- )
AT 55B4
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CCA055
DOCOL
t.0 t.RESOURCE-ADDR t.INVENTORY-CACHE-BYTES LIT8 80 t./ t.ROT
t.RETRY-GROUP-TRANSFER t.;S
AT 55CD

( COPY-INVENTORY-CACHE | NFA 55CD CFA 55D3 )
( Inferred descriptive name, not recovered original: Copies )
( nine consecutive 512-byte blocks through COPY-UNDER-OS, )
( advancing source and destination by 512 each iteration. )
( Stack: source destination -- )
AT 55CD
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D6B455
DOCOL
LIT8 09 t.0 t.(DO)
( label 55DC )
t.2DUP t.INVENTORY-BLOCK-SIZE t.COPY-UNDER-OS t.SWAP
t.INVENTORY-BLOCK-SIZE t.+ t.SWAP t.INVENTORY-BLOCK-SIZE t.+
t.(LOOP) CELL FFEC ( -> 55DC )
t.2DROP t.;S
AT 55F6

( WRITE-INVENTORY-GROUP | NFA 55F6 CFA 55FE )
( Inferred descriptive name, not recovered original: )
( Selects disk-write mode, copies all nine cache blocks to )
( resource-zero staging RAM, then writes the selected )
( resource group with $55BA. )
( Stack: group -- )
AT 55F6
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A9CD55
DOCOL
t.0 t.TRANSFER-IS-LOAD t.! t.INVENTORY-CACHE-BASE@ t.0
t.RESOURCE-ADDR t.COPY-INVENTORY-CACHE
t.TRANSFER-INVENTORY-GROUP t.;S
AT 5612

( READ-INVENTORY-GROUP | NFA 5612 CFA 561A )
( Inferred descriptive name, not recovered original: )
( Selects disk-read mode, loads the group into )
( resource-zero staging RAM, then copies its nine blocks )
( into the RAM-under-OS cache. )
( Stack: group -- )
AT 5612
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A9F655
DOCOL
t.1 t.TRANSFER-IS-LOAD t.! t.TRANSFER-INVENTORY-GROUP t.0
t.RESOURCE-ADDR t.INVENTORY-CACHE-BASE@ t.COPY-INVENTORY-CACHE
t.;S
AT 562E

( SAVE-INVENTORY-CACHE | NFA 562E CFA 5634 )
( Inferred descriptive name, not recovered original: Writes )
( saved inventory group 23 and then stores the current )
( visible block into the cache; this is the exact original )
( call order. )
( Stack: -- )
AT 562E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C11256
DOCOL
t.SAVED-INVENTORY-GROUP t.WRITE-INVENTORY-GROUP
t.STORE-INVENTORY-BLOCK t.;S
AT 563E

( LOAD-SAVED-INVENTORY | NFA 563E CFA 5644 )
( Inferred descriptive name, not recovered original: Reads )
( saved inventory group 23 into the cache and fetches the )
( selected visible block. )
( Stack: -- )
AT 563E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C12E56
DOCOL
t.SAVED-INVENTORY-GROUP t.READ-INVENTORY-GROUP
t.FETCH-INVENTORY-BLOCK t.;S
AT 564E

( LOAD-INITIAL-INVENTORY | NFA 564E CFA 5655 )
( Inferred descriptive name, not recovered original: Reads )
( initial inventory group 21 into the cache and fetches the )
( selected visible block. )
( Stack: -- )
AT 564E
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D03E56
DOCOL
t.INITIAL-INVENTORY-GROUP t.READ-INVENTORY-GROUP
t.FETCH-INVENTORY-BLOCK t.;S
AT 565F

( INVENTORY-BLOCK-INDEX | NFA 565F CFA 5665 )
( Inferred descriptive name, not recovered original: )
( Divides its argument by four. $5674 applies it after )
( subtracting 102 from an inventory object ID. )
( Stack: index -- block )
AT 565F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC4E56
DOCOL
t.4 t./ t.;S
AT 566D

( SELECT-INVENTORY-OBJECT | NFA 566D CFA 5674 )
( Inferred descriptive name, not recovered original: )
( Selects inventory resource lookup, subtracts 102 from the )
( object ID, saves/fetches a 512-byte block if the quotient )
( by four changes, and returns the remainder modulo four. )
( Stack: object -- local-index )
AT 566D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A95F56
DOCOL
t.USE-INVENTORY-RESOURCES LIT8 66 t.- t.DUP
t.INVENTORY-BLOCK-INDEX t.CURRENT-INVENTORY-BLOCK t.@ t.=
t.0=_12DE
t.0BRANCH CELL 0010 ( -> 569B )
t.CLEAR-TEXT-AREA t.STORE-INVENTORY-BLOCK t.DUP
t.INVENTORY-BLOCK-INDEX t.CURRENT-INVENTORY-BLOCK t.!
t.FETCH-INVENTORY-BLOCK
( label 569B )
t.4 t.MOD t.;S
AT 56A1

( OBJECT-PICTURE-RESOURCE | NFA 56A1 CFA 56A7 )
( Inferred descriptive name, not recovered original: IDs )
( above 100 are resolved through $5674; the local ID is )
( then doubled and offset by resource 2, selecting an image )
( followed by its hit-map. )
( Stack: object -- resource )
AT 56A1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D76D56
DOCOL
t.DUP LIT8 64 t.>
t.0BRANCH CELL 0004 ( -> 56B6 )
t.SELECT-INVENTORY-OBJECT
( label 56B6 )
t.2 t.* t.OBJECT-RECORD-BASE t.+ t.;S
AT 56C0

( COMPILE-BYTE-LIST | NFA 56C0 CFA 56C5 )
( Inferred descriptive name, not recovered original: )
( Compiles a counted byte list at HERE: parses hexadecimal )
( numbers, emits values below 256, stops on a value at )
( least 256, and fills the initial count byte. )
( Stack: -- )
AT 56C0
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A9A156
DOCOL
t.0 t.HERE t.>R t.0 t.C,
( label 56D1 )
t.BL t.WORD t.HERE t.NUMBER t.DROP t.DUP LIT16 0100 t.<
t.0BRANCH CELL 000A ( -> 56EF )
t.C, t.1+
t.BRANCH CELL FFE4 ( -> 56D1 )
( label 56EF )
t.DROP t.R> t.C! t.;S
AT 56F7

( BYTE-LIST-DEFINER | NFA 56F7 CFA 5700 )
( Inferred descriptive name, not recovered original: Uses )
( <BUILDS and $56C5 to create a byte list. Its DOES> thread )
( applies COUNT then the membership helper at $3071. )
( Stack: -- )
AT 56F7
( Saved dictionary header: flags, name bytes, link )
BYTES 85000000003AA0C056
DOCOL
t.<BUILDS t.COMPILE-BYTE-LIST t.DOES>
( Trailing code/data at 5708; retained exactly )
BYTES FE1871307712
AT 570E

( ACCEPTED-KEY-CODES | NFA 570E CFA 5714 )
( Inferred descriptive name, not recovered original: )
( Created by the byte-list definer; holds sixteen raw CH )
( keycodes. $5730 tests this collection before calling KEY; )
( INSTR returns a one-based match index or zero. )
( Stack: keycode -- index-or-zero )
AT 570E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CCF756
DODOES
( DOES> thread at 5708 )
BYTES 0857101C2C3C2736370E0F020607202226212F
AT 5729

( READ-EDIT-KEY | NFA 5729 CFA 5730 )
( Inferred descriptive name, not recovered original: Clears )
( CH [$02FC] to $FF, maps joystick trigger to raw keycode )
( $0C, waits for a listed CH code below 64, then obtains )
( the ATASCII character through KEY. )
( Stack: -- character )
AT 5729
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CA0E57
DOCOL
LIT8 FF LIT16 02FC t.C!
( label 573B )
t.0 t.TRIGGER@ t.0=_12DE
t.0BRANCH CELL 000B ( -> 574E )
LIT8 0C LIT16 02FC t.C!
( label 574E )
LIT16 02FC t.C@ t.DUP t.ACCEPTED-KEY-CODES t.0=_12DE t.SWAP
t.64 t.< t.*
t.0BRANCH CELL FFD7 ( -> 573B )
t.KEY t.;S
AT 576A

( TEXT-INPUT-MAX-LENGTH | NFA 576A CFA 5770 )
( Inferred descriptive name, not recovered original: $57EE )
( stores the caller's maximum length; $57A7 refuses to )
( append characters once the counted buffer reaches this )
( value. )
( Stack: -- address )
AT 576A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D82957
DOVAR
CELL 0000
AT 5774

( EDIT-BACKSPACE | NFA 5774 CFA 577A )
( Inferred descriptive name, not recovered original: For )
( ATASCII $7E and a nonempty counted buffer, emits )
( $1E,$3D,$1E [cursor-left, the game-font blank glyph, )
( cursor-left] and decrements the count via $4732. )
( Stack: buffer character -- buffer character )
AT 5774
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D96A57
DOCOL
t.OVER t.C@ t.0 t.> t.OVER LIT8 7E t.= t.*
t.0BRANCH CELL 0010 ( -> 579F )
( ATASCII text: [1E]=[1E] )
t.(.")
BYTES 031E3D1E
t.OVER t.-1 t.SWAP t.BYTE+!
( label 579F )
t.;S
AT 57A1

( EDIT-APPEND-CHAR | NFA 57A1 CFA 57A7 )
( Inferred descriptive name, not recovered original: )
( Appends and echoes a character while the buffer is below )
( its limit, excluding backspace $7E and return $9B; )
( increments the count. )
( Stack: buffer character -- buffer character )
AT 57A1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D27457
DOCOL
t.OVER t.C@ t.TEXT-INPUT-MAX-LENGTH t.@ t.< t.OVER LIT8 7E t.=
t.0=_12DE t.* t.OVER LIT8 9B t.= t.0=_12DE t.*
t.0BRANCH CELL 0018 ( -> 57E3 )
t.DUP t.EMIT t.2DUP t.SWAP t.COUNT t.+ t.C! t.OVER t.1 t.SWAP
t.BYTE+!
( label 57E3 )
t.;S
AT 57E5

( READ-COUNTED-INPUT | NFA 57E5 CFA 57EE )
( Inferred descriptive name, not recovered original: Clears )
( the counted buffer and loops through key input, backspace )
( and append handlers until return is received with a )
( nonzero length. )
( Stack: maximum buffer -- )
AT 57E5
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000A4A157
DOCOL
t.SWAP t.TEXT-INPUT-MAX-LENGTH t.! t.0 t.OVER t.C!
( label 57FC )
t.READ-EDIT-KEY t.EDIT-BACKSPACE t.EDIT-APPEND-CHAR LIT8 9B
t.= t.OVER t.C@ t.*
t.0BRANCH CELL FFED ( -> 57FC )
t.DROP t.;S
AT 5815

( VIEW-STACK | NFA 5815 CFA 581A )
( Inferred descriptive name, not recovered original: )
( Counted stack of 16-bit scene/view IDs. $582D pushes, )
( $5855 reads the top, and $5868 pops; its byte count is )
( capped at ten. )
( Stack: -- address )
AT 5815
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D0E557
DOVAR
BYTES 000005414C4C4F5420202020
AT 5828

( PUSH-VIEW | NFA 5828 CFA 582D )
( Inferred descriptive name, not recovered original: When )
( VIEW-STACK's byte count is below ten, stores the view at )
( base+count+2 and increments the count by two. At full )
( capacity it leaves the argument on the data stack. )
AT 5828
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D01558
DOCOL
t.VIEW-STACK t.C@ LIT16 000A t.<
t.0BRANCH CELL 0014 ( -> 584F )
t.VIEW-STACK t.C@ t.2+ t.VIEW-STACK t.+ t.! t.2 t.VIEW-STACK
t.BYTE+!
( label 584F )
t.;S
AT 5851

( CURRENT-VIEW | NFA 5851 CFA 5855 )
( Inferred descriptive name, not recovered original: )
( Fetches the cell at VIEW-STACK plus its byte count; count )
( zero therefore returns the initial zero view. )
( Stack: -- view )
AT 5851
( Saved dictionary header: flags, name bytes, link )
BYTES 81D02858
DOCOL
t.VIEW-STACK t.DUP t.C@ t.+ t.@ t.;S
AT 5863

( POP-VIEW | NFA 5863 CFA 5868 )
( Inferred descriptive name, not recovered original: )
( Fetches the top view, then decrements VIEW-STACK's )
( nonzero byte count by two. )
( Stack: -- view )
AT 5863
( Saved dictionary header: flags, name bytes, link )
BYTES 8200BE5158
DOCOL
t.VIEW-STACK t.C@ t.VIEW-STACK t.+ t.@ t.VIEW-STACK t.C@
t.0BRANCH CELL 000A ( -> 5884 )
LIT16 FFFE t.VIEW-STACK t.BYTE+!
( label 5884 )
t.;S
AT 5886

( COMPOSE-CURRENT-VIEW | NFA 5886 CFA 588D )
( Inferred descriptive name, not recovered original: )
( Expands the base picture and hit-map, obtains current )
( room/view object IDs through $520C, composes each image )
( and hit-map overlay, restores colors, and sets cursor )
( origin and limits. )
( Stack: resource -- )
AT 5886
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000B16358
DOCOL
t.DUP t.>R t.EXPAND-PICTURE t.R t.1+ t.LOAD-HIT-MAP
t.CURRENT-ROOM t.@ t.CURRENT-VIEW t.ROOM-VIEW-OBJECTS t.OUNT
t.0 t.(DO)
( label 58A9 )
t.DUP t.I t.+ t.C@ t.DUP t.OBJECT-PICTURE-RESOURCE t.SWAP
t.0BRANCH CELL 0010 ( -> 58C9 )
t.DUP t.COMPOSE-PICTURE-OVERLAY t.1+ t.COMPOSE-HIT-MAP-OVERLAY
t.USE-SCENE-RESOURCES
t.BRANCH CELL 0004 ( -> 58CB )
( label 58C9 )
t.DROP
( label 58CB )
t.(LOOP) CELL FFDC ( -> 58A9 )
t.DROP t.PICTURE-COLORS-PTR t.@ t.ADC t.@ t.3 t.CMOVE
t.SET-HIT-MAP-ORIGIN t.R> t.2 t.=
t.0BRANCH CELL 000A ( -> 58F1 )
t.16 t.HIT-MAP-BUFFER t.1+ t.C!
( label 58F1 )
t.SET-HIT-MAP-LIMITS t.;S
AT 58F5

( DRAW-CURRENT-VIEW | NFA 58F5 CFA 58FD )
( Inferred descriptive name, not recovered original: )
( Restores scene resource lookup, composes the requested )
( current view with $588D, then draws the resulting FIRST )
( bitmap using ?POBJ. )
( Stack: resource -- )
AT 58F5
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000DA8658
DOCOL
t.USE-SCENE-RESOURCES t.COMPOSE-CURRENT-VIEW t.FIRST t.?POBJ
t.;S
AT 5909

( STORE-BYTE-PAIR | NFA 5909 CFA 590E )
( Inferred descriptive name, not recovered original: Stores )
( the second byte at address+1 and the first byte at )
( address. )
( Stack: first second address -- )
AT 5909
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B2F558
DOCOL
t.>R t.R t.1+ t.C! t.R> t.C! t.;S
AT 591E

( FETCH-BYTE-PAIR | NFA 591E CFA 5923 )
( Inferred descriptive name, not recovered original: )
( Fetches the two consecutive unsigned bytes at address and )
( address+1. )
( Stack: address -- first second )
AT 591E
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B20959
DOCOL
t.>R t.R t.C@ t.R> t.1+ t.C@ t.;S
AT 5933

( VIEW-CURSOR-POSITIONS | NFA 5933 CFA 5939 )
( Inferred descriptive name, not recovered original: )
( Cell-indexed array storing one cursor x/y byte pair per )
( view-stack depth; WAIT-GAME-INPUT saves positions and )
( $59A3 restores them. )
( Stack: depth -- address )
AT 5933
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D91E59
DODOES
( DOES> thread at 4144 )
BYTES 4441202020202020202020202020
AT 5949

( USE-SCENE-CURSOR | NFA 5949 CFA 594E )
( Inferred descriptive name, not recovered original: Sets )
( CURSOR-CONTEXT [$4D70] to zero before drawing or entering )
( scene views. )
( Stack: -- )
AT 5949
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B03359
DOCOL
t.0 t.CURSOR-CONTEXT t.! t.;S
AT 5958

( VIEW-STACK-DEPTH | NFA 5958 CFA 595D )
( Inferred descriptive name, not recovered original: )
( Divides VIEW-STACK's byte count by two to obtain its )
( number of stored 16-bit views. )
( Stack: -- depth )
AT 5958
( Saved dictionary header: flags, name bytes, link )
BYTES 8200AB4959
DOCOL
t.VIEW-STACK t.C@ t.2 t./ t.;S
AT 5969

( CENTER-SCENE-CURSOR | NFA 5969 CFA 596F )
( Inferred descriptive name, not recovered original: )
( Fetches HIT-MAP-BUFFER width and height, halves both and )
( stores the result in CURSOR-GRID-POS. )
( Stack: -- )
AT 5969
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D35859
DOCOL
t.HIT-MAP-BUFFER t.FETCH-BYTE-PAIR t.2 t./ t.SWAP t.2 t./
t.SWAP t.CURSOR-GRID-POS t.STORE-BYTE-PAIR t.;S
AT 5987

( ENTER-VIEW | NFA 5987 CFA 598D )
( Inferred descriptive name, not recovered original: )
( Selects the scene cursor, pushes the view, converts it to )
( its picture resource, draws it, and centers the cursor. )
( Stack: view -- )
AT 5987
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C26959
DOCOL
t.USE-SCENE-CURSOR t.DUP t.PUSH-VIEW t.OBJECT-PICTURE-RESOURCE
t.DRAW-CURRENT-VIEW t.CENTER-SCENE-CURSOR t.;S
AT 599D

( LEAVE-VIEW | NFA 599D CFA 59A3 )
( Inferred descriptive name, not recovered original: Pops )
( and discards the current view, redraws the previous view )
( now at the stack top, and restores its saved cursor byte )
( pair from VIEW-CURSOR-POSITIONS at current stack depth. )
( Stack: -- )
AT 599D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C28759
DOCOL
t.USE-SCENE-CURSOR t.POP-VIEW t.DROP t.CURRENT-VIEW
t.OBJECT-PICTURE-RESOURCE t.DRAW-CURRENT-VIEW
t.VIEW-STACK-DEPTH t.VIEW-CURSOR-POSITIONS t.FETCH-BYTE-PAIR
t.CURSOR-GRID-POS t.STORE-BYTE-PAIR t.;S
AT 59BD

( REDRAW-CURRENT-VIEW | NFA 59BD CFA 59C3 )
( Inferred descriptive name, not recovered original: )
( Selects the scene cursor and redraws CURRENT-VIEW through )
( its object-picture resource. )
( Stack: -- )
AT 59BD
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C29D59
DOCOL
t.USE-SCENE-CURSOR t.CURRENT-VIEW t.OBJECT-PICTURE-RESOURCE
t.DRAW-CURRENT-VIEW t.;S
AT 59CF

( SIDE-ONE-LAST-ROOM | NFA 59CF CFA 59D4 )
( Inferred descriptive name, not recovered original: )
( Constant 13 is the threshold used by $59E9 to choose side )
( one versus side two when mapping room IDs to resource )
( groups. )
( Stack: -- room )
AT 59CF
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CBBD59
DOCON
CELL 000D
AT 59D8

( GAME-UI-MODE | NFA 59D8 CFA 59DF )
( Inferred descriptive name, not recovered original: State )
( cell initialized to one. Value zero enables scene-opening )
( drawing; value one controls menu transitions; value three )
( selects compact disk-message decorations. )
( Stack: -- address )
AT 59D8
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000DACF59
DOVAR
CELL 0001
AT 59E3

( ROOM-DISK-GROUP | NFA 59E3 CFA 59E9 )
( Inferred descriptive name, not recovered original: For )
( room IDs above 13 returns room-13 and side 2; otherwise )
( returns room+5 and side 1. $5AEC uses this to load the )
( room assets. )
( Stack: room -- group side )
AT 59E3
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CBD859
DOCOL
t.DUP t.SIDE-ONE-LAST-ROOM t.>
t.0BRANCH CELL 000C ( -> 59FF )
t.SIDE-ONE-LAST-ROOM t.- t.2
t.BRANCH CELL 0008 ( -> 5A05 )
( label 59FF )
t.ROOM-GROUP-OFFSET t.+ t.1
( label 5A05 )
t.;S
AT 5A07

( FILL-SCENE-BAND | NFA 5A07 CFA 5A0C )
( Inferred descriptive name, not recovered original: Stores )
( $15 in the first byte and fills the following nineteen )
( bytes with $55; used by $5A27 for the scene transition )
( region. )
( Stack: address -- )
AT 5A07
( Saved dictionary header: flags, name bytes, link )
BYTES 8200BEE359
DOCOL
LIT8 15 t.OVER t.C! t.1+ LIT8 13 LIT8 55 t.FILL t.;S
AT 5A21

( FILL-SCENE-TRANSITION | NFA 5A21 CFA 5A27 )
( Inferred descriptive name, not recovered original: Writes )
( paired 20-byte bands from ADGR+$014A and )
( ADGR+$014A+87*40, moving inward by one 40-byte row for 44 )
( iterations. )
( Stack: -- )
AT 5A21
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C2075A
DOCOL
t.ADGR t.@ LIT16 014A t.+ t.DUP LIT8 28 LIT8 57 t.* t.+
LIT16 06E0 t.0 t.(DO)
( label 5A47 )
t.OVER t.I t.+ t.FILL-SCENE-BAND t.DUP t.I t.-
t.FILL-SCENE-BAND LIT8 28
t.(+LOOP) CELL FFEB ( -> 5A47 )
t.2DROP t.;S
AT 5A62

( SCENE-UPPER-COPY-BASE | NFA 5A62 CFA 5A67 )
( Inferred descriptive name, not recovered original: )
( Constant $0960 supplies the descending source rows in )
( $5A7B's paired 20-byte scene copy. )
( Stack: -- address )
AT 5A62
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C6215A
DOCON
CELL 0960
AT 5A6B

( SCENE-LOWER-COPY-BASE | NFA 5A6B CFA 5A70 )
( Inferred descriptive name, not recovered original: )
( Constant $0974 supplies the ascending source rows in )
( $5A7B's paired 20-byte scene copy. )
( Stack: -- address )
AT 5A6B
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C6625A
DOCON
CELL 0974
AT 5A74

( COPY-SCENE-CENTER-ROWS | NFA 5A74 CFA 5A7B )
( Inferred descriptive name, not recovered original: Copies )
( 20-byte rows from the two fixed source bases into )
( destinations around ADGR+$0802, moving upward and )
( downward by screen rows. )
( Stack: -- )
AT 5A74
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000DE6B5A
DOCOL
t.ADGR t.@ LIT16 0802 t.+ t.DUP LIT8 28 t.+ LIT16 0370 t.0
t.(DO)
( label 5A96 )
t.OVER t.SCENE-UPPER-COPY-BASE t.I t.- t.SWAP t.I t.2 t.* t.-
LIT8 14 t.CMOVE t.SCENE-LOWER-COPY-BASE t.I t.+ t.OVER t.I t.2
t.* t.+ LIT8 14 t.CMOVE LIT8 14
t.(+LOOP) CELL FFCF ( -> 5A96 )
t.2DROP t.;S
AT 5ACD

( ENTER-VIEW-WITH-TRANSITION | NFA 5ACD CFA 5AD4 )
( Inferred descriptive name, not recovered original: )
( Selects the scene cursor, pushes the view, composes its )
( picture, performs the paired center-row scene copy, and )
( centers the cursor. )
( Stack: view -- )
AT 5ACD
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000DE745A
DOCOL
t.USE-SCENE-CURSOR t.DUP t.PUSH-VIEW t.OBJECT-PICTURE-RESOURCE
t.COMPOSE-CURRENT-VIEW t.COPY-SCENE-CENTER-ROWS
t.CENTER-SCENE-CURSOR t.;S
AT 5AE6

( LOAD-ROOM-VIEW | NFA 5AE6 CFA 5AEC )
( Inferred descriptive name, not recovered original: Clears )
( VIEW-STACK, stores CURRENT-ROOM, maps room to disk )
( group/side, loads the resource group and enters base view )
( zero; UI mode zero also draws transition bands. )
( Stack: room -- )
AT 5AE6
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CDCD5A
DOCOL
t.0 t.VIEW-STACK t.! t.DUP t.CURRENT-ROOM t.!
t.ROOM-DISK-GROUP t.REQUIRED-DISK-SIDE t.!
t.LOAD-RESOURCE-GROUP t.GAME-UI-MODE t.@ t.0=_12DE
t.0BRANCH CELL 0004 ( -> 5B0E )
t.FILL-SCENE-TRANSITION
( label 5B0E )
t.0 t.ENTER-VIEW-WITH-TRANSITION t.;S
AT 5B14

( UNPACK-MAP-FIELDS | NFA 5B14 CFA 5B1A )
( Inferred descriptive name, not recovered original: Reads )
( one byte and returns [byte & $70]/16 followed by byte & )
( 7, ignoring the visited bit and top bit. )
( Stack: address -- high low )
AT 5B14
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C2E65A
DOCOL
t.C@ t.DUP LIT8 70 t.AND t.16 t./ t.SWAP LIT8 07 t.AND t.;S
AT 5B32

( MAP-FLOOR-TABLE-SIZE | NFA 5B32 CFA 5B37 )
( Inferred descriptive name, not recovered original: )
( Constant ten bounds the room-range scan in $5C36 over the )
( map-floor first/end arrays. )
( Stack: -- count )
AT 5B32
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D8145B
DOCON
CELL 000A
AT 5B3B

( MAP-FLOOR-FIRST-ROOM | NFA 5B3B CFA 5B41 )
( Inferred descriptive name, not recovered original: Byte )
( array of inclusive lower room-ID bounds. $5C36 scans it; )
( $5CF6 uses it as the start of a floor's room loop. )
( Stack: floor -- address )
AT 5B3B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C9325B
DODOES
( DOES> thread at 412C )
BYTES 2C4119161F000F2426262620
AT 5B4F

( MAP-FLOOR-END-ROOM | NFA 5B4F CFA 5B55 )
( Inferred descriptive name, not recovered original: Byte )
( array of exclusive upper room-ID bounds, paired with )
( $5B41 for floor lookup and map redraw loops. )
( Stack: floor -- address )
AT 5B4F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D83B5B
DODOES
( DOES> thread at 412C )
BYTES 2C411E19240E162527272720
AT 5B63

( MAP-GLYPH-SOURCE! | NFA 5B63 CFA 5B69 )
( Inferred descriptive name, not recovered original: Sets )
( P-CCM's source pointer to font base $BC00 plus eight )
( times the glyph index. )
( Stack: glyph -- )
AT 5B63
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C34F5B
DOCOL
t.8 t.* t.GAME-FONT-BASE t.+ t.P-CCM t.! t.;S
AT 5B79

( MAP-GLYPH-DEST! | NFA 5B79 CFA 5B80 )
( Inferred descriptive name, not recovered original: Sets )
( P-CCM's destination to ADGR+x-byte+40*y for drawing a map )
( glyph into the bitmap. )
( Stack: x-byte y -- )
AT 5B79
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C7635B
DOCOL
LIT8 28 t.* t.+ t.ADGR t.@ t.+ t.P-CCM t.2+ t.! t.;S
AT 5B97

( DRAW-VISITED-ROOM | NFA 5B97 CFA 5B9E )
( Inferred descriptive name, not recovered original: Draws )
( only descriptors with visited bit $08 set. Uses packed )
( room coordinates for bitmap position and descriptor )
( high/low fields to select two eight-row font glyphs. )
( Stack: room -- )
AT 5B97
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D0795B
DOCOL
t.ROOM-MAP-DESCRIPTORS t.DUP t.1+ t.C@ t.8 t.AND
t.0BRANCH CELL 003C ( -> 5BEA )
t.>R t.1 t.8 t.XY-CCM! t.R t.UNPACK-MAP-FIELDS t.8 t.* LIT8 1E
t.+ t.SWAP LIT8 20 t.+ t.SWAP t.MAP-GLYPH-DEST! t.R> t.1+
t.UNPACK-MAP-FIELDS t.SWAP t.1+ t.MAP-GLYPH-SOURCE! t.CCMOV
LIT16 0005 t.+ t.MAP-GLYPH-SOURCE!
t.BRANCH CELL 0004 ( -> 5BEC )
( label 5BEA )
t.DROP
( label 5BEC )
t.;S
AT 5BEE

( MARK-CURRENT-MAP-ROOM | NFA 5BEE CFA 5BF6 )
( Inferred descriptive name, not recovered original: Sets )
( the descriptor's visited bit, draws its map glyphs, then )
( repeats CCMOV in mode one for the current-room marker and )
( restores mode zero. )
( Stack: room -- )
AT 5BEE
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000AB975B
DOCOL
t.DUP t.ROOM-MAP-DESCRIPTORS t.1+ t.DUP t.C@ t.8 t.OR t.SWAP
t.C! t.DRAW-VISITED-ROOM t.1 t.RCM t.C! t.CCMOV t.0 t.RCM t.C!
t.;S
AT 5C1C

( FIRST-SHARED-MAP-ROOM | NFA 5C1C CFA 5C22 )
( Inferred descriptive name, not recovered original: )
( Constant 14 is a special room drawn across map-floor )
( ranges and treated as belonging to the current floor by )
( $5C36. )
( Stack: -- room )
AT 5C1C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B1EE5B
DOCON
CELL 000E
AT 5C26

( SECOND-SHARED-MAP-ROOM | NFA 5C26 CFA 5C2C )
( Inferred descriptive name, not recovered original: )
( Constant 30 is the other shared room: floor lookup )
( retains CURRENT-MAP-FLOOR, and floors below three include )
( its map marker. )
( Stack: -- room )
AT 5C26
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B21C5C
DOCON
CELL 001E
AT 5C30

( ROOM-MAP-FLOOR | NFA 5C30 CFA 5C36 )
( Inferred descriptive name, not recovered original: )
( Returns the existing map floor for rooms 14/30; otherwise )
( finds the room's half-open interval in )
( MAP-FLOOR-FIRST-ROOM and MAP-FLOOR-END-ROOM. )
( Stack: room -- floor )
AT 5C30
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D0265C
DOCOL
t.DUP t.FIRST-SHARED-MAP-ROOM t.= t.OVER
t.SECOND-SHARED-MAP-ROOM t.= t.+
t.0BRANCH CELL 000C ( -> 5C54 )
t.DROP t.CURRENT-MAP-FLOOR t.@
t.BRANCH CELL 002A ( -> 5C7C )
( label 5C54 )
t.MAP-FLOOR-TABLE-SIZE t.0 t.(DO)
( label 5C5A )
t.I t.MAP-FLOOR-FIRST-ROOM t.C@ t.1 t.- t.OVER t.I
t.MAP-FLOOR-END-ROOM t.C@ t.<=<
t.0BRANCH CELL 0008 ( -> 5C78 )
t.DROP t.I t.LEAVE
( label 5C78 )
t.(LOOP) CELL FFE0 ( -> 5C5A )
( label 5C7C )
t.;S
AT 5C7E

( DRAW-MAP-FLOOR-NUMBER | NFA 5C7E CFA 5C86 )
( Inferred descriptive name, not recovered original: )
( Divides CURRENT-MAP-FLOOR by ten and draws both digit )
( glyphs, starting at font glyph $46, in adjacent bitmap )
( columns $22/$23 at row $12. )
( Stack: -- )
AT 5C7E
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000DA305C
DOCOL
t.1 t.8 t.XY-CCM! t.CURRENT-MAP-FLOOR t.@ LIT8 0A t./MOD
LIT8 46 t.+ t.MAP-GLYPH-SOURCE! LIT8 22 LIT8 12
t.MAP-GLYPH-DEST! t.CCMOV LIT8 46 t.+ t.MAP-GLYPH-SOURCE!
LIT8 23 LIT8 12 t.MAP-GLYPH-DEST! t.CCMOV t.;S
AT 5CBB

( CLEAR-MAP-PANEL | NFA 5CBB CFA 5CC2 )
( Inferred descriptive name, not recovered original: Fills )
( six bitmap bytes per row with $55 for 48 rows, starting )
( at ADGR+$04D0 and using the 40-byte screen stride. )
( Stack: -- )
AT 5CBB
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D07E5C
DOCOL
LIT16 04D0 t.ADGR t.@ t.+ LIT16 0780 t.0 t.(DO)
( label 5CD6 )
t.DUP t.I t.+ LIT8 06 LIT8 55 t.FILL LIT8 28
t.(+LOOP) CELL FFED ( -> 5CD6 )
t.DROP t.;S
AT 5CEF

( DRAW-FLOOR-MAP | NFA 5CEF CFA 5CF6 )
( Inferred descriptive name, not recovered original: Draws )
( visited rooms in the current floor's room-ID interval, )
( then includes shared room 14 on nonzero floors and shared )
( room 30 on floors below three. )
( Stack: -- )
AT 5CEF
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C1BB5C
DOCOL
t.CURRENT-MAP-FLOOR t.@ t.DUP t.MAP-FLOOR-END-ROOM t.C@ t.SWAP
t.MAP-FLOOR-FIRST-ROOM t.C@ t.(DO)
( label 5D0A )
t.I t.DRAW-VISITED-ROOM
t.(LOOP) CELL FFFA ( -> 5D0A )
t.CURRENT-MAP-FLOOR t.@
t.0BRANCH CELL 0006 ( -> 5D1E )
t.FIRST-SHARED-MAP-ROOM t.DRAW-VISITED-ROOM
( label 5D1E )
t.CURRENT-MAP-FLOOR t.@ t.3 t.<
t.0BRANCH CELL 0006 ( -> 5D2E )
t.SECOND-SHARED-MAP-ROOM t.DRAW-VISITED-ROOM
( label 5D2E )
t.;S
AT 5D30

( TEXT-NEXT-ROW | NFA 5D30 CFA 5D36 )
( Inferred descriptive name, not recovered original: )
( Increments the text cursor's Y coordinate without )
( changing X. )
( Stack: -- )
AT 5D30
( Saved dictionary header: flags, name bytes, link )
BYTES 830000ABEF5C
DOCOL
t.Y@ t.1+ t.Y! t.;S
AT 5D40

( MESSAGE-BOX-WIDTH | NFA 5D40 CFA 5D46 )
( Inferred descriptive name, not recovered original: Walks )
( a byte-counted list of counted text lines, takes the )
( longest line length and adds four columns of box padding. )
( Stack: message -- width )
AT 5D40
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CD305D
DOCOL
t.0 t.SWAP t.COUNT t.0 t.(DO)
( label 5D52 )
t.SWAP t.OVER t.C@ t.MAX t.SWAP t.COUNT t.+
t.(LOOP) CELL FFF0 ( -> 5D52 )
t.DROP t.4 t.+ t.;S
AT 5D6C

( PRINT-CENTERED-MESSAGE | NFA 5D6C CFA 5D75 )
( Inferred descriptive name, not recovered original: Walks )
( counted message lines, sets X to 20 minus half each )
( line's length, prints with STYPE, and advances one text )
( row. )
( Stack: message -- )
AT 5D6C
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000C5405D
DOCOL
t.COUNT t.0 t.(DO)
( label 5D7D )
t.DUP t.COUNT LIT16 0014 t.OVER t.2 t./ t.- t.X! t.STYPE
t.TEXT-NEXT-ROW t.COUNT t.+
t.(LOOP) CELL FFE4 ( -> 5D7D )
t.DROP t.;S
AT 5D9F

( SOUND-BANK-ALLOCATION | NFA 5D9F CFA 5DA6 )
( Inferred descriptive name, not recovered original: )
( Constant $0E74 [3700] is adjacent to the allocated )
( sound-bank variable at $5DB3; its allocation size matches )
( the preserved bank/storage region. No runtime caller was )
( found. )
( Stack: -- bytes )
AT 5D9F
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D56C5D
DOCON
CELL 0E74
AT 5DAA

( SOUND-ENGINE-AND-DATA | NFA 5DAA CFA 5DB3 )
( Inferred descriptive name, not recovered original: The )
( 3706-byte saved variable contains the custom sound )
( command-stream engine and music/effects. music_sap.py )
( independently identifies its public $5E00 base and $5F6F )
( frame entry. )
( Stack: -- address )
AT 5DAA
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000C49F5D
DOVAR
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000FFFF005E262C
INCBIN music/sound-bank.bin
AT 6C2F

( SOUND-ENGINE-BASE | NFA 6C2F CFA 6C35 )
( Inferred descriptive name, not recovered original: )
( Constant $5E00 is the public load base of the sound )
( engine, independently identified and extracted by )
( music_sap.py. )
( Stack: -- address )
AT 6C2F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D3AA5D
DOCON
CELL 5E00
AT 6C39

( SOUND-COMMAND! | NFA 6C39 CFA 6C41 )
( Inferred descriptive name, not recovered original: Stores )
( its argument at $5E27 inside the music/sound routine. )
AT 6C39
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C42F6C
DOCOL
LIT16 5E27 t.C! t.;S
AT 6C4B

( RESUME-SOUND | NFA 6C4B CFA 6C56 )
( Inferred descriptive name, not recovered original: Stores )
( zero at the sound-stop flag $5E1E. The frame player $5F6F )
( bypasses playback when this flag is nonzero. )
( Stack: -- )
AT 6C4B
( Saved dictionary header: flags, name bytes, link )
BYTES 8800000000000000C3396C
DOCOL
t.0 LIT16 5E1E t.C! t.;S
AT 6C62

( SILENT-POKEY-REGISTERS | NFA 6C62 CFA 6C68 )
( Inferred descriptive name, not recovered original: The )
( first eight bytes are zero. STOP-SOUND copies them to )
( $D200..$D207, clearing all four POKEY frequency/control )
( register pairs. )
( Stack: -- address )
AT 6C62
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C94B6C
DOVAR
BYTES 000000000000000020
AT 6C73

( STOP-SOUND | NFA 6C73 CFA 6C7F )
( Inferred descriptive name, not recovered original: Stores )
( 1 at sound flag $5E1E, then copies eight saved register )
( bytes to POKEY $D200. )
AT 6C73
( Saved dictionary header: flags, name bytes, link )
BYTES 890000000000000000C3626C
DOCOL
t.1 LIT16 5E1E t.C! t.SILENT-POKEY-REGISTERS LIT16 D200 t.8
t.CMOVE t.;S
AT 6C95

( w6C9A | NFA 6C95 CFA 6C9A )
( Unknown erased name; CFA identifier )
AT 6C95
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D3736C
DOCON
CELL 1EFF
AT 6C9E

( SOUND-RELOCATION-DELTA | NFA 6C9E CFA 6CA5 )
( Inferred descriptive name, not recovered original: )
( Constant $3F00 converts the preserved sound initializer )
( $1F09 to $5E09 and its stop flag $1F1E to $5E1E in )
( $6CB0/$6CD7. )
( Stack: -- offset )
AT 6C9E
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000DA956C
DOCON
CELL 3F00
AT 6CA9

( SOUND-INIT-ADDRESS | NFA 6CA9 CFA 6CB0 )
( Inferred descriptive name, not recovered original: Adds )
( SOUND-RELOCATION-DELTA to $1F09, yielding the native )
( sound initializer $5E09 verified by music_sap.py. )
( Stack: -- address )
AT 6CA9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D29E6C
DOCOL
LIT16 1F09 t.SOUND-RELOCATION-DELTA t.+ t.;S
AT 6CBC

( CALL-SOUND-INITIALIZER | NFA 6CBC CFA 6CC4 )
( Inferred descriptive name, not recovered original: Native )
( $6CC6 saves Forth X in $D1, calls JSR $5E09 to initialize )
( the custom sound player, restores X, then jumps to NEXT. )
( Stack: -- )
AT 6CBC
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A9A96C
CELL 6CC6 ( native entry point )
STX.ZP D1            ( 6CC6 )
JSR.ABS 5E09         ( 6CC8 )
LDX.ZP D1            ( 6CCB )
JMP.ABS 0F47         ( 6CCD )
AT 6CD0

( INITIALIZE-AND-RESUME-SOUND | NFA 6CD0 CFA 6CD7 )
( Inferred descriptive name, not recovered original: Calls )
( the native initializer through $6CC4, then clears the )
( relocated stop flag at $5E1E. )
( Stack: -- )
AT 6CD0
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CFBC6C
DOCOL
t.CALL-SOUND-INITIALIZER t.0 LIT16 1F1E
t.SOUND-RELOCATION-DELTA t.+ t.C! t.;S
AT 6CE9

( RESTART-SOUND | NFA 6CE9 CFA 6CF7 )
( Inferred descriptive name, not recovered original: Stops )
( playback, temporarily disables the game VBI, )
( initializes/resumes the sound engine, then reinstalls )
( RUN-VBI1. )
( Stack: -- )
AT 6CE9
( Saved dictionary header: flags, name bytes, link )
BYTES 8B00000000000000000000C3D06C
DOCOL
t.STOP-SOUND t.STOP-VBI1 t.INITIALIZE-AND-RESUME-SOUND
t.RUN-VBI1 t.;S
AT 6D03

( HUNGER-MESSAGES | NFA 6D03 CFA 6D0A )
( Inferred descriptive name, not recovered original: )
( Counted message vector contains four Polish energy/hunger )
( warnings, including 'ZEMDLALES Z GLODU' and 'CZUJESZ )
( GLOD'; $6DD5 selects a warning by energy threshold. )
( Stack: index -- record )
( Decoded text: Hunger messages )
( item 0 line 1 $6D14: ZEMDLALES Z GLODU )
( item 1 line 1 $6D29: JESTES BARDZO GLODNY )
( item 2 line 1 $6D41: CZUJESZ GLOD )
( item 3 line 1 $6D51: CZUJESZ SSANIE W ZOLADKU )
AT 6D03
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C5E96C
DODOES
( DOES> thread at 39C1 )
BYTES C1395900130001115A454D444C416C45733D5A3D476C4F4455160001
BYTES 144A45535445733D424152445A4F3D476C4F444E590E00010C435A55
BYTES 4A45535A3D476C6F441A000118435A554A45535A3D5353414E49453D
BYTES 573D7A4F6C61444B55
AT 6D69

( HUNGER-THRESHOLDS | NFA 6D69 CFA 6D6F )
( Inferred descriptive name, not recovered original: Four )
( cells contain 0,20,40,50. $6DD5 compares ENERGY after )
( decrementing it and displays the corresponding )
( HUNGER-MESSAGES record on equality. )
( Stack: index -- address )
AT 6D69
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C5036D
DODOES
( DOES> thread at 4144 )
BYTES 44410000140028003200
AT 6D7B

( SHOW-MESSAGE | NFA 6D7B CFA 6D82 )
( Inferred descriptive name, not recovered original: For a )
( nonempty counted multiline message, clears remaining text )
( rows, sizes a box with $5D46, prints centered lines with )
( $5D75, and restores the previous Y cursor. )
( Stack: message -- )
AT 6D7B
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D4696D
DOCOL
t.DUP t.C@
t.0BRANCH CELL 0041 ( -> 6DCB )
t.0 t.X!
( ATASCII text:  [1E] )
t.(.")
BYTES 02201E
t.Y@ LIT8 58 t.@ t.Y@ t.1+ LIT8 28 t.* t.+ LIT8 0D t.Y@ t.1+
t.- LIT8 28 t.* t.ERASE t.TEXT-NEXT-ROW t.SWAP t.DUP
t.MESSAGE-BOX-WIDTH t.OVER t.C@ t.2+
t.DRAW-CENTERED-TEXT-FRAME t.PRINT-CENTERED-MESSAGE t.Y!
( label 6DCB )
t.;S
AT 6DCD

( CONSUME-ENERGY | NFA 6DCD CFA 6DD5 )
( Inferred descriptive name, not recovered original: )
( Decrements ENERGY by one, checks the four hunger )
( thresholds, selects sound command $13, and displays the )
( matching hunger warning. Called on entry to a room. )
( Stack: -- )
AT 6DCD
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C47B6D
DOCOL
t.CLEAR-TEXT-AREA t.-1 t.ENERGY t.+! t.ENERGY t.@ t.4 t.0
t.(DO)
( label 6DE9 )
t.DUP t.I t.HUNGER-THRESHOLDS t.@ t.=
t.0BRANCH CELL 000F ( -> 6E04 )
LIT8 13 t.SOUND-COMMAND! t.I t.HUNGER-MESSAGES t.2+
t.SHOW-MESSAGE
( label 6E04 )
t.(LOOP) CELL FFE3 ( -> 6DE9 )
t.DROP t.;S
AT 6E0C

( KEEP-MAP-FLOOR-ON-REDRAW | NFA 6E0C CFA 6E11 )
( Inferred descriptive name, not recovered original: )
( Normally one; $78C6 clears it before re-entering the )
( current room so $6E1F performs the full map-panel redraw )
( rather than its same-floor shortcut. )
( Stack: -- address )
AT 6E0C
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D4CD6D
DOVAR
CELL 0001
AT 6E15

( ENTER-ROOM | NFA 6E15 CFA 6E1F )
( Inferred descriptive name, not recovered original: )
( Restarts sound, loads the destination room and display )
( resources, updates floor number and visited/current-room )
( map markers, decrements energy, and resets redraw flags. )
( Stack: room -- )
AT 6E15
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C10C6E
DOCOL
t.RESTART-SOUND t.DUP t.CURRENT-ROOM t.@ t.>R
t.CLEAR-TEXT-AREA t.PAUSE-COLOR-DLI t.LOAD-ROOM-VIEW
t.RESUME-COLOR-DLI t.GAME-COLOR-TABLE LIT16 0006 t.+ t.C@
LIT16 02C7 t.C! t.ROOM-MAP-FLOOR t.CURRENT-MAP-FLOOR t.@ t.=
t.KEEP-MAP-FLOOR-ON-REDRAW t.@ t.*
t.0BRANCH CELL 0010 ( -> 6E63 )
t.R t.DRAW-VISITED-ROOM t.CURRENT-ROOM t.@
t.MARK-CURRENT-MAP-ROOM
t.BRANCH CELL 0016 ( -> 6E77 )
( label 6E63 )
t.CURRENT-ROOM t.@ t.DUP t.ROOM-MAP-FLOOR t.CURRENT-MAP-FLOOR
t.! t.DRAW-MAP-FLOOR-NUMBER t.CLEAR-MAP-PANEL t.DRAW-FLOOR-MAP
t.MARK-CURRENT-MAP-ROOM
( label 6E77 )
t.R> t.DROP t.CLEAR-TEXT-AREA t.CONSUME-ENERGY t.0
t.TEXT-CLEAR-ENABLED t.! t.1 t.KEEP-MAP-FLOOR-ON-REDRAW t.!
t.;S
AT 6E8D

( CARDINAL-STEP-VECTORS | NFA 6E8D CFA 6E93 )
( Inferred descriptive name, not recovered original: )
( Cell-indexed byte pairs are [1,0],[2,1],[1,2],[0,1]. )
( $6EA6 subtracts one from each component to obtain )
( north/east/south/west deltas. )
( Stack: direction -- address )
AT 6E8D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D9156E
DODOES
( DOES> thread at 4144 )
BYTES 44410100020101020001
AT 6E9F

( ROTATED-EXIT-STEP | NFA 6E9F CFA 6EA6 )
( Inferred descriptive name, not recovered original: Adds )
( relative direction and facing modulo four, selects )
( CARDINAL-STEP-VECTORS, then subtracts one from each )
( unsigned component. )
( Stack: relative facing -- dx dy )
AT 6E9F
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C08D6E
DOCOL
t.+ t.4 t.MOD t.CARDINAL-STEP-VECTORS t.DUP t.C@ t.1 t.-
t.SWAP t.1+ t.C@ t.1 t.- t.;S
AT 6EC4

( CURRENT-EXIT-STEP | NFA 6EC4 CFA 6ECA )
( Inferred descriptive name, not recovered original: Reads )
( the current room descriptor's low three orientation bits )
( and applies $6EA6 to obtain the requested relative exit's )
( coordinate delta. )
( Stack: relative -- dx dy )
AT 6EC4
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D99F6E
DOCOL
t.CURRENT-ROOM t.@ t.ROOM-MAP-DESCRIPTORS t.1+ t.C@ LIT8 07
t.AND t.ROTATED-EXIT-STEP t.;S
AT 6EDF

( RELATIVE-EXIT-ROOM | NFA 6EDF CFA 6EE6 )
( Inferred descriptive name, not recovered original: )
( Offsets the current room's packed map position using its )
( facing and relative exit direction, handles shared rooms )
( 14/30, and searches the current floor's room descriptors )
( for the adjacent coordinate. )
( Stack: direction -- room )
AT 6EDF
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CDC46E
DOCOL
t.CURRENT-EXIT-STEP t.CURRENT-ROOM t.@ t.ROOM-MAP-DESCRIPTORS
t.UNPACK-MAP-FIELDS t.ROT t.+ t.>R t.+ t.16 t.* t.R> t.+ t.DUP
t.FIRST-SHARED-MAP-ROOM t.ROOM-MAP-DESCRIPTORS t.C@ t.=
t.0BRANCH CELL 0008 ( -> 6F16 )
t.FIRST-SHARED-MAP-ROOM
t.BRANCH CELL 0010 ( -> 6F24 )
( label 6F16 )
t.DUP t.SECOND-SHARED-MAP-ROOM t.ROOM-MAP-DESCRIPTORS t.C@ t.=
t.SECOND-SHARED-MAP-ROOM t.*
( label 6F24 )
t.-DUP t.0=_12DE
t.0BRANCH CELL 002A ( -> 6F54 )
t.CURRENT-MAP-FLOOR t.@ t.MAP-FLOOR-END-ROOM t.C@
t.CURRENT-MAP-FLOOR t.@ t.MAP-FLOOR-FIRST-ROOM t.C@ t.(DO)
( label 6F3E )
t.I t.ROOM-MAP-DESCRIPTORS t.C@ t.OVER t.=
t.0BRANCH CELL 0006 ( -> 6F50 )
t.I t.LEAVE
( label 6F50 )
t.(LOOP) CELL FFEC ( -> 6F3E )
( label 6F54 )
t.SWAP t.DROP t.;S
AT 6F5A

( AVAILABLE-EXIT-LIST | NFA 6F5A CFA 6F5F )
( Inferred descriptive name, not recovered original: )
( Five-byte active buffer: count followed by up to four )
( relative directions. $6FA1 rebuilds it and $7033/$721C )
( use it for the movement menu. )
( Stack: -- address )
AT 6F5A
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7DF6E
DOVAR
BYTES 000005414C4C
AT 6F67

( APPEND-AVAILABLE-EXIT | NFA 6F67 CFA 6F6C )
( Inferred descriptive name, not recovered original: Stores )
( a direction at AVAILABLE-EXIT-LIST+count+1 and increments )
( its byte count. )
( Stack: direction -- )
AT 6F67
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A15A6F
DOCOL
t.AVAILABLE-EXIT-LIST t.DUP t.C@ t.1+ t.+ t.C! t.1
t.AVAILABLE-EXIT-LIST t.BYTE+! t.;S
AT 6F82

( ROOM-EXIT-OPEN? | NFA 6F82 CFA 6F8A )
( Inferred descriptive name, not recovered original: )
( Fetches the current room's byte from ROOM-EXIT-MASKS, )
( computes 1<<direction with C2^, and ANDs them. The result )
( is the actual bit value, not a normalized boolean; mask )
( $0A yields 0,2,0,8 for directions 0..3. )
( Stack: direction -- bit )
AT 6F82
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C0676F
DOCOL
t.CURRENT-ROOM t.@ t.ROOM-EXIT-MASKS t.C@ t.SWAP t.C2^ t.AND
t.;S
AT 6F9C

( COLLECT-AVAILABLE-EXITS | NFA 6F9C CFA 6FA1 )
( Inferred descriptive name, not recovered original: Clears )
( the five-byte exit list, tests directions zero through )
( three with $6F8A, and appends each direction whose bit is )
( set. )
( Stack: -- )
AT 6F9C
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7826F
DOCOL
t.AVAILABLE-EXIT-LIST LIT8 05 t.ERASE t.4 t.0 t.(DO)
( label 6FB0 )
t.I t.ROOM-EXIT-OPEN?
t.0BRANCH CELL 0006 ( -> 6FBC )
t.I t.APPEND-AVAILABLE-EXIT
( label 6FBC )
t.(LOOP) CELL FFF2 ( -> 6FB0 )
t.;S
AT 6FC2

( RELATIVE-DIRECTION-LABELS | NFA 6FC2 CFA 6FC7 )
( Inferred descriptive name, not recovered original: )
( Length-prefixed inverse-text labels read PROSTO, W PRAWO, )
( W TYL, W LEWO. $7033 displays them for available relative )
( exits. )
( Stack: direction -- record )
( Decoded text: Direction labels )
( item 0 $6FCF: PROSTO )
( item 1 $6FD7: W PRAWO )
( item 2 $6FE0: W TYL )
( item 3 $6FE7: W LEWO )
AT 6FC2
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D79C6F
DODOES
( DOES> thread at 39C1 )
BYTES C13921000600D0D2CFD3D4CF0700D73DD0D2C1D7CF0500D73DD4D9EC
BYTES 0600D73DCCC5D7CFD9
AT 6FEE

( SETUP-MENU-CURSOR | NFA 6FEE CFA 6FF4 )
( Inferred descriptive name, not recovered original: )
( Selects cursor context six, sets the vertical limit, )
( derives cursor origin from current text X/Y using )
( 4/8-pixel spacing and offsets $30/$7E, and resets its )
( grid coordinates. )
( Stack: last-row -- )
AT 6FEE
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CDC26F
DOCOL
LIT8 06 t.CURSOR-CONTEXT t.! t.CURSOR-GRID-LIMIT t.1+ t.C!
LIT8 30 t.X@ t.4 t.* t.+ t.CURSOR-ORIGIN t.C! LIT8 7E t.Y@ t.8
t.* t.+ t.CURSOR-ORIGIN t.1+ t.C! t.0 t.CURSOR-GRID-POS t.!
t.;S
AT 702B

( DRAW-EXIT-MENU | NFA 702B CFA 7033 )
( Inferred descriptive name, not recovered original: )
( Collects available exits, creates a text box and menu )
( cursor, prints the no-action choice NIC, then prints each )
( available relative direction label. )
( Stack: -- )
AT 702B
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D2EE6F
DOCOL
t.CLEAR-TEXT-AREA t.CR t.COLLECT-AVAILABLE-EXITS
t.AVAILABLE-EXIT-LIST t.C@
t.0BRANCH CELL 0009 ( -> 704A )
LIT8 0C
t.BRANCH CELL 0004 ( -> 704C )
( label 704A )
t.8
( label 704C )
t.AVAILABLE-EXIT-LIST t.C@ t.3 t.+ t.DRAW-CENTERED-TEXT-FRAME
t.AVAILABLE-EXIT-LIST t.C@ t.SETUP-MENU-CURSOR t.X@ t.2+ t.X!
t.X@
( Game text: NIC )
t.(S")
BYTES 034E4943
t.X! t.TEXT-NEXT-ROW t.AVAILABLE-EXIT-LIST t.C@
t.0BRANCH CELL 0024 ( -> 7098 )
t.AVAILABLE-EXIT-LIST t.C@ t.0 t.(DO)
( label 707E )
t.X@ t.I t.AVAILABLE-EXIT-LIST t.+ t.1+ t.C@
t.RELATIVE-DIRECTION-LABELS t.OUNT t.STYPE t.X!
t.TEXT-NEXT-ROW
t.(LOOP) CELL FFE8 ( -> 707E )
( label 7098 )
t.;S
AT 709A

( REMOVE-SCENE-OBJECT | NFA 709A CFA 70A2 )
( Inferred descriptive name, not recovered original: Finds )
( the room/view's mutable object-ID list through $520C, )
( scans for the object and replaces the first matching byte )
( with zero. )
( Stack: object room view -- )
AT 709A
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A12B70
DOCOL
t.ROOM-VIEW-OBJECTS t.OUNT t.0 t.(DO)
( label 70AC )
t.2DUP t.I t.+ t.C@ t.=
t.0BRANCH CELL 000E ( -> 70C6 )
t.0 t.OVER t.I t.+ t.C! t.LEAVE
( label 70C6 )
t.(LOOP) CELL FFE4 ( -> 70AC )
t.2DROP t.;S
AT 70CE

( REMOVE-CURRENT-OBJECT | NFA 70CE CFA 70D5 )
( Inferred descriptive name, not recovered original: )
( Supplies CURRENT-ROOM and CURRENT-VIEW to )
( REMOVE-SCENE-OBJECT. )
( Stack: object -- )
AT 70CE
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A19A70
DOCOL
t.CURRENT-ROOM t.@ t.CURRENT-VIEW t.REMOVE-SCENE-OBJECT t.;S
AT 70E1

( DUP-THIRD | NFA 70E1 CFA 70E9 )
( Inferred descriptive name, not recovered original: )
( Implements >R OVER R> SWAP; used three times by $70FC to )
( retain its object/room/view arguments while removing a )
( duplicate entry. )
( Stack: a b c -- a b c a )
AT 70E1
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D2CE70
DOCOL
t.>R t.OVER t.R> t.SWAP t.;S
AT 70F5

( ADD-SCENE-OBJECT | NFA 70F5 CFA 70FC )
( Inferred descriptive name, not recovered original: )
( Retains the arguments, removes an existing duplicate with )
( $70A2, then inserts the object into the first zero slot )
( of the same mutable room/view list. )
( Stack: object room view -- )
AT 70F5
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1E170
DOCOL
t.DUP-THIRD t.DUP-THIRD t.DUP-THIRD t.REMOVE-SCENE-OBJECT
t.ROOM-VIEW-OBJECTS t.OUNT t.0 t.(DO)
( label 710E )
t.DUP t.I t.+ t.C@ t.0=_12DE
t.0BRANCH CELL 000C ( -> 7126 )
t.2DUP t.I t.+ t.C! t.LEAVE
( label 7126 )
t.(LOOP) CELL FFE6 ( -> 710E )
t.2DROP t.;S
AT 712E

( ADD-CURRENT-OBJECT | NFA 712E CFA 7134 )
( Inferred descriptive name, not recovered original: )
( Supplies CURRENT-ROOM and CURRENT-VIEW to )
( ADD-SCENE-OBJECT. )
( Stack: object -- )
AT 712E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1F570
DOCOL
t.CURRENT-ROOM t.@ t.CURRENT-VIEW t.ADD-SCENE-OBJECT t.;S
AT 7140

( NIC | NFA 7140 CFA 7146 )
( GAM FORTH 42_A_GrafDos.ATR CFA $A4BE, identical body )
( after known address relocation; surviving name length and )
( suffix match )
AT 7140
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C32E71
DOCOL
t.;S
AT 714A

( INPUT-STATE | NFA 714A CFA 7150 )
( Inferred descriptive name, not recovered original: )
( Written by input polling; zero selects ordinary handling )
( and value eight makes the main loop reinitialize. )
AT 714A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C14071
DOVAR
CELL 0000
AT 7154

( ALLOW-GAME-MENU-KEY | NFA 7154 CFA 715A )
( Inferred descriptive name, not recovered original: )
( Normally one. WAIT-GAME-INPUT permits CH=$21 to enter the )
( game menu only when this flag is nonzero and both view )
( depth and cursor context are zero; special-room movement )
( clears it. )
( Stack: -- address )
AT 7154
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C44A71
DOVAR
CELL 0001
AT 715E

( WAIT-GAME-INPUT | NFA 715E CFA 7169 )
( Inferred descriptive name, not recovered original: Clears )
( CH [$02FC], polls joystick and trigger, updates pointer, )
( tests key code $21 and returns on input-state or trigger. )
AT 715E
( Saved dictionary header: flags, name bytes, link )
BYTES 8800000000000000C15471
DOCOL
LIT8 FF LIT16 02FC t.C! t.ENERGY t.@ t.1 t.< t.INPUT-STATE t.!
( label 7180 )
t.NIC t.0 LIT8 4D t.C! t.0 t.JOYSTICK@ t.STICK>DELTAS
t.STEP-CURSOR-Y t.STEP-CURSOR-X LIT16 02FC t.C@ LIT8 21 t.=
t.0BRANCH CELL 0018 ( -> 71B8 )
t.CURRENT-VIEW t.0=_12DE t.CURSOR-CONTEXT t.@ t.0=_12DE t.*
t.ALLOW-GAME-MENU-KEY t.@ t.* t.INPUT-STATE t.!
( label 71B8 )
t.0 t.TRIGGER@ t.0=_12DE t.INPUT-STATE t.@ t.+
t.0BRANCH CELL FFBA ( -> 7180 )
t.CURSOR-CONTEXT t.@ t.0=_12DE
t.0BRANCH CELL 000C ( -> 71DC )
t.CURSOR-GRID-POS t.FETCH-BYTE-PAIR t.VIEW-STACK-DEPTH
t.VIEW-CURSOR-POSITIONS t.STORE-BYTE-PAIR
( label 71DC )
t.INPUT-STATE t.@ t.0=_12DE
t.0BRANCH CELL 0006 ( -> 71EA )
t.CURSOR-GRID-POS t.FETCH-BYTE-PAIR
( label 71EA )
t.OFF-PM t.;S
AT 71EE

( WAIT-TRIGGER-RELEASE | NFA 71EE CFA 71F3 )
( Inferred descriptive name, not recovered original: Calls )
( pointer setup then polls controller-zero trigger with )
( five-tick pauses until released. )
AT 71EE
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C75E71
DOCOL
t.INIT-CURSOR-PLAYERS
( label 71F7 )
t.0 t.TRIGGER@ LIT16 0005 t.PAUSE
t.0BRANCH CELL FFF4 ( -> 71F7 )
t.;S
AT 7207

( MOVE-AND-DROP-RESULT | NFA 7207 CFA 720C )
( Inferred descriptive name, not recovered original: Calls )
( the movement handler at $7F76 and discards its returned )
( action result; used after selecting a nonzero )
( movement-menu row. )
( Stack: direction -- )
AT 7207
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CBEE71
DOCOL
t.ENTER-RELATIVE-EXIT t.DROP t.;S
AT 7214

( CHOOSE-EXIT | NFA 7214 CFA 721C )
( Inferred descriptive name, not recovered original: Draws )
( the exit menu and reads its selected row. Zero redraws )
( the current view; other rows index AVAILABLE-EXIT-LIST )
( and invoke the movement wrapper at $720C. )
( Stack: -- )
AT 7214
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D20772
DOCOL
t.DRAW-EXIT-MENU t.WAIT-TRIGGER-RELEASE t.WAIT-GAME-INPUT
t.SWAP t.DROP t.-DUP
t.0BRANCH CELL 000E ( -> 723A )
t.AVAILABLE-EXIT-LIST t.+ t.C@ t.MOVE-AND-DROP-RESULT
t.BRANCH CELL 0004 ( -> 723C )
( label 723A )
t.REDRAW-CURRENT-VIEW
( label 723C )
t.;S
AT 723E

( SELECTED-OBJECT | NFA 723E CFA 7243 )
( Inferred descriptive name, not recovered original: Stores )
( the hit-map object byte in HANDLE-GAME-INPUT; )
( object/action menu construction and inventory )
( normalization subsequently use this value. )
( Stack: -- address )
AT 723E
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C51472
DOVAR
CELL 0000
AT 7247

( AVAILABLE-ACTION-LIST | NFA 7247 CFA 724D )
( Inferred descriptive name, not recovered original: Stores )
( a byte count followed by action IDs beginning at offset )
( two. $729D builds it, $7548 displays it and $76B7 )
( dispatches the selected ID. )
( Stack: -- address )
AT 7247
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C53E72
DOVAR
BYTES 000005414C4C4F54202020202020
AT 725D

( APPEND-ACTION-ID | NFA 725D CFA 7263 )
( Inferred descriptive name, not recovered original: Writes )
( the action byte at AVAILABLE-ACTION-LIST+count+2, then )
( increments its count. )
( Stack: action -- )
AT 725D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A14772
DOCOL
t.AVAILABLE-ACTION-LIST t.DUP t.C@ t.+ t.2+ t.C! t.1
t.AVAILABLE-ACTION-LIST t.BYTE+! t.;S
AT 7279

( SELECTED-OBJECT-RECORD | NFA 7279 CFA 7281 )
( Inferred descriptive name, not recovered original: Looks )
( up resource 1's nested object record selected by )
( SELECTED-OBJECT, returning its payload after the outer )
( length cell. )
( Stack: -- record )
AT 7279
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C25D72
DOCOL
t.1 t.RESOURCE-ADDR t.2+ t.SELECTED-OBJECT t.@ t.SWAP
t.LENGTH-RECORD-ADDR t.2+ t.;S
AT 7295

( COLLECT-OBJECT-ACTIONS | NFA 7295 CFA 729D )
( Inferred descriptive name, not recovered original: Clears )
( the action list, adds action zero, walks the selected )
( object's length-prefixed action records and appends each )
( action ID; a nested view also adds action one for return. )
( Stack: -- )
AT 7295
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C57972
DOCOL
t.0 t.AVAILABLE-ACTION-LIST t.! t.0 t.APPEND-ACTION-ID
t.SELECTED-OBJECT t.@
t.0BRANCH CELL 001C ( -> 72CB )
t.SELECTED-OBJECT-RECORD
( label 72B3 )
t.DUP t.2+ t.C@ t.APPEND-ACTION-ID t.OUNT t.+ t.DUP t.@
t.0=_12DE
t.0BRANCH CELL FFEC ( -> 72B3 )
t.DROP
( label 72CB )
t.CURRENT-VIEW t.0=_12DE t.0=_12DE
t.0BRANCH CELL 0006 ( -> 72D9 )
t.1 t.APPEND-ACTION-ID
( label 72D9 )
t.;S
AT 72DB

( ACTION-LABELS | NFA 72DB CFA 72E2 )
( Inferred descriptive name, not recovered original: Packed )
( action-name vector includes NIC, WROC, WEZ and other menu )
( verbs. One-byte records are aliases to another action )
( label, resolved by $74FA. )
( Stack: action -- record )
( Decoded text: Action labels )
( item 0 $72EA: NIC )
( item 1 $72EF: WROC )
( item 2 $72F5: ZBLIZENIE )
( item 3 $7300: POWIEKSZENIE )
( item 4 $730E: PODNIES )
( item 5 $7317: ZAJRZYJ )
( item 6 $7320: IDZ )
( item 7 $7325: ZBADAJ )
( item 8 $732D: ZJEDZ )
( item 9 $7334: WYPIJ )
( item 10 $733B: ROZBIJ )
( item 11 $7343: OTWORZ )
( item 12 $734B: ZAMKNIJ )
( item 13 $7354 -> item 6: IDZ )
( item 14 $7357: WEZ )
( item 15 $735C: ZAPAL )
( item 16 $7363: ZOSTAW RZECZ )
( item 17 $7371 -> item 11: OTWORZ )
( item 18 $7374 -> item 11: OTWORZ )
( item 19 $7377: ODEGNIJ )
( item 20 $7380 -> item 11: OTWORZ )
( item 21 $7383 -> item 12: ZAMKNIJ )
( item 22 $7386: WYLACZ )
( item 23 $738E: WLACZ )
( item 24 $7395 -> item 23: WLACZ )
( item 25 $7398 -> item 22: WYLACZ )
( item 26 $739B -> item 11: OTWORZ )
( item 27 $739E -> item 12: ZAMKNIJ )
( item 28 $73A1: PRZESUN )
( item 29 $73AA -> item 28: PRZESUN )
( item 30 $73AD: WCISNIJ )
( item 31 $73B6: WYCISNIJ )
( item 32 $73C0 -> item 30: WCISNIJ )
( item 33 $73C3: RZUC )
( item 34 $73C9 -> item 7: ZBADAJ )
( item 35 $73CC: NACISNIJ )
( item 36 $73D6: KRZYKNIJ )
( item 37 $73E0: POKAZ )
( item 38 $73E7 -> item 35: NACISNIJ )
( item 39 $73EA -> item 35: NACISNIJ )
( item 40 $73ED -> item 2: ZBLIZENIE )
( item 41 $73F0 -> item 2: ZBLIZENIE )
( item 42 $73F3 -> item 14: WEZ )
( item 43 $73F6: ODSLON )
( item 44 $73FE: ZASLON )
( item 45 $7406: PODPLYN )
( item 46 $740F -> item 14: WEZ )
( item 47 $7412: UBIERZ )
( item 48 $741A: WYRZUC )
( item 49 $7422 -> item 11: OTWORZ )
( item 50 $7425 -> item 12: ZAMKNIJ )
( item 51 $7428 -> item 35: NACISNIJ )
( item 52 $742B -> item 37: POKAZ )
( item 53 $742E -> item 36: KRZYKNIJ )
( item 54 $7431 -> item 47: UBIERZ )
( item 55 $7434: CALUJ )
( item 56 $743B -> item 35: NACISNIJ )
( item 57 $743E: PRZETNIJ )
( item 58 $7448 -> item 35: NACISNIJ )
( item 59 $744B: PRZEKREC )
( item 60 $7455 -> item 59: PRZEKREC )
( item 61 $7458 -> item 11: OTWORZ )
( item 62 $745B: ZDEJMIJ )
( item 63 $7464: POWIES )
( item 64 $746C: WKREC )
( item 65 $7473 -> item 7: ZBADAJ )
( item 66 $7476: WYKREC )
( item 67 $747E -> item 35: NACISNIJ )
( item 68 $7481 -> item 35: NACISNIJ )
( item 69 $7484 -> item 35: NACISNIJ )
( item 70 $7487: PODWATUJ )
( item 71 $7491 -> item 23: WLACZ )
( item 72 $7494 -> item 22: WYLACZ )
( item 73 $7497: ZASUN )
( item 74 $749E: WPROWADZ CHROMOSOMY )
( item 75 $74B3: WLOZ )
AT 72DB
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C29572
DODOES
( DOES> thread at 39C1 )
BYTES C139F40103004E4943040057526F630900DAC2CCC9FAC5CEC9C50C00
BYTES D0CFD7C9E5CBD3DAC5CEC9C50700D0CFC4CEC9C5F30700DAC1CAD2DA
BYTES D9CA0300C9C4FA0600DAC2C1C4C1CA0500DACAC5C4DA0500D7D9D0C9
BYTES CA0600D2CFDAC2C9CA0600CFD4D7EFD2DA0700DAC1CDCBCEC9CA0100
BYTES 060300D7C5FA0500DAC1D0C1CC0C00DACFD3D4C1D73DD2DAC5C3DA01
BYTES 000B01000B0700CFC4C5C7CEC9CA01000B01000C0600D7D9ECE1C3DA
BYTES 0500D7ECE1C3DA01001701001601000B01000C0700D0D2DAC5D3D5EE
BYTES 01001C0700D7C3C9F3CEC9CA0800D7D9C3C9F3CEC9CA01001E0400D2
BYTES DAD5E30100070800CEC1C3C9F3CEC9CA0800CBD2DAD9CBCEC9CA0500
BYTES D0CFCBC1FA01002301002301000201000201000E0600CFC4D3ECCFEE
BYTES 0600DAC1D3ECCFEE0700D0CFC4D0ECD9EE01000E0600D5C2C9C5D2DA
BYTES 0600D7D9D2DAD5E301000B01000C01002301002501002401002F0500
BYTES C3C1ECD5CA0100230800D0D2DAC5D4CEC9CA0100230800D0D2DAC5CB
BYTES D2E5E301003B01000B0700DAC4C5CACDC9CA0600D0CFD7C9C5F30500
BYTES D7CBD2E5E30100070600D7D9CBD2E5E30100230100230100230800D0
BYTES CFC4D7C1D4D5CA0100170100160500DAC1D3D5EE1300D7D0D2CFD7C1
BYTES C4DABDC3C8D2CFCDCFD3CFCDD90400D7ECEFFA000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000184
AT 74DC

( DISK-CHECK-SECTOR-BASE | NFA 74DC CFA 74E2 )
( Inferred descriptive name, not recovered original: )
( Constant $01F5 [501] is added to both disk-check sector )
( offsets. GAME-LOOP also subtracts it from $260B to obtain )
( the -DISK CFA $2416. )
( Stack: -- sector )
AT 74DC
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D3DB72
DOCON
CELL 01F5
AT 74E6

( DISK-CHECK-SECTOR-OFFSETS | NFA 74E6 CFA 74ED )
( Inferred descriptive name, not recovered original: Cells )
( $0196 and $0197 combine with base $01F5 to address )
( physical sectors 907 and 908 in the disk-check word at )
( $7C70. )
( Stack: -- address )
AT 74E6
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CBDC74
DOVAR
BYTES 96019701
AT 74F3

( RESOLVE-ACTION-LABEL | NFA 74F3 CFA 74FA )
( Inferred descriptive name, not recovered original: Looks )
( up ACTION-LABELS; a record shorter than two bytes )
( supplies a one-byte alias index, which is resolved once )
( through the same vector. )
( Stack: action -- record )
AT 74F3
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C2E674
DOCOL
t.ACTION-LABELS t.DUP t.@ t.2 t.<
t.0BRANCH CELL 0008 ( -> 7510 )
t.2+ t.C@ t.ACTION-LABELS
( label 7510 )
t.;S
AT 7512

( ACTION-MENU-WIDTH | NFA 7512 CFA 7518 )
( Inferred descriptive name, not recovered original: Scans )
( the available action IDs, obtains each resolved label's )
( length cell, chooses the maximum and adds five columns of )
( padding. )
( Stack: -- width )
AT 7512
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C5F374
DOCOL
t.0 t.AVAILABLE-ACTION-LIST t.C@ t.0 t.(DO)
( label 7524 )
t.AVAILABLE-ACTION-LIST t.2+ t.I t.+ t.C@
t.RESOLVE-ACTION-LABEL t.@ t.MAX
t.(LOOP) CELL FFEE ( -> 7524 )
LIT16 0005 t.+ t.;S
AT 7540

( DRAW-ACTION-MENU | NFA 7540 CFA 7548 )
( Inferred descriptive name, not recovered original: Builds )
( available object actions, sizes their box, sets a )
( vertical menu cursor and prints each resolved action )
( label on its own text row. )
( Stack: -- )
AT 7540
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C21275
DOCOL
t.CLEAR-TEXT-AREA t.CR t.COLLECT-OBJECT-ACTIONS
t.ACTION-MENU-WIDTH t.AVAILABLE-ACTION-LIST t.C@ t.2+
t.DRAW-CENTERED-TEXT-FRAME t.AVAILABLE-ACTION-LIST t.C@ t.1
t.- t.SETUP-MENU-CURSOR t.X@ t.2+ t.X! t.AVAILABLE-ACTION-LIST
t.C@ t.0 t.(DO)
( label 7572 )
t.X@ t.AVAILABLE-ACTION-LIST t.2+ t.I t.+ t.C@
t.RESOLVE-ACTION-LABEL t.OUNT t.STYPE t.X! t.TEXT-NEXT-ROW
t.(LOOP) CELL FFE8 ( -> 7572 )
t.;S
AT 758E

( SELECTED-ACTION-RECORD | NFA 758E CFA 7594 )
( Inferred descriptive name, not recovered original: $759F )
( stores the chosen nested action-record pointer here; )
( later action parameter readers at $7B54/$7B66 index data )
( relative to this pointer. )
( Stack: -- address )
AT 758E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D74075
DOVAR
CELL 0000
AT 7598

( SELECT-ACTION-RECORD | NFA 7598 CFA 759F )
( Inferred descriptive name, not recovered original: )
( Subtracts one from a nonzero menu row, then selects that )
( action record through $4763 and saves its pointer at )
( $7594. Row zero selects the first record. )
( Stack: row -- )
AT 7598
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A18E75
DOCOL
t.DUP
t.0BRANCH CELL 0006 ( -> 75AB )
t.1 t.-
( label 75AB )
t.SELECTED-OBJECT-RECORD t.LENGTH-RECORD-ADDR
t.SELECTED-ACTION-RECORD t.! t.;S
AT 75B5

( ACTION-HANDLER-PFAS | NFA 75B5 CFA 75BA )
( Inferred descriptive name, not recovered original: )
( Cell-indexed table stores action-handler PFAs. $7664 )
( fetches one, substitutes entry zero when the value is )
( zero, converts PFA to CFA, and EXECUTEs it. )
( Stack: action -- address )
AT 75B5
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C29875
DODOES
( DOES> thread at 4144 )
BYTES 44415B7D6A7D7D7D2020907D2020C37DD27D3C7E6D7E937E477F597F
BYTES A37FCF7F558032819A817D7D7D7DB981D081E7810C824F829582B282
BYTES EC820B832283558472849184D48467853D863087E287F08714886388
BYTES 87889B880B832283C688F188CF7F11892A89B9813C898089E7899B88
BYTES 9B883A8A628A708A858A978AA98AB981D081DF8A278B4E8B7A8B9E8B
BYTES A68CFC8B628C7F8C14884C8DE88CC2AA754114AF75E4
AT 765E

( EXECUTE-ACTION-ID | NFA 765E CFA 7664 )
( Inferred descriptive name, not recovered original: )
( Fetches an action handler PFA, falls back to entry zero )
( for a null pointer, converts to CFA and executes it; )
( handlers return the menu-loop result. )
( Stack: action -- result )
AT 765E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C2B575
DOCOL
t.ACTION-HANDLER-PFAS t.@ t.-DUP t.0=_12DE
t.0BRANCH CELL 0008 ( -> 7678 )
t.0 t.ACTION-HANDLER-PFAS t.@
( label 7678 )
t.CFA t.EXECUTE t.;S
AT 767E

( NORMALIZE-INVENTORY-OBJECT | NFA 767E CFA 7684 )
( Inferred descriptive name, not recovered original: For )
( SELECTED-OBJECT greater than 99, selects its cached )
( inventory collection via $5674 and replaces the global ID )
( with local-index+2. )
( Stack: -- )
AT 767E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DA5E76
DOCOL
t.SELECTED-OBJECT t.@ LIT8 63 t.>
t.0BRANCH CELL 000E ( -> 769F )
t.SELECTED-OBJECT t.@ t.SELECT-INVENTORY-OBJECT t.2+
t.SELECTED-OBJECT t.!
( label 769F )
t.;S
AT 76A1

( DISK-CHECK-IO | NFA 76A1 CFA 76A7 )
( Inferred descriptive name, not recovered original: )
( Initially contains 0= 0= ;S. GAME-LOOP replaces its first )
( token at $76A9 with -DISK [$2416], producing -DISK 0= ;S )
( for the two-sector disk check. Its stack effect changes )
( after that patch. )
AT 76A1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C97E76
DOCOL
t.0=_12DE t.0=_12DE t.;S
AT 76AF

( RUN-OBJECT-ACTION-MENU | NFA 76AF CFA 76B7 )
( Inferred descriptive name, not recovered original: )
( Normalizes inventory IDs, repeatedly draws the action )
( menu, waits for selection, saves its action-record )
( pointer and executes the action ID until its result is )
( nonzero; restores scene resources. )
( Stack: -- )
AT 76AF
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D2A176
DOCOL
t.NORMALIZE-INVENTORY-OBJECT t.DRAW-ACTION-MENU
( label 76BD )
t.WAIT-TRIGGER-RELEASE t.WAIT-GAME-INPUT t.SWAP t.DROP t.DUP
t.SELECT-ACTION-RECORD t.AVAILABLE-ACTION-LIST t.+ t.2+ t.C@
t.EXECUTE-ACTION-ID
t.0BRANCH CELL FFE8 ( -> 76BD )
t.USE-SCENE-RESOURCES t.;S
AT 76DB

( INVENTORY-PICTURE-BUFFER | NFA 76DB CFA 76E1 )
( Inferred descriptive name, not recovered original: )
( Scratch picture buffer used by $7840 to generate blank )
( 3-byte-wide slot images and by $786C to expand inventory )
( artwork before ?POBJ draws it. )
( Stack: -- address )
AT 76DB
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C6AF76
DOVAR
BYTES 000005414C4C4F542020202020202020202020202020202020202020
BYTES 2020202020202020616365676F204E522E454B52206920202020204B
BYTES 85525A4543DAC2764114DD140F2085525A4543DAD0764114DD
AT 7734

( INVENTORY-SLOT-ADDR | NFA 7734 CFA 773C )
( Inferred descriptive name, not recovered original: )
( Returns INVENTORY-SLOT-RECORDS [$456E] plus three times )
( the slot index; each record contains an item ID and x/y )
( placement bytes. )
( Stack: slot -- address )
AT 7734
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000DADB76
DOCOL
t.3 t.* t.INVENTORY-SLOT-RECORDS t.+ t.;S
AT 7748

( ROOM-VISIT-COUNT-LIMIT | NFA 7748 CFA 774F )
( Inferred descriptive name, not recovered original: )
( Constant 40 bounds $777A's count of visited )
( room-descriptor bits and supplies its percentage )
( denominator after subtracting four. )
( Stack: -- count )
AT 7748
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CD3477
DOCON
CELL 0028
AT 7753

( MISSION-PERCENT | NFA 7753 CFA 7759 )
( Inferred descriptive name, not recovered original: $777A )
( stores the percentage derived from visited room bits )
( here; DRAW-GAME-MENU prints it alongside PROCENT MISJI. )
( Stack: -- address )
AT 7753
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D34877
DOVAR
CELL 0000
AT 775D

( ROOM-VISITED? | NFA 775D CFA 7763 )
( Inferred descriptive name, not recovered original: Reads )
( the room descriptor's second byte, tests bit $08 and )
( normalizes the result with two 0= calls. )
( Stack: room -- flag )
AT 775D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C05377
DOCOL
t.ROOM-MAP-DESCRIPTORS t.1+ t.C@ t.8 t.AND t.0=_12DE t.0=_12DE
t.;S
AT 7775

( UPDATE-MISSION-PERCENT | NFA 7775 CFA 777A )
( Inferred descriptive name, not recovered original: Counts )
( visited flags for room IDs 0..39, multiplies by 100, )
( divides by 40-4, and stores the value printed as mission )
( completion percentage. )
( Stack: -- )
AT 7775
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A55D77
DOCOL
t.0 t.ROOM-VISIT-COUNT-LIMIT t.0 t.(DO)
( label 7784 )
t.I t.ROOM-VISITED? t.+
t.(LOOP) CELL FFF8 ( -> 7784 )
LIT8 64 t.* t.ROOM-VISIT-COUNT-LIMIT t.4 t.- t./
t.MISSION-PERCENT t.! t.;S
AT 77A1

( DRAW-GAME-MENU | NFA 77A1 CFA 77A8 )
( Inferred descriptive name, not recovered original: Prints )
( POCZaTEK, ZAPIS, ODCZYT, GRA and mission percentage. )
AT 77A1
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D77577
DOCOL
t.CLEAR-TEXT-AREA t.CR LIT8 0D LIT16 0006
t.DRAW-CENTERED-TEXT-FRAME t.3 t.SETUP-MENU-CURSOR t.X@ t.2+
t.X! t.X@
( Game text: POCZATEK )
t.(S")
BYTES 08504F435A6154454B
t.X! t.TEXT-NEXT-ROW t.X@
( Game text: ZAPIS )
t.(S")
BYTES 055A41504953
t.X! t.TEXT-NEXT-ROW t.X@
( Game text: ODCZYT )
t.(S")
BYTES 064F44435A5954
t.X! t.TEXT-NEXT-ROW t.FORTH
( Game text: GRA )
t.(S")
BYTES 03475241
t.CR t.CR t.UPDATE-MISSION-PERCENT t.GAME-UI-MODE t.@
t.0=_12DE
t.0BRANCH CELL 0032 ( -> 7837 )
LIT8 1E t.3 t.DRAW-CENTERED-TEXT-FRAME t.X@ t.1+ t.X!
( Game text: WYKONALES  )
t.(S")
BYTES 0A57594B4F4E416C45733D
t.MISSION-PERCENT t.?
( Game text: [1E] PROCENT MISJI )
t.(.")
BYTES 0F1E3D50524F43454E543D4D49534A49
( label 7837 )
t.CR t.;S
AT 783B

( CLEAR-INVENTORY-SLOT | NFA 783B CFA 7840 )
( Inferred descriptive name, not recovered original: Fills )
( scratch picture bytes with $55, copies the slot x/y )
( coordinates, writes width 3 and height 24, then draws )
( that blank inventory rectangle via ?POBJ. )
( Stack: slot-record -- )
AT 783B
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CDA177
DOCOL
t.INVENTORY-PICTURE-BUFFER LIT16 004C LIT16 0055 t.FILL t.1+
t.FETCH-BYTE-PAIR t.INVENTORY-PICTURE-BUFFER t.STORE-BYTE-PAIR
t.3 LIT8 18 t.INVENTORY-PICTURE-BUFFER t.2+ t.STORE-BYTE-PAIR
t.INVENTORY-PICTURE-BUFFER t.?POBJ t.;S
AT 7867

( DRAW-INVENTORY-ITEM | NFA 7867 CFA 786C )
( Inferred descriptive name, not recovered original: )
( Switches to inventory resource lookup, resolves the )
( item's image resource, expands it into )
( INVENTORY-PICTURE-BUFFER and draws it, then restores )
( scene lookup. )
( Stack: item -- )
AT 7867
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D23B78
DOCOL
t.USE-INVENTORY-RESOURCES t.OBJECT-PICTURE-RESOURCE
t.RESOURCE-ADDR t.INVENTORY-PICTURE-BUFFER t.<MOVE
t.INVENTORY-PICTURE-BUFFER t.?POBJ t.USE-SCENE-RESOURCES t.;S
AT 7880

( DRAW-INVENTORY | NFA 7880 CFA 7887 )
( Inferred descriptive name, not recovered original: Clears )
( text, selects RCM=2 and iterates four slot records, )
( clearing each slot and drawing its nonzero item ID, then )
( restores RCM=0. )
( Stack: -- )
AT 7880
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C56778
DOCOL
t.CLEAR-TEXT-AREA t.2 t.RCM t.C! t.4 t.0 t.(DO)
( label 7897 )
t.I t.INVENTORY-SLOT-ADDR t.DUP t.CLEAR-INVENTORY-SLOT t.C@
t.-DUP
t.0BRANCH CELL 0004 ( -> 78A9 )
t.DRAW-INVENTORY-ITEM
( label 78A9 )
t.(LOOP) CELL FFEC ( -> 7897 )
t.0 t.RCM t.C! t.;S
AT 78B5

( w78BA | NFA 78B5 CFA 78BA )
( Unknown erased name; CFA identifier )
AT 78B5
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C98078
DOVAR
CELL 0000
AT 78BE

( RELOAD-CURRENT-ROOM | NFA 78BE CFA 78C6 )
( Inferred descriptive name, not recovered original: )
( Disables the same-floor redraw shortcut, sets UI mode )
( zero, and re-enters CURRENT-ROOM through $6E1F. )
( Stack: -- )
AT 78BE
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D9B578
DOCOL
t.0 t.KEEP-MAP-FLOOR-ON-REDRAW t.! t.0 t.GAME-UI-MODE t.!
t.CURRENT-ROOM t.@ t.ENTER-ROOM t.;S
AT 78DC

( RESTORE-INITIAL-STATE | NFA 78DC CFA 78E1 )
( Inferred descriptive name, not recovered original: Clears )
( text, brackets disk operations with display suppression, )
( requires disk side one, loads the initial inventory and )
( state groups, and restores the display. )
( Stack: -- )
AT 78DC
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CCBE78
DOCOL
t.CLEAR-TEXT-AREA t.PAUSE-COLOR-DLI t.1 t.REQUIRED-DISK-SIDE
t.! t.LOAD-INITIAL-INVENTORY t.CLEAR-RESOURCE-BUFFER
t.LOAD-INITIAL-STATE t.RESUME-COLOR-DLI t.;S
AT 78F7

( CANCEL-GAME-MENU | NFA 78F7 CFA 78FD )
( Inferred descriptive name, not recovered original: When )
( UI mode is one, restores initial state and reloads the )
( current room; otherwise only resets the cursor context to )
( the scene. It is entry three in the menu dispatch vector. )
( Stack: -- )
AT 78F7
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CEDC78
DOCOL
t.GAME-UI-MODE t.@ t.1 t.=
t.0BRANCH CELL 000A ( -> 7913 )
t.RESTORE-INITIAL-STATE t.RELOAD-CURRENT-ROOM
t.BRANCH CELL 0008 ( -> 7919 )
( label 7913 )
t.0 t.CURSOR-CONTEXT t.!
( label 7919 )
t.;S
AT 791B

( START-NEW-GAME | NFA 791B CFA 7923 )
( Inferred descriptive name, not recovered original: )
( Restores initial state, reloads CURRENT-ROOM and redraws )
( all four inventory slots; entry zero in the game-menu )
( dispatch vector. )
( Stack: -- )
AT 791B
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D9F778
DOCOL
t.RESTORE-INITIAL-STATE t.RELOAD-CURRENT-ROOM t.DRAW-INVENTORY
t.;S
AT 792D

( HANDLE-GAME-INPUT | NFA 792D CFA 7934 )
( Inferred descriptive name, not recovered original: Waits )
( for trigger release, clears text, invokes input polling, )
( dispatches object actions and repeats until INPUT-STATE )
( is set. )
AT 792D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D91B79
DOCOL
( label 7936 )
t.WAIT-TRIGGER-RELEASE t.CLEAR-TEXT-AREA t.WAIT-GAME-INPUT
t.INPUT-STATE t.@ t.0=_12DE
t.0BRANCH CELL 001A ( -> 795E )
t.HIT-MAP-CELL@ t.DUP t.SELECTED-OBJECT t.! t.1 t.=
t.0BRANCH CELL 0008 ( -> 795C )
t.CHOOSE-EXIT
t.BRANCH CELL 0004 ( -> 795E )
( label 795C )
t.RUN-OBJECT-ACTION-MENU
( label 795E )
t.INPUT-STATE t.@
t.0BRANCH CELL FFD2 ( -> 7936 )
t.ENERGY t.@ t.1 t.<
t.0BRANCH CELL 001A ( -> 798A )
LIT8 32 t.PAUSE LIT8 19 t.SOUND-COMMAND! LIT16 023A t.PAUSE
t.START-NEW-GAME t.1 t.GAME-UI-MODE t.!
( label 798A )
t.;S
AT 798C

( LOAD-SAVED-GAME | NFA 798C CFA 7993 )
( Inferred descriptive name, not recovered original: Loads )
( saved inventory cache and state group 20 with display )
( suppressed, then reloads the current room and draws )
( inventory; entry two in the menu dispatch vector. )
( Stack: -- )
AT 798C
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D92D79
DOCOL
t.CLEAR-TEXT-AREA t.PAUSE-COLOR-DLI t.LOAD-SAVED-INVENTORY
t.CLEAR-RESOURCE-BUFFER t.LOAD-SAVED-STATE t.RESUME-COLOR-DLI
t.RELOAD-CURRENT-ROOM t.DRAW-INVENTORY t.;S
AT 79A7

( SAVE-CURRENT-GAME | NFA 79A7 CFA 79AE )
( Inferred descriptive name, not recovered original: If UI )
( mode is one first restores initial state, then stores the )
( current inventory block/cache, writes state group 20, )
( restores display and reloads CURRENT-ROOM; entry one in )
( the menu dispatch vector. )
( Stack: -- )
AT 79A7
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D98C79
DOCOL
t.GAME-UI-MODE t.@ t.1 t.=
t.0BRANCH CELL 0004 ( -> 79BE )
t.RESTORE-INITIAL-STATE
( label 79BE )
t.CLEAR-TEXT-AREA t.PAUSE-COLOR-DLI t.STORE-INVENTORY-BLOCK
t.SAVE-INVENTORY-CACHE t.CLEAR-RESOURCE-BUFFER
t.SAVE-GAME-STATE t.RESUME-COLOR-DLI t.RELOAD-CURRENT-ROOM
t.;S
AT 79D0

( GAME-MENU-DISPATCH | NFA 79D0 CFA 79D6 )
( Inferred descriptive name, not recovered original: )
( Four-entry threaded switch created by CASE: dispatches )
( menu rows to new game, save, load, or cancel handlers at )
( $7923/$79AE/$7993/$78FD. )
( Stack: choice -- )
AT 79D0
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D7A779
DODOES
( DOES> thread at 30B4 )
BYTES B4302379AE799379FD787712
AT 79E4

( PRINT-DISK-ERROR | NFA 79E4 CFA 79E9 )
( Inferred descriptive name, not recovered original: Prints )
( BlAD DYSKOWY [disk error] and an optional marker. )
AT 79E4
( Saved dictionary header: flags, name bytes, link )
BYTES 8200BFD079
DOCOL
LIT8 0E t.2 t.POS
( Game text: BLAD DYSKOWY )
t.(S")
BYTES 0C426C4144204459534B4F5759
t.GAME-UI-MODE t.@ t.3 t.=
t.0BRANCH CELL 000C ( -> 7A17 )
t.16 t.3 t.POS
( Game text: [3A] )
t.(S")
BYTES 013A
( label 7A17 )
t.;S
AT 7A19

( PRINT-PRESS-KEY | NFA 7A19 CFA 7A1E )
( Inferred descriptive name, not recovered original: Prints )
( NACISNIJ KLAWISZ [press a key] and an optional marker. )
AT 7A19
( Saved dictionary header: flags, name bytes, link )
BYTES 8200BFE479
DOCOL
t.GAME-UI-MODE t.@ t.3 t.=
t.0BRANCH CELL 000D ( -> 7A37 )
LIT8 10 t.4 t.POS
( Game text: [3B] )
t.(S")
BYTES 013B
( label 7A37 )
LIT8 0C LIT16 0005 t.POS
( Game text: NACISNIJ KLAWISZ )
t.(S")
BYTES 104E414349534E494A204B4C415749535A
t.;S
AT 7A55

( PRINT-FLIP-DISK | NFA 7A55 CFA 7A5A )
( Inferred descriptive name, not recovered original: Prints )
( ODWROC DYSK [turn the disk over]. )
AT 7A55
( Saved dictionary header: flags, name bytes, link )
BYTES 8200BF197A
DOCOL
t.GAME-UI-MODE t.@ t.3 t.=
t.0BRANCH CELL 000E ( -> 7A74 )
LIT8 12 t.1 t.POS
( Game text: [3B][3B] )
t.(S")
BYTES 023B3B
( label 7A74 )
LIT8 0E t.2 t.POS
( ATASCII text: ODWROC DYSK )
t.(.")
BYTES 0B4F4457524F43204459534B
t.;S
AT 7A8B

( WAIT-FOR-GAME-DISK | NFA 7A8B CFA 7A92 )
( Inferred descriptive name, not recovered original: )
( Repeatedly checks disk marker, prints disk-error or )
( flip-disk prompts and waits for a key until valid. )
AT 7A8B
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D4557A
DOCOL
( label 7A94 )
LIT8 58 t.@ LIT16 0190 t.ERASE t.READ-DISK-SIDE
t.0BRANCH CELL 0010 ( -> 7AB3 )
t.PRINT-DISK-ERROR t.PRINT-PRESS-KEY t.0 t.KEY t.DROP
t.BRANCH CELL 0016 ( -> 7AC7 )
( label 7AB3 )
t.1 t.= t.DUP t.0=_12DE
t.0BRANCH CELL 000A ( -> 7AC7 )
t.PRINT-FLIP-DISK t.PRINT-PRESS-KEY t.KEY t.DROP
( label 7AC7 )
t.0BRANCH CELL FFCB ( -> 7A94 )
t.;S
AT 7ACD

( HANDLE-GAME-MENU | NFA 7ACD CFA 7AD4 )
( Inferred descriptive name, not recovered original: Draws )
( the game menu, waits for trigger release, polls input and )
( dispatches a selection. )
AT 7ACD
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D78B7A
DOCOL
t.DRAW-GAME-MENU t.WAIT-TRIGGER-RELEASE t.WAIT-GAME-INPUT
t.SWAP t.DROP t.1 t.REQUIRED-DISK-SIDE t.!
t.GAME-MENU-DISPATCH t.;S
AT 7AEA

( GAME-LOOP | NFA 7AEA CFA 7AF0 )
( Inferred descriptive name, not recovered original: )
( Initializes the game display and VBI, then runs )
( menu/input handling; INPUT-STATE eight restarts )
( initialization. )
AT 7AEA
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C1CD7A
DOCOL
( label 7AF2 )
t.0 t.INPUT-STATE t.! LIT16 260B t.DISK-CHECK-SECTOR-BASE t.-
LIT16 76A9 t.! t.0 LIT16 0041 t.C! t.WAIT-FOR-GAME-DISK t.1
t.GAME-UI-MODE t.! t.RUN-VBI1 t.DISABLE-DISPLAY-DMA
t.INIT-GAME-DISPLAY t.RESTORE-DISPLAY-DMA t.1 LIT16 02F0 t.C!
t.0 LIT8 52 t.C! t.0 t.MARK-CURRENT-MAP-ROOM t.3
t.CURRENT-MAP-FLOOR t.! t.DRAW-MAP-FLOOR-NUMBER
( label 7B39 )
t.HANDLE-GAME-MENU t.HANDLE-GAME-INPUT t.INPUT-STATE t.@ t.8
t.=
t.0BRANCH CELL FFF2 ( -> 7B39 )
t.BRANCH CELL FFA7 ( -> 7AF2 )
t.;S
AT 7B4F
