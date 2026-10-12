( AD 2044 20-framework.fth: target 2A1B..7B4E )
( Hexadecimal. BYTES emits hex bytes; CELL emits a 16-bit )
( cell. )
( LIT8/LIT16 compile literals; branch cells are signed )
( offsets. )

( SAVE-CASSETTE-PRIMITIVE | NFA 2A1B CFA 2A1B )
( Inferred descriptive name: headerless native CFA called )
( by stock fig-FORTH CSAVE. )
AT 2A1B
( Headerless internal native entry point )
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
( Trailing native code/data at 2BCB; retained exactly )
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
( Trailing native code/data at 2D0F; retained exactly )
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
BYTES B502 ( 3073: LDA $02,X )
BYTES 85D3 ( 3075: STA $d3 )
BYTES B503 ( 3077: LDA $03,X )
BYTES 85D4 ( 3079: STA $d4 )
BYTES A000 ( 307B: LDY #$00 )
BYTES B1D3 ( 307D: LDA [$d3],Y )
BYTES D504 ( 307F: CMP $04,X )
BYTES D006 ( 3081: BNE $3089 )
BYTES A901 ( 3083: LDA #$01 )
BYTES C8 ( 3085: INY )
BYTES 4C9830 ( 3086: JMP $3098 )
BYTES C8 ( 3089: INY )
BYTES 98 ( 308A: TYA )
BYTES D500 ( 308B: CMP $00,X )
BYTES D007 ( 308D: BNE $3096 )
BYTES A901 ( 308F: LDA #$01 )
BYTES A000 ( 3091: LDY #$00 )
BYTES 4C9830 ( 3093: JMP $3098 )
BYTES A900 ( 3096: LDA #$00 )
BYTES C901 ( 3098: CMP #$01 )
BYTES D0E1 ( 309A: BNE $307d )
BYTES 9404 ( 309C: STY $04,X )
BYTES 4C5710 ( 309E: JMP $1057 )
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
( Trailing native code/data at 30B4; retained exactly )
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
BYTES 86D1 ( 35CF: STX $d1 )
BYTES B500 ( 35D1: LDA $00,X )
BYTES A8 ( 35D3: TAY )
BYTES E8 ( 35D4: INX )
BYTES E8 ( 35D5: INX )
BYTES B500 ( 35D6: LDA $00,X )
BYTES 85D3 ( 35D8: STA $d3 )
BYTES E8 ( 35DA: INX )
BYTES B500 ( 35DB: LDA $00,X )
BYTES 85D4 ( 35DD: STA $d4 )
BYTES 88 ( 35DF: DEY )
BYTES B1D3 ( 35E0: LDA [$d3],Y )
BYTES A201 ( 35E2: LDX #$01 )
BYTES C980 ( 35E4: CMP #$80 )
BYTES 1009 ( 35E6: BPL $35f1 )
BYTES C920 ( 35E8: CMP #$20 )
BYTES 1002 ( 35EA: BPL $35ee )
BYTES A200 ( 35EC: LDX #$00 )
BYTES 4CF735 ( 35EE: JMP $35f7 )
BYTES C9A0 ( 35F1: CMP #$a0 )
BYTES 1002 ( 35F3: BPL $35f7 )
BYTES A200 ( 35F5: LDX #$00 )
BYTES E000 ( 35F7: CPX #$00 )
BYTES D007 ( 35F9: BNE $3602 )
BYTES 18 ( 35FB: CLC )
BYTES 6940 ( 35FC: ADC #$40 )
BYTES 18 ( 35FE: CLC )
BYTES 4C1936 ( 35FF: JMP $3619 )
BYTES C980 ( 3602: CMP #$80 )
BYTES 100B ( 3604: BPL $3611 )
BYTES C960 ( 3606: CMP #$60 )
BYTES 1004 ( 3608: BPL $360e )
BYTES 38 ( 360A: SEC )
BYTES E920 ( 360B: SBC #$20 )
BYTES 18 ( 360D: CLC )
BYTES 4C1936 ( 360E: JMP $3619 )
BYTES C9E0 ( 3611: CMP #$e0 )
BYTES 1004 ( 3613: BPL $3619 )
BYTES 38 ( 3615: SEC )
BYTES E920 ( 3616: SBC #$20 )
BYTES 18 ( 3618: CLC )
BYTES 91D3 ( 3619: STA [$d3],Y )
BYTES C000 ( 361B: CPY #$00 )
BYTES D0C0 ( 361D: BNE $35df )
BYTES A6D1 ( 361F: LDX $d1 )
BYTES 4C5710 ( 3621: JMP $1057 )
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

( w371E | NFA 3718 CFA 371E )
( Unknown erased name; CFA identifier )
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

( w3885 | NFA 387E CFA 3885 )
( Unknown erased name; CFA identifier )
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
BYTES 48 ( 3902: PHA )
BYTES 38 ( 3903: SEC )
BYTES ADE638 ( 3904: LDA $38e6 )
BYTES EDDC38 ( 3907: SBC $38dc )
BYTES 8DE638 ( 390A: STA $38e6 )
BYTES ADE738 ( 390D: LDA $38e7 )
BYTES EDDD38 ( 3910: SBC $38dd )
BYTES 8DE738 ( 3913: STA $38e7 )
BYTES 68 ( 3916: PLA )
BYTES 60 ( 3917: RTS )
AT 3918

( ZK+ | NFA 3918 CFA 391E )
( GAM FORTH 11_A_Graf.ATR CFA $383E, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3918
( Saved dictionary header: flags, name bytes, link )
BYTES 830000ABFA38
CELL 3920 ( native entry point )
BYTES 48 ( 3920: PHA )
BYTES A5D2 ( 3921: LDA $d2 )
BYTES 18 ( 3923: CLC )
BYTES 6DDC38 ( 3924: ADC $38dc )
BYTES 85D2 ( 3927: STA $d2 )
BYTES A5D3 ( 3929: LDA $d3 )
BYTES 6DDD38 ( 392B: ADC $38dd )
BYTES 85D3 ( 392E: STA $d3 )
BYTES 68 ( 3930: PLA )
BYTES 60 ( 3931: RTS )
AT 3932

( DK+ | NFA 3932 CFA 3938 )
( GAM FORTH 11_A_Graf.ATR CFA $3858, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3932
( Saved dictionary header: flags, name bytes, link )
BYTES 830000AB1839
CELL 393A ( native entry point )
BYTES 48 ( 393A: PHA )
BYTES A5D4 ( 393B: LDA $d4 )
BYTES 18 ( 393D: CLC )
BYTES 6DDC38 ( 393E: ADC $38dc )
BYTES 85D4 ( 3941: STA $d4 )
BYTES A5D5 ( 3943: LDA $d5 )
BYTES 6DDD38 ( 3945: ADC $38dd )
BYTES 85D5 ( 3948: STA $d5 )
BYTES 68 ( 394A: PLA )
BYTES 60 ( 394B: RTS )
AT 394C

( WD | NFA 394C CFA 3951 )
( GAM FORTH 11_A_Graf.ATR CFA $3871, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 394C
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C43239
CELL 3953 ( native entry point )
BYTES B500 ( 3953: LDA $00,X )
BYTES 8DE638 ( 3955: STA $38e6 )
BYTES B501 ( 3958: LDA $01,X )
BYTES 8DE738 ( 395A: STA $38e7 )
BYTES B502 ( 395D: LDA $02,X )
BYTES 85D4 ( 395F: STA $d4 )
BYTES B503 ( 3961: LDA $03,X )
BYTES 85D5 ( 3963: STA $d5 )
BYTES B504 ( 3965: LDA $04,X )
BYTES 85D2 ( 3967: STA $d2 )
BYTES B505 ( 3969: LDA $05,X )
BYTES 85D3 ( 396B: STA $d3 )
BYTES 60 ( 396D: RTS )
AT 396E

( DYC | NFA 396E CFA 3974 )
( GAM FORTH 11_A_Graf.ATR CFA $3894, corresponding word in )
( contiguous 14-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 396E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C34C39
CELL 3976 ( native entry point )
BYTES 86D1 ( 3976: STX $d1 )
BYTES B500 ( 3978: LDA $00,X )
BYTES 85D2 ( 397A: STA $d2 )
BYTES B501 ( 397C: LDA $01,X )
BYTES 85D3 ( 397E: STA $d3 )
BYTES B502 ( 3980: LDA $02,X )
BYTES A000 ( 3982: LDY #$00 )
BYTES AA ( 3984: TAX )
BYTES F01F ( 3985: BEQ $39a6 )
BYTES B1D2 ( 3987: LDA [$d2],Y )
BYTES 8DDC38 ( 3989: STA $38dc )
BYTES C8 ( 398C: INY )
BYTES B1D2 ( 398D: LDA [$d2],Y )
BYTES 8DDD38 ( 398F: STA $38dd )
BYTES 88 ( 3992: DEY )
BYTES 202039 ( 3993: JSR $3920 )
BYTES A902 ( 3996: LDA #$02 )
BYTES 8DDC38 ( 3998: STA $38dc )
BYTES A900 ( 399B: LDA #$00 )
BYTES 8DDD38 ( 399D: STA $38dd )
BYTES 202039 ( 39A0: JSR $3920 )
BYTES CA ( 39A3: DEX )
BYTES D0E1 ( 39A4: BNE $3987 )
BYTES A6D1 ( 39A6: LDX $d1 )
BYTES 4C5710 ( 39A8: JMP $1057 )
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
( Trailing native code/data at 39C1; retained exactly )
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
BYTES B1D2 ( 3A91: LDA [$d2],Y )
BYTES C9FE ( 3A93: CMP #$fe )
BYTES D036 ( 3A95: BNE $3acd )
BYTES 8CDC38 ( 3A97: STY $38dc )
BYTES 200239 ( 3A9A: JSR $3902 )
BYTES 202039 ( 3A9D: JSR $3920 )
BYTES 203A39 ( 3AA0: JSR $393a )
BYTES A001 ( 3AA3: LDY #$01 )
BYTES B1D2 ( 3AA5: LDA [$d2],Y )
BYTES 8DDC38 ( 3AA7: STA $38dc )
BYTES A002 ( 3AAA: LDY #$02 )
BYTES B1D2 ( 3AAC: LDA [$d2],Y )
BYTES A000 ( 3AAE: LDY #$00 )
BYTES 91D4 ( 3AB0: STA [$d4],Y )
BYTES C8 ( 3AB2: INY )
BYTES CCDC38 ( 3AB3: CPY $38dc )
BYTES D0F8 ( 3AB6: BNE $3ab0 )
BYTES A000 ( 3AB8: LDY #$00 )
BYTES 203A39 ( 3ABA: JSR $393a )
BYTES A903 ( 3ABD: LDA #$03 )
BYTES 8DDC38 ( 3ABF: STA $38dc )
BYTES 202039 ( 3AC2: JSR $3920 )
BYTES 200239 ( 3AC5: JSR $3902 )
BYTES A200 ( 3AC8: LDX #$00 )
BYTES 4CD23A ( 3ACA: JMP $3ad2 )
BYTES 91D4 ( 3ACD: STA [$d4],Y )
BYTES C8 ( 3ACF: INY )
BYTES A201 ( 3AD0: LDX #$01 )
BYTES 60 ( 3AD2: RTS )
AT 3AD3

( <M | NFA 3AD3 CFA 3AD8 )
( GAM FORTH 42_A_GrafDos.ATR CFA $424D, corresponding word )
( in contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3AD3
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CD893A
CELL 3ADA ( native entry point )
BYTES 86D1 ( 3ADA: STX $d1 )
BYTES 205339 ( 3ADC: JSR $3953 )
BYTES A900 ( 3ADF: LDA #$00 )
BYTES 8DDD38 ( 3AE1: STA $38dd )
BYTES ADE738 ( 3AE4: LDA $38e7 )
BYTES D010 ( 3AE7: BNE $3af9 )
BYTES A000 ( 3AE9: LDY #$00 )
BYTES 20913A ( 3AEB: JSR $3a91 )
BYTES CCE638 ( 3AEE: CPY $38e6 )
BYTES D0F8 ( 3AF1: BNE $3aeb )
BYTES A6D1 ( 3AF3: LDX $d1 )
BYTES 60 ( 3AF5: RTS )
BYTES 4C0D3B ( 3AF6: JMP $3b0d )
BYTES A000 ( 3AF9: LDY #$00 )
BYTES 20913A ( 3AFB: JSR $3a91 )
BYTES C000 ( 3AFE: CPY #$00 )
BYTES D0F9 ( 3B00: BNE $3afb )
BYTES E001 ( 3B02: CPX #$01 )
BYTES D007 ( 3B04: BNE $3b0d )
BYTES CEE738 ( 3B06: DEC $38e7 )
BYTES E6D3 ( 3B09: INC $d3 )
BYTES E6D5 ( 3B0B: INC $d5 )
BYTES A901 ( 3B0D: LDA #$01 )
BYTES D0D3 ( 3B0F: BNE $3ae4 )
AT 3B11

( [<M] | NFA 3B11 CFA 3B18 )
( GAM FORTH 42_A_GrafDos.ATR CFA $428D, corresponding word )
( in contiguous 8-definition sequence matching name )
( length/suffix, flags, word kind, and body length )
AT 3B11
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A9D33A
CELL 3B1A ( native entry point )
BYTES 20DA3A ( 3B1A: JSR $3ada )
BYTES E8 ( 3B1D: INX )
BYTES E8 ( 3B1E: INX )
BYTES 4C5710 ( 3B1F: JMP $1057 )
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

( w3B84 | NFA 3B7D CFA 3B84 )
( Unknown erased name; CFA identifier )
AT 3B7D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000B0433B
DOCOL
t.0DL t.?DL LIT8 7D t.EMIT LIT16 00E0 LIT16 02F4 t.C! t.;S
AT 3B9B

( w3BA6 | NFA 3B9B CFA 3BA6 )
( Unknown erased name; CFA identifier )
AT 3B9B
( Saved dictionary header: flags, name bytes, link )
BYTES 8800000000000000B37D3B
DOCOL
t.TYTDL t.?DL t.ADGR t.@ LIT16 1040 t.ERASE LIT8 7D t.EMIT
t.;S
AT 3BBD

( w3BC9 | NFA 3BBD CFA 3BC9 )
( Unknown erased name; CFA identifier )
AT 3BBD
( Saved dictionary header: flags, name bytes, link )
BYTES 890000000000000000B39B3B
DOCOL
w3BA6 LIT16 00B8 LIT16 02F4 t.C! t.;S
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
BYTES E001 ( 3C35: CPX #$01 )
BYTES F00F ( 3C37: BEQ $3c48 )
BYTES 46D6 ( 3C39: LSR $d6 )
BYTES 46D6 ( 3C3B: LSR $d6 )
BYTES B1D2 ( 3C3D: LDA [$d2],Y )
BYTES 25D6 ( 3C3F: AND $d6 )
BYTES 06D6 ( 3C41: ASL $d6 )
BYTES 06D6 ( 3C43: ASL $d6 )
BYTES 4C4A3C ( 3C45: JMP $3c4a )
BYTES A5D9 ( 3C48: LDA $d9 )
BYTES 60 ( 3C4A: RTS )
AT 3C4B

( [SL] | NFA 3C4B CFA 3C52 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3C4B
( Saved dictionary header: flags, name bytes, link )
BYTES 8428534CA92C3C
CELL 3C54 ( native entry point )
BYTES E002 ( 3C54: CPX #$02 )
BYTES F00F ( 3C56: BEQ $3c67 )
BYTES 06D6 ( 3C58: ASL $d6 )
BYTES 06D6 ( 3C5A: ASL $d6 )
BYTES B1D2 ( 3C5C: LDA [$d2],Y )
BYTES 25D6 ( 3C5E: AND $d6 )
BYTES 46D6 ( 3C60: LSR $d6 )
BYTES 46D6 ( 3C62: LSR $d6 )
BYTES 4C693C ( 3C64: JMP $3c69 )
BYTES A5D8 ( 3C67: LDA $d8 )
BYTES 60 ( 3C69: RTS )
AT 3C6A

( [MVS] | NFA 3C6A CFA 3C72 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3C6A
( Saved dictionary header: flags, name bytes, link )
BYTES 85284D5653A94B3C
CELL 3C74 ( native entry point )
BYTES A5D6 ( 3C74: LDA $d6 )
BYTES 49FF ( 3C76: EOR #$ff )
BYTES 31D4 ( 3C78: AND [$d4],Y )
BYTES 85DA ( 3C7A: STA $da )
BYTES A5D6 ( 3C7C: LDA $d6 )
BYTES 31D2 ( 3C7E: AND [$d2],Y )
BYTES D022 ( 3C80: BNE $3ca4 )
BYTES 20543C ( 3C82: JSR $3c54 )
BYTES C900 ( 3C85: CMP #$00 )
BYTES F007 ( 3C87: BEQ $3c90 )
BYTES A5DA ( 3C89: LDA $da )
BYTES 91D4 ( 3C8B: STA [$d4],Y )
BYTES 4CA13C ( 3C8D: JMP $3ca1 )
BYTES A5D7 ( 3C90: LDA $d7 )
BYTES C903 ( 3C92: CMP #$03 )
BYTES D00B ( 3C94: BNE $3ca1 )
BYTES 20353C ( 3C96: JSR $3c35 )
BYTES C900 ( 3C99: CMP #$00 )
BYTES F004 ( 3C9B: BEQ $3ca1 )
BYTES A5DA ( 3C9D: LDA $da )
BYTES 91D4 ( 3C9F: STA [$d4],Y )
BYTES 4CA93C ( 3CA1: JMP $3ca9 )
BYTES 18 ( 3CA4: CLC )
BYTES 65DA ( 3CA5: ADC $da )
BYTES 91D4 ( 3CA7: STA [$d4],Y )
BYTES 46D6 ( 3CA9: LSR $d6 )
BYTES 46D6 ( 3CAB: LSR $d6 )
BYTES 60 ( 3CAD: RTS )
AT 3CAE

( MVPL | NFA 3CAE CFA 3CB5 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3CAE
( Saved dictionary header: flags, name bytes, link )
BYTES 844D5650CC6A3C
CELL 3CB7 ( native entry point )
BYTES A9C0 ( 3CB7: LDA #$c0 )
BYTES 85D6 ( 3CB9: STA $d6 )
BYTES A202 ( 3CBB: LDX #$02 )
BYTES 20743C ( 3CBD: JSR $3c74 )
BYTES A200 ( 3CC0: LDX #$00 )
BYTES 20743C ( 3CC2: JSR $3c74 )
BYTES 20743C ( 3CC5: JSR $3c74 )
BYTES A201 ( 3CC8: LDX #$01 )
BYTES 20743C ( 3CCA: JSR $3c74 )
BYTES 60 ( 3CCD: RTS )
AT 3CCE

( [MVS1] | NFA 3CCE CFA 3CD7 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3CCE
( Saved dictionary header: flags, name bytes, link )
BYTES 86284D565331A9AE3C
CELL 3CD9 ( native entry point )
BYTES A5D6 ( 3CD9: LDA $d6 )
BYTES 31D2 ( 3CDB: AND [$d2],Y )
BYTES 85DA ( 3CDD: STA $da )
BYTES F00A ( 3CDF: BEQ $3ceb )
BYTES A5D6 ( 3CE1: LDA $d6 )
BYTES 49FF ( 3CE3: EOR #$ff )
BYTES 31D4 ( 3CE5: AND [$d4],Y )
BYTES 05DA ( 3CE7: ORA $da )
BYTES 91D4 ( 3CE9: STA [$d4],Y )
BYTES 46D6 ( 3CEB: LSR $d6 )
BYTES 46D6 ( 3CED: LSR $d6 )
BYTES 60 ( 3CEF: RTS )
AT 3CF0

( [CM] | NFA 3CF0 CFA 3CF7 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3CF0
( Saved dictionary header: flags, name bytes, link )
BYTES 8428434DA9CE3C
CELL 3CF9 ( native entry point )
BYTES A900 ( 3CF9: LDA #$00 )
BYTES 85D9 ( 3CFB: STA $d9 )
BYTES ACE638 ( 3CFD: LDY $38e6 )
BYTES A5D7 ( 3D00: LDA $d7 )
BYTES D00C ( 3D02: BNE $3d10 )
BYTES 88 ( 3D04: DEY )
BYTES B1D2 ( 3D05: LDA [$d2],Y )
BYTES 91D4 ( 3D07: STA [$d4],Y )
BYTES C000 ( 3D09: CPY #$00 )
BYTES D0F7 ( 3D0B: BNE $3d04 )
BYTES 4C4B3D ( 3D0D: JMP $3d4b )
BYTES A5D7 ( 3D10: LDA $d7 )
BYTES C901 ( 3D12: CMP #$01 )
BYTES D018 ( 3D14: BNE $3d2e )
BYTES 88 ( 3D16: DEY )
BYTES A9C0 ( 3D17: LDA #$c0 )
BYTES 85D6 ( 3D19: STA $d6 )
BYTES 20D93C ( 3D1B: JSR $3cd9 )
BYTES 20D93C ( 3D1E: JSR $3cd9 )
BYTES 20D93C ( 3D21: JSR $3cd9 )
BYTES 20D93C ( 3D24: JSR $3cd9 )
BYTES C000 ( 3D27: CPY #$00 )
BYTES D0EB ( 3D29: BNE $3d16 )
BYTES 4C4B3D ( 3D2B: JMP $3d4b )
BYTES 88 ( 3D2E: DEY )
BYTES D005 ( 3D2F: BNE $3d36 )
BYTES A900 ( 3D31: LDA #$00 )
BYTES 4C3C3D ( 3D33: JMP $3d3c )
BYTES 88 ( 3D36: DEY )
BYTES A903 ( 3D37: LDA #$03 )
BYTES 31D2 ( 3D39: AND [$d2],Y )
BYTES C8 ( 3D3B: INY )
BYTES 85D8 ( 3D3C: STA $d8 )
BYTES 20B73C ( 3D3E: JSR $3cb7 )
BYTES A9C0 ( 3D41: LDA #$c0 )
BYTES 31D2 ( 3D43: AND [$d2],Y )
BYTES 85D9 ( 3D45: STA $d9 )
BYTES C000 ( 3D47: CPY #$00 )
BYTES D0E3 ( 3D49: BNE $3d2e )
BYTES 60 ( 3D4B: RTS )
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
BYTES 86D1 ( 3D60: STX $d1 )
BYTES ADF13B ( 3D62: LDA $3bf1 )
BYTES 8DE638 ( 3D65: STA $38e6 )
BYTES ADF23B ( 3D68: LDA $3bf2 )
BYTES 8D543D ( 3D6B: STA $3d54 )
BYTES ADED3B ( 3D6E: LDA $3bed )
BYTES 85D2 ( 3D71: STA $d2 )
BYTES ADEE3B ( 3D73: LDA $3bee )
BYTES 85D3 ( 3D76: STA $d3 )
BYTES ADEF3B ( 3D78: LDA $3bef )
BYTES 85D4 ( 3D7B: STA $d4 )
BYTES ADF03B ( 3D7D: LDA $3bf0 )
BYTES 85D5 ( 3D80: STA $d5 )
BYTES 20F93C ( 3D82: JSR $3cf9 )
BYTES ADE638 ( 3D85: LDA $38e6 )
BYTES 8DDC38 ( 3D88: STA $38dc )
BYTES 202039 ( 3D8B: JSR $3920 )
BYTES ADF33B ( 3D8E: LDA $3bf3 )
BYTES 8DDC38 ( 3D91: STA $38dc )
BYTES ADF43B ( 3D94: LDA $3bf4 )
BYTES 8DDD38 ( 3D97: STA $38dd )
BYTES 203A39 ( 3D9A: JSR $393a )
BYTES CE543D ( 3D9D: DEC $3d54 )
BYTES D0E0 ( 3DA0: BNE $3d82 )
BYTES A6D1 ( 3DA2: LDX $d1 )
BYTES 60 ( 3DA4: RTS )
AT 3DA5

( C-V | NFA 3DA5 CFA 3DAB )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 3DA5
( Saved dictionary header: flags, name bytes, link )
BYTES 83432DD6563D
CELL 3DAD ( native entry point )
BYTES 20603D ( 3DAD: JSR $3d60 )
BYTES 4C470F ( 3DB0: JMP $0f47 )
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

( w3EF2 | NFA 3EEB CFA 3EF2 )
( Unknown erased name; CFA identifier )
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

( w3F1D | NFA 3F15 CFA 3F1D )
( Unknown erased name; CFA identifier )
AT 3F15
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C2023F
DOCOL
t.RESOURCE-BASE@ t.DUP LIT16 A8FC t.SWAP t.- t.ERASE t.;S
AT 3F2F

( w3F37 | NFA 3F2F CFA 3F37 )
( Unknown erased name; CFA identifier )
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
w3BA6 t.0 t.RESOURCE-ADDR t.ADGR t.@ t.<MOVE t.1
t.RESOURCE-ADDR t.OUNT w3F37 t.SWAP t.CMOVE LIT8 BC LIT16 02F4
t.C! t.;S
AT 3F66

( LOAD-ASSET-GROUP | NFA 3F66 CFA 3F6C )
( Inferred descriptive name, not recovered original: Loads )
( the requested group with BLOAD, retries on error, prints )
( inverse ERROR. )
AT 3F66
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D43B3F
DOCOL
t.>R w3F1D
( label 3F72 )
t.0 t.RESOURCE-ADDR LIT8 50 t.R t.BLOAD t.DUP
t.0BRANCH CELL 000E ( -> 3F8F )
w3B84
( ATASCII text: ....... )
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

( w3FDA | NFA 3FD3 CFA 3FDA )
( Unknown erased name; CFA identifier )
AT 3FD3
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CCA93F
DOCON
CELL A910
AT 3FDE

( w3FE4 | NFA 3FDE CFA 3FE4 )
( Unknown erased name; CFA identifier )
AT 3FDE
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1D33F
DOCOL
t.DUP t.C@ LIT16 0080 t.OR t.SWAP t.C! t.;S
AT 3FF6

( w4000 | NFA 3FF6 CFA 4000 )
( Unknown erased name; CFA identifier )
AT 3FF6
( Saved dictionary header: flags, name bytes, link )
BYTES 8600000000004CA0DE3F
DOVAR
BYTES 24F8FCE42C28CA5420202020202020202020
AT 4014

( w401A | NFA 4014 CFA 401A )
( Unknown erased name; CFA identifier )
AT 4014
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D3F63F
DOVAR
CELL 0000
AT 401E

( w4025 | NFA 401E CFA 4025 )
( Unknown erased name; CFA identifier )
AT 401E
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CC1440
DOCON
CELL 00DB
AT 4029

( w402F | NFA 4029 CFA 402F )
( Unknown erased name; CFA identifier )
AT 4029
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C91E40
DOVAR
CELL 0060
AT 4033

( w403A | NFA 4033 CFA 403A )
( Unknown erased name; CFA identifier )
AT 4033
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A92940
CELL 403C ( native entry point )
BYTES 08 ( 403C: PHP )
BYTES 48 ( 403D: PHA )
BYTES 98 ( 403E: TYA )
BYTES 48 ( 403F: PHA )
BYTES AC1C40 ( 4040: LDY $401c )
BYTES 18 ( 4043: CLC )
BYTES B1DB ( 4044: LDA [$db],Y )
BYTES 8D16D0 ( 4046: STA $d016 )
BYTES C8 ( 4049: INY )
BYTES B1DB ( 404A: LDA [$db],Y )
BYTES 8D17D0 ( 404C: STA $d017 )
BYTES C8 ( 404F: INY )
BYTES B1DB ( 4050: LDA [$db],Y )
BYTES 8D18D0 ( 4052: STA $d018 )
BYTES C8 ( 4055: INY )
BYTES AD0BD4 ( 4056: LDA $d40b )
BYTES C940 ( 4059: CMP #$40 )
BYTES 3002 ( 405B: BMI $405f )
BYTES A000 ( 405D: LDY #$00 )
BYTES 8C1C40 ( 405F: STY $401c )
BYTES 68 ( 4062: PLA )
BYTES A8 ( 4063: TAY )
BYTES 68 ( 4064: PLA )
BYTES 28 ( 4065: PLP )
BYTES 40 ( 4066: RTI )
AT 4067

( w4070 | NFA 4067 CFA 4070 )
( Unknown erased name; CFA identifier )
AT 4067
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000C93340
DOCOL
LIT16 0200 t.! t.0 w401A t.! w402F t.C@ LIT16 00E0 t.OR t.DUP
w402F t.C! LIT16 D40E t.C! t.;S
AT 4096

( w409E | NFA 4096 CFA 409E )
( Unknown erased name; CFA identifier )
AT 4096
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CC6740
DOCOL
LIT16 403C w4070 t.;S
AT 40A8

( w40B2 | NFA 40A8 CFA 40B2 )
( Unknown erased name; CFA identifier )
AT 40A8
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C99640
DOCOL
LIT16 0060 w402F t.C! t.1 t.PAUSE w4025 t.@ LIT16 02C4
LIT16 0003 t.CMOVE LIT16 0060 LIT16 D40E t.C! w4025 t.@
LIT16 D016 LIT16 0003 t.CMOVE t.;S
AT 40E8

( w40EF | NFA 40E8 CFA 40EF )
( Unknown erased name; CFA identifier )
AT 40E8
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D0A840
DOCOL
w4000 w4025 t.! w3FDA t.1+ w3FE4 w3FDA LIT16 006D t.+ w3FE4
w409E w4000 LIT16 0006 t.+ t.C@ LIT16 02C7 t.C! t.;S
AT 411B

( w4124 | NFA 411B CFA 4124 )
( Unknown erased name; CFA identifier )
AT 411B
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000D9E840
DOCOL
t.<BUILDS t.ALLOT t.DOES>
( Trailing native code/data at 412C; retained exactly )
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
( Trailing native code/data at 4144; retained exactly )
BYTES 8D13D5140F2004137712
AT 414E

( w4154 | NFA 414E CFA 4154 )
( Unknown erased name; CFA identifier )
AT 414E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC3041
DOCON
CELL 0200
AT 4158

( w415E | NFA 4158 CFA 415E )
( Unknown erased name; CFA identifier )
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

( w4369 | NFA 4362 CFA 4369 )
( Unknown erased name; CFA identifier )
AT 4362
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CD5841
DOVAR
CELL 0000
AT 436D

( w4377 | NFA 436D CFA 4377 )
( Unknown erased name; CFA identifier )
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

( w438B | NFA 4385 CFA 438B )
( Unknown erased name; CFA identifier )
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

( w4563 | NFA 455B CFA 4563 )
( Unknown erased name; CFA identifier )
AT 455B
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000CD8543
DOCON
CELL 005A
AT 4567

( w456E | NFA 4567 CFA 456E )
( Unknown erased name; CFA identifier )
AT 4567
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C55B45
DOVAR
BYTES 0002190006190002380006382020
AT 457E

( w4584 | NFA 457E CFA 4584 )
( Unknown erased name; CFA identifier )
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

( w4642 | NFA 463C CFA 4642 )
( Unknown erased name; CFA identifier )
AT 463C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D97E45
DODOES
( DOES> thread at 4144 )
BYTES 44410000000000000000000000000000000000000000010001000000
BYTES 000000000800
AT 4666

( w466D | NFA 4666 CFA 466D )
( Unknown erased name; CFA identifier )
AT 4666
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000DA3C46
DOVAR
CELL 0002
AT 4671

( w4678 | NFA 4671 CFA 4678 )
( Unknown erased name; CFA identifier )
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

( w46DE | NFA 46D6 CFA 46DE )
( Unknown erased name; CFA identifier )
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

( w4732 | NFA 472C CFA 4732 )
( Unknown erased name; CFA identifier )
AT 472C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1D646
DOCOL
t.SWAP t.OVER t.C@ t.+ t.SWAP t.C! t.;S
AT 4742

( w4748 | NFA 4742 CFA 4748 )
( Unknown erased name; CFA identifier )
AT 4742
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C12C47
DOCOL
LIT16 02FC t.C@ LIT16 00FF LIT16 02FC t.C! t.;S
AT 475C

( w4763 | NFA 475C CFA 4763 )
( Unknown erased name; CFA identifier )
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

( w47A4 | NFA 479E CFA 47A4 )
( Unknown erased name; CFA identifier )
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
w47A4 t.@
t.0BRANCH CELL 0019 ( -> 47CE )
t.0 t.0 t.POS
( ATASCII text:  . )
t.(.")
BYTES 02201E
LIT16 0058 t.@ LIT16 0208 t.ERASE
( label 47CE )
t.1 w47A4 t.! t.;S
AT 47D6

( w47DC | NFA 47D6 CFA 47DC )
( Unknown erased name; CFA identifier )
AT 47D6
( Saved dictionary header: flags, name bytes, link )
BYTES 830000BDA847
DOCOL
w40B2 t.;S
AT 47E2

( w47E9 | NFA 47E2 CFA 47E9 )
( Unknown erased name; CFA identifier )
AT 47E2
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000BED647
DOCOL
w409E t.;S
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
t.INSTALL-SCENE-ASSETS w40EF t.RESTORE-DISPLAY-DMA t.;S
AT 4842

( w4847 | NFA 4842 CFA 4847 )
( Unknown erased name; CFA identifier )
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
BYTES 18 ( 488B: CLC )
BYTES A5D2 ( 488C: LDA $d2 )
BYTES 6928 ( 488E: ADC #$28 )
BYTES 85D2 ( 4890: STA $d2 )
BYTES A5D3 ( 4892: LDA $d3 )
BYTES 6900 ( 4894: ADC #$00 )
BYTES 85D3 ( 4896: STA $d3 )
BYTES 60 ( 4898: RTS )
AT 4899

( G#D | NFA 4899 CFA 489F )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 4899
( Saved dictionary header: flags, name bytes, link )
BYTES 834723C48348
CELL 48A1 ( native entry point )
BYTES A000 ( 48A1: LDY #$00 )
BYTES AD5948 ( 48A3: LDA $4859 )
BYTES 91D2 ( 48A6: STA [$d2],Y )
BYTES C8 ( 48A8: INY )
BYTES AD5A48 ( 48A9: LDA $485a )
BYTES 91D2 ( 48AC: STA [$d2],Y )
BYTES C8 ( 48AE: INY )
BYTES 98 ( 48AF: TYA )
BYTES A6D1 ( 48B0: LDX $d1 )
BYTES D502 ( 48B2: CMP $02,X )
BYTES D0F3 ( 48B4: BNE $48a9 )
BYTES 88 ( 48B6: DEY )
BYTES AD5B48 ( 48B7: LDA $485b )
BYTES 91D2 ( 48BA: STA [$d2],Y )
BYTES 60 ( 48BC: RTS )
AT 48BD

( G# | NFA 48BD CFA 48C2 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 48BD
( Saved dictionary header: flags, name bytes, link )
BYTES 8247A39948
CELL 48C4 ( native entry point )
BYTES 86D1 ( 48C4: STX $d1 )
BYTES 20A148 ( 48C6: JSR $48a1 )
BYTES 208B48 ( 48C9: JSR $488b )
BYTES A6D1 ( 48CC: LDX $d1 )
BYTES 4C470F ( 48CE: JMP $0f47 )
AT 48D1

( D# | NFA 48D1 CFA 48D6 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 48D1
( Saved dictionary header: flags, name bytes, link )
BYTES 8244A3BD48
CELL 48D8 ( native entry point )
BYTES 86D1 ( 48D8: STX $d1 )
BYTES 20A148 ( 48DA: JSR $48a1 )
BYTES A6D1 ( 48DD: LDX $d1 )
BYTES 4C5710 ( 48DF: JMP $1057 )
AT 48E2

( S# | NFA 48E2 CFA 48E7 )
( Original intact name in the supplied game image; private )
( vocabulary chain terminates at FORTH dummy header $1E44. )
AT 48E2
( Saved dictionary header: flags, name bytes, link )
BYTES 8253A3D148
CELL 48E9 ( native entry point )
BYTES 86D1 ( 48E9: STX $d1 )
BYTES A902 ( 48EB: LDA #$02 )
BYTES 85D4 ( 48ED: STA $d4 )
BYTES 20A148 ( 48EF: JSR $48a1 )
BYTES 208B48 ( 48F2: JSR $488b )
BYTES E6D4 ( 48F5: INC $d4 )
BYTES A5D4 ( 48F7: LDA $d4 )
BYTES A6D1 ( 48F9: LDX $d1 )
BYTES D500 ( 48FB: CMP $00,X )
BYTES D0F0 ( 48FD: BNE $48ef )
BYTES A6D1 ( 48FF: LDX $d1 )
BYTES 4C470F ( 4901: JMP $0f47 )
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

( w4940 | NFA 4938 CFA 4940 )
( Unknown erased name; CFA identifier )
AT 4938
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C14248
DOCOL
LIT16 0058 t.@ t.Y@ LIT16 0028 t.* t.+ t.X@ t.+ t.EKP t.!
t.(RAM) t.X@ t.1+ t.X! t.Y@ t.1+ t.Y! t.;S
AT 496A

( w4973 | NFA 496A CFA 4973 )
( Unknown erased name; CFA identifier )
AT 496A
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000C13849
DOCOL
t.OVER t.2 t./ LIT16 0014 t.SWAP t.- t.X! w4940 t.;S
AT 4989

( w498F | NFA 4989 CFA 498F )
( Unknown erased name; CFA identifier )
AT 4989
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B06A49
DOCON
CELL 0002
AT 4993

( w499A | NFA 4993 CFA 499A )
( Unknown erased name; CFA identifier )
AT 4993
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000B08949
DOCON
CELL 0005
AT 499E

( w49A3 | NFA 499E CFA 49A3 )
( Unknown erased name; CFA identifier )
AT 499E
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CC9349
DOCOL
t.DUP t.X! t.Y@ t.1+ t.Y! t.;S
AT 49B1

( w49B7 | NFA 49B1 CFA 49B7 )
( Unknown erased name; CFA identifier )
AT 49B1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D29E49
DOCOL
t.CLEAR-TEXT-AREA w47E9 t.CR LIT16 001C t.4 w4973 t.X@
( ATASCII text: ===BlaD=ODCZYTU=Z=DYSKU )
t.(S")
BYTES 173D3D3D426C61443D4F44435A5954553D5A3D4459534B55
w49A3
( ATASCII text: =NACIsNIJ=DOWOLNY=KLAWISZ )
t.(S")
BYTES 193D4E414349734E494A3D444F574F4C4E593D4B4C415749535A
t.BEEP t.KEY t.2DROP t.CLEAR-TEXT-AREA w47DC t.;S
AT 4A0D

( w4A14 | NFA 4A0D CFA 4A14 )
( Unknown erased name; CFA identifier )
AT 4A0D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D2B149
DOCOL
t.CLEAR-TEXT-AREA w47E9 t.CR LIT16 001E t.4 w4973 t.X@
( ATASCII text: ======ODWRoc=DYSKIETKe )
t.(S")
BYTES 163D3D3D3D3D3D4F4457526F633D4459534B4945544B65
w49A3
( ATASCII text: =I=NACISNIJ=DOWOLNY=KLAWISZ )
t.(S")
BYTES 1B3D493D4E414349534E494A3D444F574F4C4E593D4B4C415749535A
t.KEY t.2DROP t.CLEAR-TEXT-AREA w47DC t.;S
AT 4A69

( w4A6F | NFA 4A69 CFA 4A6F )
( Unknown erased name; CFA identifier )
AT 4A69
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C40D4A
DOVAR
CELL 0001
AT 4A73

( w4A79 | NFA 4A73 CFA 4A79 )
( Unknown erased name; CFA identifier )
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

( w4A9F | NFA 4A99 CFA 4A9F )
( Unknown erased name; CFA identifier )
AT 4A99
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A9734A
DOVAR
CELL 436B
AT 4AA3

( w4AA9 | NFA 4AA3 CFA 4AA9 )
( Unknown erased name; CFA identifier )
AT 4AA3
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A9994A
DOVAR
CELL 0007
AT 4AAD

( w4AB3 | NFA 4AAD CFA 4AB3 )
( Unknown erased name; CFA identifier )
AT 4AAD
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A9A34A
DOVAR
CELL 0014
AT 4AB7

( w4ABC | NFA 4AB7 CFA 4ABC )
( Unknown erased name; CFA identifier )
AT 4AB7
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D3AD4A
DOVAR
CELL 0000
AT 4AC0

( w4AC8 | NFA 4AC0 CFA 4AC8 )
( Unknown erased name; CFA identifier )
AT 4AC0
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A9B74A
DOCOL
w4AB3 t.! w4AA9 t.! w4A9F t.!
( label 4AD6 )
w4A79 t.0=_12DE
t.0BRANCH CELL 0042 ( -> 4B1E )
w4A6F t.@ t.=
t.0BRANCH CELL 0030 ( -> 4B16 )
w4A9F t.@ w4AA9 t.@ w4AB3 t.@ w4ABC t.@
t.0BRANCH CELL 0008 ( -> 4B02 )
t.BLOAD
t.BRANCH CELL 0004 ( -> 4B04 )
( label 4B02 )
w46DE
( label 4B04 )
t.0BRANCH CELL 000A ( -> 4B10 )
w49B7 t.0
t.BRANCH CELL 0004 ( -> 4B12 )
( label 4B10 )
t.1
( label 4B12 )
t.BRANCH CELL 0006 ( -> 4B1A )
( label 4B16 )
w4A14 t.0
( label 4B1A )
t.BRANCH CELL 0006 ( -> 4B22 )
( label 4B1E )
w49B7 t.0
( label 4B22 )
t.0BRANCH CELL FFB2 ( -> 4AD6 )
t.;S
AT 4B28

( w4B2D | NFA 4B28 CFA 4B2D )
( Unknown erased name; CFA identifier )
AT 4B28
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C9C04A
DOCOL
w4369 w4563 t.1 t.- w4678 t.OVER t.- t.B/BUF t./ t.1+ t.;S
AT 4B45

( w4B4C | NFA 4B45 CFA 4B4C )
( Unknown erased name; CFA identifier )
AT 4B45
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C3284B
DOCOL
t.1 w4ABC t.! w4B2D LIT8 13 w4AC8 t.;S
AT 4B5D

( w4B64 | NFA 4B5D CFA 4B64 )
( Unknown erased name; CFA identifier )
AT 4B5D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CE454B
DOCOL
t.1 w4ABC t.! w4B2D LIT8 14 w4AC8 t.;S
AT 4B75

( w4B7C | NFA 4B75 CFA 4B7C )
( Unknown erased name; CFA identifier )
AT 4B75
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CE5D4B
DOCOL
t.0 w4ABC t.! w4B2D LIT8 14 w4AC8 t.;S
AT 4B8D

( w4B95 | NFA 4B8D CFA 4B95 )
( Unknown erased name; CFA identifier )
AT 4B8D
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C2754B
DOCOL
w3F1D t.1 w4ABC t.! t.0 t.RESOURCE-ADDR LIT8 50 t.ROT w4AC8
t.;S
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
( Trailing native code/data at 4CA1; retained exactly )
BYTES 00001008E402000000000000000000001018FCFEFC18100000000000
BYTES 000000000102E4081000007712
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

( w4CF3 | NFA 4CEA CFA 4CF3 )
( Unknown erased name; CFA identifier )
AT 4CEA
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000A1D54C
DOCOL
t.ILPM t.! t.+DOD t.! t.;S
AT 4CFF

( w4D05 | NFA 4CFF CFA 4D05 )
( Unknown erased name; CFA identifier )
AT 4CFF
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A6EA4C
CELL 4D07 ( native entry point )
BYTES 86D1 ( 4D07: STX $d1 )
BYTES AED34C ( 4D09: LDX $4cd3 )
BYTES A000 ( 4D0C: LDY #$00 )
BYTES B1D2 ( 4D0E: LDA [$d2],Y )
BYTES 91D4 ( 4D10: STA [$d4],Y )
BYTES C8 ( 4D12: INY )
BYTES CCDC38 ( 4D13: CPY $38dc )
BYTES D0F6 ( 4D16: BNE $4d0e )
BYTES E6D5 ( 4D18: INC $d5 )
BYTES 202039 ( 4D1A: JSR $3920 )
BYTES CA ( 4D1D: DEX )
BYTES D0EC ( 4D1E: BNE $4d0c )
BYTES A6D1 ( 4D20: LDX $d1 )
BYTES 4C470F ( 4D22: JMP $0f47 )
AT 4D25

( w4D2C | NFA 4D25 CFA 4D2C )
( Unknown erased name; CFA identifier )
AT 4D25
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1FF4C
DOCOL
LIT16 4CA1 t.SWAP t.PMBASE@ t.+ t.ZD-PM! LIT8 0D t.3 w4CF3 t.1
t.PAUSE w4D05 t.;S
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
( Trailing native code/data at 4D5C; retained exactly )
BYTES A513E413E413041316167712
AT 4D68

( w4D70 | NFA 4D68 CFA 4D70 )
( Unknown erased name; CFA identifier )
AT 4D68
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C5494D
DOVAR
CELL 0000
AT 4D74

( w4D7C | NFA 4D74 CFA 4D7C )
( Unknown erased name; CFA identifier )
AT 4D74
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000B0684D
DODOES
( DOES> thread at 4D5C )
BYTES 5C4D724D531C3634202020202020
AT 4D8C

( w4D92 | NFA 4D8C CFA 4D92 )
( Unknown erased name; CFA identifier )
AT 4D8C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D0744D
DODOES
( DOES> thread at 4D5C )
BYTES 5C4D724D00000000202020202020
AT 4DA2

( w4DA9 | NFA 4DA2 CFA 4DA9 )
( Unknown erased name; CFA identifier )
AT 4DA2
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C48C4D
DODOES
( DOES> thread at 4D5C )
BYTES 5C4D724D04060F1F202004082020
AT 4DB9

( w4DC1 | NFA 4DB9 CFA 4DC1 )
( Unknown erased name; CFA identifier )
AT 4DB9
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D8A24D
DODOES
( DOES> thread at 4D5C )
BYTES 5C4D724D130E0101202000202020
AT 4DD1

( w4DD8 | NFA 4DD1 CFA 4DD8 )
( Unknown erased name; CFA identifier )
AT 4DD1
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1B94D
DOCOL
t.DUP w4D92 t.C! w4DA9 t.C@ t.* w4D7C t.C@ t.+ t.;S
AT 4DEE

( w4DF4 | NFA 4DEE CFA 4DF4 )
( Unknown erased name; CFA identifier )
AT 4DEE
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1D14D
DOCOL
w4DD8 t.XPM! t.;S
AT 4DFC

( w4E02 | NFA 4DFC CFA 4E02 )
( Unknown erased name; CFA identifier )
AT 4DFC
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1EE4D
DOCOL
t.1 w4D70 t.+! w4DD8 w4D2C LIT16 FFFF w4D70 t.+! t.;S
AT 4E18

( w4E1F | NFA 4E18 CFA 4E1F )
( Unknown erased name; CFA identifier )
AT 4E18
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1FC4D
DOCOL
w4D70 t.@ t.2 t.MOD
t.0BRANCH CELL 0008 ( -> 4E33 )
w4D2C
t.BRANCH CELL 0004 ( -> 4E35 )
( label 4E33 )
t.XPM!
( label 4E35 )
t.;S
AT 4E37

( w4E3E | NFA 4E37 CFA 4E3E )
( Unknown erased name; CFA identifier )
AT 4E37
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000AB184E
DOCOL
t.>R w4D92 t.C@ w4DA9 t.C@ t.* w4D7C t.C@ t.+ t.R t.0=_12DE
t.0BRANCH CELL 000A ( -> 4E62 )
t.R> t.2DROP
t.BRANCH CELL 003A ( -> 4E9A )
( label 4E62 )
t.R t.SWAP t.R t.+ t.DUP w4DA9 t.C@ t.R t.* t.+ t.DUP t.R t.-
t.SWAP t.ROT t.(DO)
( label 4E82 )
t.I w4E1F t.OVER
t.(+LOOP) CELL FFF8 ( -> 4E82 )
t.2DROP w4D92 t.C@ t.R> t.+ w4D92 t.C!
( label 4E9A )
t.;S
AT 4E9C

( w4EA4 | NFA 4E9C CFA 4EA4 )
( Unknown erased name; CFA identifier )
AT 4E9C
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A1374E
DOCOL
t.DUP t.0<_12F3
t.0BRANCH CELL 001A ( -> 4EC6 )
w4D92 t.C@ t.0 t.>
t.0BRANCH CELL 0008 ( -> 4EC0 )
w4E3E
t.BRANCH CELL 0004 ( -> 4EC2 )
( label 4EC0 )
t.DROP
( label 4EC2 )
t.BRANCH CELL 0018 ( -> 4EDC )
( label 4EC6 )
w4D92 t.C@ w4DC1 t.C@ t.<
t.0BRANCH CELL 0008 ( -> 4EDA )
w4E3E
t.BRANCH CELL 0004 ( -> 4EDC )
( label 4EDA )
t.DROP
( label 4EDC )
t.;S
AT 4EDE

( w4EE5 | NFA 4EDE CFA 4EE5 )
( Unknown erased name; CFA identifier )
AT 4EDE
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A19C4E
DOCOL
w4EA4 t.;S
AT 4EEB

( w4EF2 | NFA 4EEB CFA 4EF2 )
( Unknown erased name; CFA identifier )
AT 4EEB
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1DE4E
DOCOL
t.1 w4D70 t.+! w4EA4 LIT16 FFFF w4D70 t.+! t.;S
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

( w4F51 | NFA 4F4B CFA 4F51 )
( Unknown erased name; CFA identifier )
AT 4F4B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D4424F
DODOES
( DOES> thread at 30B4 )
BYTES B430CD14CD14CD14C514474F474F474FC514C514C514C5147712
AT 4F6D

( w4F73 | NFA 4F6D CFA 4F73 )
( Unknown erased name; CFA identifier )
AT 4F6D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D44B4F
DODOES
( DOES> thread at 30B4 )
BYTES B430CD14474FC514C514CD14474FC514C514CD14474FC5147712
AT 4F8F

( w4F98 | NFA 4F8F CFA 4F98 )
( Unknown erased name; CFA identifier )
AT 4F8F
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000D96D4F
DOCOL
LIT16 0005 t.- t.DUP w4F51 t.SWAP w4F73 t.;S
AT 4FAA

( w4FB4 | NFA 4FAA CFA 4FB4 )
( Unknown erased name; CFA identifier )
AT 4FAA
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000CD8F4F
DOCOL
LIT16 003E LIT16 022F t.C! t.1 LIT16 026F t.C! LIT16 00A0
t.PMBASE! t.C-PM t.?COL-PM t.ON-PM w4D92 t.C@ w4DF4 w4D92 t.1+
t.C@ w4E02 t.;S
AT 4FE4

( w4FEB | NFA 4FE4 CFA 4FEB )
( Unknown erased name; CFA identifier )
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

( w5147 | NFA 5140 CFA 5147 )
( Unknown erased name; CFA identifier )
AT 5140
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C0E44F
DOCOL
w4FEB t.C@ t.* t.+ w4FEB t.+ t.2+ t.C@ t.;S
AT 515B

( w5162 | NFA 515B CFA 5162 )
( Unknown erased name; CFA identifier )
AT 515B
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C24051
DOCOL
t.DUP t.@ t.+ t.2+ w4FEB t.<MOVE t.;S
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

( w518C | NFA 5184 CFA 518C )
( Unknown erased name; CFA identifier )
AT 5184
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000B07B51
DOCOL
t.FIRST t.C@ w4DA9 t.C@ t.* t.XR t.+ w4D7C t.C! t.FIRST t.1+
t.C@ t.YR t.+ w4D7C t.1+ t.C! t.;S
AT 51B2

( w51B9 | NFA 51B2 CFA 51B9 )
( Unknown erased name; CFA identifier )
AT 51B2
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D88451
DOCOL
w4FEB t.C@ t.1 t.- w4DC1 t.C! w4FEB t.1+ t.C@ t.1 t.- w4DC1
t.1+ t.C! t.;S
AT 51D9

( w51E0 | NFA 51D9 CFA 51E0 )
( Unknown erased name; CFA identifier )
AT 51D9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D2B251
DOCOL
t.DUP t.>R t.RESOURCE-ADDR t.DUP t.?PCOBJ w518C w5162 t.R> t.2
t.=
t.0BRANCH CELL 000A ( -> 5202 )
t.16 w4FEB t.1+ t.C!
( label 5202 )
w51B9 t.;S
AT 5206

( w520C | NFA 5206 CFA 520C )
( Unknown erased name; CFA identifier )
AT 5206
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C2D951
DOCOL
t.SWAP w438B w4763 t.2+ w4763 t.;S
AT 521A

( w521F | NFA 521A CFA 521F )
( Unknown erased name; CFA identifier )
AT 521A
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C30652
DOVAR
CELL 0000
AT 5223

( w522A | NFA 5223 CFA 522A )
( Unknown erased name; CFA identifier )
AT 5223
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C61A52
DOCOL
t.RESOURCE-ADDR t.DUP t.OUNT t.+ t.1 t.- t.DUP t.C@ t.2 t.MOD
t.0BRANCH CELL 0010 ( -> 5252 )
LIT16 0005 t.- w521F t.!
t.BRANCH CELL 0004 ( -> 5254 )
( label 5252 )
t.DROP
( label 5254 )
t.FIRST t.<MOVE t.;S
AT 525A

( w5261 | NFA 525A CFA 5261 )
( Unknown erased name; CFA identifier )
AT 525A
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D42352
DOCOL
t.RESOURCE-ADDR w4FEB t.<MOVE t.;S
AT 526B

( w5270 | NFA 526B CFA 5270 )
( Unknown erased name; CFA identifier )
AT 526B
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D85A52
DOVAR
CELL 0000
AT 5274

( w5279 | NFA 5274 CFA 5279 )
( Unknown erased name; CFA identifier )
AT 5274
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D96B52
DOVAR
CELL 0000
AT 527D

( w5283 | NFA 527D CFA 5283 )
( Unknown erased name; CFA identifier )
AT 527D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A17452
DOCOL
t.P-CCM LIT16 0006 t.+ t.! t.;S
AT 5291

( w5296 | NFA 5291 CFA 5296 )
( Unknown erased name; CFA identifier )
AT 5291
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C47D52
DOCON
CELL A4E8
AT 529A

( w52A1 | NFA 529A CFA 52A1 )
( Unknown erased name; CFA identifier )
AT 529A
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C69152
DOCOL
t.RESOURCE-ADDR w5296 t.<MOVE w5296 t.2+ t.OXY t.XY-CCM! w5296
t.4 t.+ w5296 t.C@ t.FIRST t.C@ t.- t.DUP w5270 t.! w5296 t.1+
t.C@ t.FIRST t.1+ t.C@ t.- t.DUP w5279 t.! t.FIRST t.2+ t.C@
t.* t.+ t.FIRST t.+ t.4 t.+ t.ZD-CCM! t.FIRST t.2+ t.C@ w5283
t.CCMOV LIT16 0028 w5283 t.;S
AT 5301

( w5308 | NFA 5301 CFA 5308 )
( Unknown erased name; CFA identifier )
AT 5301
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D49A52
DOCOL
t.RCM t.C@ t.SWAP t.0 t.RCM t.C! t.RESOURCE-ADDR t.PAD t.<MOVE
t.PAD t.OXY t.XY-CCM! t.PAD t.2+ w5270 t.@ w5279 t.@
LIT16 0006 t./MOD t.SWAP t.0=_12DE t.0=_12DE t.+ w4FEB t.C@
t.* t.+ w4FEB t.+ t.2+ t.ZD-CCM! w4FEB t.C@ w5283 t.CCMOV
LIT16 0028 w5283 t.RCM t.C! t.;S
AT 5360

( w5366 | NFA 5360 CFA 5366 )
( Unknown erased name; CFA identifier )
AT 5360
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B00153
DOCOL
w415E t.2+ t.;S
AT 536E

( w5374 | NFA 536E CFA 5374 )
( Unknown erased name; CFA identifier )
AT 536E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DA6053
DOCOL
LIT16 5368 t.CFA LIT16 3F0B t.! t.2 t.RCM t.C! t.;S
AT 538A

( w5390 | NFA 538A CFA 5390 )
( Unknown erased name; CFA identifier )
AT 538A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000BE6E53
DOCOL
LIT16 3EE5 t.CFA LIT16 3F0B t.! t.0 t.RCM t.C! t.;S
AT 53A6

( w53B0 | NFA 53A6 CFA 53B0 )
( Unknown erased name; CFA identifier )
AT 53A6
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C28A53
CELL 53B2 ( native entry point )
BYTES B501 ( 53B2: LDA $01,X )
BYTES CA ( 53B4: DEX )
BYTES CA ( 53B5: DEX )
BYTES 9500 ( 53B6: STA $00,X )
BYTES A900 ( 53B8: LDA #$00 )
BYTES 9503 ( 53BA: STA $03,X )
BYTES 9501 ( 53BC: STA $01,X )
BYTES 4C470F ( 53BE: JMP $0f47 )
AT 53C1

( w53C9 | NFA 53C1 CFA 53C9 )
( Unknown erased name; CFA identifier )
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

( w540C | NFA 5404 CFA 540C )
( Unknown erased name; CFA identifier )
AT 5404
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000B1C153
DOVAR
BYTES EAEAEAEA20E554EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEA
BYTES EAEAEA4C6F5F20
AT 5431

( w5438 | NFA 5431 CFA 5438 )
( Unknown erased name; CFA identifier )
AT 5431
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000B10454
DOCOL
w540C w53C9 t.;S
AT 5440

( w5448 | NFA 5440 CFA 5448 )
( Unknown erased name; CFA identifier )
AT 5440
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A93154
CELL 544A ( native entry point )
BYTES 4C62E4 ( 544A: JMP $e462 )
AT 544D

( RUN-VBI1 | NFA 544D CFA 5457 )
( GAM FORTH 09_A_Forth.TXT SCR 27 native implementation: )
( SETVBV deferred-VBI vector $540F, matching the $VBI1 )
( handler )
AT 544D
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000B14054
CELL 5459 ( native entry point )
BYTES 86D1 ( 5459: STX $d1 )
BYTES A254 ( 545B: LDX #$54 )
BYTES A00F ( 545D: LDY #$0f )
BYTES A907 ( 545F: LDA #$07 )
BYTES 205CE4 ( 5461: JSR $e45c )
BYTES A6D1 ( 5464: LDX $d1 )
BYTES 4C470F ( 5466: JMP $0f47 )
AT 5469

( STOP-VBI1 | NFA 5469 CFA 5474 )
( GAM FORTH 09_A_Forth.TXT SCR 27 native implementation: )
( SETVBV deferred-VBI vector $E462 [OS default] )
AT 5469
( Saved dictionary header: flags, name bytes, link )
BYTES 8800000000000000B14D54
CELL 5476 ( native entry point )
BYTES 86D1 ( 5476: STX $d1 )
BYTES A2E4 ( 5478: LDX #$e4 )
BYTES A062 ( 547A: LDY #$62 )
BYTES A907 ( 547C: LDA #$07 )
BYTES 205CE4 ( 547E: JSR $e45c )
BYTES A6D1 ( 5481: LDX $d1 )
BYTES 4C470F ( 5483: JMP $0f47 )
AT 5486

( w548C | NFA 5486 CFA 548C )
( Unknown erased name; CFA identifier )
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

( w549E | NFA 5499 CFA 549E )
( Unknown erased name; CFA identifier )
AT 5499
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A59054
DOCON
CELL 00DF
AT 54A2

( w54A9 | NFA 54A2 CFA 54A9 )
( Unknown erased name; CFA identifier )
AT 54A2
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A99954
CELL 54AB ( native entry point )
BYTES AE8F54 ( 54AB: LDX $548f )
BYTES A000 ( 54AE: LDY #$00 )
BYTES E000 ( 54B0: CPX #$00 )
BYTES F00E ( 54B2: BEQ $54c2 )
BYTES B1DD ( 54B4: LDA [$dd],Y )
BYTES 91DF ( 54B6: STA [$df],Y )
BYTES 88 ( 54B8: DEY )
BYTES D0F9 ( 54B9: BNE $54b4 )
BYTES E6DE ( 54BB: INC $de )
BYTES E6E0 ( 54BD: INC $e0 )
BYTES CA ( 54BF: DEX )
BYTES D0F2 ( 54C0: BNE $54b4 )
BYTES AD8E54 ( 54C2: LDA $548e )
BYTES F00C ( 54C5: BEQ $54d3 )
BYTES AC8E54 ( 54C7: LDY $548e )
BYTES 88 ( 54CA: DEY )
BYTES B1DD ( 54CB: LDA [$dd],Y )
BYTES 91DF ( 54CD: STA [$df],Y )
BYTES C000 ( 54CF: CPY #$00 )
BYTES D0F7 ( 54D1: BNE $54ca )
BYTES 60 ( 54D3: RTS )
AT 54D4

( w54D9 | NFA 54D4 CFA 54D9 )
( Unknown erased name; CFA identifier )
AT 54D4
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C4A254
DOVAR
CELL 0000
AT 54DD

( w54E3 | NFA 54DD CFA 54E3 )
( Unknown erased name; CFA identifier )
AT 54DD
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D6D454
CELL 54E5 ( native entry point )
BYTES ADDB54 ( 54E5: LDA $54db )
BYTES F021 ( 54E8: BEQ $550b )
BYTES 86D1 ( 54EA: STX $d1 )
BYTES A960 ( 54EC: LDA #$60 )
BYTES 8D0ED4 ( 54EE: STA $d40e )
BYTES A9FE ( 54F1: LDA #$fe )
BYTES 8D01D3 ( 54F3: STA $d301 )
BYTES 20AB54 ( 54F6: JSR $54ab )
BYTES A9FF ( 54F9: LDA #$ff )
BYTES 8D01D3 ( 54FB: STA $d301 )
BYTES AD3140 ( 54FE: LDA $4031 )
BYTES 8D0ED4 ( 5501: STA $d40e )
BYTES A6D1 ( 5504: LDX $d1 )
BYTES A900 ( 5506: LDA #$00 )
BYTES 8DDB54 ( 5508: STA $54db )
BYTES 60 ( 550B: RTS )
AT 550C

( w5514 | NFA 550C CFA 5514 )
( Unknown erased name; CFA identifier )
AT 550C
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C5DD54
DOCOL
w548C t.! w549E t.! t.Z% t.! t.1 w54D9 t.!
( label 5528 )
w54D9 t.C@ t.0=_12DE
t.0BRANCH CELL FFF8 ( -> 5528 )
t.;S
AT 5534

( w553A | NFA 5534 CFA 553A )
( Unknown erased name; CFA identifier )
AT 5534
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DA0C55
DOCON
CELL 0015
AT 553E

( w5544 | NFA 553E CFA 5544 )
( Unknown erased name; CFA identifier )
AT 553E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DA3455
DOCON
CELL 0017
AT 5548

( w554E | NFA 5548 CFA 554E )
( Unknown erased name; CFA identifier )
AT 5548
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC3E55
DOVAR
CELL 0000
AT 5552

( w5558 | NFA 5552 CFA 5558 )
( Unknown erased name; CFA identifier )
AT 5552
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC4855
DOCON
CELL 1200
AT 555C

( w5563 | NFA 555C CFA 5563 )
( Unknown erased name; CFA identifier )
AT 555C
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000B05255
DOVAR
CELL D800
AT 5567

( w556D | NFA 5567 CFA 556D )
( Unknown erased name; CFA identifier )
AT 5567
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B05C55
DOCOL
w5563 t.@ t.;S
AT 5575

( w557C | NFA 5575 CFA 557C )
( Unknown erased name; CFA identifier )
AT 5575
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C16755
DOCOL
w554E t.@ w4154 t.* w556D t.+ t.;S
AT 558C

( w5594 | NFA 558C CFA 5594 )
( Unknown erased name; CFA identifier )
AT 558C
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C17555
DOCOL
w415E w557C w4154 w5514 t.;S
AT 55A0

( w55A8 | NFA 55A0 CFA 55A8 )
( Unknown erased name; CFA identifier )
AT 55A0
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000DA8C55
DOCOL
w557C w415E w4154 w5514 t.;S
AT 55B4

( w55BA | NFA 55B4 CFA 55BA )
( Unknown erased name; CFA identifier )
AT 55B4
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CCA055
DOCOL
t.0 t.RESOURCE-ADDR w5558 LIT8 80 t./ t.ROT w4AC8 t.;S
AT 55CD

( w55D3 | NFA 55CD CFA 55D3 )
( Unknown erased name; CFA identifier )
AT 55CD
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D6B455
DOCOL
LIT8 09 t.0 t.(DO)
( label 55DC )
t.2DUP w4154 w5514 t.SWAP w4154 t.+ t.SWAP w4154 t.+
t.(LOOP) CELL FFEC ( -> 55DC )
t.2DROP t.;S
AT 55F6

( w55FE | NFA 55F6 CFA 55FE )
( Unknown erased name; CFA identifier )
AT 55F6
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A9CD55
DOCOL
t.0 w4ABC t.! w556D t.0 t.RESOURCE-ADDR w55D3 w55BA t.;S
AT 5612

( w561A | NFA 5612 CFA 561A )
( Unknown erased name; CFA identifier )
AT 5612
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A9F655
DOCOL
t.1 w4ABC t.! w55BA t.0 t.RESOURCE-ADDR w556D w55D3 t.;S
AT 562E

( w5634 | NFA 562E CFA 5634 )
( Unknown erased name; CFA identifier )
AT 562E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C11256
DOCOL
w5544 w55FE w5594 t.;S
AT 563E

( w5644 | NFA 563E CFA 5644 )
( Unknown erased name; CFA identifier )
AT 563E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C12E56
DOCOL
w5544 w561A w55A8 t.;S
AT 564E

( w5655 | NFA 564E CFA 5655 )
( Unknown erased name; CFA identifier )
AT 564E
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D03E56
DOCOL
w553A w561A w55A8 t.;S
AT 565F

( w5665 | NFA 565F CFA 5665 )
( Unknown erased name; CFA identifier )
AT 565F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CC4E56
DOCOL
t.4 t./ t.;S
AT 566D

( w5674 | NFA 566D CFA 5674 )
( Unknown erased name; CFA identifier )
AT 566D
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A95F56
DOCOL
w5374 LIT8 66 t.- t.DUP w5665 w554E t.@ t.= t.0=_12DE
t.0BRANCH CELL 0010 ( -> 569B )
t.CLEAR-TEXT-AREA w5594 t.DUP w5665 w554E t.! w55A8
( label 569B )
t.4 t.MOD t.;S
AT 56A1

( w56A7 | NFA 56A1 CFA 56A7 )
( Unknown erased name; CFA identifier )
AT 56A1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D76D56
DOCOL
t.DUP LIT8 64 t.>
t.0BRANCH CELL 0004 ( -> 56B6 )
w5674
( label 56B6 )
t.2 t.* w498F t.+ t.;S
AT 56C0

( w56C5 | NFA 56C0 CFA 56C5 )
( Unknown erased name; CFA identifier )
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

( w5700 | NFA 56F7 CFA 5700 )
( Unknown erased name; CFA identifier )
AT 56F7
( Saved dictionary header: flags, name bytes, link )
BYTES 85000000003AA0C056
DOCOL
t.<BUILDS w56C5 t.DOES>
( Trailing native code/data at 5708; retained exactly )
BYTES FE1871307712
AT 570E

( w5714 | NFA 570E CFA 5714 )
( Unknown erased name; CFA identifier )
AT 570E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CCF756
DODOES
( DOES> thread at 5708 )
BYTES 0857101C2C3C2736370E0F020607202226212F
AT 5729

( w5730 | NFA 5729 CFA 5730 )
( Unknown erased name; CFA identifier )
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
LIT16 02FC t.C@ t.DUP w5714 t.0=_12DE t.SWAP t.64 t.< t.*
t.0BRANCH CELL FFD7 ( -> 573B )
t.KEY t.;S
AT 576A

( w5770 | NFA 576A CFA 5770 )
( Unknown erased name; CFA identifier )
AT 576A
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D82957
DOVAR
CELL 0000
AT 5774

( w577A | NFA 5774 CFA 577A )
( Unknown erased name; CFA identifier )
AT 5774
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D96A57
DOCOL
t.OVER t.C@ t.0 t.> t.OVER LIT8 7E t.= t.*
t.0BRANCH CELL 0010 ( -> 579F )
( ATASCII text: .=. )
t.(.")
BYTES 031E3D1E
t.OVER t.-1 t.SWAP w4732
( label 579F )
t.;S
AT 57A1

( w57A7 | NFA 57A1 CFA 57A7 )
( Unknown erased name; CFA identifier )
AT 57A1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D27457
DOCOL
t.OVER t.C@ w5770 t.@ t.< t.OVER LIT8 7E t.= t.0=_12DE t.*
t.OVER LIT8 9B t.= t.0=_12DE t.*
t.0BRANCH CELL 0018 ( -> 57E3 )
t.DUP t.EMIT t.2DUP t.SWAP t.COUNT t.+ t.C! t.OVER t.1 t.SWAP
w4732
( label 57E3 )
t.;S
AT 57E5

( w57EE | NFA 57E5 CFA 57EE )
( Unknown erased name; CFA identifier )
AT 57E5
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000A4A157
DOCOL
t.SWAP w5770 t.! t.0 t.OVER t.C!
( label 57FC )
w5730 w577A w57A7 LIT8 9B t.= t.OVER t.C@ t.*
t.0BRANCH CELL FFED ( -> 57FC )
t.DROP t.;S
AT 5815

( w581A | NFA 5815 CFA 581A )
( Unknown erased name; CFA identifier )
AT 5815
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D0E557
DOVAR
BYTES 000005414C4C4F5420202020
AT 5828

( w582D | NFA 5828 CFA 582D )
( Unknown erased name; CFA identifier )
AT 5828
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D01558
DOCOL
w581A t.C@ LIT16 000A t.<
t.0BRANCH CELL 0014 ( -> 584F )
w581A t.C@ t.2+ w581A t.+ t.! t.2 w581A w4732
( label 584F )
t.;S
AT 5851

( w5855 | NFA 5851 CFA 5855 )
( Unknown erased name; CFA identifier )
AT 5851
( Saved dictionary header: flags, name bytes, link )
BYTES 81D02858
DOCOL
w581A t.DUP t.C@ t.+ t.@ t.;S
AT 5863

( w5868 | NFA 5863 CFA 5868 )
( Unknown erased name; CFA identifier )
AT 5863
( Saved dictionary header: flags, name bytes, link )
BYTES 8200BE5158
DOCOL
w581A t.C@ w581A t.+ t.@ w581A t.C@
t.0BRANCH CELL 000A ( -> 5884 )
LIT16 FFFE w581A w4732
( label 5884 )
t.;S
AT 5886

( w588D | NFA 5886 CFA 588D )
( Unknown erased name; CFA identifier )
AT 5886
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000B16358
DOCOL
t.DUP t.>R w522A t.R t.1+ w5261 w4369 t.@ w5855 w520C t.OUNT
t.0 t.(DO)
( label 58A9 )
t.DUP t.I t.+ t.C@ t.DUP w56A7 t.SWAP
t.0BRANCH CELL 0010 ( -> 58C9 )
t.DUP w52A1 t.1+ w5308 w5390
t.BRANCH CELL 0004 ( -> 58CB )
( label 58C9 )
t.DROP
( label 58CB )
t.(LOOP) CELL FFDC ( -> 58A9 )
t.DROP w521F t.@ t.ADC t.@ t.3 t.CMOVE w518C t.R> t.2 t.=
t.0BRANCH CELL 000A ( -> 58F1 )
t.16 w4FEB t.1+ t.C!
( label 58F1 )
w51B9 t.;S
AT 58F5

( w58FD | NFA 58F5 CFA 58FD )
( Unknown erased name; CFA identifier )
AT 58F5
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000DA8658
DOCOL
w5390 w588D t.FIRST t.?POBJ t.;S
AT 5909

( w590E | NFA 5909 CFA 590E )
( Unknown erased name; CFA identifier )
AT 5909
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B2F558
DOCOL
t.>R t.R t.1+ t.C! t.R> t.C! t.;S
AT 591E

( w5923 | NFA 591E CFA 5923 )
( Unknown erased name; CFA identifier )
AT 591E
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B20959
DOCOL
t.>R t.R t.C@ t.R> t.1+ t.C@ t.;S
AT 5933

( w5939 | NFA 5933 CFA 5939 )
( Unknown erased name; CFA identifier )
AT 5933
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D91E59
DODOES
( DOES> thread at 4144 )
BYTES 4441202020202020202020202020
AT 5949

( w594E | NFA 5949 CFA 594E )
( Unknown erased name; CFA identifier )
AT 5949
( Saved dictionary header: flags, name bytes, link )
BYTES 8200B03359
DOCOL
t.0 w4D70 t.! t.;S
AT 5958

( w595D | NFA 5958 CFA 595D )
( Unknown erased name; CFA identifier )
AT 5958
( Saved dictionary header: flags, name bytes, link )
BYTES 8200AB4959
DOCOL
w581A t.C@ t.2 t./ t.;S
AT 5969

( w596F | NFA 5969 CFA 596F )
( Unknown erased name; CFA identifier )
AT 5969
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D35859
DOCOL
w4FEB w5923 t.2 t./ t.SWAP t.2 t./ t.SWAP w4D92 w590E t.;S
AT 5987

( w598D | NFA 5987 CFA 598D )
( Unknown erased name; CFA identifier )
AT 5987
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C26959
DOCOL
w594E t.DUP w582D w56A7 w58FD w596F t.;S
AT 599D

( w59A3 | NFA 599D CFA 59A3 )
( Unknown erased name; CFA identifier )
AT 599D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C28759
DOCOL
w594E w5868 t.DROP w5855 w56A7 w58FD w595D w5939 w5923 w4D92
w590E t.;S
AT 59BD

( w59C3 | NFA 59BD CFA 59C3 )
( Unknown erased name; CFA identifier )
AT 59BD
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C29D59
DOCOL
w594E w5855 w56A7 w58FD t.;S
AT 59CF

( w59D4 | NFA 59CF CFA 59D4 )
( Unknown erased name; CFA identifier )
AT 59CF
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CBBD59
DOCON
CELL 000D
AT 59D8

( w59DF | NFA 59D8 CFA 59DF )
( Unknown erased name; CFA identifier )
AT 59D8
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000DACF59
DOVAR
CELL 0001
AT 59E3

( w59E9 | NFA 59E3 CFA 59E9 )
( Unknown erased name; CFA identifier )
AT 59E3
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CBD859
DOCOL
t.DUP w59D4 t.>
t.0BRANCH CELL 000C ( -> 59FF )
w59D4 t.- t.2
t.BRANCH CELL 0008 ( -> 5A05 )
( label 59FF )
w499A t.+ t.1
( label 5A05 )
t.;S
AT 5A07

( w5A0C | NFA 5A07 CFA 5A0C )
( Unknown erased name; CFA identifier )
AT 5A07
( Saved dictionary header: flags, name bytes, link )
BYTES 8200BEE359
DOCOL
LIT8 15 t.OVER t.C! t.1+ LIT8 13 LIT8 55 t.FILL t.;S
AT 5A21

( w5A27 | NFA 5A21 CFA 5A27 )
( Unknown erased name; CFA identifier )
AT 5A21
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C2075A
DOCOL
t.ADGR t.@ LIT16 014A t.+ t.DUP LIT8 28 LIT8 57 t.* t.+
LIT16 06E0 t.0 t.(DO)
( label 5A47 )
t.OVER t.I t.+ w5A0C t.DUP t.I t.- w5A0C LIT8 28
t.(+LOOP) CELL FFEB ( -> 5A47 )
t.2DROP t.;S
AT 5A62

( w5A67 | NFA 5A62 CFA 5A67 )
( Unknown erased name; CFA identifier )
AT 5A62
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C6215A
DOCON
CELL 0960
AT 5A6B

( w5A70 | NFA 5A6B CFA 5A70 )
( Unknown erased name; CFA identifier )
AT 5A6B
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C6625A
DOCON
CELL 0974
AT 5A74

( w5A7B | NFA 5A74 CFA 5A7B )
( Unknown erased name; CFA identifier )
AT 5A74
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000DE6B5A
DOCOL
t.ADGR t.@ LIT16 0802 t.+ t.DUP LIT8 28 t.+ LIT16 0370 t.0
t.(DO)
( label 5A96 )
t.OVER w5A67 t.I t.- t.SWAP t.I t.2 t.* t.- LIT8 14 t.CMOVE
w5A70 t.I t.+ t.OVER t.I t.2 t.* t.+ LIT8 14 t.CMOVE LIT8 14
t.(+LOOP) CELL FFCF ( -> 5A96 )
t.2DROP t.;S
AT 5ACD

( w5AD4 | NFA 5ACD CFA 5AD4 )
( Unknown erased name; CFA identifier )
AT 5ACD
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000DE745A
DOCOL
w594E t.DUP w582D w56A7 w588D w5A7B w596F t.;S
AT 5AE6

( w5AEC | NFA 5AE6 CFA 5AEC )
( Unknown erased name; CFA identifier )
AT 5AE6
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CDCD5A
DOCOL
t.0 w581A t.! t.DUP w4369 t.! w59E9 w4A6F t.! w4B95 w59DF t.@
t.0=_12DE
t.0BRANCH CELL 0004 ( -> 5B0E )
w5A27
( label 5B0E )
t.0 w5AD4 t.;S
AT 5B14

( w5B1A | NFA 5B14 CFA 5B1A )
( Unknown erased name; CFA identifier )
AT 5B14
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C2E65A
DOCOL
t.C@ t.DUP LIT8 70 t.AND t.16 t./ t.SWAP LIT8 07 t.AND t.;S
AT 5B32

( w5B37 | NFA 5B32 CFA 5B37 )
( Unknown erased name; CFA identifier )
AT 5B32
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D8145B
DOCON
CELL 000A
AT 5B3B

( w5B41 | NFA 5B3B CFA 5B41 )
( Unknown erased name; CFA identifier )
AT 5B3B
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C9325B
DODOES
( DOES> thread at 412C )
BYTES 2C4119161F000F2426262620
AT 5B4F

( w5B55 | NFA 5B4F CFA 5B55 )
( Unknown erased name; CFA identifier )
AT 5B4F
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D83B5B
DODOES
( DOES> thread at 412C )
BYTES 2C411E19240E162527272720
AT 5B63

( w5B69 | NFA 5B63 CFA 5B69 )
( Unknown erased name; CFA identifier )
AT 5B63
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C34F5B
DOCOL
t.8 t.* w3F37 t.+ t.P-CCM t.! t.;S
AT 5B79

( w5B80 | NFA 5B79 CFA 5B80 )
( Unknown erased name; CFA identifier )
AT 5B79
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C7635B
DOCOL
LIT8 28 t.* t.+ t.ADGR t.@ t.+ t.P-CCM t.2+ t.! t.;S
AT 5B97

( w5B9E | NFA 5B97 CFA 5B9E )
( Unknown erased name; CFA identifier )
AT 5B97
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D0795B
DOCOL
w4584 t.DUP t.1+ t.C@ t.8 t.AND
t.0BRANCH CELL 003C ( -> 5BEA )
t.>R t.1 t.8 t.XY-CCM! t.R w5B1A t.8 t.* LIT8 1E t.+ t.SWAP
LIT8 20 t.+ t.SWAP w5B80 t.R> t.1+ w5B1A t.SWAP t.1+ w5B69
t.CCMOV LIT16 0005 t.+ w5B69
t.BRANCH CELL 0004 ( -> 5BEC )
( label 5BEA )
t.DROP
( label 5BEC )
t.;S
AT 5BEE

( w5BF6 | NFA 5BEE CFA 5BF6 )
( Unknown erased name; CFA identifier )
AT 5BEE
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000AB975B
DOCOL
t.DUP w4584 t.1+ t.DUP t.C@ t.8 t.OR t.SWAP t.C! w5B9E t.1
t.RCM t.C! t.CCMOV t.0 t.RCM t.C! t.;S
AT 5C1C

( w5C22 | NFA 5C1C CFA 5C22 )
( Unknown erased name; CFA identifier )
AT 5C1C
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B1EE5B
DOCON
CELL 000E
AT 5C26

( w5C2C | NFA 5C26 CFA 5C2C )
( Unknown erased name; CFA identifier )
AT 5C26
( Saved dictionary header: flags, name bytes, link )
BYTES 830000B21C5C
DOCON
CELL 001E
AT 5C30

( w5C36 | NFA 5C30 CFA 5C36 )
( Unknown erased name; CFA identifier )
AT 5C30
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D0265C
DOCOL
t.DUP w5C22 t.= t.OVER w5C2C t.= t.+
t.0BRANCH CELL 000C ( -> 5C54 )
t.DROP w466D t.@
t.BRANCH CELL 002A ( -> 5C7C )
( label 5C54 )
w5B37 t.0 t.(DO)
( label 5C5A )
t.I w5B41 t.C@ t.1 t.- t.OVER t.I w5B55 t.C@ t.<=<
t.0BRANCH CELL 0008 ( -> 5C78 )
t.DROP t.I t.LEAVE
( label 5C78 )
t.(LOOP) CELL FFE0 ( -> 5C5A )
( label 5C7C )
t.;S
AT 5C7E

( w5C86 | NFA 5C7E CFA 5C86 )
( Unknown erased name; CFA identifier )
AT 5C7E
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000DA305C
DOCOL
t.1 t.8 t.XY-CCM! w466D t.@ LIT8 0A t./MOD LIT8 46 t.+ w5B69
LIT8 22 LIT8 12 w5B80 t.CCMOV LIT8 46 t.+ w5B69 LIT8 23
LIT8 12 w5B80 t.CCMOV t.;S
AT 5CBB

( w5CC2 | NFA 5CBB CFA 5CC2 )
( Unknown erased name; CFA identifier )
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

( w5CF6 | NFA 5CEF CFA 5CF6 )
( Unknown erased name; CFA identifier )
AT 5CEF
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C1BB5C
DOCOL
w466D t.@ t.DUP w5B55 t.C@ t.SWAP w5B41 t.C@ t.(DO)
( label 5D0A )
t.I w5B9E
t.(LOOP) CELL FFFA ( -> 5D0A )
w466D t.@
t.0BRANCH CELL 0006 ( -> 5D1E )
w5C22 w5B9E
( label 5D1E )
w466D t.@ t.3 t.<
t.0BRANCH CELL 0006 ( -> 5D2E )
w5C2C w5B9E
( label 5D2E )
t.;S
AT 5D30

( w5D36 | NFA 5D30 CFA 5D36 )
( Unknown erased name; CFA identifier )
AT 5D30
( Saved dictionary header: flags, name bytes, link )
BYTES 830000ABEF5C
DOCOL
t.Y@ t.1+ t.Y! t.;S
AT 5D40

( w5D46 | NFA 5D40 CFA 5D46 )
( Unknown erased name; CFA identifier )
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

( w5D75 | NFA 5D6C CFA 5D75 )
( Unknown erased name; CFA identifier )
AT 5D6C
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000C5405D
DOCOL
t.COUNT t.0 t.(DO)
( label 5D7D )
t.DUP t.COUNT LIT16 0014 t.OVER t.2 t./ t.- t.X! t.STYPE w5D36
t.COUNT t.+
t.(LOOP) CELL FFE4 ( -> 5D7D )
t.DROP t.;S
AT 5D9F

( w5DA6 | NFA 5D9F CFA 5DA6 )
( Unknown erased name; CFA identifier )
AT 5D9F
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D56C5D
DOCON
CELL 0E74
AT 5DAA

( w5DB3 | NFA 5DAA CFA 5DB3 )
( Unknown erased name; CFA identifier )
AT 5DAA
( Saved dictionary header: flags, name bytes, link )
BYTES 860000000000C49F5D
DOVAR
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000FFFF005E262C000000000000000000
BYTES A9988D3560A9668D3660202F654C526588A1016F9E01060C12182430
BYTES 48605000000000000000000201030405090600060606060686000000
BYTES 00000001010101010101010101010101010101010100000000000000
BYTES 00000000000000010100000000000000000000000000000000000000
BYTES 000000019C9C9C9C9C9C9C9CFAFAFAFAFAFAFAFA192A3C4E00000000
BYTES 78000000000000004E63000000000000BE6000000000000092000000
BYTES 00000000FC6060606060606060606060606060606061616262000000
BYTES 00610000000000000061610000000000006162000000000000610000
BYTES 00000000006101030680010101010000000000070025661E66020407
BYTES 0303060000010000000000060BE001010101002F0000012F00476634
BYTES 66040D1104060600020300000000000306E001010101000000000151
BYTES 000D660066020A0B01030600040500000000010000E0000101020000
BYTES 0000002300385E3E5E00000000000000060700000000AD1E5EF0034C
BYTES E162A9008D035E8D045E8D055E8D065E8D075E8D025EAD35608D985F
BYTES AD36608D995FAD8FA18D015E293F4A4A4AAA18BD305E6D985F8D985F
BYTES A9006D995F8D995FAD015E29C0CD075E9028D005AD025ED021AD015E
BYTES 293FAABD445E8D025EAD015E29C08D075E182A2A2AAAA9019D035E4C
BYTES 975FA9008D005EAD035EF00BADEF5E49010D005E8D005EAD045EF00B
BYTES AD0F5F49010D005E8D005EAD055EF00BAD2F5F49010D005E8D005EAD
BYTES 065EF00BAD4F5F49010D005E8D005EAD005EF00F4C9362AD88A1EE35
BYTES 60D003EE366060A9008D075E8D025EAD35608D195EAD36608D1A5E20
BYTES 34608D015E29C04ACD075E902BD005AD025ED024AD015E293FAABD44
BYTES 5E8D025EAD015E29C04A8D075EBD7D5E8D8B60BDB65E8D8C604C9C60
BYTES AD195E8D3560AD1A5E8D36604C9362203460AE075E9DFC5EA9009D08
BYTES 5F9D055F9DEF5E9D045FBDF35ED014AD015E2907A8B91F5E9D065FA9
BYTES 039D075F4C4860AD015E2907A8B91F5EDDF15EB0119D065FBD025F9D
BYTES 045FA9039D075F4C486038FDF05E9D065FA9029D075F4C4860AE075E
BYTES A9009DEF5E9D055FA9019D075FAD015E2907A8B91F5E9D065F4C4860
BYTES 203460482034608D3660688D35604CE1622034604820346048AD3560
BYTES 8D1C5EAD36608D1D5EA9018D1B5E688D3660688D35604CE162203460
BYTES AA203460DD275EF0BF2034602034604C4860203460AA203460DD275E
BYTES F0BB2034602034604C48602034608D8D612034608D8E612034608D8B
BYTES 61A9018DE2004C4860AE075E2034609DFE5E2034609DFF5E2034609D
BYTES 005F2034609D015F2034609D045F9D025FA9009DF35E4C4860AE075E
BYTES 2034609DFE5E2034609DFF5E2034609D005F2034609D015F2034609D
BYTES 045F9D025F2034609D035F2034609DF05E2034609DF15EA9019DF35E
BYTES 4C4860AD1B5EF014AD1C5E8D3560AD1D5E8D3660A9008D1B5E4C6F5F
BYTES ADEF5E2D0F5F2D2F5F2D4F5FF016AD085F0D285F0D485F0D685FD008
BYTES A9018D1E5E4CE1624C8D60AE075E2034609DF45E2034609DF55E4C48
BYTES 60AE075E2034609DF95E2034609DF85E4C48602034608D1F5E203460
BYTES 8D205E2034608D215E2034608D225E2034608D235E2034608D245E20
BYTES 34608D255E2034608D265E4C4860A9038D0FD2A9008D08D2A2008E1A
BYTES 63E88E10638E2764A200205164A220A0028C1A63C88C10638C276420
BYTES 5164A240A0048C1A63C88C27648C1063205164A260A0068C1A63C88C
BYTES 10638C27642051644C8AC2EABDFE5E8D0163BDFF5E8D0263BD005F8D
BYTES 1363BD015F8D1463BC045FB90D668D005E293F187DFA5E1DF25E8D07
BYTES D2B90066187DFC5E8D06D2FE055FFE045F60FE055FBD055FDD065FD0
BYTES 05A9019DEF5E4C0164BDF75EF006BD025F9D045FA9059D075F20E462
BYTES BD065FDD055FF00DAD005E300160BD025F9D045F60BDF95EF01C9DF7
BYTES 5EA9009DF95E9D055FA9079D075FBDF05E9D065FAD005E30D960A900
BYTES 9D055FA9069D075FBDF05E9D065FBD035F9D045F60209A65AD005E30
BYTES 01604CCF6320E462BD065FDD055FF0F2AD005E30A56020E462BD065F
BYTES DD055FF006AD005E309460BDF95E9DF75EA9009DF95EA9019DEF5EBD
BYTES F75EF00EA9029D085FAD005E10034C576360BDF45EF00F9DFB5EBDF5
BYTES 5E9DF65EA9019D085F60A9009D085F60BD085FD00160C901D01FDEF6
BYTES 5ED010BDF55E9DF65EDEFB5ED005A9009D085FBDF25E1DFB5E8D07D2
BYTES 6020E462AD005E1006BD025F9D045FDE055FBDFC5E187DF75E9DFC5E
BYTES DDF85EF00160A9009DF75E60BDFD5EF00BA90C8D1A638D10638D2764
BYTES BDEF5EF0034C0164BC075FB97B648D7964B983648D7A644C9663EA23
BYTES 36B3004696A2EA6363630063636305354544855B053C45518560052D
BYTES 453C85480328452F853C031D0723472D873C0F108B25010000E00001
BYTES 010200000000002300381F3E1F000000000000000001000000000100
BYTES 00E00001010200000000002300381F3E1F0000000000000002030000
BYTES 0000010000E00001010200000000002300381F3E1F00000000000000
BYTES 040500000000010000E00001010200000000002300381F3E1F000000
BYTES 00000000060700000000A9008D1B5EA9018D1E5EA27FBDAF649DEF5E
BYTES CA10F7A200BD8A659D1F5EE8E010D0F560A9018542A2FFA06488D0FD
BYTES CAD0F8AD085EC9B2F01BAD24028DE262AD25028DE362A96F8D2402A9
BYTES 5F8D2502A9B28D085EA9008542EAEAEA6004080C1018203040000000
BYTES 000000000020E462A9009DF75E606C0A00FFFF000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000101010101
BYTES 01000000000000000203040404040404048402028100000585000000
BYTES 00FE01FE020405850303820000000003060686010100000000000000
BYTES 00000000000000000000030605050404050506060504840302020101
BYTES 81000000000000000000000003030303030202020282820000000202
BYTES 030405068600000000000000000003060A0E08870302810002FE0200
BYTES 000E0E0E0E0F8A29020406080C101820189962002100011767210002
BYTES 346721000751672100086B6721000A866721000BC76721000CA66721
BYTES 000E346721000FFA6721001017672100134568210014596821001572
BYTES 682100168C68210019356921001CA06821001FB468210020CF682100
BYTES 21EA682100230E69210028E267210050CC691098663818275E0018F2
BYTES 5EA0307566706603130113000E093092668C660400133818F25EA030
BYTES 756670660313FF0E0013093092668C6604000E18275E003818F25EA0
BYTES 2883667A660406030813FF0B001108000B18275E003818F25E803075
BYTES 66706603000D0007000500090005000118275E003852080318F25E80
BYTES 58125FA03092668C66047092668C6604000B410718275E0038307566
BYTES 70660318F25E8018FA5E0213010F0005083092668C6604000F18275E
BYTES 003830756670660318F25E8018FA5E0213FF05000F08000518275E00
BYTES 3818F25E20301C661A660013FF07001B0D09000718275E003858125F
BYTES A098325FA07092668C6604B092668C66045208019208014717871A47
BYTES 1F87234717871A471F87234717871A471F872318275E003858125F80
BYTES 7092668C6604520801400718275E00386883667A660406030858125F
BYTES C0454858275E00387092668C660458125FA0401D401F401A40234017
BYTES 58275E003858275E0058125FA06883667A6604060308520604430F4D
BYTES 40113818F25E802883667A6604060308000518275E003858125F8070
BYTES 7566706603520601400718275E003818FA5E0330756670660318F25E
BYTES A0130151003C09005118275E003818FA5E0330756670660318F25EA0
BYTES 13FF3C005109003C18275E003830756670660318F25EA01301050107
BYTES 0D2883667A660406030818F25E80000518275E003829102030406080
BYTES C0FF6865665A66000A010258275E0058125F40471547154715471547
BYTES 15471538290810182030406080189962012847663466040D060B6847
BYTES 663466040D060BA883667A660406030818F25EA058125FA098325FA0
BYTES 03354523833503398339033543238335033543238335042D44218444
BYTES 016741218135052F4523854809432D8335012D012D41238139012F43
BYTES 238535012D0123432D0123031A452885830317051B452F8548290204
BYTES 06080C1018201899620018275E003829060C12182430489F18F25E80
BYTES 2825661E66020403066847663466040D060BA80D660066020A03060B
BYTES 413C8B41484140413C0005442F8451090107000F4035806008403C80
BYTES 79000153FF2F432F839018E20001817981600005442F845109010700
BYTES 0F402F806008402F8079000143488390080007080007413C8179413C
BYTES 8160000544288490090107000F402F80600840358079000153FF2F43
BYTES 2F839018E20001817981600003442F8451090107000F402F80600840
BYTES 2F80790001413C83900007414808000741408179413C816000054435
BYTES 84B6090107000F402F809008402880A20001413583B6413541358179
BYTES 413581800005443584B6090107000F402F80A208402F80B600014335
BYTES 836C080007080007413C8179413C817900054440826C090107000F40
BYTES 3C80A20840408080000153FF514351836C4151817941518180000544
BYTES 5184A2090107000F405180C10848809000014B83A210CC693838E202
BYTES E302091FE002E102A326E702E802662C000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000
AT 6C2F

( w6C35 | NFA 6C2F CFA 6C35 )
( Unknown erased name; CFA identifier )
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

( w6C56 | NFA 6C4B CFA 6C56 )
( Unknown erased name; CFA identifier )
AT 6C4B
( Saved dictionary header: flags, name bytes, link )
BYTES 8800000000000000C3396C
DOCOL
t.0 LIT16 5E1E t.C! t.;S
AT 6C62

( w6C68 | NFA 6C62 CFA 6C68 )
( Unknown erased name; CFA identifier )
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
t.1 LIT16 5E1E t.C! w6C68 LIT16 D200 t.8 t.CMOVE t.;S
AT 6C95

( w6C9A | NFA 6C95 CFA 6C9A )
( Unknown erased name; CFA identifier )
AT 6C95
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D3736C
DOCON
CELL 1EFF
AT 6C9E

( w6CA5 | NFA 6C9E CFA 6CA5 )
( Unknown erased name; CFA identifier )
AT 6C9E
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000DA956C
DOCON
CELL 3F00
AT 6CA9

( w6CB0 | NFA 6CA9 CFA 6CB0 )
( Unknown erased name; CFA identifier )
AT 6CA9
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D29E6C
DOCOL
LIT16 1F09 w6CA5 t.+ t.;S
AT 6CBC

( w6CC4 | NFA 6CBC CFA 6CC4 )
( Unknown erased name; CFA identifier )
AT 6CBC
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A9A96C
CELL 6CC6 ( native entry point )
BYTES 86D1 ( 6CC6: STX $d1 )
BYTES 20095E ( 6CC8: JSR $5e09 )
BYTES A6D1 ( 6CCB: LDX $d1 )
BYTES 4C470F ( 6CCD: JMP $0f47 )
AT 6CD0

( w6CD7 | NFA 6CD0 CFA 6CD7 )
( Unknown erased name; CFA identifier )
AT 6CD0
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CFBC6C
DOCOL
w6CC4 t.0 LIT16 1F1E w6CA5 t.+ t.C! t.;S
AT 6CE9

( w6CF7 | NFA 6CE9 CFA 6CF7 )
( Unknown erased name; CFA identifier )
AT 6CE9
( Saved dictionary header: flags, name bytes, link )
BYTES 8B00000000000000000000C3D06C
DOCOL
t.STOP-SOUND t.STOP-VBI1 w6CD7 t.RUN-VBI1 t.;S
AT 6D03

( w6D0A | NFA 6D03 CFA 6D0A )
( Unknown erased name; CFA identifier )
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

( w6D6F | NFA 6D69 CFA 6D6F )
( Unknown erased name; CFA identifier )
AT 6D69
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C5036D
DODOES
( DOES> thread at 4144 )
BYTES 44410000140028003200
AT 6D7B

( w6D82 | NFA 6D7B CFA 6D82 )
( Unknown erased name; CFA identifier )
AT 6D7B
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D4696D
DOCOL
t.DUP t.C@
t.0BRANCH CELL 0041 ( -> 6DCB )
t.0 t.X!
( ATASCII text:  . )
t.(.")
BYTES 02201E
t.Y@ LIT8 58 t.@ t.Y@ t.1+ LIT8 28 t.* t.+ LIT8 0D t.Y@ t.1+
t.- LIT8 28 t.* t.ERASE w5D36 t.SWAP t.DUP w5D46 t.OVER t.C@
t.2+ w4973 w5D75 t.Y!
( label 6DCB )
t.;S
AT 6DCD

( w6DD5 | NFA 6DCD CFA 6DD5 )
( Unknown erased name; CFA identifier )
AT 6DCD
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C47B6D
DOCOL
t.CLEAR-TEXT-AREA t.-1 w4377 t.+! w4377 t.@ t.4 t.0 t.(DO)
( label 6DE9 )
t.DUP t.I w6D6F t.@ t.=
t.0BRANCH CELL 000F ( -> 6E04 )
LIT8 13 t.SOUND-COMMAND! t.I w6D0A t.2+ w6D82
( label 6E04 )
t.(LOOP) CELL FFE3 ( -> 6DE9 )
t.DROP t.;S
AT 6E0C

( w6E11 | NFA 6E0C CFA 6E11 )
( Unknown erased name; CFA identifier )
AT 6E0C
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D4CD6D
DOVAR
CELL 0001
AT 6E15

( w6E1F | NFA 6E15 CFA 6E1F )
( Unknown erased name; CFA identifier )
AT 6E15
( Saved dictionary header: flags, name bytes, link )
BYTES 87000000000000C10C6E
DOCOL
w6CF7 t.DUP w4369 t.@ t.>R t.CLEAR-TEXT-AREA w47DC w5AEC w47E9
w4000 LIT16 0006 t.+ t.C@ LIT16 02C7 t.C! w5C36 w466D t.@ t.=
w6E11 t.@ t.*
t.0BRANCH CELL 0010 ( -> 6E63 )
t.R w5B9E w4369 t.@ w5BF6
t.BRANCH CELL 0016 ( -> 6E77 )
( label 6E63 )
w4369 t.@ t.DUP w5C36 w466D t.! w5C86 w5CC2 w5CF6 w5BF6
( label 6E77 )
t.R> t.DROP t.CLEAR-TEXT-AREA w6DD5 t.0 w47A4 t.! t.1 w6E11
t.! t.;S
AT 6E8D

( w6E93 | NFA 6E8D CFA 6E93 )
( Unknown erased name; CFA identifier )
AT 6E8D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D9156E
DODOES
( DOES> thread at 4144 )
BYTES 44410100020101020001
AT 6E9F

( w6EA6 | NFA 6E9F CFA 6EA6 )
( Unknown erased name; CFA identifier )
AT 6E9F
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C08D6E
DOCOL
t.+ t.4 t.MOD w6E93 t.DUP t.C@ t.1 t.- t.SWAP t.1+ t.C@ t.1
t.- t.;S
AT 6EC4

( w6ECA | NFA 6EC4 CFA 6ECA )
( Unknown erased name; CFA identifier )
AT 6EC4
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D99F6E
DOCOL
w4369 t.@ w4584 t.1+ t.C@ LIT8 07 t.AND w6EA6 t.;S
AT 6EDF

( w6EE6 | NFA 6EDF CFA 6EE6 )
( Unknown erased name; CFA identifier )
AT 6EDF
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CDC46E
DOCOL
w6ECA w4369 t.@ w4584 w5B1A t.ROT t.+ t.>R t.+ t.16 t.* t.R>
t.+ t.DUP w5C22 w4584 t.C@ t.=
t.0BRANCH CELL 0008 ( -> 6F16 )
w5C22
t.BRANCH CELL 0010 ( -> 6F24 )
( label 6F16 )
t.DUP w5C2C w4584 t.C@ t.= w5C2C t.*
( label 6F24 )
t.-DUP t.0=_12DE
t.0BRANCH CELL 002A ( -> 6F54 )
w466D t.@ w5B55 t.C@ w466D t.@ w5B41 t.C@ t.(DO)
( label 6F3E )
t.I w4584 t.C@ t.OVER t.=
t.0BRANCH CELL 0006 ( -> 6F50 )
t.I t.LEAVE
( label 6F50 )
t.(LOOP) CELL FFEC ( -> 6F3E )
( label 6F54 )
t.SWAP t.DROP t.;S
AT 6F5A

( w6F5F | NFA 6F5A CFA 6F5F )
( Unknown erased name; CFA identifier )
AT 6F5A
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7DF6E
DOVAR
BYTES 000005414C4C
AT 6F67

( w6F6C | NFA 6F67 CFA 6F6C )
( Unknown erased name; CFA identifier )
AT 6F67
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A15A6F
DOCOL
w6F5F t.DUP t.C@ t.1+ t.+ t.C! t.1 w6F5F w4732 t.;S
AT 6F82

( w6F8A | NFA 6F82 CFA 6F8A )
( Unknown erased name; CFA identifier )
AT 6F82
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C0676F
DOCOL
w4369 t.@ w4678 t.C@ t.SWAP t.C2^ t.AND t.;S
AT 6F9C

( w6FA1 | NFA 6F9C CFA 6FA1 )
( Unknown erased name; CFA identifier )
AT 6F9C
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D7826F
DOCOL
w6F5F LIT8 05 t.ERASE t.4 t.0 t.(DO)
( label 6FB0 )
t.I w6F8A
t.0BRANCH CELL 0006 ( -> 6FBC )
t.I w6F6C
( label 6FBC )
t.(LOOP) CELL FFF2 ( -> 6FB0 )
t.;S
AT 6FC2

( w6FC7 | NFA 6FC2 CFA 6FC7 )
( Unknown erased name; CFA identifier )
AT 6FC2
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D79C6F
DODOES
( DOES> thread at 39C1 )
BYTES C13921000600D0D2CFD3D4CF0700D73DD0D2C1D7CF0500D73DD4D9EC
BYTES 0600D73DCCC5D7CFD9
AT 6FEE

( w6FF4 | NFA 6FEE CFA 6FF4 )
( Unknown erased name; CFA identifier )
AT 6FEE
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CDC26F
DOCOL
LIT8 06 w4D70 t.! w4DC1 t.1+ t.C! LIT8 30 t.X@ t.4 t.* t.+
w4D7C t.C! LIT8 7E t.Y@ t.8 t.* t.+ w4D7C t.1+ t.C! t.0 w4D92
t.! t.;S
AT 702B

( w7033 | NFA 702B CFA 7033 )
( Unknown erased name; CFA identifier )
AT 702B
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D2EE6F
DOCOL
t.CLEAR-TEXT-AREA t.CR w6FA1 w6F5F t.C@
t.0BRANCH CELL 0009 ( -> 704A )
LIT8 0C
t.BRANCH CELL 0004 ( -> 704C )
( label 704A )
t.8
( label 704C )
w6F5F t.C@ t.3 t.+ w4973 w6F5F t.C@ w6FF4 t.X@ t.2+ t.X! t.X@
( ATASCII text: NIC )
t.(S")
BYTES 034E4943
t.X! w5D36 w6F5F t.C@
t.0BRANCH CELL 0024 ( -> 7098 )
w6F5F t.C@ t.0 t.(DO)
( label 707E )
t.X@ t.I w6F5F t.+ t.1+ t.C@ w6FC7 t.OUNT t.STYPE t.X! w5D36
t.(LOOP) CELL FFE8 ( -> 707E )
( label 7098 )
t.;S
AT 709A

( w70A2 | NFA 709A CFA 70A2 )
( Unknown erased name; CFA identifier )
AT 709A
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000A12B70
DOCOL
w520C t.OUNT t.0 t.(DO)
( label 70AC )
t.2DUP t.I t.+ t.C@ t.=
t.0BRANCH CELL 000E ( -> 70C6 )
t.0 t.OVER t.I t.+ t.C! t.LEAVE
( label 70C6 )
t.(LOOP) CELL FFE4 ( -> 70AC )
t.2DROP t.;S
AT 70CE

( w70D5 | NFA 70CE CFA 70D5 )
( Unknown erased name; CFA identifier )
AT 70CE
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A19A70
DOCOL
w4369 t.@ w5855 w70A2 t.;S
AT 70E1

( w70E9 | NFA 70E1 CFA 70E9 )
( Unknown erased name; CFA identifier )
AT 70E1
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D2CE70
DOCOL
t.>R t.OVER t.R> t.SWAP t.;S
AT 70F5

( w70FC | NFA 70F5 CFA 70FC )
( Unknown erased name; CFA identifier )
AT 70F5
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A1E170
DOCOL
w70E9 w70E9 w70E9 w70A2 w520C t.OUNT t.0 t.(DO)
( label 710E )
t.DUP t.I t.+ t.C@ t.0=_12DE
t.0BRANCH CELL 000C ( -> 7126 )
t.2DUP t.I t.+ t.C! t.LEAVE
( label 7126 )
t.(LOOP) CELL FFE6 ( -> 710E )
t.2DROP t.;S
AT 712E

( w7134 | NFA 712E CFA 7134 )
( Unknown erased name; CFA identifier )
AT 712E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A1F570
DOCOL
w4369 t.@ w5855 w70FC t.;S
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

( w715A | NFA 7154 CFA 715A )
( Unknown erased name; CFA identifier )
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
LIT8 FF LIT16 02FC t.C! w4377 t.@ t.1 t.< t.INPUT-STATE t.!
( label 7180 )
t.NIC t.0 LIT8 4D t.C! t.0 t.JOYSTICK@ w4F98 w4EF2 w4EE5
LIT16 02FC t.C@ LIT8 21 t.=
t.0BRANCH CELL 0018 ( -> 71B8 )
w5855 t.0=_12DE w4D70 t.@ t.0=_12DE t.* w715A t.@ t.*
t.INPUT-STATE t.!
( label 71B8 )
t.0 t.TRIGGER@ t.0=_12DE t.INPUT-STATE t.@ t.+
t.0BRANCH CELL FFBA ( -> 7180 )
w4D70 t.@ t.0=_12DE
t.0BRANCH CELL 000C ( -> 71DC )
w4D92 w5923 w595D w5939 w590E
( label 71DC )
t.INPUT-STATE t.@ t.0=_12DE
t.0BRANCH CELL 0006 ( -> 71EA )
w4D92 w5923
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
w4FB4
( label 71F7 )
t.0 t.TRIGGER@ LIT16 0005 t.PAUSE
t.0BRANCH CELL FFF4 ( -> 71F7 )
t.;S
AT 7207

( w720C | NFA 7207 CFA 720C )
( Unknown erased name; CFA identifier )
AT 7207
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CBEE71
DOCOL
w7F76 t.DROP t.;S
AT 7214

( w721C | NFA 7214 CFA 721C )
( Unknown erased name; CFA identifier )
AT 7214
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D20772
DOCOL
w7033 t.WAIT-TRIGGER-RELEASE t.WAIT-GAME-INPUT t.SWAP t.DROP
t.-DUP
t.0BRANCH CELL 000E ( -> 723A )
w6F5F t.+ t.C@ w720C
t.BRANCH CELL 0004 ( -> 723C )
( label 723A )
w59C3
( label 723C )
t.;S
AT 723E

( w7243 | NFA 723E CFA 7243 )
( Unknown erased name; CFA identifier )
AT 723E
( Saved dictionary header: flags, name bytes, link )
BYTES 8200C51472
DOVAR
CELL 0000
AT 7247

( w724D | NFA 7247 CFA 724D )
( Unknown erased name; CFA identifier )
AT 7247
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C53E72
DOVAR
BYTES 000005414C4C4F54202020202020
AT 725D

( w7263 | NFA 725D CFA 7263 )
( Unknown erased name; CFA identifier )
AT 725D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000A14772
DOCOL
w724D t.DUP t.C@ t.+ t.2+ t.C! t.1 w724D w4732 t.;S
AT 7279

( w7281 | NFA 7279 CFA 7281 )
( Unknown erased name; CFA identifier )
AT 7279
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C25D72
DOCOL
t.1 t.RESOURCE-ADDR t.2+ w7243 t.@ t.SWAP w4763 t.2+ t.;S
AT 7295

( w729D | NFA 7295 CFA 729D )
( Unknown erased name; CFA identifier )
AT 7295
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C57972
DOCOL
t.0 w724D t.! t.0 w7263 w7243 t.@
t.0BRANCH CELL 001C ( -> 72CB )
w7281
( label 72B3 )
t.DUP t.2+ t.C@ w7263 t.OUNT t.+ t.DUP t.@ t.0=_12DE
t.0BRANCH CELL FFEC ( -> 72B3 )
t.DROP
( label 72CB )
w5855 t.0=_12DE t.0=_12DE
t.0BRANCH CELL 0006 ( -> 72D9 )
t.1 w7263
( label 72D9 )
t.;S
AT 72DB

( w72E2 | NFA 72DB CFA 72E2 )
( Unknown erased name; CFA identifier )
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

( w74E2 | NFA 74DC CFA 74E2 )
( Unknown erased name; CFA identifier )
AT 74DC
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D3DB72
DOCON
CELL 01F5
AT 74E6

( w74ED | NFA 74E6 CFA 74ED )
( Unknown erased name; CFA identifier )
AT 74E6
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CBDC74
DOVAR
BYTES 96019701
AT 74F3

( w74FA | NFA 74F3 CFA 74FA )
( Unknown erased name; CFA identifier )
AT 74F3
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C2E674
DOCOL
w72E2 t.DUP t.@ t.2 t.<
t.0BRANCH CELL 0008 ( -> 7510 )
t.2+ t.C@ w72E2
( label 7510 )
t.;S
AT 7512

( w7518 | NFA 7512 CFA 7518 )
( Unknown erased name; CFA identifier )
AT 7512
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C5F374
DOCOL
t.0 w724D t.C@ t.0 t.(DO)
( label 7524 )
w724D t.2+ t.I t.+ t.C@ w74FA t.@ t.MAX
t.(LOOP) CELL FFEE ( -> 7524 )
LIT16 0005 t.+ t.;S
AT 7540

( w7548 | NFA 7540 CFA 7548 )
( Unknown erased name; CFA identifier )
AT 7540
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000C21275
DOCOL
t.CLEAR-TEXT-AREA t.CR w729D w7518 w724D t.C@ t.2+ w4973 w724D
t.C@ t.1 t.- w6FF4 t.X@ t.2+ t.X! w724D t.C@ t.0 t.(DO)
( label 7572 )
t.X@ w724D t.2+ t.I t.+ t.C@ w74FA t.OUNT t.STYPE t.X! w5D36
t.(LOOP) CELL FFE8 ( -> 7572 )
t.;S
AT 758E

( w7594 | NFA 758E CFA 7594 )
( Unknown erased name; CFA identifier )
AT 758E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D74075
DOVAR
CELL 0000
AT 7598

( w759F | NFA 7598 CFA 759F )
( Unknown erased name; CFA identifier )
AT 7598
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000A18E75
DOCOL
t.DUP
t.0BRANCH CELL 0006 ( -> 75AB )
t.1 t.-
( label 75AB )
w7281 w4763 w7594 t.! t.;S
AT 75B5

( w75BA | NFA 75B5 CFA 75BA )
( Unknown erased name; CFA identifier )
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

( w7664 | NFA 765E CFA 7664 )
( Unknown erased name; CFA identifier )
AT 765E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C2B575
DOCOL
w75BA t.@ t.-DUP t.0=_12DE
t.0BRANCH CELL 0008 ( -> 7678 )
t.0 w75BA t.@
( label 7678 )
t.CFA t.EXECUTE t.;S
AT 767E

( w7684 | NFA 767E CFA 7684 )
( Unknown erased name; CFA identifier )
AT 767E
( Saved dictionary header: flags, name bytes, link )
BYTES 830000DA5E76
DOCOL
w7243 t.@ LIT8 63 t.>
t.0BRANCH CELL 000E ( -> 769F )
w7243 t.@ w5674 t.2+ w7243 t.!
( label 769F )
t.;S
AT 76A1

( w76A7 | NFA 76A1 CFA 76A7 )
( Unknown erased name; CFA identifier )
AT 76A1
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C97E76
DOCOL
t.0=_12DE t.0=_12DE t.;S
AT 76AF

( w76B7 | NFA 76AF CFA 76B7 )
( Unknown erased name; CFA identifier )
AT 76AF
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D2A176
DOCOL
w7684 w7548
( label 76BD )
t.WAIT-TRIGGER-RELEASE t.WAIT-GAME-INPUT t.SWAP t.DROP t.DUP
w759F w724D t.+ t.2+ t.C@ w7664
t.0BRANCH CELL FFE8 ( -> 76BD )
w5390 t.;S
AT 76DB

( w76E1 | NFA 76DB CFA 76E1 )
( Unknown erased name; CFA identifier )
AT 76DB
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C6AF76
DOVAR
BYTES 000005414C4C4F542020202020202020202020202020202020202020
BYTES 2020202020202020616365676F204E522E454B52206920202020204B
BYTES 85525A4543DAC2764114DD140F2085525A4543DAD0764114DD
AT 7734

( w773C | NFA 7734 CFA 773C )
( Unknown erased name; CFA identifier )
AT 7734
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000DADB76
DOCOL
t.3 t.* w456E t.+ t.;S
AT 7748

( w774F | NFA 7748 CFA 774F )
( Unknown erased name; CFA identifier )
AT 7748
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000CD3477
DOCON
CELL 0028
AT 7753

( w7759 | NFA 7753 CFA 7759 )
( Unknown erased name; CFA identifier )
AT 7753
( Saved dictionary header: flags, name bytes, link )
BYTES 830000D34877
DOVAR
CELL 0000
AT 775D

( w7763 | NFA 775D CFA 7763 )
( Unknown erased name; CFA identifier )
AT 775D
( Saved dictionary header: flags, name bytes, link )
BYTES 830000C05377
DOCOL
w4584 t.1+ t.C@ t.8 t.AND t.0=_12DE t.0=_12DE t.;S
AT 7775

( w777A | NFA 7775 CFA 777A )
( Unknown erased name; CFA identifier )
AT 7775
( Saved dictionary header: flags, name bytes, link )
BYTES 8200A55D77
DOCOL
t.0 w774F t.0 t.(DO)
( label 7784 )
t.I w7763 t.+
t.(LOOP) CELL FFF8 ( -> 7784 )
LIT8 64 t.* w774F t.4 t.- t./ w7759 t.! t.;S
AT 77A1

( DRAW-GAME-MENU | NFA 77A1 CFA 77A8 )
( Inferred descriptive name, not recovered original: Prints )
( POCZaTEK, ZAPIS, ODCZYT, GRA and mission percentage. )
AT 77A1
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D77577
DOCOL
t.CLEAR-TEXT-AREA t.CR LIT8 0D LIT16 0006 w4973 t.3 w6FF4 t.X@
t.2+ t.X! t.X@
( ATASCII text: POCZaTEK )
t.(S")
BYTES 08504F435A6154454B
t.X! w5D36 t.X@
( ATASCII text: ZAPIS )
t.(S")
BYTES 055A41504953
t.X! w5D36 t.X@
( ATASCII text: ODCZYT )
t.(S")
BYTES 064F44435A5954
t.X! w5D36 t.FORTH
( ATASCII text: GRA )
t.(S")
BYTES 03475241
t.CR t.CR w777A w59DF t.@ t.0=_12DE
t.0BRANCH CELL 0032 ( -> 7837 )
LIT8 1E t.3 w4973 t.X@ t.1+ t.X!
( ATASCII text: WYKONAlEs= )
t.(S")
BYTES 0A57594B4F4E416C45733D
w7759 t.?
( ATASCII text: .=PROCENT=MISJI )
t.(.")
BYTES 0F1E3D50524F43454E543D4D49534A49
( label 7837 )
t.CR t.;S
AT 783B

( w7840 | NFA 783B CFA 7840 )
( Unknown erased name; CFA identifier )
AT 783B
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CDA177
DOCOL
w76E1 LIT16 004C LIT16 0055 t.FILL t.1+ w5923 w76E1 w590E t.3
LIT8 18 w76E1 t.2+ w590E w76E1 t.?POBJ t.;S
AT 7867

( w786C | NFA 7867 CFA 786C )
( Unknown erased name; CFA identifier )
AT 7867
( Saved dictionary header: flags, name bytes, link )
BYTES 8200D23B78
DOCOL
w5374 w56A7 t.RESOURCE-ADDR w76E1 t.<MOVE w76E1 t.?POBJ w5390
t.;S
AT 7880

( w7887 | NFA 7880 CFA 7887 )
( Unknown erased name; CFA identifier )
AT 7880
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000C56778
DOCOL
t.CLEAR-TEXT-AREA t.2 t.RCM t.C! t.4 t.0 t.(DO)
( label 7897 )
t.I w773C t.DUP w7840 t.C@ t.-DUP
t.0BRANCH CELL 0004 ( -> 78A9 )
w786C
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

( w78C6 | NFA 78BE CFA 78C6 )
( Unknown erased name; CFA identifier )
AT 78BE
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D9B578
DOCOL
t.0 w6E11 t.! t.0 w59DF t.! w4369 t.@ w6E1F t.;S
AT 78DC

( w78E1 | NFA 78DC CFA 78E1 )
( Unknown erased name; CFA identifier )
AT 78DC
( Saved dictionary header: flags, name bytes, link )
BYTES 8200CCBE78
DOCOL
t.CLEAR-TEXT-AREA w47DC t.1 w4A6F t.! w5655 w3F1D w4B4C w47E9
t.;S
AT 78F7

( w78FD | NFA 78F7 CFA 78FD )
( Unknown erased name; CFA identifier )
AT 78F7
( Saved dictionary header: flags, name bytes, link )
BYTES 830000CEDC78
DOCOL
w59DF t.@ t.1 t.=
t.0BRANCH CELL 000A ( -> 7913 )
w78E1 w78C6
t.BRANCH CELL 0008 ( -> 7919 )
( label 7913 )
t.0 w4D70 t.!
( label 7919 )
t.;S
AT 791B

( w7923 | NFA 791B CFA 7923 )
( Unknown erased name; CFA identifier )
AT 791B
( Saved dictionary header: flags, name bytes, link )
BYTES 8500000000D9F778
DOCOL
w78E1 w78C6 w7887 t.;S
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
w5147 t.DUP w7243 t.! t.1 t.=
t.0BRANCH CELL 0008 ( -> 795C )
w721C
t.BRANCH CELL 0004 ( -> 795E )
( label 795C )
w76B7
( label 795E )
t.INPUT-STATE t.@
t.0BRANCH CELL FFD2 ( -> 7936 )
w4377 t.@ t.1 t.<
t.0BRANCH CELL 001A ( -> 798A )
LIT8 32 t.PAUSE LIT8 19 t.SOUND-COMMAND! LIT16 023A t.PAUSE
w7923 t.1 w59DF t.!
( label 798A )
t.;S
AT 798C

( w7993 | NFA 798C CFA 7993 )
( Unknown erased name; CFA identifier )
AT 798C
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D92D79
DOCOL
t.CLEAR-TEXT-AREA w47DC w5644 w3F1D w4B64 w47E9 w78C6 w7887
t.;S
AT 79A7

( w79AE | NFA 79A7 CFA 79AE )
( Unknown erased name; CFA identifier )
AT 79A7
( Saved dictionary header: flags, name bytes, link )
BYTES 84000000D98C79
DOCOL
w59DF t.@ t.1 t.=
t.0BRANCH CELL 0004 ( -> 79BE )
w78E1
( label 79BE )
t.CLEAR-TEXT-AREA w47DC w5594 w5634 w3F1D w4B7C w47E9 w78C6
t.;S
AT 79D0

( w79D6 | NFA 79D0 CFA 79D6 )
( Unknown erased name; CFA identifier )
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
( ATASCII text: BlAD DYSKOWY )
t.(S")
BYTES 0C426C4144204459534B4F5759
w59DF t.@ t.3 t.=
t.0BRANCH CELL 000C ( -> 7A17 )
t.16 t.3 t.POS
( ATASCII text: : )
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
w59DF t.@ t.3 t.=
t.0BRANCH CELL 000D ( -> 7A37 )
LIT8 10 t.4 t.POS
( ATASCII text: ; )
t.(S")
BYTES 013B
( label 7A37 )
LIT8 0C LIT16 0005 t.POS
( ATASCII text: NACISNIJ KLAWISZ )
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
w59DF t.@ t.3 t.=
t.0BRANCH CELL 000E ( -> 7A74 )
LIT8 12 t.1 t.POS
( ATASCII text: ;; )
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
LIT8 58 t.@ LIT16 0190 t.ERASE w4A79
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
t.SWAP t.DROP t.1 w4A6F t.! w79D6 t.;S
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
t.0 t.INPUT-STATE t.! LIT16 260B w74E2 t.- LIT16 76A9 t.! t.0
LIT16 0041 t.C! t.WAIT-FOR-GAME-DISK t.1 w59DF t.! t.RUN-VBI1
t.DISABLE-DISPLAY-DMA t.INIT-GAME-DISPLAY
t.RESTORE-DISPLAY-DMA t.1 LIT16 02F0 t.C! t.0 LIT8 52 t.C! t.0
w5BF6 t.3 w466D t.! w5C86
( label 7B39 )
t.HANDLE-GAME-MENU t.HANDLE-GAME-INPUT t.INPUT-STATE t.@ t.8
t.=
t.0BRANCH CELL FFF2 ( -> 7B39 )
t.BRANCH CELL FFA7 ( -> 7AF2 )
t.;S
AT 7B4F
