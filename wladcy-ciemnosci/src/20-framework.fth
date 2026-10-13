( Wladcy Ciemnosci v1 20-framework.fth: target 2A76..600F )
( Hexadecimal. BYTES emits bytes; CELL emits 16-bit cells. )
( LIT8/LIT16 compile literals; branches retain signed )
( offsets. )
( 6502 mnemonics use 06-assembler.fth; operands follow )
( words. )

( ASSEMBLER | NFA 2A76 CFA 2A82 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $2A82 [ASSEMBLER] in contiguous 330-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $2A82, )
( corresponding word in contiguous 252-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 2A76
( Header: flags, saved name and link )
BYTES C90000000000000000D2042A
DODOES
( DOES> thread at 1E30 )
BYTES 301E81A0AA2F481E
AT 2A8C

( INDEX | NFA 2A8C CFA 2A94 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2A8C
( Header: flags, saved name and link )
BYTES 85494E4445D8441E
DOVAR
BYTES 090905151501118009800D1D19808080800004141480808080800C1C
BYTES 1C80802C
AT 2AB6

( MODE | NFA 2AB6 CFA 2ABD )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2AB6
( Header: flags, saved name and link )
BYTES 844D4F44C58C2A
DOVAR
CELL 0002
AT 2AC1

( .A | NFA 2AC1 CFA 2AC6 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2AC1
( Header: flags, saved name and link )
BYTES 822EC1B62A
DOCOL
t.0 t.MODE t.! t.;S
AT 2AD0

( # | NFA 2AD0 CFA 2AD4 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2AD0
( Header: flags, saved name and link )
BYTES 81A3C12A
DOCOL
t.1 t.MODE t.! t.;S
AT 2ADE

( MEM | NFA 2ADE CFA 2AE4 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2ADE
( Header: flags, saved name and link )
BYTES 834D45CDD02A
DOCOL
t.2 t.MODE t.! t.;S
AT 2AEE

( ,X | NFA 2AEE CFA 2AF3 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2AEE
( Header: flags, saved name and link )
BYTES 822CD8DE2A
DOCOL
t.3 t.MODE t.! t.;S
AT 2AFD

( ,Y | NFA 2AFD CFA 2B02 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2AFD
( Header: flags, saved name and link )
BYTES 822CD9EE2A
DOCOL
LIT16 0004 t.MODE t.! t.;S
AT 2B0E

( X] | NFA 2B0E CFA 2B13 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B0E
( Header: flags, saved name and link )
BYTES 8258A9FD2A
DOCOL
LIT16 0005 t.MODE t.! t.;S
AT 2B1F

( ]Y | NFA 2B1F CFA 2B24 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B1F
( Header: flags, saved name and link )
BYTES 8229D90E2B
DOCOL
LIT16 0006 t.MODE t.! t.;S
AT 2B30

( ] | NFA 2B30 CFA 2B34 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B30
( Header: flags, saved name and link )
BYTES 81A91F2B
DOCOL
LIT16 000F t.MODE t.! t.;S
AT 2B40

( BOT | NFA 2B40 CFA 2B46 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B40
( Header: flags, saved name and link )
BYTES 83424FD4302B
DOCOL
t.,X t.0 t.;S
AT 2B4E

( SEC | NFA 2B4E CFA 2B54 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B4E
( Header: flags, saved name and link )
BYTES 835345C3402B
DOCOL
t.,X t.2 t.;S
AT 2B5C

( RP] | NFA 2B5C CFA 2B62 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B5C
( Header: flags, saved name and link )
BYTES 835250A94E2B
DOCOL
t.,X LIT16 0101 t.;S
AT 2B6C

( UPMODE | NFA 2B6C CFA 2B75 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2B6C
( Header: flags, saved name and link )
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
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2BBD
( Header: flags, saved name and link )
BYTES 834350D56C2B
DOCOL
t.<BUILDS t.C, t.DOES>
( Trailing code/data at 2BCB; retained exactly )
BYTES F9135216E42A7712
AT 2BD3

( BRK, | NFA 2BD3 CFA 2BDA )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2BD3
( Header: flags, saved name and link )
BYTES 8442524BACBD2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B00
AT 2BDF

( CLC, | NFA 2BDF CFA 2BE6 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2BDF
( Header: flags, saved name and link )
BYTES 84434C43ACD32B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B18
AT 2BEB

( CLD, | NFA 2BEB CFA 2BF2 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2BEB
( Header: flags, saved name and link )
BYTES 84434C44ACDF2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2BD8
AT 2BF7

( CLI, | NFA 2BF7 CFA 2BFE )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2BF7
( Header: flags, saved name and link )
BYTES 84434C49ACEB2B
DODOES
( DOES> thread at 2BCB )
BYTES CB2B58
AT 2C03

( CLV, | NFA 2C03 CFA 2C0A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C03
( Header: flags, saved name and link )
BYTES 84434C56ACF72B
DODOES
( DOES> thread at 2BCB )
BYTES CB2BB8
AT 2C0F

( DEX, | NFA 2C0F CFA 2C16 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C0F
( Header: flags, saved name and link )
BYTES 84444558AC032C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BCA
AT 2C1B

( DEY, | NFA 2C1B CFA 2C22 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C1B
( Header: flags, saved name and link )
BYTES 84444559AC0F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B88
AT 2C27

( INX, | NFA 2C27 CFA 2C2E )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C27
( Header: flags, saved name and link )
BYTES 84494E58AC1B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BE8
AT 2C33

( INY, | NFA 2C33 CFA 2C3A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C33
( Header: flags, saved name and link )
BYTES 84494E59AC272C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BC8
AT 2C3F

( NOP, | NFA 2C3F CFA 2C46 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C3F
( Header: flags, saved name and link )
BYTES 844E4F50AC332C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BEA
AT 2C4B

( PHA, | NFA 2C4B CFA 2C52 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C4B
( Header: flags, saved name and link )
BYTES 84504841AC3F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B48
AT 2C57

( PHP, | NFA 2C57 CFA 2C5E )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C57
( Header: flags, saved name and link )
BYTES 84504850AC4B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B08
AT 2C63

( PLA, | NFA 2C63 CFA 2C6A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C63
( Header: flags, saved name and link )
BYTES 84504C41AC572C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B68
AT 2C6F

( PLP, | NFA 2C6F CFA 2C76 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C6F
( Header: flags, saved name and link )
BYTES 84504C50AC632C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B28
AT 2C7B

( RTI, | NFA 2C7B CFA 2C82 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C7B
( Header: flags, saved name and link )
BYTES 84525449AC6F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B40
AT 2C87

( RTS, | NFA 2C87 CFA 2C8E )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C87
( Header: flags, saved name and link )
BYTES 84525453AC7B2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B60
AT 2C93

( SEC, | NFA 2C93 CFA 2C9A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C93
( Header: flags, saved name and link )
BYTES 84534543AC872C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B38
AT 2C9F

( SED, | NFA 2C9F CFA 2CA6 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2C9F
( Header: flags, saved name and link )
BYTES 84534544AC932C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BF8
AT 2CAB

( SEI, | NFA 2CAB CFA 2CB2 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CAB
( Header: flags, saved name and link )
BYTES 84534549AC9F2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B78
AT 2CB7

( TAX, | NFA 2CB7 CFA 2CBE )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CB7
( Header: flags, saved name and link )
BYTES 84544158ACAB2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BAA
AT 2CC3

( TAY, | NFA 2CC3 CFA 2CCA )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CC3
( Header: flags, saved name and link )
BYTES 84544159ACB72C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BA8
AT 2CCF

( TSX, | NFA 2CCF CFA 2CD6 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CCF
( Header: flags, saved name and link )
BYTES 84545358ACC32C
DODOES
( DOES> thread at 2BCB )
BYTES CB2BBA
AT 2CDB

( TXA, | NFA 2CDB CFA 2CE2 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CDB
( Header: flags, saved name and link )
BYTES 84545841ACCF2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B8A
AT 2CE7

( TXS, | NFA 2CE7 CFA 2CEE )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CE7
( Header: flags, saved name and link )
BYTES 84545853ACDB2C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B9A
AT 2CF3

( TYA, | NFA 2CF3 CFA 2CFA )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CF3
( Header: flags, saved name and link )
BYTES 84545941ACE72C
DODOES
( DOES> thread at 2BCB )
BYTES CB2B98
AT 2CFF

( MCP | NFA 2CFF CFA 2D05 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2CFF
( Header: flags, saved name and link )
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
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2D81
( Header: flags, saved name and link )
BYTES 84414443ACFF2C
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D606E1C
AT 2D8F

( AND, | NFA 2D8F CFA 2D96 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2D8F
( Header: flags, saved name and link )
BYTES 84414E44AC812D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D206E1C
AT 2D9D

( CMP, | NFA 2D9D CFA 2DA4 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2D9D
( Header: flags, saved name and link )
BYTES 84434D50AC8F2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC06E1C
AT 2DAB

( EOR, | NFA 2DAB CFA 2DB2 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DAB
( Header: flags, saved name and link )
BYTES 84454F52AC9D2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D406E1C
AT 2DB9

( LDA, | NFA 2DB9 CFA 2DC0 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DB9
( Header: flags, saved name and link )
BYTES 844C4441ACAB2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA06E1C
AT 2DC7

( ORA, | NFA 2DC7 CFA 2DCE )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DC7
( Header: flags, saved name and link )
BYTES 844F5241ACB92D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D006E1C
AT 2DD5

( SBC, | NFA 2DD5 CFA 2DDC )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DD5
( Header: flags, saved name and link )
BYTES 84534243ACC72D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE06E1C
AT 2DE3

( STA, | NFA 2DE3 CFA 2DEA )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DE3
( Header: flags, saved name and link )
BYTES 84535441ACD52D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D806C1C
AT 2DF1

( ASL, | NFA 2DF1 CFA 2DF8 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DF1
( Header: flags, saved name and link )
BYTES 8441534CACE32D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D010D0D
AT 2DFF

( DEC, | NFA 2DFF CFA 2E06 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2DFF
( Header: flags, saved name and link )
BYTES 84444543ACF12D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC10C0C
AT 2E0D

( INC, | NFA 2E0D CFA 2E14 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E0D
( Header: flags, saved name and link )
BYTES 84494E43ACFF2D
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE10C0C
AT 2E1B

( LSR, | NFA 2E1B CFA 2E22 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E1B
( Header: flags, saved name and link )
BYTES 844C5352AC0D2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D410D0D
AT 2E29

( ROL, | NFA 2E29 CFA 2E30 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E29
( Header: flags, saved name and link )
BYTES 84524F4CAC1B2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D210D0D
AT 2E37

( ROR, | NFA 2E37 CFA 2E3E )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E37
( Header: flags, saved name and link )
BYTES 84524F52AC292E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D610D0D
AT 2E45

( STX, | NFA 2E45 CFA 2E4C )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E45
( Header: flags, saved name and link )
BYTES 84535458AC372E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D811404
AT 2E53

( CPX, | NFA 2E53 CFA 2E5A )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E53
( Header: flags, saved name and link )
BYTES 84435058AC452E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DE08604
AT 2E61

( CPY, | NFA 2E61 CFA 2E68 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E61
( Header: flags, saved name and link )
BYTES 84435059AC532E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DC08604
AT 2E6F

( LDX, | NFA 2E6F CFA 2E76 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E6F
( Header: flags, saved name and link )
BYTES 844C4458AC612E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA29614
AT 2E7D

( LDY, | NFA 2E7D CFA 2E84 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E7D
( Header: flags, saved name and link )
BYTES 844C4459AC6F2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2DA08E0C
AT 2E8B

( STY, | NFA 2E8B CFA 2E92 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E8B
( Header: flags, saved name and link )
BYTES 84535459AC7D2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D808C04
AT 2E99

( JSR, | NFA 2E99 CFA 2EA0 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2E99
( Header: flags, saved name and link )
BYTES 844A5352AC8B2E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D148004
AT 2EA7

( JMP, | NFA 2EA7 CFA 2EAE )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2EA7
( Header: flags, saved name and link )
BYTES 844A4D50AC992E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D408084
AT 2EB5

( BIT, | NFA 2EB5 CFA 2EBC )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2EB5
( Header: flags, saved name and link )
BYTES 84424954ACA72E
DODOES
( DOES> thread at 2D0F )
BYTES 0F2D208404
AT 2EC3

( BEGIN, | NFA 2EC3 CFA 2ECC )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2EC3
( Header: flags, saved name and link )
BYTES C6424547494EACB52E
DOCOL
t.HERE t.1 t.;S
AT 2ED4

( UNTIL, | NFA 2ED4 CFA 2EDD )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2ED4
( Header: flags, saved name and link )
BYTES C6554E54494CACC32E
DOCOL
t.?EXEC t.>R t.1 t.?PAIRS t.R> t.C, t.HERE t.1+ t.- t.C, t.;S
AT 2EF5

( IF, | NFA 2EF5 CFA 2EFB )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2EF5
( Header: flags, saved name and link )
BYTES C34946ACD42E
DOCOL
t.C, t.HERE t.0 t.C, t.2 t.;S
AT 2F09

( THEN, | NFA 2F09 CFA 2F11 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F09
( Header: flags, saved name and link )
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
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F37
( Header: flags, saved name and link )
BYTES C5454C5345AC092F
DOCOL
t.2 t.?PAIRS t.HERE t.1+ t.1 t.JMP, t.SWAP t.HERE t.OVER t.1+
t.- t.SWAP t.C! t.2 t.;S
AT 2F5F

( NOT | NFA 2F5F CFA 2F65 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F5F
( Header: flags, saved name and link )
BYTES 834E4FD4372F
DOCOL
LIT16 0020 t.+ t.;S
AT 2F6F

( CS | NFA 2F6F CFA 2F74 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F6F
( Header: flags, saved name and link )
BYTES 8243D35F2F
DOCON
CELL 0090
AT 2F78

( 0= | NFA 2F78 CFA 2F7D )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F78
( Header: flags, saved name and link )
BYTES 8230BD6F2F
DOCON
CELL 00D0
AT 2F81

( 0< | NFA 2F81 CFA 2F86 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F81
( Header: flags, saved name and link )
BYTES 8230BC782F
DOCON
CELL 0010
AT 2F8A

( >= | NFA 2F8A CFA 2F8F )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F8A
( Header: flags, saved name and link )
BYTES 823EBD812F
DOCON
CELL 0090
AT 2F93

( C; | NFA 2F93 CFA 2F98 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2F93
( Header: flags, saved name and link )
BYTES C243BB8A2F
DOCOL
t.CURRENT t.@ t.CONTEXT t.! t.?EXEC t.?CSP t.SMUDGE t.;S
AT 2FAA

( END-CODE | NFA 2FAA CFA 2FB5 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 2FAA
( Header: flags, saved name and link )
BYTES C8454E442D434F44C5932F
DOCOL
t.C; t.;S
AT 2FBB

( CODE | NFA 2FBB CFA 2FC2 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $2FC2 [CODE] in contiguous 330-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $2FC2, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 2FBB
( Header: flags, saved name and link )
BYTES C4000000C5762A
DOCOL
t.?EXEC t.CREATE t.ASSEMBLER t.MEM t.!CSP t.;S
AT 2FD0

( MAC | NFA 2FD0 CFA 2FD6 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $2FD6 [MAC] in contiguous 330-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $2FD6, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 2FD0
( Header: flags, saved name and link )
BYTES C30000C3BB2F
DOCOL
t.-FIND t.0=_12DE t.0 t.?ERROR t.DROP LIT16 0020 t.C, t., t.;S
AT 2FEC

( CMC-PLAYER-STORAGE | NFA 2FEC CFA 2FF3 )
( Inferred descriptive name, not recovered original: )
( Allocated buffer contains the CMC player with dispatcher )
( $3003 and frame routine $3006; music commands at )
( $5E81/$5EAA/$5ED6 call those entries. )
( Stack: -- address )
AT 2FEC
( Header: flags, saved name and link )
BYTES 84000000DAD02F
DOVAR
BYTES 000005414CFFFF0030C1374C5A374C63304CBB3200000000004CC65F
BYTES C207000000000000000000000000000000000000000000FFFFFF0000
BYTES 00000000000000000000000000000000000000000000000000000000
BYTES 0080808080000000401B2B0606008414840086000000000000008D51
BYTES 308E52308C533029704A4A4AAABD94308D9230BD95308D9330A9038D
BYTES 1FD2A9018D6230AC5330AE5230AD51304C6859A430CF3092312E3168
BYTES 3183318E313531AD5A3085FCAD5B3085FDA0008AF01CB1FCC98FF004
BYTES C9EFD00CCAD009C8C054B00998AA1006C8C05490E5608E0D30A900A2
BYTES 029D41309D44309D4A30CA10F48D0C308D4D30A0FF8C4F30AD563085
BYTES FCAD573085FDA013B1FCAAAD5A3085FCAD5B3085FDAC0D30B1FCC9CF
BYTES D00D98186955A8B1FC300FAA4C2731C98FF007C9EFF0038810E28E54
BYTES 308E5530608E54308E5530608E563086FC8C573084FD188A69148D58
BYTES 309869008D5930188A69008D5A309869028D5B30A013B1FC8D54308D
BYTES 5530A2038E1FD2A9008D6230A008A9009900D2C003B008990930A9FF
BYTES 9928308810ECA980A2039D4A30CA10FA60A900F0F3AD51302903AAA9
BYTES 809D4A30AC5330AD52308D51308C5330A9009D31309D28309D2B3098
BYTES 0A0A0A85FE18AD5630693048AD57306901A8681865FE9D5C30986900
BYTES 9D5F3018AD5630699485FCAD5730690085FDAD53300A6D53300AA88C
BYTES 5330C8C8C8C8C8B1FC9D3A3088B1FC9D373088B1FC9D34308888B1FC
BYTES 9D2E30A0002907C903D002A002C907D002A004B9B53285FEB9B63285
BYTES FFAC5330C8C8B1FC4A4A4A4A186D51308D51308DAC32A8BD2E302907
BYTES C907D00F980AA8B1FE9D1C30C88C51304C6932B1FE9D1C30AC5330C8
BYTES C8B1FC290F186D51308D5130AC5130BD2E302907C90508B1FE28F008
BYTES DD1C30D00338E9019D1F30AC5330B1FC482903A8B944379D2530684A
BYTES 4A4A4AA03EC90FF010A037C90EF00AA030C90DF0041869ABA8B94436
BYTES 9D22306044368536C636D8A5FC48A5FD48A5FE48A5FF48AD6230D003
BYTES 4C2336AD4D30F0034C7834AD5430CD5530F0034C6534AD0C30F0034C
BYTES 8B33A202A900BC4A3030039D4A309D4130CA10F2AD5A3085FCAD5B30
BYTES 85FDAC0D308C8E33CC4F30D019AD5030F014AD0D30AC4E308C0D30CE
BYTES 5030D0E88D0D30A810E2A200B1FCC9FEF00F9D3E3018986955A8E8E0
BYTES 0390EDB00FAC0D30C8CC8E33F0378C0D304C0D33AC0D30B1FC1033C9
BYTES FFF02F4A4A4A290EAABD8F338D7433BD90338D7533AD3F3085FE2073
BYTES 5B8C0D30C055B005CC8E33D08BAC8E338C0D304C23364CF533009D33
BYTES A333A933B333BD33C933E633208331A0FF60A5FE30F9A860A5FE30F3
BYTES 3898E5FEA860A5FE30E9189865FEA860A5FE30DF8D54308D5530C860
BYTES A5FE30D3AD403030CEC88C4E30189865FE8D4F30AD40308D5030C054
BYTES 6088300AB1FCC98FF004C9EFD0F3C860A202BD4430F005DE44301057
BYTES BD4A30D052BC3E30C940B04BAD583085FCAD593085FDB1FC85FE1898
BYTES 6940A8B1FC85FFBC4130B1FE29C0D00CB1FE293F9D4730FE413010EB
BYTES C940D00DB1FE293FBC473020A3314C5534C980D00AB1FE293F9D4430
BYTES FE4130CA109CAE0C30E88A293F8D0C30CE5530D00EAD54308D5530AD
BYTES 0C30D003EE0D30AC1F30AD2E302907C905F004C906D001888C1A30A0
BYTES 00C905F004C906D002A002C907D002A0288C1B30A202BD2E3029E09D
BYTES 1330BD5C3085FCBD5F3085FDBD2830C9FFF037C90FD021BD2B30F02E
BYTES DE2B30BD2B30D026BC0930F00188989D0930BD34309D2B30884CF334
BYTES BD28304AA8B1FC90044A4A4A4A290F9D0930BC1C30BD2E302907C901
BYTES D01F8898C8DD1F3008A90128D0020A0A3D3130F00CBC1F30C0FFD005
BYTES A9009D0930989D1730A9018D3D30BD2830C90FF0382907A8B9503785
BYTES FEBD28302908088A2818F0026903A8B9373025FEF01BBD22309D1730
BYTES 8E3D30CA10088D1A30A9008D1B30E8BD25309D1330BD2830290FC90F
BYTES F012FE2830BD2830290FC90FD006BD34309D2B30BD4A30100ABD0930
BYTES D005A9409D4A30FE3130A000BD2E304A4A4A4A9001884A9001C81898
BYTES 7D1C309D1C30BD1F30C9FFD002A00018987D1F309D1F30CA30034CA3
BYTES 34AD13308D1630AD2E302907A003AE3D30F018C904D002A007C905D0
BYTES 02A00BC906D002A00FC907D002A0139848B9303608297FAA9829030A
BYTES A8BD17309900D2BD0930E003D003AD09301D1330281002A9009901D2
BYTES 68A8882903D0D0AD1B308D08D2186885FF6885FE6885FD6885FC6000
BYTES 01028300010203010002830100020301028003FFF1E4D7CBC0B5AAA1
BYTES 988F877F78726B655F5A55504B47433F3C3835322F2C2A272523211F
BYTES 1D1C1A18171614131211100F0E0D0C0B0A0908070605040302010000
BYTES 00000000F2E9DACEBFB6AAA1988F89807A716B655F00565067605A55
BYTES 514C48433F3D393433392D2A282524211F1E00000F0E0D0C0B0A0908
BYTES 070605040302010000380B8C0A000A6A09E8086A08EF0780070807AE
BYTES 064606E60595054105F604B0046E043004F603BB03840352032203F4
BYTES 02C802A0027A02550234021402F501D801BD01A4018D01770160014E
BYTES 013801270115010601F700E800DB00CF00C300B800AC00A2009A0090
BYTES 0088007F00780070006A0064005E005700520032000A0080A0204000
BYTES 01353F008080A08040201008040201B73768AAF042C902F0066868CA
BYTES D0FB60A514C514F0FCAD24028DC037AD25028DC137AD58378D2402AD
BYTES 59378D25026868F00338E9018D9C3768A868AAA970206330A900A29B
BYTES 4C6330A514C514F0FCADC0378D2402ADC1378D2502A9404C633020BB
BYTES 32900320A6374CBF5F13C10F1200B13708146F1AB137E41314157335
BYTES 6F1AC616C6167712822BCEB53741149A37E413C10F32002D31E413C1
BYTES 0F16006F1AB1
AT 37F7

( CMC-ALIGNED-BASE | NFA 37F7 CFA 37FE )
( Inferred descriptive name, not recovered original: Rounds )
( the player-storage address up to the next $100-byte )
( boundary, yielding $3000. No decoded caller was found. )
( Stack: -- address )
AT 37F7
( Header: flags, saved name and link )
BYTES 84000000B0EC2F
DOCOL
t.CMC-PLAYER-STORAGE LIT16 0100 t.2DUP t.MOD t.- t.+ t.;S
AT 3810

( w3817 | NFA 3810 CFA 3817 )
( Unknown erased name; CFA identifier )
AT 3810
( Header: flags, saved name and link )
BYTES 84000000C5F737
DOVAR
CELL 0081
AT 381B

( w3821 | NFA 381B CFA 3821 )
( Unknown erased name; CFA identifier )
AT 381B
( Header: flags, saved name and link )
BYTES 830000C51038
DOCOL
w3817 t.@ t.;S
AT 3829

( THREADED-SELECTOR: | NFA 3829 CFA 3832 )
( Inferred descriptive name, not recovered original: )
( Defining word compiles a list of CFA cells; its DOES> )
( tail doubles an index, adds it to the parameter address )
( and executes the selected CFA. Used by joystick delta )
( tables $506B/$508D. )
AT 3829
( Header: flags, saved name and link )
BYTES 860000000000D41B38
DOCOL
t.<BUILDS t.SMUDGE t.] t.DOES>
( Trailing code/data at 383C; retained exactly )
BYTES 8D13D5140F200413E4138A0F7712
AT 384A

( SEARCH-ACTIVE | NFA 384A CFA 384F )
( Inferred descriptive name, not recovered original: Low )
( byte is set, tested and cleared by native $385A while )
( scanning for a matching byte or the endpoint. )
( Stack: -- address )
AT 384A
( Header: flags, saved name and link )
BYTES 8200C92938
DOVAR
CELL 0000
AT 3853

( SCAN-BYTE-MATCH | NFA 3853 CFA 3858 )
( Inferred descriptive name, not recovered original: Native )
( helper compares byte at [$D3] with the third stack cell, )
( advances $D3/$D4 to the first match or end, and clears )
( $3851 when finished. $3896 supplies the endpoints. )
AT 3853
( Header: flags, saved name and link )
BYTES 8200D54A38
CELL 385A ( native entry point )
LDY.# 01             ( 385A )
STY.ABS 3851         ( 385C )
DEY                  ( 385F )
LDA.INDY D3          ( 3860 )
CMP.ZPX 04           ( 3862 )
BNE 386C             ( 3864 )
DEC.ABS 3851         ( 3866 )
JMP.ABS 3886         ( 3869 )
LDA.# 01             ( 386C )
CLC                  ( 386E )
ADC.ZP D3            ( 386F )
STA.ZP D3            ( 3871 )
BCC 3877             ( 3873 )
INC.ZP D4            ( 3875 )
LDA.ZPX 01           ( 3877 )
CMP.ZP D4            ( 3879 )
BNE 3886             ( 387B )
LDA.ZPX 00           ( 387D )
CMP.ZP D3            ( 387F )
BNE 3886             ( 3881 )
DEC.ABS 3851         ( 3883 )
LDA.ABS 3851         ( 3886 )
BNE 3860             ( 3889 )
JMP.ABS 0F47         ( 388B )
AT 388E

( FIND-BYTE-FIRST | NFA 388E CFA 3896 )
( Inferred descriptive name, not recovered original: )
( Initializes the search pointer at XSAVE+2, scans forward )
( with $3858, and returns the one-based first-match index )
( or zero. Used for raw keycodes in $5D2E. A zero count is )
( coerced to one, so even that case examines the first byte. )
( Stack: byte address count -- index-or-zero )
AT 388E
( Header: flags, saved name and link )
BYTES 8500000000D25338
DOCOL
t.DUP t.0=_12DE t.+ t.OVER t.+ t.OVER t.XSAVE t.2+ t.!
t.SCAN-BYTE-MATCH t.XSAVE t.2+ t.@ t.=
t.0BRANCH CELL 000A ( -> 38C0 )
t.2DROP t.0
t.BRANCH CELL 0012 ( -> 38D0 )
( label 38C0 )
t.XSAVE t.2+ t.@ t.SWAP t.- t.1+ t.SWAP t.DROP
( label 38D0 )
t.;S
AT 38D2

( LOAD-UNLESS-DEFINED | NFA 38D2 CFA 38DA )
( Inferred descriptive name, not recovered original: Parses )
( the following name with -FIND; if it exists discards the )
( screen number, otherwise LOADs it. )
( Stack: screen -- )
AT 38D2
( Header: flags, saved name and link )
BYTES 8500000000A28E38
DOCOL
t.-FIND
t.0BRANCH CELL 000A ( -> 38EA )
t.2DROP t.DROP
t.BRANCH CELL 0004 ( -> 38EC )
( label 38EA )
t.LOAD
( label 38EC )
t.;S
AT 38EE

( <=< | NFA 38EE CFA 38F4 )
( Matched original source name: Complete threaded body OVER )
( > >R < R> * matches the author tutorial and GAM source; )
( surviving three-character name and final < agree. Both )
( comparisons are strict signed bounds, so equal endpoints )
( return0. )
( Stack: low value high -- flag )
AT 38EE
( Header: flags, saved name and link )
BYTES 830000BCD238
DOCOL
t.OVER t.> t.>R t.< t.R> t.* t.;S
AT 3904

( % | NFA 3904 CFA 3908 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 3904
( Header: flags, saved name and link )
BYTES C1A5EE38
DOCOL
t.COMPILE t.CLIT t.BL t.WORD t.HERE t.NUMBER t.DROP LIT16 FFFF
t.OVER LIT16 0100 t.<=< t.0=_12DE
t.0BRANCH CELL 0014 ( -> 393C )
t.CR
( ATASCII text: Error: %  )
t.(.")
BYTES 094572726F723A202520
t.DUP t..
( label 393C )
t.C, t.;S
AT 3940

( DIRB | NFA 3940 CFA 3947 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3545 [DIRB] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $3932, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 3940
( Header: flags, saved name and link )
BYTES 84000000C20439
DOCON
CELL 01F4
AT 394B

( S-L | NFA 394B CFA 3951 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $354F [S-L] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $393C, )
( corresponding word in contiguous 33-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 394B
( Header: flags, saved name and link )
BYTES 830000CC4039
DOVAR
CELL 0000
AT 3955

( HE | NFA 3955 CFA 395A )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $35B4 [HE] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $39A1, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 3955
( Header: flags, saved name and link )
BYTES 8200C54B39
DOCON
CELL 8CA0
AT 395E

( SP& | NFA 395E CFA 3964 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $35BE [SP&] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 09_A_Forth.ATR CFA $39AB, )
( corresponding word in contiguous 33-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 395E
( Header: flags, saved name and link )
BYTES 830000A65539
DOVAR
CELL 00FF
AT 3968

( ASC-PEEK | NFA 3968 CFA 3973 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $35CD [ASC-PEEK] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 11_A_Graf.ATR CFA $3303, )
( corresponding word in contiguous 10-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 3968
( Header: flags, saved name and link )
BYTES 8800000000000000CB5E39
CELL 3975 ( native entry point )
STX.ZP D1            ( 3975 )
LDA.ZPX 00           ( 3977 )
TAY                  ( 3979 )
INX                  ( 397A )
INX                  ( 397B )
LDA.ZPX 00           ( 397C )
STA.ZP D3            ( 397E )
INX                  ( 3980 )
LDA.ZPX 00           ( 3981 )
STA.ZP D4            ( 3983 )
DEY                  ( 3985 )
LDA.INDY D3          ( 3986 )
LDX.# 01             ( 3988 )
CMP.# 80             ( 398A )
BPL 3997             ( 398C )
CMP.# 20             ( 398E )
BPL 3994             ( 3990 )
LDX.# 00             ( 3992 )
JMP.ABS 399D         ( 3994 )
CMP.# A0             ( 3997 )
BPL 399D             ( 3999 )
LDX.# 00             ( 399B )
CPX.# 00             ( 399D )
BNE 39A8             ( 399F )
CLC                  ( 39A1 )
ADC.# 40             ( 39A2 )
CLC                  ( 39A4 )
JMP.ABS 39BF         ( 39A5 )
CMP.# 80             ( 39A8 )
BPL 39B7             ( 39AA )
CMP.# 60             ( 39AC )
BPL 39B4             ( 39AE )
SEC                  ( 39B0 )
SBC.# 20             ( 39B1 )
CLC                  ( 39B3 )
JMP.ABS 39BF         ( 39B4 )
CMP.# E0             ( 39B7 )
BPL 39BF             ( 39B9 )
SEC                  ( 39BB )
SBC.# 20             ( 39BC )
CLC                  ( 39BE )
STA.INDY D3          ( 39BF )
CPY.# 00             ( 39C1 )
BNE 3985             ( 39C3 )
LDX.ZP D1            ( 39C5 )
JMP.ABS 1057         ( 39C7 )
AT 39CA

( PEEK-ASC | NFA 39CA CFA 39D5 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $362F [PEEK-ASC] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 11_A_Graf.ATR CFA $3365, )
( corresponding word in contiguous 10-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 39CA
( Header: flags, saved name and link )
BYTES 8800000000000000C36839
DOCOL
t.OVER t.OVER LIT8 02 LIT8 00 t.(DO)
( label 39E3 )
t.ASC-PEEK
t.(LOOP) CELL FFFC ( -> 39E3 )
t.;S
AT 39EB

( X! | NFA 39EB CFA 39F0 )
( Matched original source name: Complete body stores a cell )
( at OS COLCRS $55; the author tutorial defines X! as85 !, )
( and GAM uses the same byte-literal form. Surviving )
( two-character name ends in!. )
( Stack: x -- )
AT 39EB
( Header: flags, saved name and link )
BYTES 8200A1CA39
DOCOL
LIT8 55 t.! t.;S
AT 39F9

( Y! | NFA 39F9 CFA 39FE )
( Matched original source name: Complete body stores a byte )
( at OS ROWCRS $54; the author tutorial defines Y! as84 C!, )
( and GAM uses the same byte-literal form. Surviving )
( two-character name ends in!. )
( Stack: y -- )
AT 39F9
( Header: flags, saved name and link )
BYTES 8200A1EB39
DOCOL
LIT8 54 t.C! t.;S
AT 3A07

( X@ | NFA 3A07 CFA 3A0C )
( Matched original source name: Complete body matches GAM )
( screen18 line9: byte literal85 followed by @. It fetches )
( the OS COLCRS cell; surviving two-character name ends in@. )
( Stack: -- x )
AT 3A07
( Header: flags, saved name and link )
BYTES 8200C0F939
DOCOL
LIT8 55 t.@ t.;S
AT 3A15

( Y@ | NFA 3A15 CFA 3A1A )
( Matched original source name: Complete body matches GAM )
( screen18 line10: byte literal84 followed by C@. It )
( fetches OS ROWCRS; surviving two-character name ends in@. )
( Stack: -- y )
AT 3A15
( Header: flags, saved name and link )
BYTES 8200C0073A
DOCOL
LIT8 54 t.C@ t.;S
AT 3A23

( POS | NFA 3A23 CFA 3A29 )
( Matched original source name: Complete body calls Y! then )
( X!, exactly as in the author tutorial and preserved GAM )
( source. The three-character header ends inS; )
( original-runtime tests confirm both OS cursor fields. )
( Stack: x y -- )
AT 3A23
( Header: flags, saved name and link )
BYTES 830000D3153A
DOCOL
t.Y! t.X! t.;S
AT 3A31

( STYPE | NFA 3A31 CFA 3A39 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3693 [STYPE] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 11_A_Graf.ATR CFA $33C9, )
( corresponding word in contiguous 10-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 3A31
( Header: flags, saved name and link )
BYTES 8500000000C5233A
DOCOL
t.OVER t.OVER t.ASC-PEEK t.OVER t.OVER t.DUP t.>R LIT8 58 t.@
LIT8 55 t.@ t.DUP t.>R t.+ LIT8 54 t.C@ LIT8 28 t.* t.+ t.SWAP
t.R> t.R> t.+ LIT16 0055 t.! LIT8 1E t.EMIT LIT16 001F t.EMIT
t.CMOVE t.PEEK-ASC t.;S
AT 3A84

( [S"] | NFA 3A84 CFA 3A8B )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $36E5 [[S"]] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 11_A_Graf.ATR CFA $341B, )
( corresponding word in contiguous 10-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 3A84
( Header: flags, saved name and link )
BYTES 84000000A9313A
DOCOL
t.R t.COUNT t.DUP t.1+ t.R> t.+ t.>R t.STYPE t.;S
AT 3A9F

( S" | NFA 3A9F CFA 3AA4 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $36FE [S"] in contiguous 12-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 11_A_Graf.ATR CFA $3434, )
( corresponding word in contiguous 10-definition sequence )
( matching name length/suffix, flags, word kind, and body )
( length )
AT 3A9F
( Header: flags, saved name and link )
BYTES C200A2843A
DOCOL
LIT16 3A8B LIT16 199F t.! t.." LIT16 1977 LIT16 199F t.! t.;S
AT 3ABE

( GRAPHICS-SOURCE-PTR | NFA 3ABE CFA 3AC3 )
( Inferred descriptive name, not recovered original: )
( Constant $F0; RLE decoding reads its source pointer and )
( picture composition also uses it as a destination pointer. )
( Stack: -- address )
AT 3ABE
( Header: flags, saved name and link )
BYTES 8200D39F3A
DOCON
CELL 00F0
AT 3AC7

( GRAPHICS-DEST-PTR | NFA 3AC7 CFA 3ACC )
( Inferred descriptive name, not recovered original: )
( Constant $F2; RLE decoding writes through this pointer. )
( Bitmap composition reuses it as a source pointer. )
( Stack: -- address )
AT 3AC7
( Header: flags, saved name and link )
BYTES 8200CCBE3A
DOCON
CELL 00F2
AT 3AD0

( GRAPHICS-ZP-F4 | NFA 3AD0 CFA 3AD5 )
( Inferred descriptive name, not recovered original: )
( Constant $F4, the two-byte saved column origin in the RLE )
( engine. No Forth caller distinguishes this constant from )
( the identical alias at $3ADF. )
( Stack: -- address )
AT 3AD0
( Header: flags, saved name and link )
BYTES 8200AAC73A
DOCON
CELL 00F4
AT 3AD9

( GRAPHICS-ZP-F4-ALIAS | NFA 3AD9 CFA 3ADF )
( Inferred descriptive name, not recovered original: Second )
( constant returning $F4. Native composition also reuses )
( its low byte as a two-bit pixel mask; no decoded Forth )
( consumer establishes this alias's original intended role. )
( Stack: -- address )
AT 3AD9
( Header: flags, saved name and link )
BYTES 830000B0D03A
DOCON
CELL 00F4
AT 3AE3

( GRAPHICS-ROW-STRIDE | NFA 3AE3 CFA 3AE8 )
( Inferred descriptive name, not recovered original: )
( Constant $F6; RLE destination-row increment and )
( composition source-row increment are stored here. )
( Stack: -- address )
AT 3AE3
( Header: flags, saved name and link )
BYTES 8200ABD93A
DOCON
CELL 00F6
AT 3AEC

( GRAPHICS-COLUMN-COUNT | NFA 3AEC CFA 3AF2 )
( Inferred descriptive name, not recovered original: )
( Constant $F7; RLE decrements it once per output column, )
( and bitmap composition uses it as bytes per row. )
( Stack: -- address )
AT 3AEC
( Header: flags, saved name and link )
BYTES 830000C1E33A
DOCON
CELL 00F7
AT 3AF6

( GRAPHICS-ROW-COUNT | NFA 3AF6 CFA 3AFC )
( Inferred descriptive name, not recovered original: )
( Constant $F8; RLE reloads its per-column row countdown )
( from this byte, while composition decrements it directly. )
( Stack: -- address )
AT 3AF6
( Header: flags, saved name and link )
BYTES 830000C1EC3A
DOCON
CELL 00F8
AT 3B00

( GRAPHICS-ROW-COUNTER | NFA 3B00 CFA 3B05 )
( Inferred descriptive name, not recovered original: )
( Constant $F9; RLE decrements its remaining rows; the )
( blitter reuses the byte as destination stride. )
( Stack: -- address )
AT 3B00
( Header: flags, saved name and link )
BYTES 8200CDF63A
DOCON
CELL 00F9
AT 3B09

( GRAPHICS-RLE-GROUP-SIZE | NFA 3B09 CFA 3B0F )
( Inferred descriptive name, not recovered original: )
( Constant $FA; the RLE escape decoder stores the repeated )
( group width [one through four] here. Composition reuses )
( it as a pixel byte. )
( Stack: -- address )
AT 3B09
( Header: flags, saved name and link )
BYTES 830000D0003B
DOCON
CELL 00FA
AT 3B13

( GRAPHICS-RLE-REPEATS | NFA 3B13 CFA 3B1A )
( Inferred descriptive name, not recovered original: )
( Constant $FB; low six bits of an $8D escape control byte )
( specify the repeat counter. Blitting also reuses it for )
( six-row hit-map progression. )
( Stack: -- address )
AT 3B13
( Header: flags, saved name and link )
BYTES 84000000DA093B
DOCON
CELL 00FB
AT 3B1E

( GRAPHICS-RLE-GROUP | NFA 3B1E CFA 3B24 )
( Inferred descriptive name, not recovered original: )
( Constant $FC; the RLE escape decoder stores up to four )
( bytes beginning here. The transparency helper reuses its )
( low byte as a run counter. )
( Stack: -- address )
AT 3B1E
( Header: flags, saved name and link )
BYTES 830000CF133B
DOCON
CELL 00FC
AT 3B28

( RLE-RESTORE-COLUMN | NFA 3B28 CFA 3B2F )
( Inferred descriptive name, not recovered original: Copies )
( saved destination $F4/$F5 to $F2/$F3, then RTS. )
( Native-only helper called by $3BC3 and repeated-row )
( expansion. )
( Assembly subroutine entry; returns with RTS. )
AT 3B28
( Header: flags, saved name and link )
BYTES 84000000B01E3B
CELL 3B31 ( native entry point )
LDA.ZP F4            ( 3B31 )
STA.ZP F2            ( 3B33 )
LDA.ZP F5            ( 3B35 )
STA.ZP F3            ( 3B37 )
RTS                  ( 3B39 )
AT 3B3A

( RLE-SAVE-COLUMN | NFA 3B3A CFA 3B41 )
( Inferred descriptive name, not recovered original: Copies )
( $F2/$F3 to saved origin $F4/$F5, then RTS; used before )
( decoding each column. )
( Assembly subroutine entry; returns with RTS. )
AT 3B3A
( Header: flags, saved name and link )
BYTES 84000000B0283B
CELL 3B43 ( native entry point )
LDA.ZP F2            ( 3B43 )
STA.ZP F4            ( 3B45 )
LDA.ZP F3            ( 3B47 )
STA.ZP F5            ( 3B49 )
RTS                  ( 3B4B )
AT 3B4C

( RLE-NEXT-ROW | NFA 3B4C CFA 3B52 )
( Inferred descriptive name, not recovered original: Adds )
( unsigned stride $F6 to pointer $F2/$F3, then RTS. Called )
( after each output byte. )
( Assembly subroutine entry; returns with RTS. )
AT 3B4C
( Header: flags, saved name and link )
BYTES 830000AB3A3B
CELL 3B54 ( native entry point )
CLC                  ( 3B54 )
LDA.ZP F6            ( 3B55 )
ADC.ZP F2            ( 3B57 )
STA.ZP F2            ( 3B59 )
BCC 3B60             ( 3B5B )
INC.ZP F3            ( 3B5D )
CLC                  ( 3B5F )
RTS                  ( 3B60 )
AT 3B61

( RLE-ADVANCE-SOURCE | NFA 3B61 CFA 3B67 )
( Inferred descriptive name, not recovered original: Adds )
( accumulator A to $F0/$F1 with carry, then RTS. )
( Native-only helper. )
( Assembly subroutine entry; returns with RTS. )
AT 3B61
( Header: flags, saved name and link )
BYTES 830000AB4C3B
CELL 3B69 ( native entry point )
CLC                  ( 3B69 )
ADC.ZP F0            ( 3B6A )
STA.ZP F0            ( 3B6C )
BCC 3B73             ( 3B6E )
INC.ZP F1            ( 3B70 )
CLC                  ( 3B72 )
RTS                  ( 3B73 )
AT 3B74

( RLE-EXPAND-RUN | NFA 3B74 CFA 3B7A )
( Inferred descriptive name, not recovered original: )
( Decodes escape $8D: control top two bits plus one give )
( group size, low six bits initialize the repeat countdown; )
( reads the group and writes strided bytes. A zero )
( countdown wraps to256 repetitions in this native loop. )
( Returns RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 3B74
( Header: flags, saved name and link )
BYTES 830000D0613B
CELL 3B7C ( native entry point )
LDY.# 01             ( 3B7C )
LDA.# C0             ( 3B7E )
AND.INDY F0          ( 3B80 )
LSR.A                ( 3B82 )
LSR.A                ( 3B83 )
LSR.A                ( 3B84 )
LSR.A                ( 3B85 )
LSR.A                ( 3B86 )
LSR.A                ( 3B87 )
CLC                  ( 3B88 )
ADC.# 01             ( 3B89 )
STA.ZP FA            ( 3B8B )
LDA.# 3F             ( 3B8D )
AND.INDY F0          ( 3B8F )
STA.ZP FB            ( 3B91 )
LDX.# 00             ( 3B93 )
INY                  ( 3B95 )
LDA.INDY F0          ( 3B96 )
STA.ZPX FC           ( 3B98 )
INY                  ( 3B9A )
INX                  ( 3B9B )
CPX.ZP FA            ( 3B9C )
BNE 3B96             ( 3B9E )
TYA                  ( 3BA0 )
JSR.ABS 3B69         ( 3BA1 )
LDY.# 00             ( 3BA4 )
LDX.# 00             ( 3BA6 )
LDA.ZPX FC           ( 3BA8 )
STA.INDY F2          ( 3BAA )
JSR.ABS 3B54         ( 3BAC )
DEC.ZP F9            ( 3BAF )
INX                  ( 3BB1 )
CPX.ZP FA            ( 3BB2 )
BNE 3BA8             ( 3BB4 )
DEC.ZP FB            ( 3BB6 )
BNE 3BA6             ( 3BB8 )
RTS                  ( 3BBA )
AT 3BBB

( RLE-EXPAND-COLUMNS | NFA 3BBB CFA 3BC1 )
( Inferred descriptive name, not recovered original: Native )
( decoder consumes literals or $8D runs column by column, )
( using $F7 columns, $F8 rows and $F6 destination stride. )
( Returns with RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 3BBB
( Header: flags, saved name and link )
BYTES 830000BC743B
CELL 3BC3 ( native entry point )
JSR.ABS 3B43         ( 3BC3 )
LDA.ZP F8            ( 3BC6 )
STA.ZP F9            ( 3BC8 )
LDY.# 00             ( 3BCA )
LDA.INDY F0          ( 3BCC )
CMP.# 8D             ( 3BCE )
BNE 3BD8             ( 3BD0 )
JSR.ABS 3B7C         ( 3BD2 )
JMP.ABS 3BE4         ( 3BD5 )
STA.INDY F2          ( 3BD8 )
DEC.ZP F9            ( 3BDA )
JSR.ABS 3B54         ( 3BDC )
LDA.# 01             ( 3BDF )
JSR.ABS 3B69         ( 3BE1 )
LDA.ZP F9            ( 3BE4 )
BNE 3BCA             ( 3BE6 )
JSR.ABS 3B31         ( 3BE8 )
LDA.ZP F2            ( 3BEB )
CLC                  ( 3BED )
ADC.# 01             ( 3BEE )
STA.ZP F2            ( 3BF0 )
BCC 3BF6             ( 3BF2 )
INC.ZP F3            ( 3BF4 )
DEC.ZP F7            ( 3BF6 )
BNE 3BC3             ( 3BF8 )
RTS                  ( 3BFA )
AT 3BFB

( RLE-EXPAND | NFA 3BFB CFA 3C04 )
( Inferred descriptive name, not recovered original: )
( Preserves the Forth X stack pointer, calls native column )
( decoder $3BC3, restores X and jumps to NEXT. )
( Stack: -- )
AT 3BFB
( Header: flags, saved name and link )
BYTES 860000000000BCBB3B
CELL 3C06 ( native entry point )
STX.ZP D1            ( 3C06 )
JSR.ABS 3BC3         ( 3C08 )
LDX.ZP D1            ( 3C0B )
JMP.ABS 0F47         ( 3C0D )
AT 3C10

( RLE-SIZE! | NFA 3C10 CFA 3C17 )
( Inferred descriptive name, not recovered original: Stores )
( rows in $F8 and columns in $F7 for the column decoder. )
( Stack: columns rows -- )
AT 3C10
( Header: flags, saved name and link )
BYTES 84000000A1FB3B
DOCOL
t.GRAPHICS-ROW-COUNT t.C! t.GRAPHICS-COLUMN-COUNT t.C! t.;S
AT 3C23

( RLE-POINTERS! | NFA 3C23 CFA 3C2A )
( Inferred descriptive name, not recovered original: Stores )
( destination in $F2/$F3 and source in $F0/$F1. )
( Stack: source destination -- )
AT 3C23
( Header: flags, saved name and link )
BYTES 84000000A1103C
DOCOL
t.GRAPHICS-DEST-PTR t.! t.GRAPHICS-SOURCE-PTR t.! t.;S
AT 3C36

( RLE-STRIDE! | NFA 3C36 CFA 3C3D )
( Inferred descriptive name, not recovered original: Stores )
( the low byte of its argument in $F6. )
( Stack: stride -- )
AT 3C36
( Header: flags, saved name and link )
BYTES 84000000A1233C
DOCOL
t.GRAPHICS-ROW-STRIDE t.C! t.;S
AT 3C45

( BANK-COPY-LENGTH | NFA 3C45 CFA 3C4B )
( Inferred descriptive name, not recovered original: 16-bit )
( count read by $3CB1: high byte supplies full 256-byte )
( pages and low byte a final partial page. )
( Stack: -- address )
AT 3C45
( Header: flags, saved name and link )
BYTES 830000CC363C
DOVAR
CELL 0000
AT 3C4F

( BANK-COPY-SOURCE | NFA 3C4F CFA 3C54 )
( Inferred descriptive name, not recovered original: )
( Constant $DD, the source pointer used by native $3C92. )
( Stack: -- address )
AT 3C4F
( Header: flags, saved name and link )
BYTES 8200A5453C
DOCON
CELL 00DD
AT 3C58

( BANK-COPY-DEST | NFA 3C58 CFA 3C5D )
( Inferred descriptive name, not recovered original: )
( Constant $DF, the destination pointer used by native )
( $3C92. )
( Stack: -- address )
AT 3C58
( Header: flags, saved name and link )
BYTES 8200A54F3C
DOCON
CELL 00DF
AT 3C61

( NMI-ENABLE-SHADOW | NFA 3C61 CFA 3C67 )
( Inferred descriptive name, not recovered original: )
( Software shadow for NMIEN. Color DLI install selects $E0 )
( bits; banked-copy routines set NMIEN=0 before hiding OS )
( ROM and restore this byte afterward. )
( Stack: -- address )
AT 3C61
( Header: flags, saved name and link )
BYTES 830000C9583C
DOVAR
CELL 0060
AT 3C6B

( ENTER-RAM-UNDER-OS | NFA 3C6B CFA 3C71 )
( Inferred descriptive name, not recovered original: Waits )
( for the VCOUNT bit7 transition, synchronizes WSYNC, )
( disables NMIEN and IRQs, then decrements PORTB to expose )
( RAM beneath the OS ROM. Native RTS entry. )
( Assembly subroutine entry; returns with RTS. )
AT 3C6B
( Header: flags, saved name and link )
BYTES 830000D4613C
CELL 3C73 ( native entry point )
LDA.ABS D40B         ( 3C73 )
BMI 3C73             ( 3C76 )
LDA.ABS D40B         ( 3C78 )
BPL 3C78             ( 3C7B )
LDA.# FF             ( 3C7D )
STA.ABS D40A         ( 3C7F )
LDA.# 00             ( 3C82 )
STA.ABS D40E         ( 3C84 )
SEI                  ( 3C87 )
DEC.ABS D301         ( 3C88 )
RTS                  ( 3C8B )
AT 3C8C

( COPY-BANK-PAGE | NFA 3C8C CFA 3C92 )
( Inferred descriptive name, not recovered original: After )
( exposing RAM under OS, copies Y bytes backward through )
( $DD/$DF, restores PORTB and the saved NMIEN value, )
( enables IRQs and RTS. Y=0 copies256 bytes. )
( Assembly subroutine entry; returns with RTS. )
AT 3C8C
( Header: flags, saved name and link )
BYTES 830000CC6B3C
CELL 3C94 ( native entry point )
JSR.ABS 3C73         ( 3C94 )
DEY                  ( 3C97 )
LDA.INDY DD          ( 3C98 )
STA.INDY DF          ( 3C9A )
CPY.# 00             ( 3C9C )
BNE 3C97             ( 3C9E )
INC.ABS D301         ( 3CA0 )
LDA.ABS 3C69         ( 3CA3 )
STA.ABS D40E         ( 3CA6 )
CLI                  ( 3CA9 )
RTS                  ( 3CAA )
AT 3CAB

( COPY-BANK-BYTES | NFA 3CAB CFA 3CB1 )
( Inferred descriptive name, not recovered original: Copies )
( the full pages and remainder specified by $3C4B through )
( native $3C92, preserving the Forth parameter-stack X )
( register. )
( Stack: -- )
AT 3CAB
( Header: flags, saved name and link )
BYTES 830000D68C3C
CELL 3CB3 ( native entry point )
STX.ZP D1            ( 3CB3 )
LDX.ABS 3C4E         ( 3CB5 )
LDY.# 00             ( 3CB8 )
CPX.# 00             ( 3CBA )
BEQ 3CC8             ( 3CBC )
JSR.ABS 3C94         ( 3CBE )
INC.ZP DE            ( 3CC1 )
INC.ZP E0            ( 3CC3 )
DEX                  ( 3CC5 )
BNE 3CBE             ( 3CC6 )
LDA.ABS 3C4D         ( 3CC8 )
BEQ 3CD3             ( 3CCB )
LDY.ABS 3C4D         ( 3CCD )
JSR.ABS 3C94         ( 3CD0 )
LDX.ZP D1            ( 3CD3 )
JMP.ABS 0F47         ( 3CD5 )
AT 3CD8

( COPY-UNDER-OS | NFA 3CD8 CFA 3CE0 )
( Inferred descriptive name, not recovered original: Stores )
( length and both bank-copy pointers, then executes $3CB1. )
( Tutorial PMOVE has the same parameter roles, but this )
( game uses its own raster-synchronized implementation. )
( Stack: source destination length -- )
AT 3CD8
( Header: flags, saved name and link )
BYTES 8500000000C5AB3C
DOCOL
t.BANK-COPY-LENGTH t.! t.BANK-COPY-DEST t.! t.BANK-COPY-SOURCE
t.! t.COPY-BANK-BYTES t.;S
AT 3CF2

( BANK-FIRST-SPAN | NFA 3CF2 CFA 3CF8 )
( Inferred descriptive name, not recovered original: )
( Constant $2800 is the size of logical offsets mapped to )
( physical $D800..$FFFF; later offsets map from $C000. )
( Stack: -- bytes )
AT 3CF2
( Header: flags, saved name and link )
BYTES 830000B8D83C
DOCON
CELL 2800
AT 3CFC

( SPLIT-BANK-RANGE | NFA 3CFC CFA 3D02 )
( Inferred descriptive name, not recovered original: Splits )
( a logical offset/count pair at $2800 into physical copy )
( spans, mapping lower offsets from $D800 and higher )
( offsets from $C000. Called by both directions of bank )
( transfer. )
( Stack: offset count -- address1 count1 address2 count2 )
( count1 )
AT 3CFC
( Header: flags, saved name and link )
BYTES 830000CCF23C
DOCOL
t.OVER t.+ t.DUP t.>R t.BANK-FIRST-SPAN t.< t.0=_12DE
t.0BRANCH CELL 004A ( -> 3D5E )
t.DUP t.BANK-FIRST-SPAN t.< t.0=_12DE
t.0BRANCH CELL 0020 ( -> 3D40 )
t.>R t.0 t.0 LIT16 C000 t.R t.BANK-FIRST-SPAN t.- t.+ t.R> t.R
t.SWAP t.-
t.BRANCH CELL 001C ( -> 3D5A )
( label 3D40 )
t.>R LIT16 D800 t.R t.+ t.BANK-FIRST-SPAN t.R> t.- LIT16 C000
t.R t.BANK-FIRST-SPAN t.-
( label 3D5A )
t.BRANCH CELL 0018 ( -> 3D74 )
( label 3D5E )
t.>R LIT16 D800 t.R t.+ t.R> t.R t.SWAP t.- t.0 t.0
( label 3D74 )
t.R> t.DROP t.>R t.OVER t.R> t.SWAP t.;S
AT 3D82

( STORE-BANK-RANGE | NFA 3D82 CFA 3D89 )
( Inferred descriptive name, not recovered original: Uses )
( $3D02 to split the logical range, then copies from normal )
( RAM into one or two physical RAM-under-OS spans with )
( $3CE0. )
( Stack: source offset count -- )
AT 3D82
( Header: flags, saved name and link )
BYTES 84000000CDFC3C
DOCOL
t.ROT t.>R t.SPLIT-BANK-RANGE t.R t.+ t.ROT t.ROT
t.COPY-UNDER-OS t.R> t.ROT t.ROT t.COPY-UNDER-OS t.;S
AT 3DA5

( FETCH-BANK-RANGE | NFA 3DA5 CFA 3DAC )
( Inferred descriptive name, not recovered original: Uses )
( $3D02 to split the logical range, then copies one or two )
( RAM-under-OS spans into contiguous normal RAM with $3CE0. )
( Stack: destination offset count -- )
AT 3DA5
( Header: flags, saved name and link )
BYTES 84000000CD823D
DOCOL
t.ROT t.>R t.SPLIT-BANK-RANGE t.R t.+ t.SWAP t.COPY-UNDER-OS
t.R> t.SWAP t.COPY-UNDER-OS t.;S
AT 3DC4

( SPLIT-UNSIGNED-BYTES | NFA 3DC4 CFA 3DCE )
( Inferred descriptive name, not recovered original: Native )
( code moves the original high byte to a new zero-extended )
( stack cell and clears both high halves. )
( Stack: cell -- low high )
AT 3DC4
( Header: flags, saved name and link )
BYTES 87000000000000C2A53D
CELL 3DD0 ( native entry point )
LDA.ZPX 01           ( 3DD0 )
DEX                  ( 3DD2 )
DEX                  ( 3DD3 )
STA.ZPX 00           ( 3DD4 )
LDA.# 00             ( 3DD6 )
STA.ZPX 03           ( 3DD8 )
STA.ZPX 01           ( 3DDA )
JMP.ABS 0F47         ( 3DDC )
AT 3DDF

( PATCH-VBI-SLOT | NFA 3DDF CFA 3DE7 )
( Inferred descriptive name, not recovered original: Parses )
( a Forth name with -FIND, writes JSR opcode $20 at )
( table+1+3*slot and stores the target native entry after )
( it; otherwise prints ERROR VBI. )
( Stack: slot table -- )
AT 3DDF
( Header: flags, saved name and link )
BYTES 8500000000A9C43D
DOCOL
t.-FIND
t.0BRANCH CELL 0025 ( -> 3E12 )
t.DROP t.SWAP t.1+ t.ROT LIT8 03 t.* t.+ t.DUP t.>R t.1+ t.!
LIT16 0020 t.R> t.C!
t.BRANCH CELL 0010 ( -> 3E20 )
( label 3E12 )
t.DROP
( ATASCII text: ERROR VBI )
t.(.")
BYTES 094552524F5220564249
( label 3E20 )
t.;S
AT 3E22

( VBI-CALL-TABLE | NFA 3E22 CFA 3E2A )
( Inferred descriptive name, not recovered original: )
( Mutable native JSR/NOP slots ending in a jump to $3E59. )
( INSTALL-GAME-VBI installs table+1 as the immediate VBI )
( via SETVBV A=6. )
( Stack: -- address )
AT 3E22
( Header: flags, saved name and link )
BYTES 8500000000B1DF3D
DOVAR
BYTES EAEAEAEA20F75EEAEAEAEAEAEAEAEAEA4C593E20
AT 3E40

( VBI-SLOT! | NFA 3E40 CFA 3E47 )
( Inferred descriptive name, not recovered original: )
( Supplies the VBI call table to $3DE7; the parsed name )
( determines the installed JSR target. )
( Stack: slot -- )
AT 3E40
( Header: flags, saved name and link )
BYTES 84000000B1223E
DOCOL
t.VBI-CALL-TABLE t.PATCH-VBI-SLOT t.;S
AT 3E4F

( CONTINUE-OS-VBI | NFA 3E4F CFA 3E57 )
( Inferred descriptive name, not recovered original: Native )
( JMP $E45F continues the OS SYSVBV handler after this )
( game's immediate VBI; it is not a Forth NEXT return or )
( XITVBV. )
( Assembly VBI continuation; jumps to OS SYSVBV. )
AT 3E4F
( Header: flags, saved name and link )
BYTES 8500000000A9403E
CELL 3E59 ( native entry point )
JMP.ABS E45F         ( 3E59 )
AT 3E5C

( INSTALL-GAME-VBI | NFA 3E5C CFA 3E66 )
( Inferred descriptive name, not recovered original: Native )
( SETVBV call at $E45C installs the game interrupt entry )
( $3E2D with selector six. )
AT 3E5C
( Header: flags, saved name and link )
BYTES 87000000000000B14F3E
CELL 3E68 ( native entry point )
STX.ZP D1            ( 3E68 )
LDX.# 3E             ( 3E6A )
LDY.# 2D             ( 3E6C )
LDA.# 06             ( 3E6E )
JSR.ABS E45C         ( 3E70 )
LDX.ZP D1            ( 3E73 )
JMP.ABS 0F47         ( 3E75 )
AT 3E78

( RESTORE-OS-VBI | NFA 3E78 CFA 3E83 )
( Inferred descriptive name, not recovered original: Native )
( SETVBV call restores the operating system VBI entry $E45F )
( with selector six. )
AT 3E78
( Header: flags, saved name and link )
BYTES 8800000000000000B15C3E
CELL 3E85 ( native entry point )
STX.ZP D1            ( 3E85 )
LDX.# E4             ( 3E87 )
LDY.# 5F             ( 3E89 )
LDA.# 06             ( 3E8B )
JSR.ABS E45C         ( 3E8D )
LDX.ZP D1            ( 3E90 )
JMP.ABS 0F47         ( 3E92 )
AT 3E95

( RECORD-SPAN | NFA 3E95 CFA 3E9C )
( Inferred descriptive name, not recovered original: Shared )
( scratch cell. PM-plane copying uses it as per-plane byte )
( length; bank resource lookup stores the record payload )
( length here, while the optimized scanner temporarily )
( reuses its low byte for pointer addition. )
( Stack: -- address )
AT 3E95
( Header: flags, saved name and link )
BYTES 84000000C4783E
DOVAR
CELL 00C6
AT 3EA0

( RECORD-WRAP-HIGH | NFA 3EA0 CFA 3EA6 )
( Inferred descriptive name, not recovered original: Native )
( scan $3ED1 compares pointer high byte against this )
( threshold, initially $A7, then sets it to $D8 after )
( wrapping the resource window. )
( Stack: -- address )
AT 3EA0
( Header: flags, saved name and link )
BYTES 830000C3953E
DOVAR
CELL 00A7
AT 3EAA

( RECORD-POINTER | NFA 3EAA CFA 3EAF )
( Inferred descriptive name, not recovered original: )
( Constant $D2, the current pointer used by resource )
( scanning and PM-plane copies. )
( Stack: -- address )
AT 3EAA
( Header: flags, saved name and link )
BYTES 8200CBA03E
DOCON
CELL 00D2
AT 3EB3

( ADVANCE-RECORD-POINTER | NFA 3EB3 CFA 3EB9 )
( Inferred descriptive name, not recovered original: Adds )
( the 16-bit RECORD-SPAN cell to $D2/$D3 and returns with )
( RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 3EB3
( Header: flags, saved name and link )
BYTES 830000ABAA3E
CELL 3EBB ( native entry point )
LDA.ZP D2            ( 3EBB )
CLC                  ( 3EBD )
ADC.ABS 3E9E         ( 3EBE )
STA.ZP D2            ( 3EC1 )
LDA.ZP D3            ( 3EC3 )
ADC.ABS 3E9F         ( 3EC5 )
STA.ZP D3            ( 3EC8 )
RTS                  ( 3ECA )
AT 3ECB

( SCAN-LENGTH-RECORDS | NFA 3ECB CFA 3ED1 )
( Inferred descriptive name, not recovered original: Walks )
( u16-length records and advances $D2/$D3 by length+2 with )
( direct pointer arithmetic, wrapping the banked resource )
( window at its threshold. Unlike Klatwa, it does not )
( retain each span length in $3E9C. Native RTS. )
AT 3ECB
( Header: flags, saved name and link )
BYTES 830000AAB33E
CELL 3ED3 ( native entry point )
LDA.ZPX 02           ( 3ED3 )
LDY.# 00             ( 3ED5 )
TAX                  ( 3ED7 )
BEQ 3F0C             ( 3ED8 )
LDA.INDY D2          ( 3EDA )
INY                  ( 3EDC )
CLC                  ( 3EDD )
ADC.ZP D2            ( 3EDE )
STA.ABS 3E9E         ( 3EE0 )
LDA.INDY D2          ( 3EE3 )
ADC.ZP D3            ( 3EE5 )
STA.ZP D3            ( 3EE7 )
CLC                  ( 3EE9 )
LDA.ABS 3E9E         ( 3EEA )
ADC.# 02             ( 3EED )
STA.ZP D2            ( 3EEF )
BCC 3EF5             ( 3EF1 )
INC.ZP D3            ( 3EF3 )
DEY                  ( 3EF5 )
LDA.ZP D3            ( 3EF6 )
CMP.ABS 3EA8         ( 3EF8 )
BMI 3F09             ( 3EFB )
LDA.ZP D3            ( 3EFD )
CLC                  ( 3EFF )
ADC.# C0             ( 3F00 )
STA.ZP D3            ( 3F02 )
LDA.# D8             ( 3F04 )
STA.ABS 3EA8         ( 3F06 )
DEX                  ( 3F09 )
BNE 3EDA             ( 3F0A )
LDX.ZP D1            ( 3F0C )
RTS                  ( 3F0E )
AT 3F0F

( SET-RECORD-SCAN-POINTER | NFA 3F0F CFA 3F15 )
( Inferred descriptive name, not recovered original: Copies )
( the top Forth cell into $D2/$D3 and saves X in XSAVE; )
( native helper returns RTS without dropping parameters. )
( Assembly subroutine entry; returns with RTS. )
AT 3F0F
( Header: flags, saved name and link )
BYTES 830000AACB3E
CELL 3F17 ( native entry point )
STX.ZP D1            ( 3F17 )
LDA.ZPX 00           ( 3F19 )
STA.ZP D2            ( 3F1B )
LDA.ZPX 01           ( 3F1D )
STA.ZP D3            ( 3F1F )
RTS                  ( 3F21 )
AT 3F22

( SCAN-RAM-RECORD | NFA 3F22 CFA 3F28 )
( Inferred descriptive name, not recovered original: Sets )
( the wrap threshold to $A7, initializes $D2/$D3, scans )
( records, and drops both arguments; resulting address )
( remains in RECORD-POINTER. )
( Stack: index base -- )
AT 3F22
( Header: flags, saved name and link )
BYTES 830000C30F3F
CELL 3F2A ( native entry point )
LDA.# A7             ( 3F2A )
STA.ABS 3EA8         ( 3F2C )
JSR.ABS 3F17         ( 3F2F )
JSR.ABS 3ED3         ( 3F32 )
JMP.ABS 1057         ( 3F35 )
AT 3F38

( LENGTH-RECORD-TABLE: | NFA 3F38 CFA 3F42 )
( Inferred descriptive name, not recovered original: )
( Defining word stores a u16 total length and allocates )
( bytes. Its DOES> tail skips that length and indexes )
( variable-length records through $3F28, returning the )
( record header address. )
AT 3F38
( Header: flags, saved name and link )
BYTES 87000000000000C3223F
DOCOL
t.<BUILDS t.DUP t., t.ALLOT t.DOES>
( Trailing code/data at 3F4E; retained exactly )
BYTES 1616283FAF3EE4137712
AT 3F58

( WORD-COUNT | NFA 3F58 CFA 3F5F )
( Inferred descriptive name, not recovered original: )
( Preserves the length-header address on the return stack, )
( returns address+2 and its u16 length. Equivalent )
( interface to COUNT for 16-bit lengths. )
( Stack: record -- payload length )
AT 3F58
( Header: flags, saved name and link )
BYTES 84000000D4383F
DOCOL
t.DUP t.>R t.2+ t.R> t.@ t.;S
AT 3F6D

( LENGTH-RECORD-ADDR | NFA 3F6D CFA 3F74 )
( Inferred descriptive name, not recovered original: Runs )
( $3F28 and fetches its resulting $D2/$D3 pointer. The )
( result points at the u16 length field. )
( Stack: index base -- record )
AT 3F6D
( Header: flags, saved name and link )
BYTES 84000000C4583F
DOCOL
t.SCAN-RAM-RECORD t.RECORD-POINTER t.@ t.;S
AT 3F7E

( STORE-QUOTED-RECORD | NFA 3F7E CFA 3F86 )
( Inferred descriptive name, not recovered original: Parses )
( text delimited by a double quote, copies the characters )
( after the record's u16 header, then stores the text )
( length in that header. )
( Stack: record -- )
AT 3F7E
( Header: flags, saved name and link )
BYTES 8500000000D46D3F
DOCOL
LIT16 0022 t.WORD t.HERE t.1+ t.OVER t.2+ t.HERE t.C@ t.CMOVE
t.HERE t.C@ t.SWAP t.! t.;S
AT 3FA6

( RECORD-OFFSET | NFA 3FA6 CFA 3FAD )
( Inferred descriptive name, not recovered original: )
( Preserves base, scans indexed record, and subtracts base )
( from the resulting pointer. )
( Stack: index base -- offset )
AT 3FA6
( Header: flags, saved name and link )
BYTES 84000000D57E3F
DOCOL
t.>R t.R t.SCAN-RAM-RECORD t.RECORD-POINTER t.@ t.R> t.- t.;S
AT 3FBF

( BANKED-TRANSFER | NFA 3FBF CFA 3FC5 )
( Inferred descriptive name, not recovered original: )
( Nonzero selects sector transfer through PAD and the )
( logical bank-copy helpers; zero transfers directly )
( through normal RAM. Set by $5C88 when loading banked )
( scene assets. )
( Stack: -- address )
AT 3FBF
( Header: flags, saved name and link )
BYTES 830000CDA63F
DOVAR
CELL 0000
AT 3FC9

( w3FD1 | NFA 3FC9 CFA 3FD1 )
( Unknown erased name; CFA identifier )
AT 3FC9
( Header: flags, saved name and link )
BYTES 8500000000CBBF3F
DOVAR
CELL 0000
AT 3FD5

( TRANSFER-BANK-OFFSET | NFA 3FD5 CFA 3FDC )
( Inferred descriptive name, not recovered original: )
( Logical bank offset advanced by B/BUF during the )
( PAD-staged disk transfer. )
( Stack: -- address )
AT 3FD5
( Header: flags, saved name and link )
BYTES 84000000CDC93F
DOVAR
CELL 0000
AT 3FE0

( PREPARE-SECTOR-BUFFER | NFA 3FE0 CFA 3FE6 )
( Inferred descriptive name, not recovered original: In )
( normal mode leaves all three transfer arguments )
( unchanged. In banked mode replaces the address with PAD )
( after fetching a sector from the supplied logical bank )
( offset; retains first/count. )
( Stack: address first count -- buffer first count )
AT 3FE0
( Header: flags, saved name and link )
BYTES 830000D2D53F
DOCOL
t.ROT t.BANKED-TRANSFER t.@
t.0BRANCH CELL 0012 ( -> 4002 )
t.TRANSFER-BANK-OFFSET t.! t.PAD t.TRANSFER-BANK-OFFSET t.@
t.B/BUF t.FETCH-BANK-RANGE t.PAD
( label 4002 )
t.ROT t.ROT t.;S
AT 4008

( ADVANCE-SECTOR-BUFFER | NFA 4008 CFA 400D )
( Inferred descriptive name, not recovered original: For )
( normal RAM adds B/BUF; in banked mode keeps PAD, updates )
( the logical offset and copies a sector between PAD and )
( banked RAM according to S-L. )
( Stack: buffer -- next-buffer )
AT 4008
( Header: flags, saved name and link )
BYTES 8200CEE03F
DOCOL
t.BANKED-TRANSFER t.@
t.0BRANCH CELL 0032 ( -> 4047 )
t.S-L t.@
t.0BRANCH CELL 0016 ( -> 4033 )
t.PAD t.TRANSFER-BANK-OFFSET t.@ t.B/BUF t.STORE-BANK-RANGE
t.B/BUF t.TRANSFER-BANK-OFFSET t.+!
t.BRANCH CELL 0012 ( -> 4043 )
( label 4033 )
t.B/BUF t.TRANSFER-BANK-OFFSET t.+! t.PAD
t.TRANSFER-BANK-OFFSET t.@ t.B/BUF t.FETCH-BANK-RANGE
( label 4043 )
t.BRANCH CELL 0006 ( -> 404B )
( label 4047 )
t.B/BUF t.+
( label 404B )
t.;S
AT 404D

( DIRECTORY-BUFFER | NFA 404D CFA 4054 )
( Inferred descriptive name, not recovered original: Points )
( at the PAD+B/BUF sector buffer loaded from DIRB by $4069. )
( Stack: -- address )
AT 404D
( Header: flags, saved name and link )
BYTES 84000000D20840
DOVAR
CELL 0000
AT 4058

( GROUP-END-SECTOR | NFA 4058 CFA 405E )
( Inferred descriptive name, not recovered original: Set to )
( start sector plus sector count while $4069 resolves a )
( directory entry. )
( Stack: -- address )
AT 4058
( Header: flags, saved name and link )
BYTES 830000D04D40
DOVAR
CELL 0000
AT 4062

( FIND-GAM-GROUP | NFA 4062 CFA 4069 )
( Inferred descriptive name, not recovered original: Reads )
( directory sector DIRB, sums preceding one-byte group )
( lengths, compensates for the directory-sector hole and )
( returns start/count with zero error, or an error result. )
( Stack: group -- start count 0 | error )
AT 4062
( Header: flags, saved name and link )
BYTES 84000000D25840
DOCOL
t.PAD t.B/BUF t.+ t.DUP t.DIRECTORY-BUFFER t.! t.DIRB t.1 t.1
t.-DISK t.0=_12DE
t.0BRANCH CELL 0054 ( -> 40D7 )
t.1 LIT16 007F t.1 t.(DO)
( label 408F )
t.OVER t.I t.=
t.0BRANCH CELL 002C ( -> 40C3 )
t.SWAP t.DROP t.DUP t.DIRB t.> t.0=_12DE t.0=_12DE t.+
t.DIRECTORY-BUFFER t.@ t.I t.+ t.C@ t.2DUP t.+
t.GROUP-END-SECTOR t.! t.0 t.LEAVE
t.BRANCH CELL 000E ( -> 40CF )
( label 40C3 )
t.DIRECTORY-BUFFER t.@ t.I t.+ t.C@ t.+
( label 40CF )
t.(LOOP) CELL FFBE ( -> 408F )
t.BRANCH CELL 0006 ( -> 40DB )
( label 40D7 )
t.DROP t.1
( label 40DB )
t.;S
AT 40DD

( TRANSFER-GROUP-SECTORS | NFA 40DD CFA 40E5 )
( Inferred descriptive name, not recovered original: )
( Transfers consecutive sectors through -DISK using S-L; )
( skips the directory sector when encountered, )
( advances/stages the buffer and returns a zero/nonzero )
( error status. )
( Stack: address first count -- error )
AT 40DD
( Header: flags, saved name and link )
BYTES 8500000000CB6240
DOCOL
t.PREPARE-SECTOR-BUFFER t.OVER t.+ t.OVER t.1 t.- t.OVER
t.DIRB t.SWAP t.<=< t.0=_12DE t.0=_12DE t.+ t.SWAP t.(DO)
( label 4105 )
t.I t.DIRB t.=
t.0BRANCH CELL 0008 ( -> 4115 )
t.R> t.1+ t.>R
( label 4115 )
t.DUP t.I t.1 t.S-L t.@ t.-DISK
t.0BRANCH CELL 000C ( -> 412F )
t.DROP t.0 t.LEAVE
t.BRANCH CELL 0004 ( -> 4131 )
( label 412F )
t.ADVANCE-SECTOR-BUFFER
( label 4131 )
t.(LOOP) CELL FFD2 ( -> 4105 )
t.0=_12DE t.;S
AT 4139

( DIRS | NFA 4139 CFA 4140 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $37E6 [DIRS] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4139
( Header: flags, saved name and link )
BYTES 84000000D3DD40
DOCOL
t.0 t.S-L t.! t.SWAP t.>R t.FIND-GAM-GROUP t.>R t.-DUP
t.0=_12DE
t.0BRANCH CELL 0005 ( -> 415B )
LIT8 FF
( label 415B )
t.R> t.R> t.;S
AT 4161

( DIRL | NFA 4161 CFA 4168 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $380E [DIRL] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4161
( Header: flags, saved name and link )
BYTES 84000000CC3941
DOCOL
t.1 t.S-L t.! t.SWAP t.>R t.FIND-GAM-GROUP t.R> t.SWAP t.ROT
t.;S
AT 417E

( -SE | NFA 417E CFA 4184 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $382A [-SE] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 417E
( Header: flags, saved name and link )
BYTES 830000C56141
DOVAR
CELL 0000
AT 4188

( DSL | NFA 4188 CFA 418E )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $3834 [DSL] in contiguous 4-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4188
( Header: flags, saved name and link )
BYTES 830000CC7E41
DOCOL
t.>R t.-DUP t.0=_12DE
t.0BRANCH CELL 0028 ( -> 41C0 )
t.R t.- t.DUP t.-SE t.! t.0<_12F3 t.0=_12DE
t.0BRANCH CELL 000A ( -> 41B4 )
t.R> t.TRANSFER-GROUP-SECTORS
t.BRANCH CELL 000A ( -> 41BC )
( label 41B4 )
t.R> t.DROP t.2DROP t.2
( label 41BC )
t.BRANCH CELL 0008 ( -> 41C6 )
( label 41C0 )
t.SWAP t.R> t.2DROP
( label 41C6 )
t.;S
AT 41C8

( EXPECTED-DISK-ID | NFA 41C8 CFA 41CE )
( Inferred descriptive name, not recovered original: )
( Expected first byte of the GAM directory, initially 3. )
( $41D8 compares this against the disk before a group )
( transfer. )
( Stack: -- address )
AT 41C8
( Header: flags, saved name and link )
BYTES 830000C48841
DOVAR
CELL 0003
AT 41D2

( CHECK-GAM-DISK | NFA 41D2 CFA 41D8 )
( Inferred descriptive name, not recovered original: Reads )
( DIRB into PAD; returns whether its first byte matches )
( EXPECTED-DISK-ID, or disk/error code. Preserves the )
( transfer arguments on success and removes them on failure. )
AT 41D2
( Header: flags, saved name and link )
BYTES 830000C4C841
DOCOL
t.PAD t.DIRB t.1 t.1 t.-DISK t.0=_12DE t.0=_12DE t.DUP
t.0=_12DE
t.0BRANCH CELL 0014 ( -> 4202 )
t.DROP t.PAD t.C@ t.EXPECTED-DISK-ID t.@ t.= t.0=_12DE t.3 t.*
( label 4202 )
t.DUP
t.0BRANCH CELL 000A ( -> 4210 )
t.>R t.DROP t.2DROP t.R>
( label 4210 )
t.-DUP t.0=_12DE t.;S
AT 4216

( LAST-DISK-STATUS | NFA 4216 CFA 421C )
( Inferred descriptive name, not recovered original: )
( Receives the result of the DIRL/DSL disk operation and is )
( checked by title and game loading paths. )
AT 4216
( Header: flags, saved name and link )
BYTES 830000D2D241
DOVAR
CELL 0000
AT 4220

( LOAD-GAM-GROUP | NFA 4220 CFA 4228 )
( Inferred descriptive name, not recovered original: Checks )
( disk ID, invokes DIRL/DSL and stores the result in )
( GROUP-TRANSFER-ERROR. )
( Stack: address count group -- )
AT 4220
( Header: flags, saved name and link )
BYTES 8500000000C41642
DOCOL
t.CHECK-GAM-DISK
t.0BRANCH CELL 0006 ( -> 4234 )
t.DIRL t.DSL
( label 4234 )
t.LAST-DISK-STATUS t.! t.;S
AT 423A

( SAVE-GAM-GROUP | NFA 423A CFA 4242 )
( Inferred descriptive name, not recovered original: Checks )
( disk ID, invokes DIRS/DSL, updates the cached group )
( length, and writes the directory when a formerly empty )
( group was successfully allocated; stores the result at )
( $421C. )
( Stack: address count group -- )
AT 423A
( Header: flags, saved name and link )
BYTES 8500000000C52042
DOCOL
t.CHECK-GAM-DISK
t.0BRANCH CELL 004C ( -> 4294 )
t.>R t.>R t.DUP t.R> t.R> t.2DUP t.>R t.>R t.DIRS t.DSL t.SWAP
t.DROP t.R> t.R> t.DIRECTORY-BUFFER t.@ t.+ t.DUP t.C@ t.>R
t.C! t.DUP t.0=_12DE t.R> t.0=_12DE t.*
t.0BRANCH CELL 0014 ( -> 4294 )
t.DROP t.DIRECTORY-BUFFER t.@ t.DIRB t.1 t.0 t.-DISK t.0=_12DE
t.0=_12DE
( label 4294 )
t.LAST-DISK-STATUS t.! t.;S
AT 429A

( WAIT-FRAMES | NFA 429A CFA 42A2 )
( Inferred descriptive name, not recovered original: Loops )
( until Atari RTCLOK low byte $14 changes, once per )
( requested frame. )
AT 429A
( Header: flags, saved name and link )
BYTES 8500000000C53A42
DOCOL
t.0 t.(DO)
( label 42A8 )
LIT8 14 t.C@
( label 42AD )
t.DUP LIT8 14 t.C@ t.= t.0=_12DE
t.0BRANCH CELL FFF3 ( -> 42AD )
t.DROP
t.(LOOP) CELL FFE8 ( -> 42A8 )
t.;S
AT 42C4

( ENABLE-DLI-AT | NFA 42C4 CFA 42CA )
( Inferred descriptive name, not recovered original: Sets )
( bit $80 in a display-list instruction byte to request a )
( DLI. )
( Stack: address -- )
AT 42C4
( Header: flags, saved name and link )
BYTES 830000A19A42
DOCOL
t.DUP t.C@ LIT16 0080 t.OR t.SWAP t.C! t.;S
AT 42DC

( GAME-COLOR-TABLE | NFA 42DC CFA 42E2 )
( Inferred descriptive name, not recovered original: )
( Triplets read by COLOR-TABLE-DLI into COLPF0..2; $5E1A )
( installs the gameplay colors here. )
( Stack: -- address )
AT 42DC
( Header: flags, saved name and link )
BYTES 830000CCC442
DOVAR
BYTES E4181C24C8CCC85420202020202020202020
AT 42F6

( DLI-COLOR-OFFSET | NFA 42F6 CFA 42FC )
( Inferred descriptive name, not recovered original: Byte )
( index into the color table; native DLI advances by three )
( and resets after VCOUNT reaches $40. )
( Stack: -- address )
AT 42F6
( Header: flags, saved name and link )
BYTES 830000D3DC42
DOVAR
CELL 0000
AT 4300

( DLI-COLOR-POINTER | NFA 4300 CFA 4307 )
( Inferred descriptive name, not recovered original: )
( Constant $DB, zero-page pointer dereferenced by the )
( color-table DLI. )
( Stack: -- address )
AT 4300
( Header: flags, saved name and link )
BYTES 84000000CCF642
DOCON
CELL 00DB
AT 430B

( COLOR-TABLE-DLI | NFA 430B CFA 4312 )
( Inferred descriptive name, not recovered original: Native )
( interrupt handler preserves A/Y, sends successive table )
( triplets to GTIA $D016..$D018 and returns RTI. )
( Interrupt entry; returns with RTI. )
AT 430B
( Header: flags, saved name and link )
BYTES 84000000A90043
CELL 4314 ( native entry point )
PHP                  ( 4314 )
PHA                  ( 4315 )
TYA                  ( 4316 )
PHA                  ( 4317 )
LDY.ABS 42FE         ( 4318 )
CLC                  ( 431B )
LDA.INDY DB          ( 431C )
STA.ABS D016         ( 431E )
INY                  ( 4321 )
LDA.INDY DB          ( 4322 )
STA.ABS D017         ( 4324 )
INY                  ( 4327 )
LDA.INDY DB          ( 4328 )
STA.ABS D018         ( 432A )
INY                  ( 432D )
LDA.ABS D40B         ( 432E )
CMP.# 40             ( 4331 )
BMI 4337             ( 4333 )
LDY.# 00             ( 4335 )
STY.ABS 42FE         ( 4337 )
PLA                  ( 433A )
TAY                  ( 433B )
PLA                  ( 433C )
PLP                  ( 433D )
RTI                  ( 433E )
AT 433F

( INSTALL-COLOR-DLI | NFA 433F CFA 4346 )
( Inferred descriptive name, not recovered original: Stores )
( native $4314 in VDSLST [$0200], clears its table index )
( and enables NMI bits in both the shadow and $D40E. )
( Stack: -- )
AT 433F
( Header: flags, saved name and link )
BYTES 84000000CC0B43
DOCOL
LIT16 4314 LIT16 0200 t.! t.0 t.DLI-COLOR-OFFSET t.!
t.NMI-ENABLE-SHADOW t.C@ LIT16 00E0 t.OR t.DUP
t.NMI-ENABLE-SHADOW t.C! LIT16 D40E t.C! t.;S
AT 4370

( PAUSE-COLOR-DLI | NFA 4370 CFA 4377 )
( Inferred descriptive name, not recovered original: )
( Selects NMI mask $60, waits a frame, and copies the first )
( color triplet to OS shadows $02C4 and live GTIA $D016 )
( before disabling DLI. )
( Stack: -- )
AT 4370
( Header: flags, saved name and link )
BYTES 84000000CC3F43
DOCOL
LIT16 0060 t.NMI-ENABLE-SHADOW t.C! t.1 t.WAIT-FRAMES
t.DLI-COLOR-POINTER t.@ LIT16 02C4 LIT16 0003 t.CMOVE
LIT16 0060 LIT16 D40E t.C! t.DLI-COLOR-POINTER t.@ LIT16 D016
LIT16 0003 t.CMOVE t.;S
AT 43AD

( #RT | NFA 43AD CFA 43B3 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4857 [#RT] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43AD
( Header: flags, saved name and link )
BYTES 830000D47043
DOVAR
BYTES 000005
AT 43B8

( #RTC | NFA 43B8 CFA 43BF )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4863 [#RTC] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43B8
( Header: flags, saved name and link )
BYTES 84000000C3AD43
DOVAR
BYTES D1D7C5C11DC4DAD8C32020
AT 43CC

( EKP | NFA 43CC CFA 43D2 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4876 [EKP] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43CC
( Header: flags, saved name and link )
BYTES 830000D0B843
DOCON
CELL 00D2
AT 43D6

( #L | NFA 43D6 CFA 43DB )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $487F [#L] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43D6
( Header: flags, saved name and link )
BYTES 8200CCCC43
DOCON
CELL 00D4
AT 43DF

( 40+ | NFA 43DF CFA 43E5 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4889 [40+] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43DF
( Header: flags, saved name and link )
BYTES 830000ABD643
CELL 43E7 ( native entry point )
CLC                  ( 43E7 )
LDA.ZP D2            ( 43E8 )
ADC.# 28             ( 43EA )
STA.ZP D2            ( 43EC )
LDA.ZP D3            ( 43EE )
ADC.# 00             ( 43F0 )
STA.ZP D3            ( 43F2 )
RTS                  ( 43F4 )
AT 43F5

( G#D | NFA 43F5 CFA 43FB )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $489F [G#D] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 43F5
( Header: flags, saved name and link )
BYTES 830000C4DF43
CELL 43FD ( native entry point )
LDY.# 00             ( 43FD )
LDA.ABS 43B5         ( 43FF )
STA.INDY D2          ( 4402 )
INY                  ( 4404 )
LDA.ABS 43B6         ( 4405 )
STA.INDY D2          ( 4408 )
INY                  ( 440A )
TYA                  ( 440B )
LDX.ZP D1            ( 440C )
CMP.ZPX 02           ( 440E )
BNE 4405             ( 4410 )
DEY                  ( 4412 )
LDA.ABS 43B7         ( 4413 )
STA.INDY D2          ( 4416 )
RTS                  ( 4418 )
AT 4419

( G# | NFA 4419 CFA 441E )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $48C2 [G#] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4419
( Header: flags, saved name and link )
BYTES 8200A3F543
CELL 4420 ( native entry point )
STX.ZP D1            ( 4420 )
JSR.ABS 43FD         ( 4422 )
JSR.ABS 43E7         ( 4425 )
LDX.ZP D1            ( 4428 )
JMP.ABS 0F47         ( 442A )
AT 442D

( D# | NFA 442D CFA 4432 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $48D6 [D#] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 442D
( Header: flags, saved name and link )
BYTES 8200A31944
CELL 4434 ( native entry point )
STX.ZP D1            ( 4434 )
JSR.ABS 43FD         ( 4436 )
LDX.ZP D1            ( 4439 )
JMP.ABS 1057         ( 443B )
AT 443E

( S# | NFA 443E CFA 4443 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $48E7 [S#] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 443E
( Header: flags, saved name and link )
BYTES 8200A32D44
CELL 4445 ( native entry point )
STX.ZP D1            ( 4445 )
LDA.# 02             ( 4447 )
STA.ZP D4            ( 4449 )
JSR.ABS 43FD         ( 444B )
JSR.ABS 43E7         ( 444E )
INC.ZP D4            ( 4451 )
LDA.ZP D4            ( 4453 )
LDX.ZP D1            ( 4455 )
CMP.ZPX 00           ( 4457 )
BNE 444B             ( 4459 )
LDX.ZP D1            ( 445B )
JMP.ABS 0F47         ( 445D )
AT 4460

( [RAM] | NFA 4460 CFA 4468 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $490C [[RAM]] in contiguous 10-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. Original intact name in the supplied game )
( image; private vocabulary chain terminates at FORTH dummy )
( header $1E44. )
AT 4460
( Header: flags, saved name and link )
BYTES 8500000000A93E44
DOCOL
t.#RTC t.#RT t.3 t.CMOVE t.G# t.#RTC t.3 t.+ t.#RT t.3 t.CMOVE
t.S# t.#RTC LIT16 0006 t.+ t.#RT t.3 t.CMOVE t.D# t.;S
AT 4494

( DRAW-TEXT-FRAME | NFA 4494 CFA 4499 )
( Inferred descriptive name, not recovered original: )
( Computes screen address from SAVMSC, column and row; )
( invokes [RAM], then advances text coordinates into the )
( frame interior. )
( Stack: width height -- )
AT 4494
( Header: flags, saved name and link )
BYTES 8200AA6044
DOCOL
LIT8 58 t.@ t.Y@ LIT8 28 t.* t.+ t.X@ t.+ t.EKP t.! t.(RAM)
t.X@ t.1+ t.X! t.Y@ t.1+ t.Y! t.;S
AT 44C1

( DRAW-CENTERED-TEXT-FRAME | NFA 44C1 CFA 44CA )
( Inferred descriptive name, not recovered original: Sets )
( column to 20-width/2 and draws the frame at the current )
( row. )
( Stack: width height -- )
AT 44C1
( Header: flags, saved name and link )
BYTES 860000000000C19444
DOCOL
t.OVER t.2 t./ LIT8 14 t.SWAP t.- t.X! t.DRAW-TEXT-FRAME t.;S
AT 44DF

( MESSAGE-FIRST-LINE-WIDTH | NFA 44DF CFA 44E5 )
( Inferred descriptive name, not recovered original: $44F8 )
( stores the first or second line width plus four here; )
( later UI code can size message choices from this value. )
( Stack: -- address )
AT 44DF
( Header: flags, saved name and link )
BYTES 830000CBC144
DOVAR
CELL 0000
AT 44E9

( MESSAGE-FRAME-WIDTH | NFA 44E9 CFA 44EE )
( Inferred descriptive name, not recovered original: Stores )
( maximum counted-line length plus four, with a )
( seven-column special case for a single-line message. )
( Stack: -- address )
AT 44E9
( Header: flags, saved name and link )
BYTES 8200D2DF44
DOVAR
CELL 0000
AT 44F2

( MEASURE-MESSAGE | NFA 44F2 CFA 44F8 )
( Inferred descriptive name, not recovered original: Walks )
( a line-count byte followed by counted strings, computes )
( maximum width+4, stores width fields and uses width seven )
( when there is only one line. )
( Stack: message -- width )
AT 44F2
( Header: flags, saved name and link )
BYTES 830000CDE944
DOCOL
t.0 t.SWAP t.COUNT t.DUP t.>R t.0 t.(DO)
( label 4508 )
t.SWAP t.OVER t.C@ t.I t.0=_12DE t.I t.1 t.= t.+
t.0BRANCH CELL 000D ( -> 4529 )
t.DUP LIT8 04 t.+ t.MESSAGE-FIRST-LINE-WIDTH t.!
( label 4529 )
t.MAX t.SWAP t.COUNT t.+
t.(LOOP) CELL FFD5 ( -> 4508 )
t.DROP LIT8 04 t.+ t.DUP t.MESSAGE-FRAME-WIDTH t.! t.R> t.1
t.=
t.0BRANCH CELL 000F ( -> 4559 )
LIT8 07 t.DUP t.MESSAGE-FRAME-WIDTH t.!
t.MESSAGE-FIRST-LINE-WIDTH t.!
( label 4559 )
t.;S
AT 455B

( NEXT-TEXT-ROW | NFA 455B CFA 4561 )
( Inferred descriptive name, not recovered original: )
( Increments the OS text row through Y@ and Y!. )
( Stack: -- )
AT 455B
( Header: flags, saved name and link )
BYTES 830000ABF244
DOCOL
t.Y@ t.1+ t.Y! t.;S
AT 456B

( PRINT-CENTERED-LINES | NFA 456B CFA 4571 )
( Inferred descriptive name, not recovered original: Walks )
( the counted-line message, sets each starting column to )
( 20-length/2, prints via STYPE, and advances the row. )
( Stack: message -- )
AT 456B
( Header: flags, saved name and link )
BYTES 830000D05B45
DOCOL
t.COUNT t.0 t.(DO)
( label 4579 )
t.DUP t.COUNT LIT8 14 t.OVER t.2 t./ t.- t.X! t.STYPE
t.NEXT-TEXT-ROW t.COUNT t.+
t.(LOOP) CELL FFE5 ( -> 4579 )
t.DROP t.;S
AT 459A

( SHOW-MESSAGE | NFA 459A CFA 45A1 )
( Inferred descriptive name, not recovered original: For a )
( nonempty counted-line group, measures and draws its )
( frame, prints centered lines, then restores the original )
( row and sets column zero. Unlike Klatwa this word does )
( not first erase the following text rows. )
( Stack: message -- )
AT 459A
( Header: flags, saved name and link )
BYTES 84000000D46B45
DOCOL
t.DUP t.C@
t.0BRANCH CELL 0021 ( -> 45CA )
t.Y@ t.NEXT-TEXT-ROW t.SWAP t.DUP t.MEASURE-MESSAGE t.OVER
t.C@ t.2+ t.DRAW-CENTERED-TEXT-FRAME t.PRINT-CENTERED-LINES
t.Y! t.0 t.X!
( ATASCII text:  [1E] )
t.(.")
BYTES 02201E
( label 45CA )
t.;S
AT 45CC

( DISK-ERROR-MESSAGES | NFA 45CC CFA 45D2 )
( Inferred descriptive name, not recovered original: )
( u16-length vector contains disk-error and wrong-disk )
( Polish prompts, including BLAD DYSKOWY and NIE TEN DYSK; )
( $462A displays the selected entry after a transfer error. )
( Stack: index -- record )
( Decoded text: Disk messages )
( item 0 line 1 $45DC: A )
( item 1 line 1 $45E1: BLAD DYSKOWY )
( item 1 line 2 $45EE: WLACZYLES STACJE? )
( item 1 line 3 $4600: RETURN )
( item 2 line 1 $460A: U )
( item 3 line 1 $460F: NIE TEN DYSK )
( item 3 line 2 $461C: RETURN )
AT 45CC
( Header: flags, saved name and link )
BYTES 830000D59A45
DODOES
( DOES> thread at 3F4E )
BYTES 4E3F4A0003000101412700030C426C61443D4459534B4F575911576C
BYTES 61435A596C45733D535441434A653F0652455455524E030001015515
BYTES 00020C4E49453D54454E3D4459534B0652455455524E
AT 4622

( SHOW-DISK-ERROR | NFA 4622 CFA 462A )
( Inferred descriptive name, not recovered original: )
( Indexes the disk-error vector, skips its u16 header and )
( displays the multiline message. )
( Stack: error -- )
AT 4622
( Header: flags, saved name and link )
BYTES 8500000000D5CC45
DOCOL
t.DISK-ERROR-MESSAGES t.2+ t.SHOW-MESSAGE t.;S
AT 4634

( TRANSFER-IS-LOAD | NFA 4634 CFA 463A )
( Inferred descriptive name, not recovered original: )
( Selects $4228 load when nonzero or $4242 save when zero )
( in $46BE. )
( Stack: -- address )
AT 4634
( Header: flags, saved name and link )
BYTES 830000D32246
DOVAR
CELL 0000
AT 463E

( TEXT-PANEL-PATTERN | NFA 463E CFA 4644 )
( Inferred descriptive name, not recovered original: u16 )
( length plus alternating custom-font bytes $3B/$3D; $466E )
( tiles this pattern across the panel and $4B45 copies part )
( into its border. )
( Stack: -- address )
( Decoded text: Screen background glyphs, not prose )
( background tiles $4648: )
( [3B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3 )
( B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3B][3D][3B] )
( [3D][3B][3D][3B] )
AT 463E
( Header: flags, saved name and link )
BYTES 830000B03446
DOVAR
BYTES 21003B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D3B3D
BYTES 3B3D3B3D3B3D3B
AT 4669

( CLEAR-TEXT-AREA | NFA 4669 CFA 466E )
( Inferred descriptive name, not recovered original: Resets )
( text position, then fills nine32-byte panel rows from )
( alternating offsets in TEXT-PANEL-PATTERN using40-byte )
( screen stride; finishes the lower border with byte$0F. )
( This is a patterned clear rather than an ERASE. )
( Stack: -- )
AT 4669
( Header: flags, saved name and link )
BYTES 8200C53E46
DOCOL
t.0 t.0 t.POS
( ATASCII text:   )
t.(.")
BYTES 0120
LIT8 58 t.@ LIT16 002C t.+ LIT16 0009 t.0 t.(DO)
( label 468D )
t.TEXT-PANEL-PATTERN t.2+ t.I t.2 t.MOD t.+ t.OVER LIT8 20
t.CMOVE LIT16 0028 t.+
t.(LOOP) CELL FFE5 ( -> 468D )
t.2 t.- LIT8 24 LIT8 0F t.FILL t.;S
AT 46B8

( TRY-GROUP-TRANSFER | NFA 46B8 CFA 46BE )
( Inferred descriptive name, not recovered original: Keeps )
( transfer arguments, clears text, pauses the DLI, tries )
( load/save, resumes DLI, and displays/acknowledges an )
( error if needed. )
( Stack: address count group -- address count group )
AT 46B8
( Header: flags, saved name and link )
BYTES 830000AA6946
DOCOL
t.>R t.2DUP t.R t.ROT t.ROT t.CLEAR-TEXT-AREA
t.PAUSE-COLOR-DLI t.R> t.TRANSFER-IS-LOAD t.@
t.0BRANCH CELL 0008 ( -> 46DE )
t.LOAD-GAM-GROUP
t.BRANCH CELL 0004 ( -> 46E0 )
( label 46DE )
t.SAVE-GAM-GROUP
( label 46E0 )
t.LAST-DISK-STATUS t.@ t.INSTALL-COLOR-DLI
t.0BRANCH CELL 000C ( -> 46F4 )
t.LAST-DISK-STATUS t.@ t.SHOW-DISK-ERROR t.KEY t.DROP
( label 46F4 )
t.;S
AT 46F6

( RETRY-GROUP-TRANSFER | NFA 46F6 CFA 46FC )
( Inferred descriptive name, not recovered original: )
( Repeats $46BE until the stored transfer error is zero, )
( then drops the retained transfer arguments. )
( Stack: address count group -- )
AT 46F6
( Header: flags, saved name and link )
BYTES 830000BFB846
DOCOL
( label 46FE )
t.TRY-GROUP-TRANSFER t.LAST-DISK-STATUS t.@ t.0=_12DE
t.0BRANCH CELL FFF6 ( -> 46FE )
t.DROP t.2DROP t.;S
AT 4710

( READ-RESOURCE-GROUP | NFA 4710 CFA 4716 )
( Inferred descriptive name, not recovered original: Sets )
( transfer mode to read and invokes the retrying transfer. )
( Stack: address count group -- )
AT 4710
( Header: flags, saved name and link )
BYTES 830000BFF646
DOCOL
t.1 t.TRANSFER-IS-LOAD t.! t.RETRY-GROUP-TRANSFER t.;S
AT 4722

( WRITE-RESOURCE-GROUP | NFA 4722 CFA 4728 )
( Inferred descriptive name, not recovered original: Sets )
( transfer mode to write and invokes the retrying transfer. )
( Stack: address count group -- )
AT 4722
( Header: flags, saved name and link )
BYTES 830000BF1047
DOCOL
t.0 t.TRANSFER-IS-LOAD t.! t.RETRY-GROUP-TRANSFER t.;S
AT 4734

( READ-BANK-RECORD-LENGTH | NFA 4734 CFA 473A )
( Inferred descriptive name, not recovered original: Native )
( helper reads the u16 at [$D2],Y into RECORD-SPAN; returns )
( RTS. Used while OS ROM is switched out. )
( Assembly subroutine entry; returns with RTS. )
AT 4734
( Header: flags, saved name and link )
BYTES 830000AA2247
CELL 473C ( native entry point )
LDA.INDY D2          ( 473C )
STA.ABS 3E9E         ( 473E )
INY                  ( 4741 )
LDA.INDY D2          ( 4742 )
STA.ABS 3E9F         ( 4744 )
RTS                  ( 4747 )
AT 4748

( SCAN-BANK-RECORD | NFA 4748 CFA 474F )
( Inferred descriptive name, not recovered original: )
( Resolves a banked u16-length record. For indices at )
( least32, scans the excess first, restores interrupts, )
( then re-enters the bank and scans32 more; reads the )
( resulting length, restores PORTB/NMIEN/IRQs and drops )
( both arguments. )
( Stack: index base -- )
AT 4748
( Header: flags, saved name and link )
BYTES 84000000C33447
CELL 4751 ( native entry point )
LDA.# 00             ( 4751 )
STA.ABS 3EA8         ( 4753 )
JSR.ABS 3F17         ( 4756 )
LDA.ZPX 02           ( 4759 )
SEC                  ( 475B )
SBC.# 20             ( 475C )
BCC 4781             ( 475E )
STA.ZPX 02           ( 4760 )
JSR.ABS 3C73         ( 4762 )
JSR.ABS 3ED3         ( 4765 )
INC.ABS D301         ( 4768 )
LDA.ABS 3C69         ( 476B )
STA.ABS D40E         ( 476E )
CLI                  ( 4771 )
LDA.# 20             ( 4772 )
LDX.ZP D1            ( 4774 )
STA.ZPX 02           ( 4776 )
JSR.ABS 3C73         ( 4778 )
JSR.ABS 3ED3         ( 477B )
JMP.ABS 4787         ( 477E )
JSR.ABS 3C73         ( 4781 )
JSR.ABS 3ED3         ( 4784 )
JSR.ABS 473C         ( 4787 )
INC.ABS D301         ( 478A )
LDA.ABS 3C69         ( 478D )
STA.ABS D40E         ( 4790 )
CLI                  ( 4793 )
JMP.ABS 1057         ( 4794 )
AT 4797

( BANK-RECORD-RANGE | NFA 4797 CFA 479D )
( Inferred descriptive name, not recovered original: Scans )
( a banked record, skips its u16 header, converts the )
( physical address to a logical offset [subtracting $D800 )
( or $9800], and returns its payload length. )
( Stack: index base -- offset length )
AT 4797
( Header: flags, saved name and link )
BYTES 830000CC4847
DOCOL
t.SCAN-BANK-RECORD t.RECORD-POINTER t.@ t.2+ t.DUP LIT16 D7FF
t.>
t.0BRANCH CELL 000C ( -> 47BD )
LIT16 D800 t.-
t.BRANCH CELL 0008 ( -> 47C3 )
( label 47BD )
LIT16 9800 t.-
( label 47C3 )
t.RECORD-SPAN t.@ t.;S
AT 47C9

( NESTED-BANK-RECORD | NFA 47C9 CFA 47D0 )
( Inferred descriptive name, not recovered original: First )
( indexes a collection at banked base $D800, then indexes )
( its nested record and returns the logical payload range. )
( Stack: index collection -- offset length )
AT 47C9
( Header: flags, saved name and link )
BYTES 84000000CC9747
DOCOL
LIT16 D800 t.SCAN-BANK-RECORD t.RECORD-POINTER t.@ t.2+
t.BANK-RECORD-RANGE t.;S
AT 47E2

( BANK-RESOURCE-RANGE | NFA 47E2 CFA 47E9 )
( Inferred descriptive name, not recovered original: Uses )
( banked base $D800 and returns the indexed resource's )
( payload offset and length. )
( Stack: index -- offset length )
AT 47E2
( Header: flags, saved name and link )
BYTES 84000000CCC947
DOCOL
LIT16 D800 t.BANK-RECORD-RANGE t.;S
AT 47F3

( RESOURCE-BASE | NFA 47F3 CFA 47F9 )
( Inferred descriptive name, not recovered original: )
( Pointer to the visible RAM resource collection, initially )
( $A460; $4803 fetches it and $482A indexes its u16-length )
( records. )
( Stack: -- address )
AT 47F3
( Header: flags, saved name and link )
BYTES 830000C1E247
DOVAR
CELL A460
AT 47FD

( RESOURCE-BASE@ | NFA 47FD CFA 4803 )
( Inferred descriptive name, not recovered original: )
( Fetches the visible resource collection base from $47F9, )
( initially $A460. )
( Stack: -- address )
AT 47FD
( Header: flags, saved name and link )
BYTES 830000C1F347
DOCOL
t.RESOURCE-BASE t.@ t.;S
AT 480B

( PICTURE-STAGING-BASE | NFA 480B CFA 4811 )
( Inferred descriptive name, not recovered original: )
( Pointer cell initially $A412; its fetched address )
( receives decoded item pictures before scene composition. )
( Stack: -- address )
AT 480B
( Header: flags, saved name and link )
BYTES 830000DAFD47
DOVAR
CELL A412
AT 4815

( PICTURE-STAGING@ | NFA 4815 CFA 481B )
( Inferred descriptive name, not recovered original: )
( Fetches PICTURE-STAGING-BASE; $5898 decodes item art here )
( and $545D composites it into the scene picture. )
( Stack: -- address )
AT 4815
( Header: flags, saved name and link )
BYTES 830000DA0B48
DOCOL
t.PICTURE-STAGING-BASE t.@ t.;S
AT 4823

( RESOURCE-ADDR | NFA 4823 CFA 482A )
( Inferred descriptive name, not recovered original: )
( Indexes a u16-length record at RESOURCE-BASE through )
( $3F74; returns its length header. )
( Stack: index -- record )
AT 4823
( Header: flags, saved name and link )
BYTES 84000000C21548
DOCOL
t.RESOURCE-BASE@ t.LENGTH-RECORD-ADDR t.;S
AT 4832

( FETCH-RESOURCE-TO | NFA 4832 CFA 4838 )
( Inferred descriptive name, not recovered original: )
( Resolves a banked resource payload and copies it to the )
( supplied normal-RAM destination. )
( Stack: index destination -- )
AT 4832
( Header: flags, saved name and link )
BYTES 830000CD2348
DOCOL
t.SWAP t.BANK-RESOURCE-RANGE t.FETCH-BANK-RANGE t.;S
AT 4842

( FETCH-NESTED-RESOURCE | NFA 4842 CFA 4849 )
( Inferred descriptive name, not recovered original: )
( Resolves a nested banked resource and copies its payload )
( to the supplied destination. )
( Stack: index collection destination -- )
AT 4842
( Header: flags, saved name and link )
BYTES 84000000CD3248
DOCOL
t.ROT t.ROT t.NESTED-BANK-RECORD t.FETCH-BANK-RANGE t.;S
AT 4855

( FETCH-RESOURCE | NFA 4855 CFA 485C )
( Inferred descriptive name, not recovered original: Copies )
( the chosen banked resource into the visible RESOURCE-BASE )
( buffer. )
( Stack: index -- )
AT 4855
( Header: flags, saved name and link )
BYTES 84000000CD4248
DOCOL
t.RESOURCE-BASE@ t.FETCH-RESOURCE-TO t.;S
AT 4864

( WAIT-RASTER-HALF | NFA 4864 CFA 4869 )
( Inferred descriptive name, not recovered original: Native )
( loop waits for VCOUNT bit7 to clear and then set; returns )
( RTS. Used to synchronize player positions and graphics )
( work. )
( Assembly subroutine entry; returns with RTS. )
AT 4864
( Header: flags, saved name and link )
BYTES 8200BC5548
CELL 486B ( native entry point )
LDA.ABS D40B         ( 486B )
BMI 486B             ( 486E )
LDA.ABS D40B         ( 4870 )
BPL 4870             ( 4873 )
RTS                  ( 4875 )
AT 4876

( WAIT-RASTER | NFA 4876 CFA 487B )
( Inferred descriptive name, not recovered original: Calls )
( the native raster wait at $486B and returns to Forth NEXT. )
( Stack: -- )
AT 4876
( Header: flags, saved name and link )
BYTES 8200AA6448
CELL 487D ( native entry point )
JSR.ABS 486B         ( 487D )
JMP.ABS 0F47         ( 4880 )
AT 4883

( GRAPHICS-BASE | NFA 4883 CFA 488A )
( Inferred descriptive name, not recovered original: )
( Receives the graphics address from INSTALL-DISPLAY and is )
( used by graphics memory operations. )
AT 4883
( Header: flags, saved name and link )
BYTES 84000000D27648
DOVAR
CELL 0000
AT 488E

( EXPAND-SCREEN-DESCRIPTOR | NFA 488E CFA 4896 )
( Inferred descriptive name, not recovered original: Reads )
( the destination cell, then expands )
( width/row-count/pattern records sequentially into )
( destination RAM until a zero pattern terminator. Consumes )
( the descriptor address; runtime test expands width2, )
( rows3, pattern11/22 into six bytes. )
( Stack: descriptor -- )
AT 488E
( Header: flags, saved name and link )
BYTES 8500000000D68348
DOCOL
t.DUP t.@ t.SWAP t.2+ t.SWAP
( label 48A2 )
t.OVER t.DUP t.C@ t.SWAP t.1+ t.C@ t.* t.OVER t.+ t.DUP t.>R
t.SWAP t.(DO)
( label 48BC )
t.DUP t.2+ t.OVER t.C@ t.I t.SWAP t.CMOVE t.DUP t.C@
t.(+LOOP) CELL FFEC ( -> 48BC )
t.DUP t.C@ t.+ t.2+ t.R> t.OVER t.@ t.0=_12DE
t.0BRANCH CELL FFBE ( -> 48A2 )
t.2DROP t.;S
AT 48EA

( INSTALL-DISPLAY | NFA 48EA CFA 48F0 )
( Inferred descriptive name, not recovered original: )
( Installs text screen address at SAVMSC $0058, stores the )
( graphics base, and writes SDLSTL $0230. )
AT 48EA
( Header: flags, saved name and link )
BYTES 830000CC8E48
DOCOL
t.DUP t.@ LIT16 0058 t.! t.2+ t.DUP t.@ t.GRAPHICS-BASE t.!
t.2+ t.DUP t.EXPAND-SCREEN-DESCRIPTOR t.@ LIT16 0230 t.! t.;S
AT 4916

( FRAME-PATTERN-DATA | NFA 4916 CFA 491B )
( Inferred descriptive name, not recovered original: Two )
( frame-row patterns filled with $55 bytes and containing )
( display-line pointers. $4B09 uses them as left/right )
( borders; transition routines also point display lines )
( into this pattern block. )
( Stack: -- address )
AT 4916
( Header: flags, saved name and link )
BYTES 8200CFEA48
DOVAR
BYTES 00001EA4555555555555555555555555555555555555555555555555
BYTES 55555555555555553A91000000004A94555555555555555555555555
BYTES 55555555555555555555555555555555555555553EA40000437C
AT 496F

( GAME-SCREEN-DESCRIPTOR | NFA 496F CFA 4977 )
( Inferred descriptive name, not recovered original: )
( Despite its saved DOCOL code field, the body is )
( screen-description data beginning at $4979. $4C38/$4C4D )
( pass that literal address to $48F0; it is not executed as )
( Forth. )
( Data body referenced by literal address; do not execute )
( its saved DOCOL entry. )
AT 496F
( Header: flags, saved name and link )
BYTES 8500000000CC1649
DOCOL
( Trailing code/data at 4979; retained exactly )
BYTES 48BA30A800A7090170704400A84E1D490E04374E1D490E03014420BA
BYTES 010B0403014100A700007712
AT 49A1

( ROOM-BITMAP-ADDRESS | NFA 49A1 CFA 49A7 )
( Inferred descriptive name, not recovered original: )
( Constant $A830 is the room bitmap address used when )
( opening the display-line transition. )
( Stack: -- address )
AT 49A1
( Header: flags, saved name and link )
BYTES 830000CC6F49
DOCON
CELL A830
AT 49AB

( TRANSITION-ROW-PAIRS | NFA 49AB CFA 49B1 )
( Inferred descriptive name, not recovered original: )
( Constant 56 is the transition loop bound; a displayed )
( 112-row room uses paired rows. )
( Stack: -- count )
AT 49AB
( Header: flags, saved name and link )
BYTES 830000CCA149
DOCON
CELL A706
AT 49B5

( w49BB | NFA 49B5 CFA 49BB )
( Unknown erased name; CFA identifier )
AT 49B5
( Header: flags, saved name and link )
BYTES 830000CCAB49
DOCON
CELL 0038
AT 49BF

( FRAME-ROW-POINTER | NFA 49BF CFA 49C5 )
( Inferred descriptive name, not recovered original: )
( Pointer cell set to one of the two frame-row patterns by )
( $4B09; $4AD3 copies the left/right borders through its )
( value. The following cell is unused padding in this entry. )
( Stack: -- address )
AT 49BF
( Header: flags, saved name and link )
BYTES 830000C4B549
DOVAR
BYTES 00000541
AT 49CB

( TRANSITION-IS-CLOSING | NFA 49CB CFA 49D0 )
( Inferred descriptive name, not recovered original: Zero )
( chooses sequential room bitmap rows; nonzero chooses the )
( fixed frame-pattern address for closing the scene. )
( Stack: -- address )
AT 49CB
( Header: flags, saved name and link )
BYTES 8200CFBF49
DOVAR
CELL 0000
AT 49D4

( TRANSITION-LINE-ADDRESS | NFA 49D4 CFA 49DA )
( Inferred descriptive name, not recovered original: 16-bit )
( display-memory address written into successive )
( display-list address fields by $49EE. )
( Stack: -- address )
AT 49D4
( Header: flags, saved name and link )
BYTES 830000CFCB49
DOVAR
CELL 0000
AT 49DE

( TRANSITION-LINE-COUNT | NFA 49DE CFA 49E4 )
( Inferred descriptive name, not recovered original: Byte )
( count decremented by native $49EE while patching )
( display-line pointers. )
( Stack: -- address )
AT 49DE
( Header: flags, saved name and link )
BYTES 830000C4D449
DOVAR
CELL 0000
AT 49E8

( PATCH-TRANSITION-LINES | NFA 49E8 CFA 49EE )
( Inferred descriptive name, not recovered original: Waits )
( for the raster, stores the current display-memory pointer )
( through $D2, advances the display-list pointer by )
( RECORD-SPAN and, when opening, advances image memory )
( by$190 per write. Repeats TRANSITION-LINE-COUNT times. )
( Stack: -- )
AT 49E8
( Header: flags, saved name and link )
BYTES 830000BEDE49
CELL 49F0 ( native entry point )
LDY.# 00             ( 49F0 )
JSR.ABS 486B         ( 49F2 )
LDA.ABS 49DC         ( 49F5 )
STA.INDY D2          ( 49F8 )
INY                  ( 49FA )
LDA.ABS 49DD         ( 49FB )
STA.INDY D2          ( 49FE )
DEY                  ( 4A00 )
JSR.ABS 3EBB         ( 4A01 )
LDA.ABS 49D2         ( 4A04 )
BNE 4A1A             ( 4A07 )
CLC                  ( 4A09 )
LDA.ABS 49DC         ( 4A0A )
ADC.# 90             ( 4A0D )
STA.ABS 49DC         ( 4A0F )
LDA.ABS 49DD         ( 4A12 )
ADC.# 01             ( 4A15 )
STA.ABS 49DD         ( 4A17 )
DEC.ABS 49E6         ( 4A1A )
BNE 49F5             ( 4A1D )
JMP.ABS 0F47         ( 4A1F )
AT 4A22

( SET-TRANSITION-COLUMN | NFA 4A22 CFA 4A28 )
( Inferred descriptive name, not recovered original: Sets )
( display-list address pointer to $A706+4*index; when )
( closing uses FRAME-PATTERN-DATA, otherwise sets image )
( pointer to $A830+80*index. )
( Stack: index -- )
AT 4A22
( Header: flags, saved name and link )
BYTES 830000A1E849
DOCOL
t.DUP LIT8 04 t.* t.TRANSITION-ROW-PAIRS t.+ t.RECORD-POINTER
t.! t.TRANSITION-IS-CLOSING t.@
t.0BRANCH CELL 000A ( -> 4A49 )
t.DROP t.FRAME-PATTERN-DATA
t.BRANCH CELL 000B ( -> 4A52 )
( label 4A49 )
LIT8 50 t.* t.ROOM-BITMAP-ADDRESS t.+
( label 4A52 )
t.TRANSITION-LINE-ADDRESS t.! t.;S
AT 4A58

( ANIMATE-SCENE-TRANSITION | NFA 4A58 CFA 4A5F )
( Inferred descriptive name, not recovered original: Sets )
( display-list step20 bytes; patches12 lines in the first )
( interleaved pass, then four passes of11 lines, selecting )
( successive start offsets through $4A28. )
( Stack: -- )
AT 4A58
( Header: flags, saved name and link )
BYTES 84000000BE224A
DOCOL
LIT8 14 t.RECORD-SPAN t.! LIT8 0C t.TRANSITION-LINE-COUNT t.!
t.0 t.SET-TRANSITION-COLUMN t.PATCH-TRANSITION-LINES LIT8 05
t.1 t.(DO)
( label 4A7C )
LIT8 0B t.TRANSITION-LINE-COUNT t.! t.I
t.SET-TRANSITION-COLUMN t.PATCH-TRANSITION-LINES
t.(LOOP) CELL FFF1 ( -> 4A7C )
t.;S
AT 4A8F

( OPEN-SCENE-TRANSITION | NFA 4A8F CFA 4A95 )
( Inferred descriptive name, not recovered original: Clears )
( TRANSITION-IS-CLOSING and performs the five interleaved )
( display-line pointer passes, revealing the room bitmap. )
( Stack: -- )
AT 4A8F
( Header: flags, saved name and link )
BYTES 830000CC584A
DOCOL
t.0 t.TRANSITION-IS-CLOSING t.! t.ANIMATE-SCENE-TRANSITION
t.;S
AT 4AA1

( CLOSE-SCENE-TRANSITION | NFA 4AA1 CFA 4AA7 )
( Inferred descriptive name, not recovered original: Sets )
( TRANSITION-IS-CLOSING and performs the interleaved )
( display-line pointer passes using the frame-pattern )
( address. )
( Stack: -- )
AT 4AA1
( Header: flags, saved name and link )
BYTES 830000CC8F4A
DOCOL
t.1 t.TRANSITION-IS-CLOSING t.! t.ANIMATE-SCENE-TRANSITION
t.;S
AT 4AB3

( FILL-AND-ADVANCE | NFA 4AB3 CFA 4AB9 )
( Inferred descriptive name, not recovered original: )
( Preserves count, fills the requested bytes with the )
( supplied value, then returns address+count. )
( Stack: address value count -- next-address )
AT 4AB3
( Header: flags, saved name and link )
BYTES 830000ABA14A
DOCOL
t.>R t.OVER t.SWAP t.R t.SWAP t.FILL t.R> t.+ t.;S
AT 4ACD

( DRAW-FRAME-ROW | NFA 4ACD CFA 4AD3 )
( Inferred descriptive name, not recovered original: Copies )
( four left border bytes, clears the next 32 bytes, and )
( copies four right border bytes from the current frame )
( pattern. )
( Stack: destination -- )
AT 4ACD
( Header: flags, saved name and link )
BYTES 830000CCB34A
DOCOL
t.FRAME-ROW-POINTER t.@ t.OVER LIT8 04 t.CMOVE LIT8 04 t.+
t.DUP LIT8 20 t.ERASE LIT8 20 t.+ t.FRAME-ROW-POINTER t.@
LIT8 24 t.+ t.SWAP LIT8 04 t.CMOVE t.;S
AT 4B03

( DRAW-SCENE-FRAME | NFA 4B03 CFA 4B09 )
( Inferred descriptive name, not recovered original: )
( Iterates the 112-row bitmap in 80-byte row pairs, drawing )
( the alternating frame-row patterns around a 32-byte )
( interior. )
( Stack: -- )
AT 4B03
( Header: flags, saved name and link )
BYTES 830000C7CD4A
DOCOL
t.GRAPHICS-BASE t.@ t.DUP LIT16 1180 t.+ t.SWAP t.(DO)
( label 4B1B )
t.FRAME-PATTERN-DATA t.FRAME-ROW-POINTER t.! t.I
t.DRAW-FRAME-ROW LIT16 4945 t.FRAME-ROW-POINTER t.! t.I
LIT8 28 t.+ t.DRAW-FRAME-ROW LIT8 50
t.(+LOOP) CELL FFE0 ( -> 4B1B )
t.;S
AT 4B3F

( DRAW-TEXT-PANEL-BORDERS | NFA 4B3F CFA 4B45 )
( Inferred descriptive name, not recovered original: )
( Clears400 bytes of the text screen, draws custom-font )
( top/bottom and side borders at temporary SAVMSC )
( positions, restores SAVMSC and copies the patterned top )
( row. )
( Stack: -- )
AT 4B3F
( Header: flags, saved name and link )
BYTES 830000D4034B
DOCOL
LIT8 58 t.@ t.DUP LIT16 0190 t.ERASE LIT16 A800 t.DUP LIT8 28
t.ERASE LIT8 58 t.! t.1 t.0 t.POS
( Game text: )
( [16][02][0E][0D][12][14][2D][2D][2D][2D][2D][2D][2D][2D][2 )
( D][2D][06][07][08][0A][0B][0C][7C][7C][7C][7C][7C][7C][7C] )
( [7C][7C][7C][19][15][09][0F][10][13] )
t.(S")
BYTES 2616020E0D12142D2D2D2D2D2D2D2D2D2D0607080A0B0C7C7C7C7C7C
BYTES 7C7C7C7C7C1915090F1013
LIT8 28 t.- t.DUP LIT8 28 t.ERASE LIT8 58 t.! t.1 t.0 t.POS
( Game text: )
( [28][29][3C][3E][2B][2B][2B][2B][2B][2B][2B][2B][2B][2B][2 )
( B][2B][23][24][25][26][27][40][2A][2A][2A][2A][2A][2A][2A] )
( [2A][2A][2A][2A][2A][71][77][72][74] )
t.(S")
BYTES 2628293C3E2B2B2B2B2B2B2B2B2B2B2B2B2324252627402A2A2A2A2A
BYTES 2A2A2A2A2A2A2A71777274
LIT8 28 LIT8 58 t.+! t.2 t.0 t.POS
( Game text: [3A][3B] )
t.(S")
BYTES 023A3B
LIT16 0023 t.0 t.POS
( Game text: [79][75][69] )
t.(S")
BYTES 03797569
LIT16 000A t.1 t.(DO)
( label 4BFC )
t.2 t.I t.POS
( Game text: [5C][5E] )
t.(S")
BYTES 025C5E
LIT16 0024 t.I t.POS
( Game text: [64][66] )
t.(S")
BYTES 026466
t.(LOOP) CELL FFE6 ( -> 4BFC )
t.TEXT-PANEL-PATTERN t.3 t.+ LIT16 0058 t.@ LIT16 0004 t.+
LIT16 001F t.CMOVE t.;S
AT 4C32

( OPEN-GAME-SCREEN | NFA 4C32 CFA 4C38 )
( Inferred descriptive name, not recovered original: )
( Installs the screen descriptor, performs the opening )
( transition, and clears the text area. )
( Stack: -- )
AT 4C32
( Header: flags, saved name and link )
BYTES 830000D43F4B
DOCOL
LIT16 4979 t.INSTALL-DISPLAY t.OPEN-SCENE-TRANSITION
t.CLEAR-TEXT-AREA t.;S
AT 4C46

( INIT-GAME-SCREEN | NFA 4C46 CFA 4C4D )
( Inferred descriptive name, not recovered original: )
( Installs the screen descriptor, draws text-panel borders )
( and the alternating scene frame, then clears the text )
( area. )
( Stack: -- )
AT 4C46
( Header: flags, saved name and link )
BYTES 84000000B5324C
DOCOL
LIT16 4979 t.INSTALL-DISPLAY t.DRAW-TEXT-PANEL-BORDERS
t.DRAW-SCENE-FRAME t.CLEAR-TEXT-AREA t.;S
AT 4C5D

( BYTE-PAIR@ | NFA 4C5D CFA 4C63 )
( Inferred descriptive name, not recovered original: Reads )
( adjacent bytes at address and address+1 as zero-extended )
( values. )
( Stack: address -- first second )
AT 4C5D
( Header: flags, saved name and link )
BYTES 830000D9464C
DOCOL
t.DUP t.>R t.C@ t.R> t.1+ t.C@ t.;S
AT 4C73

( BYTE+! | NFA 4C73 CFA 4C79 )
( Inferred descriptive name, not recovered original: Adds )
( delta to the byte at address, storing only the low eight )
( bits. )
( Stack: delta address -- )
AT 4C73
( Header: flags, saved name and link )
BYTES 830000A15D4C
DOCOL
t.>R t.R t.C@ t.+ t.R> t.C! t.;S
AT 4C89

( SCENE-PICTURE-BUFFER | NFA 4C89 CFA 4C90 )
( Inferred descriptive name, not recovered original: )
( Constant $0600 is the decompressed scene/zoom picture )
( buffer, with x,y,width,height followed by pixels. )
( Stack: -- address )
AT 4C89
( Header: flags, saved name and link )
BYTES 84000000C2734C
DOCON
CELL 0600
AT 4C94

( PICTURE-X-OFFSET | NFA 4C94 CFA 4C99 )
( Inferred descriptive name, not recovered original: Stored )
( by $4CE1 as picture x minus the supplied destination )
( origin; used by $4CC8 for composition placement. )
( Stack: -- address )
AT 4C94
( Header: flags, saved name and link )
BYTES 8200D8894C
DOVAR
CELL 0000
AT 4C9D

( PICTURE-Y-OFFSET | NFA 4C9D CFA 4CA2 )
( Inferred descriptive name, not recovered original: Stored )
( by $4CE1 as picture y minus the supplied destination )
( origin; used by $4CC8 and hit-map placement. )
( Stack: -- address )
AT 4C9D
( Header: flags, saved name and link )
BYTES 8200D9944C
DOVAR
CELL 0000
AT 4CA6

( EXPAND-PICTURE-DATA | NFA 4CA6 CFA 4CAB )
( Inferred descriptive name, not recovered original: Reads )
( width/height from the source, advances past its two-byte )
( dimensions, sets RLE parameters and expands into )
( destination with the requested stride. )
( Stack: stride source destination -- )
AT 4CA6
( Header: flags, saved name and link )
BYTES 8200CF9D4C
DOCOL
t.OVER t.BYTE-PAIR@ t.RLE-SIZE! t.SWAP t.2+ t.SWAP
t.RLE-POINTERS! t.RLE-STRIDE! t.RLE-EXPAND t.;S
AT 4CC1

( PICTURE-OFFSET | NFA 4CC1 CFA 4CC8 )
( Inferred descriptive name, not recovered original: Adds )
( PICTURE-X-OFFSET and stride*PICTURE-Y-OFFSET to the )
( supplied base. )
( Stack: base stride -- address )
AT 4CC1
( Header: flags, saved name and link )
BYTES 84000000D9A64C
DOCOL
t.PICTURE-Y-OFFSET t.@ t.* t.+ t.PICTURE-X-OFFSET t.@ t.+ t.;S
AT 4CDA

( SET-PICTURE-OFFSETS | NFA 4CDA CFA 4CE1 )
( Inferred descriptive name, not recovered original: Reads )
( picture x/y and subtracts supplied origin coordinates, )
( storing relative x/y offsets. )
( Stack: picture x-origin y-origin -- picture )
AT 4CDA
( Header: flags, saved name and link )
BYTES 84000000BEC14C
DOCOL
t.SWAP t.>R t.>R t.DUP t.BYTE-PAIR@ t.R> t.-
t.PICTURE-Y-OFFSET t.! t.R> t.- t.PICTURE-X-OFFSET t.! t.;S
AT 4CFF

( OVERLAY-PACKED-PICTURE | NFA 4CFF CFA 4D05 )
( Inferred descriptive name, not recovered original: Uses )
( both four-byte picture headers to compute relative )
( placement, then expands source RLE bytes into destination )
( at its own row stride. )
( Stack: source destination -- )
AT 4CFF
( Header: flags, saved name and link )
BYTES 830000C2DA4C
DOCOL
t.>R t.R t.BYTE-PAIR@ t.SET-PICTURE-OFFSETS t.R t.2+ t.C@
t.SWAP t.2+ t.OVER t.R> LIT16 0004 t.+ t.SWAP t.PICTURE-OFFSET
t.EXPAND-PICTURE-DATA t.;S
AT 4D2B

( DRAW-RESOURCE-PICTURE | NFA 4D2B CFA 4D31 )
( Inferred descriptive name, not recovered original: )
( Resolves the picture record, sets origin-relative offsets )
( using x=4/y=0, then decodes the image into BITMAP-BASE at )
( its stored x/y with stride40. )
( Stack: resource -- )
AT 4D2B
( Header: flags, saved name and link )
BYTES 830000C2FF4C
DOCOL
t.RESOURCE-ADDR t.2+ LIT16 0004 t.0 t.SET-PICTURE-OFFSETS t.>R
LIT8 28 t.R t.2+ t.GRAPHICS-BASE t.@ t.R> t.BYTE-PAIR@ LIT8 28
t.* t.+ t.+ t.EXPAND-PICTURE-DATA t.;S
AT 4D5D

( DECODE-PICTURE | NFA 4D5D CFA 4D62 )
( Inferred descriptive name, not recovered original: Copies )
( the source's x/y/width/height header to destination, then )
( expands its packed payload there. )
( Stack: source destination -- )
AT 4D5D
( Header: flags, saved name and link )
BYTES 8200CF2B4D
DOCOL
t.>R t.DUP t.R LIT16 0004 t.CMOVE t.R>
t.OVERLAY-PACKED-PICTURE t.;S
AT 4D76

( DECODE-SCENE-RESOURCE | NFA 4D76 CFA 4D7C )
( Inferred descriptive name, not recovered original: )
( Resolves a picture resource and decodes it into the $0600 )
( scene picture buffer. )
( Stack: resource -- )
AT 4D76
( Header: flags, saved name and link )
BYTES 830000C25D4D
DOCOL
t.RESOURCE-ADDR t.2+ t.SCENE-PICTURE-BUFFER t.DECODE-PICTURE
t.;S
AT 4D88

( OVERLAY-SCENE-RESOURCE | NFA 4D88 CFA 4D8E )
( Inferred descriptive name, not recovered original: )
( Resolves a packed picture and overlays it into the )
( existing $0600 scene picture buffer. )
( Stack: resource -- )
AT 4D88
( Header: flags, saved name and link )
BYTES 830000C2764D
DOCOL
t.RESOURCE-ADDR t.2+ t.SCENE-PICTURE-BUFFER
t.OVERLAY-PACKED-PICTURE t.;S
AT 4D9A

( HIT-MAP-SELECTOR | NFA 4D9A CFA 4D9F )
( Inferred descriptive name, not recovered original: Zero )
( chooses the base hit map; nonzero selects the zoom hit )
( map at +$284. Scene/zoom drawing routines set it )
( explicitly. )
( Stack: -- address )
AT 4D9A
( Header: flags, saved name and link )
BYTES 8200D4884D
DOVAR
CELL 0000
AT 4DA3

( HIT-MAP-BASE | NFA 4DA3 CFA 4DA8 )
( Inferred descriptive name, not recovered original: )
( Constant $A0D5 addresses the base room hit map; its first )
( two bytes contain width and height. )
( Stack: -- address )
AT 4DA3
( Header: flags, saved name and link )
BYTES 8200C19A4D
DOCON
CELL A0D5
AT 4DAC

( HIT-MAP@ | NFA 4DAC CFA 4DB2 )
( Inferred descriptive name, not recovered original: )
( Returns hit-map base $A0D5, adding $284 when )
( HIT-MAP-SELECTOR is nonzero. )
( Stack: -- address )
AT 4DAC
( Header: flags, saved name and link )
BYTES 830000C2A34D
DOCOL
t.HIT-MAP-BASE t.HIT-MAP-SELECTOR t.@
t.0BRANCH CELL 0008 ( -> 4DC4 )
LIT16 0284 t.+
( label 4DC4 )
t.;S
AT 4DC6

( PLAYER-COLORS | NFA 4DC6 CFA 4DCC )
( Inferred descriptive name, not recovered original: Bytes )
( copied to OS PCOLR0..3 at $02C0 by $4DDB to color the )
( player/missile cursor. )
( Stack: -- address )
AT 4DC6
( Header: flags, saved name and link )
BYTES 830000CDAC4D
DOVAR
BYTES AEAAA0414C4C
AT 4DD4

( SET-PLAYER-COLORS | NFA 4DD4 CFA 4DDB )
( Inferred descriptive name, not recovered original: Copies )
( four bytes from PLAYER-COLORS to OS color shadows )
( $02C0..$02C3. )
( Stack: -- )
AT 4DD4
( Header: flags, saved name and link )
BYTES 84000000CDC64D
DOCOL
t.PLAYER-COLORS LIT16 02C0 LIT16 0004 t.CMOVE t.;S
AT 4DEB

( PM-BASE | NFA 4DEB CFA 4DF1 )
( Inferred descriptive name, not recovered original: Cell )
( stores the player/missile memory base in bytes; set while )
( writing PMBASE hardware $D407. )
( Stack: -- address )
AT 4DEB
( Header: flags, saved name and link )
BYTES 830000A3D44D
DOVAR
CELL 0000
AT 4DF5

( PLAYER-DATA-BASE | NFA 4DF5 CFA 4DFC )
( Inferred descriptive name, not recovered original: )
( Returns PM-BASE+$400, the first player area for the )
( configured single-line PM graphics. )
( Stack: -- address )
AT 4DF5
( Header: flags, saved name and link )
BYTES 84000000C0EB4D
DOCOL
t.PM-BASE t.@ LIT16 0400 t.+ t.;S
AT 4E0A

( PM-BASE! | NFA 4E0A CFA 4E11 )
( Inferred descriptive name, not recovered original: Writes )
( the page number to ANTIC PMBASE $D407 and stores page*256 )
( in PM-BASE. )
( Stack: page -- )
AT 4E0A
( Header: flags, saved name and link )
BYTES 84000000A1F54D
DOCOL
t.DUP LIT16 D407 t.C! LIT16 0100 t.* t.PM-BASE t.! t.;S
AT 4E27

( CLEAR-PLAYERS | NFA 4E27 CFA 4E2E )
( Inferred descriptive name, not recovered original: Erases )
( $2FF bytes from PM-BASE+$400, covering the cursor's three )
( player planes. )
( Stack: -- )
AT 4E27
( Header: flags, saved name and link )
BYTES 84000000CD0A4E
DOCOL
t.PLAYER-DATA-BASE LIT16 02FF t.ERASE t.;S
AT 4E3A

( ENABLE-PLAYERS | NFA 4E3A CFA 4E42 )
( Inferred descriptive name, not recovered original: Writes )
( three to GTIA GRACTL $D01D, enabling missile and player )
( DMA display. )
( Stack: -- )
AT 4E3A
( Header: flags, saved name and link )
BYTES 8500000000CD274E
DOCOL
t.3 LIT16 D01D t.C! t.;S
AT 4E4E

( DISABLE-PLAYERS | NFA 4E4E CFA 4E57 )
( Inferred descriptive name, not recovered original: Clears )
( eight horizontal position registers at $D000 and writes )
( zero to GRACTL. )
( Stack: -- )
AT 4E4E
( Header: flags, saved name and link )
BYTES 860000000000CD3A4E
DOCOL
LIT16 D000 LIT16 0008 t.ERASE t.0 LIT16 D01D t.C! t.;S
AT 4E6D

( w4E73 | NFA 4E6D CFA 4E73 )
( Unknown erased name; CFA identifier )
AT 4E6D
( Header: flags, saved name and link )
BYTES 830000A34E4E
DOVAR
BYTES 000005414C
AT 4E7A

( SET-CURSOR-PM-X | NFA 4E7A CFA 4E81 )
( Inferred descriptive name, not recovered original: Waits )
( for the raster point, then writes the supplied x to )
( HPOSP0, HPOSP1 and HPOSP2 and drops it. )
( Stack: x -- )
AT 4E7A
( Header: flags, saved name and link )
BYTES 84000000A16D4E
CELL 4E83 ( native entry point )
JSR.ABS 486B         ( 4E83 )
LDA.ZPX 00           ( 4E86 )
STA.ABS D000         ( 4E88 )
STA.ABS D001         ( 4E8B )
STA.ABS D002         ( 4E8E )
JMP.ABS 1059         ( 4E91 )
AT 4E94

( CURSOR-PLAYER-BITMAP | NFA 4E94 CFA 4E9A )
( Inferred descriptive name, not recovered original: Body )
( at $4E9C contains three 13-byte cursor planes. $4F1E )
( refers to that literal body address; its saved DOCOL )
( field is not evidence this data is executable Forth. )
( Data body referenced by literal address; do not execute )
( its saved DOCOL entry. )
AT 4E94
( Header: flags, saved name and link )
BYTES 830000B07A4E
DOCOL
( Trailing code/data at 4E9C; retained exactly )
INCBIN graphics/cursors/player-planes.bin
BYTES 7712
AT 4EC5

( PM-COPY-DEST | NFA 4EC5 CFA 4ECA )
( Inferred descriptive name, not recovered original: )
( Constant $D4, the destination pointer used by the native )
( player-plane copy. )
( Stack: -- address )
AT 4EC5
( Header: flags, saved name and link )
BYTES 8200CB944E
DOCON
CELL 00D4
AT 4ECE

( PM-COPY-PLANES | NFA 4ECE CFA 4ED5 )
( Inferred descriptive name, not recovered original: Native )
( $4EF4 uses its low byte as plane count and advances )
( destination by256 for each plane. )
( Stack: -- address )
AT 4ECE
( Header: flags, saved name and link )
BYTES 84000000CDC54E
DOVAR
CELL 0000
AT 4ED9

( PM-COPY-PARAMETERS! | NFA 4ED9 CFA 4EE2 )
( Inferred descriptive name, not recovered original: Stores )
( plane count and the per-plane byte count [the shared )
( RECORD-SPAN cell]. )
( Stack: bytes-per-plane planes -- )
AT 4ED9
( Header: flags, saved name and link )
BYTES 860000000000A1CE4E
DOCOL
t.PM-COPY-PLANES t.! t.RECORD-SPAN t.! t.;S
AT 4EEE

( COPY-PM-PLANES | NFA 4EEE CFA 4EF4 )
( Inferred descriptive name, not recovered original: Waits )
( for raster, copies each plane from $D2 to $D4, advances )
( source by plane length and destination by256, preserving )
( Forth X. )
( Stack: -- )
AT 4EEE
( Header: flags, saved name and link )
BYTES 830000A6D94E
CELL 4EF6 ( native entry point )
STX.ZP D1            ( 4EF6 )
JSR.ABS 486B         ( 4EF8 )
LDX.ABS 4ED7         ( 4EFB )
LDY.# 00             ( 4EFE )
LDA.INDY D2          ( 4F00 )
STA.INDY D4          ( 4F02 )
INY                  ( 4F04 )
CPY.ABS 3E9E         ( 4F05 )
BNE 4F00             ( 4F08 )
INC.ZP D5            ( 4F0A )
JSR.ABS 3EBB         ( 4F0C )
DEX                  ( 4F0F )
BNE 4EFE             ( 4F10 )
LDX.ZP D1            ( 4F12 )
JMP.ABS 0F47         ( 4F14 )
AT 4F17

( SET-CURSOR-PM-Y | NFA 4F17 CFA 4F1E )
( Inferred descriptive name, not recovered original: Copies )
( the fixed three-plane,13-row cursor bitmap to )
( PM-BASE+$400+y using $4EF4. )
( Stack: y -- )
AT 4F17
( Header: flags, saved name and link )
BYTES 84000000A1EE4E
DOCOL
LIT16 4E9C t.SWAP t.PLAYER-DATA-BASE t.+ t.PM-COPY-DEST t.!
t.RECORD-POINTER t.! t.3 t.PM-COPY-PLANES t.! LIT8 0D
t.RECORD-SPAN t.! t.COPY-PM-PLANES t.;S
AT 4F43

( CONTEXT-BYTE-ARRAY: | NFA 4F43 CFA 4F4C )
( Inferred descriptive name, not recovered original: )
( Defining word stores an index-cell address and allocates )
( bytes; DOES> fetches that index and adds it to the )
( payload address. )
AT 4F43
( Header: flags, saved name and link )
BYTES 860000000000D9174F
DOCOL
t.<BUILDS t., t.ALLOT t.DOES>
( Trailing code/data at 4F56; retained exactly )
BYTES A513E413E413041316167712
AT 4F62

( CURSOR-AXIS | NFA 4F62 CFA 4F68 )
( Inferred descriptive name, not recovered original: Zero )
( selects horizontal cursor cells; one selects the adjacent )
( vertical cells in the four context-indexed arrays. )
( Stack: -- address )
AT 4F62
( Header: flags, saved name and link )
BYTES 830000D9434F
DOVAR
CELL 0000
AT 4F6C

( CURSOR-ORIGIN | NFA 4F6C CFA 4F73 )
( Inferred descriptive name, not recovered original: )
( Axis-indexed byte origins used with grid step and )
( position to compute PM screen coordinates. )
( Stack: -- address )
AT 4F6C
( Header: flags, saved name and link )
BYTES 84000000B0624F
DODOES
( DOES> thread at 4F56 )
BYTES 564F6A4F422120
AT 4F7C

( CURSOR-GRID-POS | NFA 4F7C CFA 4F82 )
( Inferred descriptive name, not recovered original: )
( Axis-indexed cursor x/y grid positions; input wait )
( returns both bytes and navigation saves/restores their )
( pair. )
( Stack: -- address )
AT 4F7C
( Header: flags, saved name and link )
BYTES 830000D06C4F
DODOES
( DOES> thread at 4F56 )
BYTES 564F6A4F000020
AT 4F8B

( CURSOR-GRID-STEP | NFA 4F8B CFA 4F91 )
( Inferred descriptive name, not recovered original: )
( Axis-indexed pixel steps, normally x4 and y6; $4FB9 )
( scales the selected grid position by this value. )
( Stack: -- address )
AT 4F8B
( Header: flags, saved name and link )
BYTES 830000D37C4F
DODOES
( DOES> thread at 4F56 )
BYTES 564F6A4F040620
AT 4F9A

( CURSOR-GRID-LIMIT | NFA 4F9A CFA 4FA0 )
( Inferred descriptive name, not recovered original: )
( Axis-indexed maximum grid coordinates; movement stops at )
( zero or this limit. )
( Stack: -- address )
AT 4F9A
( Header: flags, saved name and link )
BYTES 830000CD8B4F
DODOES
( DOES> thread at 4F56 )
BYTES 564F6A4F1F1220
AT 4FA9

( CURSOR-MOVE-DELTA | NFA 4FA9 CFA 4FAE )
( Inferred descriptive name, not recovered original: Stores )
( the signed one-step input delta during animated cursor )
( movement. )
( Stack: -- address )
AT 4FA9
( Header: flags, saved name and link )
BYTES 8200CC9A4F
DOVAR
CELL 0000
AT 4FB2

( CURSOR-PIXEL | NFA 4FB2 CFA 4FB9 )
( Inferred descriptive name, not recovered original: )
( Computes selected-axis origin + grid-position*grid-step. )
( Stack: -- pixel )
AT 4FB2
( Header: flags, saved name and link )
BYTES 84000000D9A94F
DOCOL
t.CURSOR-ORIGIN t.C@ t.CURSOR-GRID-POS t.C@ t.CURSOR-GRID-STEP
t.C@ t.* t.+ t.;S
AT 4FCD

( STEP-CURSOR | NFA 4FCD CFA 4FD4 )
( Inferred descriptive name, not recovered original: For )
( nonzero signed movement, checks the selected-axis limit, )
( animates PM position across one grid step and adjusts its )
( stored grid byte. Intended deltas are -1,0,+1. )
( Stack: delta -- )
AT 4FCD
( Header: flags, saved name and link )
BYTES 84000000A1B24F
DOCOL
t.-DUP
t.0BRANCH CELL 0068 ( -> 5042 )
t.DUP t.CURSOR-MOVE-DELTA t.! t.0 t.<
t.0BRANCH CELL 000C ( -> 4FF4 )
t.CURSOR-GRID-POS t.C@ t.0=_12DE
t.BRANCH CELL 000C ( -> 4FFE )
( label 4FF4 )
t.CURSOR-GRID-POS t.C@ t.CURSOR-GRID-LIMIT t.C@ t.=
( label 4FFE )
t.0=_12DE
t.0BRANCH CELL 0040 ( -> 5042 )
t.CURSOR-PIXEL t.CURSOR-GRID-STEP t.C@ t.1+
t.CURSOR-MOVE-DELTA t.@ t.* t.CURSOR-MOVE-DELTA t.@ t.(DO)
( label 5018 )
t.DUP t.I t.+ t.CURSOR-AXIS t.@ t.0=_12DE
t.0BRANCH CELL 0008 ( -> 502E )
t.SET-CURSOR-PM-X
t.BRANCH CELL 0004 ( -> 5030 )
( label 502E )
t.SET-CURSOR-PM-Y
( label 5030 )
t.CURSOR-MOVE-DELTA t.@
t.(+LOOP) CELL FFE2 ( -> 5018 )
t.DROP t.CURSOR-MOVE-DELTA t.@ t.CURSOR-GRID-POS t.BYTE+!
( label 5042 )
t.;S
AT 5044

( JOYSTICK-TRIGGER | NFA 5044 CFA 504C )
( Inferred descriptive name, not recovered original: Reads )
( Atari hardware trigger $D010 plus the joystick number and )
( masks bit zero; zero means pressed. )
AT 5044
( Header: flags, saved name and link )
BYTES 8500000000C7CD4F
DOCOL
LIT16 D010 t.+ t.C@ t.1 t.AND t.;S
AT 505C

( -1 | NFA 505C CFA 5061 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $4F47 [-1] in contiguous 3-definition sequence )
( matching header flags, name suffix, word kind and body )
( size. GAM FORTH 11_A_Graf.ATR CFA $9612, identical body )
( after known address relocation; surviving name length and )
( suffix match )
AT 505C
( Header: flags, saved name and link )
BYTES 8200B14450
DOCON
CELL FFFF
AT 5065

( STICK-X-DELTA-TABLE | NFA 5065 CFA 506B )
( Inferred descriptive name, not recovered original: )
( Threaded selector indexed by raw STICK nibble minus five; )
( entries yield +1,-1 or0 for horizontal movement. )
( Stack: index -- dx )
AT 5065
( Header: flags, saved name and link )
BYTES 830000D45C50
DODOES
( DOES> thread at 383C )
BYTES 3C38CD14CD14CD14C514615061506150C514C514C514C5147712
AT 5087

( STICK-Y-DELTA-TABLE | NFA 5087 CFA 508D )
( Inferred descriptive name, not recovered original: )
( Companion selector yields vertical -1/0/+1 after the raw )
( joystick nibble is reduced by five. )
( Stack: index -- dy )
AT 5087
( Header: flags, saved name and link )
BYTES 830000D46550
DODOES
( DOES> thread at 383C )
BYTES 3C38CD146150C514C514CD146150C514C514CD146150C5147712
AT 50A9

( JOYSTICK-DELTA | NFA 50A9 CFA 50B2 )
( Inferred descriptive name, not recovered original: Reads )
( STICK0 at $0278 plus joystick index, subtracts five, and )
( maps through two direction tables. )
AT 50A9
( Header: flags, saved name and link )
BYTES 860000000000D98750
DOCOL
LIT16 0278 t.+ t.C@ LIT16 0005 t.- t.DUP t.STICK-X-DELTA-TABLE
t.SWAP t.STICK-Y-DELTA-TABLE t.;S
AT 50CC

( INIT-CURSOR-PLAYERS | NFA 50CC CFA 50D2 )
( Inferred descriptive name, not recovered original: Sets )
( SDMCTL=$3E and GPRIOR=1, selects PM base $A000, clears )
( players, installs their colors and enables GRACTL. )
( Stack: -- )
AT 50CC
( Header: flags, saved name and link )
BYTES 830000CDA950
DOCOL
LIT16 003E LIT16 022F t.C! t.1 LIT16 026F t.C! LIT16 00A0
t.PM-BASE! t.CLEAR-PLAYERS t.SET-PLAYER-COLORS
t.ENABLE-PLAYERS t.;S
AT 50F4

( CURSOR-ORIGIN! | NFA 50F4 CFA 50FC )
( Inferred descriptive name, not recovered original: Sets )
( vertical origin y+$21 and horizontal origin 4*x+$32 in )
( the axis-indexed cursor array. )
( Stack: x-byte y -- )
AT 50F4
( Header: flags, saved name and link )
BYTES 8500000000A1CC50
DOCOL
t.1 t.CURSOR-AXIS t.! LIT8 21 t.+ t.CURSOR-ORIGIN t.C! t.0
t.CURSOR-AXIS t.! LIT8 04 t.* LIT8 32 t.+ t.CURSOR-ORIGIN t.C!
t.;S
AT 5123

( CURSOR-LIMITS! | NFA 5123 CFA 512A )
( Inferred descriptive name, not recovered original: Stores )
( rows-1 and columns-1 as vertical/horizontal maximum grid )
( positions. )
( Stack: columns rows -- )
AT 5123
( Header: flags, saved name and link )
BYTES 84000000A1F450
DOCOL
t.0 t.CURSOR-AXIS t.! t.1 t.- t.CURSOR-GRID-LIMIT t.1+ t.C!
t.1 t.- t.CURSOR-GRID-LIMIT t.C! t.;S
AT 5146

( CURSOR-STEPS! | NFA 5146 CFA 514D )
( Inferred descriptive name, not recovered original: Stores )
( the horizontal and vertical byte steps used to animate )
( cursor movement. )
( Stack: x-step y-step -- )
AT 5146
( Header: flags, saved name and link )
BYTES 84000000A12351
DOCOL
t.0 t.CURSOR-AXIS t.! t.CURSOR-GRID-STEP t.1+ t.C!
t.CURSOR-GRID-STEP t.C! t.;S
AT 5161

( VIEW-STACK | NFA 5161 CFA 5166 )
( Inferred descriptive name, not recovered original: )
( Counted stack of 16-bit view IDs; the first byte counts )
( stored bytes. $517D pushes and $51AA pops. )
( Stack: -- address )
AT 5161
( Header: flags, saved name and link )
BYTES 8200D04651
DOVAR
BYTES 000005414C4C4F542020202020202020
AT 5178

( PUSH-VIEW | NFA 5178 CFA 517D )
( Inferred descriptive name, not recovered original: Stores )
( the cell at VIEW-STACK+count+2, then increments the byte )
( count by two. This implementation has no capacity check. )
( Stack: view -- )
AT 5178
( Header: flags, saved name and link )
BYTES 8200D06151
DOCOL
t.VIEW-STACK t.C@ t.2+ t.VIEW-STACK t.+ t.! t.2 t.VIEW-STACK
t.BYTE+! t.;S
AT 5193

( P | NFA 5193 CFA 5197 )
( Intact dictionary name in supplied Wladcy Ciemnosci v1 )
( image. )
AT 5193
( Header: flags, saved name and link )
BYTES 81D07851
DOCOL
t.VIEW-STACK t.DUP t.C@ t.+ t.@ t.;S
AT 51A5

( POP-VIEW | NFA 51A5 CFA 51AA )
( Inferred descriptive name, not recovered original: )
( Fetches the cell at VIEW-STACK+count, then decrements a )
( nonzero byte count by two; zero count returns the initial )
( cell. )
( Stack: -- view )
AT 51A5
( Header: flags, saved name and link )
BYTES 8200BE9351
DOCOL
t.VIEW-STACK t.C@ t.VIEW-STACK t.+ t.@ t.VIEW-STACK t.C@
t.0BRANCH CELL 000A ( -> 51C6 )
LIT16 FFFE t.VIEW-STACK t.BYTE+!
( label 51C6 )
t.;S
AT 51C8

( CELL-ARRAY: | NFA 51C8 CFA 51D0 )
( Inferred descriptive name, not recovered original: )
( Defining word allocates twice the requested count; DOES> )
( doubles the index and adds it to the payload. )
AT 51C8
( Header: flags, saved name and link )
BYTES 8500000000D9A551
DOCOL
t.<BUILDS t.2 t.* t.ALLOT t.DOES>
( Trailing code/data at 51DC; retained exactly )
BYTES 8D13D5140F2004137712
AT 51E6

( VIEW-CURSOR-POSITIONS | NFA 51E6 CFA 51EC )
( Inferred descriptive name, not recovered original: Cell )
( array stores one cursor x/y byte pair for each view-stack )
( byte-count index, as used by $5204/$5220. )
( Stack: index -- address )
AT 51E6
( Header: flags, saved name and link )
BYTES 830000D9C851
DODOES
( DOES> thread at 51DC )
BYTES DC512020202020202020202020202020
AT 51FE

( RESTORE-VIEW-CURSOR | NFA 51FE CFA 5204 )
( Inferred descriptive name, not recovered original: )
( Indexes saved cursor cells by current VIEW-STACK byte )
( count, fetches the packed pair and writes it to the )
( horizontal/vertical cursor bytes. )
( Stack: -- )
AT 51FE
( Header: flags, saved name and link )
BYTES 830000D9E651
DOCOL
t.VIEW-STACK t.C@ t.VIEW-CURSOR-POSITIONS t.@ t.0
t.CURSOR-AXIS t.! t.CURSOR-GRID-POS t.! t.;S
AT 521A

( SAVE-VIEW-CURSOR | NFA 521A CFA 5220 )
( Inferred descriptive name, not recovered original: Stores )
( the current packed cursor position at the cell-array )
( index given by the current VIEW-STACK byte count. )
( Stack: -- )
AT 521A
( Header: flags, saved name and link )
BYTES 830000D9FE51
DOCOL
t.0 t.CURSOR-AXIS t.! t.CURSOR-GRID-POS t.@ t.VIEW-STACK t.C@
t.VIEW-CURSOR-POSITIONS t.! t.;S
AT 5236

( CENTER-VIEW-CURSOR | NFA 5236 CFA 523C )
( Inferred descriptive name, not recovered original: Uses )
( active hit-map dimensions: y becomes height/2 and x )
( becomes width/2-1. )
( Stack: -- )
AT 5236
( Header: flags, saved name and link )
BYTES 830000D91A52
DOCOL
t.0 t.CURSOR-AXIS t.! t.HIT-MAP@ t.BYTE-PAIR@ t.2 t./
t.CURSOR-GRID-POS t.1+ t.C! t.2 t./ t.1 t.- t.CURSOR-GRID-POS
t.C! t.;S
AT 5260

( CONFIGURE-VIEW-CURSOR | NFA 5260 CFA 5266 )
( Inferred descriptive name, not recovered original: Uses )
( picture origin for a zoom view or x4/y0 for the base )
( view, applies active hit-map dimensions as limits and )
( fixes cursor steps to4/6 pixels. )
( Stack: -- )
AT 5260
( Header: flags, saved name and link )
BYTES 830000CD3652
DOCOL
t.VIEW-STACK t.C@
t.0BRANCH CELL 000A ( -> 5278 )
t.SCENE-PICTURE-BUFFER t.BYTE-PAIR@
t.BRANCH CELL 0008 ( -> 527E )
( label 5278 )
LIT16 0004 t.0
( label 527E )
t.CURSOR-ORIGIN! t.HIT-MAP@ t.BYTE-PAIR@ t.CURSOR-LIMITS!
LIT16 0004 LIT8 06 t.CURSOR-STEPS! t.;S
AT 5291

( HIT-MAP-CELL | NFA 5291 CFA 5298 )
( Inferred descriptive name, not recovered original: )
( Returns the hit-map byte at base+2+x+y*width for the )
( currently selected map. )
( Stack: x y -- object )
AT 5291
( Header: flags, saved name and link )
BYTES 84000000C06052
DOCOL
t.HIT-MAP@ t.C@ t.* t.+ t.HIT-MAP@ t.+ t.2+ t.C@ t.;S
AT 52AC

( HIT-MAP-OFFSET | NFA 52AC CFA 52B3 )
( Inferred descriptive name, not recovered original: Adds )
( horizontal picture offset and stride*[vertical offset/6], )
( matching six bitmap rows per hit-map row. )
( Stack: base stride -- address )
AT 52AC
( Header: flags, saved name and link )
BYTES 84000000D99152
DOCOL
t.PICTURE-Y-OFFSET t.@ LIT16 0006 t./ t.* t.+
t.PICTURE-X-OFFSET t.@ t.+ t.;S
AT 52CB

( EXPAND-HIT-MAP | NFA 52CB CFA 52D1 )
( Inferred descriptive name, not recovered original: )
( Decodes a packed width/height hit-map record at its )
( relative picture offset into the active hit-map buffer. )
( Stack: source -- )
AT 52CB
( Header: flags, saved name and link )
BYTES 830000C2AC52
DOCOL
t.HIT-MAP@ t.C@ t.SWAP t.OVER t.HIT-MAP@ t.2+ t.SWAP
t.HIT-MAP-OFFSET t.EXPAND-PICTURE-DATA t.;S
AT 52E7

( LOAD-BASE-HIT-MAP | NFA 52E7 CFA 52ED )
( Inferred descriptive name, not recovered original: )
( Selects the base map, copies its dimensions [doubling )
( width], configures/centers the cursor and expands the )
( packed map. )
( Stack: resource -- )
AT 52E7
( Header: flags, saved name and link )
BYTES 830000C1CB52
DOCOL
t.0 t.HIT-MAP-SELECTOR t.! t.RESOURCE-ADDR t.2+ t.DUP
t.BYTE-PAIR@ t.HIT-MAP@ t.1+ t.C! t.2 t.* t.HIT-MAP@ t.C!
t.CONFIGURE-VIEW-CURSOR t.CENTER-VIEW-CURSOR t.EXPAND-HIT-MAP
t.;S
AT 5313

( LOAD-ZOOM-HIT-MAP | NFA 5313 CFA 5319 )
( Inferred descriptive name, not recovered original: )
( Selects the zoom map, copies its width/height header and )
( expands its packed payload. )
( Stack: resource -- )
AT 5313
( Header: flags, saved name and link )
BYTES 830000C1E752
DOCOL
t.1 t.HIT-MAP-SELECTOR t.! t.RESOURCE-ADDR t.2+ t.DUP
t.HIT-MAP@ t.2 t.CMOVE t.EXPAND-HIT-MAP t.;S
AT 5331

( OVERLAY-HIT-MAP | NFA 5331 CFA 5337 )
( Inferred descriptive name, not recovered original: )
( Resolves a mask resource and expands it into the current )
( hit map using the current picture offsets. )
( Stack: resource -- )
AT 5331
( Header: flags, saved name and link )
BYTES 830000C11353
DOCOL
t.RESOURCE-ADDR t.2+ t.EXPAND-HIT-MAP t.;S
AT 5341

( MASK-PICTURE-BYTE | NFA 5341 CFA 5346 )
( Inferred descriptive name, not recovered original: Native )
( helper processes four two-bit pixels, combines a )
( source-pixel mask with destination, and tracks runs )
( through $FC. Returns masked byte in $FA with RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5341
( Header: flags, saved name and link )
BYTES 8200B03153
CELL 5348 ( native entry point )
LDA.# C0             ( 5348 )
STA.ZP F4            ( 534A )
LDX.# 04             ( 534C )
LDA.INDY F0          ( 534E )
STA.ZP FA            ( 5350 )
LDA.ZP F4            ( 5352 )
AND.INDY F2          ( 5354 )
BEQ 5365             ( 5356 )
LDA.ZP F4            ( 5358 )
EOR.# FF             ( 535A )
AND.ZP FA            ( 535C )
STA.ZP FA            ( 535E )
INC.ZP FC            ( 5360 )
JMP.ABS 5377         ( 5362 )
LDA.ZP FC            ( 5365 )
CMP.# 02             ( 5367 )
BCC 5373             ( 5369 )
LDA.ZP F4            ( 536B )
EOR.# FF             ( 536D )
AND.ZP FA            ( 536F )
STA.ZP FA            ( 5371 )
LDA.# 00             ( 5373 )
STA.ZP FC            ( 5375 )
LSR.ZP F4            ( 5377 )
LSR.ZP F4            ( 5379 )
DEX                  ( 537B )
BNE 5352             ( 537C )
RTS                  ( 537E )
AT 537F

( BLIT-MASKED | NFA 537F CFA 5384 )
( Inferred descriptive name, not recovered original: Zero )
( makes $538D copy source directly; nonzero enables masked )
( blending with the optional hit/depth comparison. )
( Stack: -- address )
AT 537F
( Header: flags, saved name and link )
BYTES 8200CD4153
DOVAR
CELL 0000
AT 5388

( BLEND-PICTURE-BYTE | NFA 5388 CFA 538D )
( Inferred descriptive name, not recovered original: Copies )
( a source pixel byte directly when BLIT-MASKED is zero; )
( otherwise calls $5346, ORs source pixels with the masked )
( background and stores them. This game has no Klatwa )
( hit/depth threshold branch. Native RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5388
( Header: flags, saved name and link )
BYTES 8200AA7F53
CELL 538F ( native entry point )
LDA.ABS 5386         ( 538F )
BNE 539B             ( 5392 )
LDA.INDY F2          ( 5394 )
STA.INDY F0          ( 5396 )
JMP.ABS 53A7         ( 5398 )
JSR.ABS 5348         ( 539B )
SEC                  ( 539E )
BCC 53A7             ( 539F )
LDA.INDY F2          ( 53A1 )
ORA.ZP FA            ( 53A3 )
STA.INDY F0          ( 53A5 )
RTS                  ( 53A7 )
AT 53A8

( BLEND-PICTURE-ROW | NFA 53A8 CFA 53AE )
( Inferred descriptive name, not recovered original: Calls )
( the byte blending helper for Y=0 through width-1, width )
( held in $F7. Native RTS helper. )
( Assembly subroutine entry; returns with RTS. )
AT 53A8
( Header: flags, saved name and link )
BYTES 830000C98853
CELL 53B0 ( native entry point )
LDY.# 00             ( 53B0 )
JSR.ABS 538F         ( 53B2 )
INY                  ( 53B5 )
CPY.ZP F7            ( 53B6 )
BNE 53B2             ( 53B8 )
RTS                  ( 53BA )
AT 53BB

( BLEND-PICTURE-ROWS | NFA 53BB CFA 53C1 )
( Inferred descriptive name, not recovered original: For )
( each row, clears the pixel-run counter, blends width )
( bytes, advances source and destination by their )
( independent strides, then decrements height. No Klatwa )
( row clipping or hit-map pointer progression remains. )
( Native RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 53BB
( Header: flags, saved name and link )
BYTES 830000CFA853
CELL 53C3 ( native entry point )
LDA.# 00             ( 53C3 )
STA.ZP FC            ( 53C5 )
JSR.ABS 53B0         ( 53C7 )
LDA.ZP F6            ( 53CA )
CLC                  ( 53CC )
ADC.ZP F2            ( 53CD )
STA.ZP F2            ( 53CF )
BCC 53D5             ( 53D1 )
INC.ZP F3            ( 53D3 )
LDA.ZP F9            ( 53D5 )
CLC                  ( 53D7 )
ADC.ZP F0            ( 53D8 )
STA.ZP F0            ( 53DA )
BCC 53E0             ( 53DC )
INC.ZP F1            ( 53DE )
DEC.ZP F8            ( 53E0 )
BNE 53C7             ( 53E2 )
RTS                  ( 53E4 )
AT 53E5

( BLIT-PICTURE | NFA 53E5 CFA 53ED )
( Inferred descriptive name, not recovered original: )
( Preserves the Forth stack register while invoking the )
( native rectangle compositor at $53C3. )
( Stack: -- )
AT 53E5
( Header: flags, saved name and link )
BYTES 8500000000C5BB53
CELL 53EF ( native entry point )
STX.ZP D1            ( 53EF )
JSR.ABS 53C3         ( 53F1 )
LDX.ZP D1            ( 53F4 )
JMP.ABS 0F47         ( 53F6 )
AT 53F9

( PICTURE-SCREEN-ADDR | NFA 53F9 CFA 53FE )
( Inferred descriptive name, not recovered original: Reads )
( picture x/y and returns BITMAP-BASE+x+40*y. )
( Stack: picture -- address )
AT 53F9
( Header: flags, saved name and link )
BYTES 8200D3E553
DOCOL
t.GRAPHICS-BASE t.@ t.SWAP t.BYTE-PAIR@ LIT8 28 t.* t.+ t.+
t.;S
AT 5413

( BLIT-PARAMETERS | NFA 5413 CFA 541A )
( Inferred descriptive name, not recovered original: Stores )
( destination stride, source pointer and )
( width/height/source stride, then calls the native )
( blitter. Header begins with width/height. )
( Stack: header pixels stride -- )
AT 5413
( Header: flags, saved name and link )
BYTES 84000000AAF953
DOCOL
t.GRAPHICS-ROW-COUNTER t.C! t.2+ t.GRAPHICS-DEST-PTR t.!
t.BYTE-PAIR@ t.GRAPHICS-ROW-COUNT t.C! t.DUP
t.GRAPHICS-ROW-STRIDE t.C! t.GRAPHICS-COLUMN-COUNT t.C!
t.BLIT-PICTURE t.;S
AT 543A

( DRAW-DECODED-PICTURE | NFA 543A CFA 5441 )
( Inferred descriptive name, not recovered original: )
( Converts the picture's x/y header into its screen )
( address, sets destination pointer and blits width/height )
( pixels with40-byte screen stride. )
( Stack: picture -- )
AT 543A
( Header: flags, saved name and link )
BYTES 84000000C21354
DOCOL
t.DUP t.PICTURE-SCREEN-ADDR t.GRAPHICS-SOURCE-PTR t.! t.2+
t.DUP LIT8 28 t.BLIT-PARAMETERS t.;S
AT 5456

( COMPOSE-STAGED-PICTURE | NFA 5456 CFA 545D )
( Inferred descriptive name, not recovered original: Uses )
( staged picture and $0600 scene headers to calculate )
( relative offsets, then blits the staged image into the )
( scene buffer using scene width as destination stride. )
( Stack: -- )
AT 5456
( Header: flags, saved name and link )
BYTES 84000000C63A54
DOCOL
t.PICTURE-STAGING@ t.SCENE-PICTURE-BUFFER t.BYTE-PAIR@
t.SET-PICTURE-OFFSETS t.SCENE-PICTURE-BUFFER LIT16 0004 t.+
t.SCENE-PICTURE-BUFFER t.2+ t.C@ t.PICTURE-OFFSET
t.GRAPHICS-SOURCE-PTR t.! t.2+ t.DUP t.SCENE-PICTURE-BUFFER
t.2+ t.C@ t.BLIT-PARAMETERS t.;S
AT 5489

( SCENE-BACKUP-PICTURE | NFA 5489 CFA 548F )
( Inferred descriptive name, not recovered original: )
( Constant $0A00 is a four-byte picture header followed by )
( a saved screen rectangle used when entering/leaving zoom )
( views. )
( Stack: -- address )
AT 5489
( Header: flags, saved name and link )
BYTES 830000C35654
DOCON
CELL 0A00
AT 5493

( w5498 | NFA 5493 CFA 5498 )
( Unknown erased name; CFA identifier )
AT 5493
( Header: flags, saved name and link )
BYTES 8200D48954
DOCON
CELL 0B90
AT 549C

( SAVE-SCENE-BACKGROUND | NFA 549C CFA 54A3 )
( Inferred descriptive name, not recovered original: Copies )
( the scene picture header to $0A00 and captures its screen )
( rectangle using40-byte source stride and the blitter; )
( unlike Klatwa, it performs no extra banked backup. )
( Stack: -- )
AT 549C
( Header: flags, saved name and link )
BYTES 84000000BE9354
DOCOL
t.SCENE-PICTURE-BUFFER t.SCENE-BACKUP-PICTURE LIT16 0004
t.CMOVE LIT8 28 t.GRAPHICS-ROW-STRIDE t.C!
t.SCENE-BACKUP-PICTURE t.PICTURE-SCREEN-ADDR
t.GRAPHICS-DEST-PTR t.! t.SCENE-BACKUP-PICTURE LIT16 0004 t.+
t.GRAPHICS-SOURCE-PTR t.! t.SCENE-BACKUP-PICTURE t.2+
t.BYTE-PAIR@ t.GRAPHICS-ROW-COUNT t.C! t.DUP
t.GRAPHICS-ROW-COUNTER t.C! t.GRAPHICS-COLUMN-COUNT t.C!
t.BLIT-PICTURE t.;S
AT 54E2

( ITEM-RESOURCE-BASE | NFA 54E2 CFA 54E8 )
( Inferred descriptive name, not recovered original: )
( Constant $8D4D is the normal-RAM base of item-art )
( u16-length resources, indexed by $54F2. )
( Stack: -- address )
AT 54E2
( Header: flags, saved name and link )
BYTES 830000B09C54
DOCON
CELL 8D4D
AT 54EC

( ITEM-RESOURCE-ADDR | NFA 54EC CFA 54F2 )
( Inferred descriptive name, not recovered original: )
( Indexes the item-art length-record collection at $9932. )
( Stack: index -- record )
AT 54EC
( Header: flags, saved name and link )
BYTES 830000C5E254
DOCOL
t.ITEM-RESOURCE-BASE t.LENGTH-RECORD-ADDR t.;S
AT 54FA

( SAVED-STATE-BASE | NFA 54FA CFA 5500 )
( Inferred descriptive name, not recovered original: Start )
( of the contiguous saved state copied by game load/save; )
( initial cells2 and10 precede CURRENT-ROOM and the )
( power-slot records. No more specific direct reader is )
( established. )
( Stack: -- address )
AT 54FA
( Header: flags, saved name and link )
BYTES 830000C2EC54
DOVAR
BYTES 02000A00
AT 5506

( CURRENT-ROOM | NFA 5506 CFA 550D )
( Inferred descriptive name, not recovered original: Room )
( cell set by $59F0 and read by room/view list selection, )
( achievements and high-level game actions. )
( Stack: -- address )
AT 5506
( Header: flags, saved name and link )
BYTES 84000000CDFA54
DOVAR
CELL 0000
AT 5511

( POWER-SLOT-RECORDS | NFA 5511 CFA 5517 )
( Inferred descriptive name, not recovered original: Eight )
( length-prefixed power records contain three metadata )
( bytes plus13 display-name bytes. $603C renders SPIS MOCY; )
( $61F2 checks the selected power and two inventory )
( requirements; $6294 installs matching or empty slot )
( metadata. )
( Stack: index -- record )
( Decoded text: Power display slots )
( item 0 display $5522: [81]           [62] )
( item 1 display $5534: [ED]           [84] )
( item 2 display $5546: [81]           [62] )
( item 3 display $5558: [ED]           [84] )
( item 4 display $556A: [81]           [62] )
( item 5 display $557C: [ED]           [84] )
( item 6 display $558E: [81]           [62] )
( item 7 display $55A0: [ED]           [84] )
AT 5511
( Header: flags, saved name and link )
BYTES 830000C90655
DODOES
( DOES> thread at 3F4E )
BYTES 4E3F90001000000000813D3D3D3D3D3D3D3D3D3D3D621000000000ED
BYTES 3D3D3D3D3D3D3D3D3D3D3D841000000000813D3D3D3D3D3D3D3D3D3D
BYTES 3D621000000000ED3D3D3D3D3D3D3D3D3D3D3D841000000000813D3D
BYTES 3D3D3D3D3D3D3D3D3D621000000000ED3D3D3D3D3D3D3D3D3D3D3D84
BYTES 1000000000813D3D3D3D3D3D3D3D3D3D3D621000000000ED3D3D3D3D
BYTES 3D3D3D3D3D3D3D84
AT 55AD

( ITEM-POSITIONS | NFA 55AD CFA 55B4 )
( Inferred descriptive name, not recovered original: Cell )
( array of saved item x/y pairs. $5898 indexes it by )
( objectID-$CA and installs these coordinates before )
( drawing a dropped item. )
( Stack: item-index -- address )
AT 55AD
( Header: flags, saved name and link )
BYTES 84000000D91155
DODOES
( DOES> thread at 51DC )
BYTES DC5116481B480C30163C07481F3C0748122A1F3C1B3C07481B421A36
BYTES 1F3C19421F3C1736122A525A0748163C0748163C1B421A3C1B42122A
BYTES 122A5AB2
AT 55F2

( PART2-ITEM-POSITIONS | NFA 55F2 CFA 55F8 )
( Inferred descriptive name, not recovered original: )
( Initial item x/y coordinate table copied into the live )
( ITEM-POSITIONS table when beginning the second part. )
( Stack: item-index -- address )
AT 55F2
( Header: flags, saved name and link )
BYTES 830000B2AD55
DODOES
( DOES> thread at 51DC )
BYTES DC511F481A2A0A480A480A480A480A480A480A480A480F4813481748
BYTES 8442083C152A083C152A0E3C08480E3C1A2A4C4F
AT 562A

( CURRENT-PART-GROUP | NFA 562A CFA 5631 )
( Inferred descriptive name, not recovered original: )
( Selects the game-part resource group. Start/load paths )
( set2 or4; saved-game loading derives group4 or6 by adding )
( two. )
( Stack: -- address )
AT 562A
( Header: flags, saved name and link )
BYTES 84000000CBF255
DOVAR
BYTES 01000541
AT 5637

( w563E | NFA 5637 CFA 563E )
( Unknown erased name; CFA identifier )
AT 5637
( Header: flags, saved name and link )
BYTES 84000000C92A56
DODOES
( DOES> thread at 51DC )
BYTES DC51202020202020
AT 5648

( ROOM-OBJECT-STATE | NFA 5648 CFA 564E )
( Inferred descriptive name, not recovered original: )
( Mutable nested u16-length room/view object records. $59DC )
( takes room/view and returns the selected list; scene )
( redraw and object-changing actions consume these records. )
( Stack: -- address )
AT 5648
( Header: flags, saved name and link )
BYTES 830000C23756
DOVAR
BYTES 0B0001000006000C00000000000E000300086C0003002CCED002008F
BYTES CB180003000000000400278B0000030090D20002002CDF02002B0009
BYTES 00030000000002008F00080002001E00020090D90800020000000200
BYTES 8F00120004003B00000002003ADB02003AD102002BE3120003001E19
BYTES 00020090D702008F0003002C3E000C000200000002002C0002003AE4
BYTES 1400020000000200310002003200020032CD02002BD50D0003009600
BYTES 00020032E002003100110003003B00000200A1CC02003AE502000000
BYTES 08000200A20002008F6807000500A340A4780007000500A340A47800
BYTES 0400020040A41C000200000002006ECF02006ED002006ED102006ECC
BYTES 02006ECD02006ECE090003000E0000020035DD110003007200000200
BYTES 770002007700020077000400020000000D00030000000002008ACB02
BYTES 0095DE1300010000020027DA02002700020096DB020095DC11000300
BYTES 150000020027D80200310002008ADF170003008C0000040088D4D5D6
BYTES 020025000200890002002600040002009300
AT 57CE

( w57D6 | NFA 57CE CFA 57D6 )
( Unknown erased name; CFA identifier )
AT 57CE
( Header: flags, saved name and link )
BYTES 8500000000CD4856
DOCON
CELL 0018
AT 57DA

( ROOM-ACHIEVEMENT-BITS | NFA 57DA CFA 57E0 )
( Inferred descriptive name, not recovered original: )
( Room-indexed achievement bit bytes updated and counted by )
( progress routines. The buffer contains25 active room )
( bytes plus padding; game actions set particular event )
( bits. )
( Stack: -- address )
AT 57DA
( Header: flags, saved name and link )
BYTES 830000D0CE57
DOVAR
BYTES 0000000000000000000000000000000000000000000000000020
AT 57FC

( PUZZLE-STATE-CELLS | NFA 57FC CFA 5802 )
( Inferred descriptive name, not recovered original: )
( Indexed puzzle-state cell array shared by power, object )
( and ending actions. Consumers treat its entries as )
( independent flags/counters; no single narrower meaning )
( covers the whole array. )
( Stack: index -- address )
AT 57FC
( Header: flags, saved name and link )
BYTES 830000D9DA57
DODOES
( DOES> thread at 51DC )
BYTES DC510000000000000000000000000000000000000000000000000000
BYTES 00000000000000000000000000000000000000000000D4F8
AT 5838

( PATH-X | NFA 5838 CFA 583D )
( Inferred descriptive name, not recovered original: )
( Movement handlers update this coordinate for the path )
( puzzle; used with PATH-Y and directional move counters. )
( Stack: -- address )
AT 5838
( Header: flags, saved name and link )
BYTES 8200D4FC57
DOVAR
CELL 0000
AT 5841

( PATH-Y | NFA 5841 CFA 5846 )
( Inferred descriptive name, not recovered original: )
( Movement handlers update this coordinate for the path )
( puzzle; used with PATH-X and directional move counters. )
( Stack: -- address )
AT 5841
( Header: flags, saved name and link )
BYTES 8200D43858
DOVAR
CELL 0000
AT 584A

( PATH-MOVES-LEFT | NFA 584A CFA 584F )
( Inferred descriptive name, not recovered original: Cell )
( initially12, adjusted by the path-movement handlers as )
( the puzzle move budget. )
( Stack: -- address )
AT 584A
( Header: flags, saved name and link )
BYTES 8200CB4158
DOVAR
CELL 000C
AT 5853

( PATH-LAST-DIRECTION | NFA 5853 CFA 585A )
( Inferred descriptive name, not recovered original: Cell )
( initially1; path handlers record previous direction here )
( for their movement constraints. )
( Stack: -- address )
AT 5853
( Header: flags, saved name and link )
BYTES 84000000D24A58
DOVAR
CELL 0001
AT 585E

( PATH-DIRECTION-COUNTS | NFA 585E CFA 5865 )
( Inferred descriptive name, not recovered original: )
( Four16-bit direction counters, initially5,2,0,3, updated )
( by the path-movement handlers $7E82..$7ECC. )
( Stack: -- address )
AT 585E
( Header: flags, saved name and link )
BYTES 84000000D35358
DOVAR
BYTES 0500020000000300
AT 586F

( LAST-DIRECTION | NFA 586F CFA 5876 )
( Inferred descriptive name, not recovered original: )
( Previous movement direction cell used by ordinary )
( navigation and retained in the saved state; separate from )
( the path puzzle's direction at $585A. )
( Stack: -- address )
AT 586F
( Header: flags, saved name and link )
BYTES 84000000C55E58
DOVAR
CELL 0000
AT 587A

( ITEM-PICTURE-INDEX | NFA 587A CFA 5880 )
( Inferred descriptive name, not recovered original: Maps )
( an inventory/drop object ID to its picture resource: )
( 2*[object-$CA]+2, followed by its paired mask resource. )
( Stack: object -- resource )
AT 587A
( Header: flags, saved name and link )
BYTES 830000CE6F58
DOCOL
LIT8 CA t.- t.2 t.* t.2 t.+ t.;S
AT 5891

( COMPOSE-DROPPED-ITEM | NFA 5891 CFA 5898 )
( Inferred descriptive name, not recovered original: )
( Enables masked blending, decodes item art, applies the )
( saved ITEM-POSITIONS coordinates, composes it into the )
( scene and expands its paired hit map, then disables )
( masked blending. )
( Stack: object -- )
AT 5891
( Header: flags, saved name and link )
BYTES 84000000D47A58
DOCOL
t.DUP t.ITEM-PICTURE-INDEX t.>R t.1 t.BLIT-MASKED t.C! t.R
t.ITEM-RESOURCE-ADDR t.2+ t.PICTURE-STAGING@ t.DECODE-PICTURE
LIT8 CA t.- t.ITEM-POSITIONS t.BYTE-PAIR@ t.PICTURE-STAGING@
t.1+ t.C! t.PICTURE-STAGING@ t.C! t.COMPOSE-STAGED-PICTURE
t.R> t.1+ t.ITEM-RESOURCE-ADDR t.2+ t.EXPAND-HIT-MAP t.0
t.BLIT-MASKED t.C! t.;S
AT 58D7

( DRAW-BASE-PICTURE | NFA 58D7 CFA 58DE )
( Inferred descriptive name, not recovered original: Draws )
( the selected picture directly to screen and loads the )
( next resource as its base hit map. )
( Stack: resource -- )
AT 58D7
( Header: flags, saved name and link )
BYTES 84000000D09158
DOCOL
t.DUP t.DRAW-RESOURCE-PICTURE t.1+ t.LOAD-BASE-HIT-MAP t.;S
AT 58EA

( DRAW-PICTURE-AND-MASK | NFA 58EA CFA 58F0 )
( Inferred descriptive name, not recovered original: Draws )
( the picture; only if the word after its length-bounded )
( payload is nonzero does it expand the next resource as a )
( hit-map overlay. )
( Stack: resource -- )
AT 58EA
( Header: flags, saved name and link )
BYTES 830000D4D758
DOCOL
t.DUP t.DRAW-RESOURCE-PICTURE t.DUP t.RESOURCE-ADDR
t.WORD-COUNT t.+ t.@
t.0BRANCH CELL 000A ( -> 590C )
t.1+ t.OVERLAY-HIT-MAP
t.BRANCH CELL 0004 ( -> 590E )
( label 590C )
t.DROP
( label 590E )
t.;S
AT 5910

( DECODE-ZOOM-PICTURE | NFA 5910 CFA 5916 )
( Inferred descriptive name, not recovered original: )
( Decodes a picture into the scene buffer and loads the )
( following resource as the zoom hit map. )
( Stack: resource -- )
AT 5910
( Header: flags, saved name and link )
BYTES 830000D4EA58
DOCOL
t.DUP t.DECODE-SCENE-RESOURCE t.1+ t.LOAD-ZOOM-HIT-MAP t.;S
AT 5922

( COMPOSE-PICTURE-AND-MASK | NFA 5922 CFA 5928 )
( Inferred descriptive name, not recovered original: )
( Overlays a picture in the scene buffer, then expands its )
( following mask resource into the selected hit map. )
( Stack: resource -- )
AT 5922
( Header: flags, saved name and link )
BYTES 830000D41059
DOCOL
t.DUP t.OVERLAY-SCENE-RESOURCE t.1+ t.OVERLAY-HIT-MAP t.;S
AT 5934

( ROOM-RECORD-BUFFER | NFA 5934 CFA 593A )
( Inferred descriptive name, not recovered original: )
( Constant $8CC1 is the normal-RAM room descriptor staging )
( buffer. Background drawing loads a nested record here )
( before choosing its graphics resources. )
( Stack: -- address )
AT 5934
( Header: flags, saved name and link )
BYTES 830000D72259
DOCON
CELL 8CC1
AT 593E

( SPLIT-OBJECT-ID | NFA 593E CFA 5943 )
( Inferred descriptive name, not recovered original: )
( Divides by100, doubles the quotient for the resource )
( collection number and retains the remainder as the local )
( object index. )
( Stack: object -- collection local-index )
AT 593E
( Header: flags, saved name and link )
BYTES 8200D73459
DOCOL
LIT8 64 t./MOD t.2 t.* t.SWAP t.;S
AT 5952

( CLASSIFY-OBJECT | NFA 5952 CFA 5958 )
( Inferred descriptive name, not recovered original: IDs0/1 )
( produce only0; IDs above200 retain the original ID and )
( return1 [item art]; IDs2..200 load the collection )
( selected by ID/100 and return local index followed by )
( class2 [scene art]. Stack arity therefore differs for )
( ignored IDs. )
AT 5952
( Header: flags, saved name and link )
BYTES 830000D73E59
DOCOL
t.DUP t.1 t.>
t.0BRANCH CELL 001D ( -> 597F )
t.DUP LIT8 C8 t.>
t.0BRANCH CELL 0008 ( -> 5975 )
t.1
t.BRANCH CELL 0008 ( -> 597B )
( label 5975 )
t.SPLIT-OBJECT-ID t.FETCH-RESOURCE t.2
( label 597B )
t.BRANCH CELL 0006 ( -> 5983 )
( label 597F )
t.DROP t.0
( label 5983 )
t.;S
AT 5985

( DRAW-OBJECT-LIST | NFA 5985 CFA 598B )
( Inferred descriptive name, not recovered original: Walks )
( object bytes in a u16-length record beginning at start; )
( classifies each ID and draws its picture/mask when )
( nonzero. )
( Stack: record start -- )
AT 5985
( Header: flags, saved name and link )
BYTES 830000C25259
DOCOL
t.>R t.WORD-COUNT t.R> t.(DO)
( label 5995 )
t.DUP t.I t.+ t.C@ t.CLASSIFY-OBJECT
t.0BRANCH CELL 0004 ( -> 59A5 )
t.DRAW-PICTURE-AND-MASK
( label 59A5 )
t.(LOOP) CELL FFEE ( -> 5995 )
t.DROP t.;S
AT 59AD

( DRAW-ROOM-BACKGROUND | NFA 59AD CFA 59B4 )
( Inferred descriptive name, not recovered original: )
( Fetches room-1 from nested collection1 into )
( ROOM-RECORD-BUFFER, loads its specified resource group, )
( draws base picture0 and remaining static object entries. )
( Stack: room -- )
AT 59AD
( Header: flags, saved name and link )
BYTES 84000000D28559
DOCOL
t.1 t.- t.1 t.ROOM-RECORD-BUFFER t.FETCH-NESTED-RESOURCE
t.ROOM-RECORD-BUFFER t.2+ t.DUP t.2+ t.C@ t.FETCH-RESOURCE t.0
t.DRAW-BASE-PICTURE t.1 t.DRAW-OBJECT-LIST t.;S
AT 59D6

( ROOM-VIEW-OBJECTS | NFA 59D6 CFA 59DC )
( Inferred descriptive name, not recovered original: )
( Indexes outer ROOM-OBJECT-STATE by room, skips its u16 )
( header, then indexes the selected view's u16-length )
( object list. )
( Stack: room view -- record )
AT 59D6
( Header: flags, saved name and link )
BYTES 830000C2AD59
DOCOL
t.SWAP t.ROOM-OBJECT-STATE t.LENGTH-RECORD-ADDR t.2+
t.LENGTH-RECORD-ADDR t.;S
AT 59EA

( DRAW-ROOM | NFA 59EA CFA 59F0 )
( Inferred descriptive name, not recovered original: Stores )
( CURRENT-ROOM, draws its static background, then draws the )
( mutable object list for base view0. )
( Stack: room -- )
AT 59EA
( Header: flags, saved name and link )
BYTES 830000CDD659
DOCOL
t.DUP t.CURRENT-ROOM t.! t.DUP t.DRAW-ROOM-BACKGROUND t.0
t.ROOM-VIEW-OBJECTS t.0 t.DRAW-OBJECT-LIST t.;S
AT 5A06

( EXPAND-THREE-BYTE-ROW | NFA 5A06 CFA 5A0C )
( Inferred descriptive name, not recovered original: Native )
( helper expands a three-byte template across a wider )
( destination row: first and last bytes are borders, middle )
( byte repeats. Returns RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5A06
( Header: flags, saved name and link )
BYTES 830000AAEA59
CELL 5A0E ( native entry point )
LDY.# 00             ( 5A0E )
LDA.INDY F2          ( 5A10 )
STA.INDY F0          ( 5A12 )
INY                  ( 5A14 )
INY                  ( 5A15 )
DEY                  ( 5A16 )
STY.ZP F6            ( 5A17 )
LDY.# 01             ( 5A19 )
LDA.INDY F2          ( 5A1B )
LDY.ZP F6            ( 5A1D )
STA.INDY F0          ( 5A1F )
INY                  ( 5A21 )
INY                  ( 5A22 )
CPY.ZP F7            ( 5A23 )
BNE 5A16             ( 5A25 )
DEY                  ( 5A27 )
STY.ZP F6            ( 5A28 )
LDY.# 02             ( 5A2A )
LDA.INDY F2          ( 5A2C )
LDY.ZP F6            ( 5A2E )
STA.INDY F0          ( 5A30 )
RTS                  ( 5A32 )
AT 5A33

( ADVANCE-EXPANDED-ROW | NFA 5A33 CFA 5A39 )
( Inferred descriptive name, not recovered original: Adds )
( destination width $F7 to $F0/$F1 through the RLE )
( source-pointer increment helper; native RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5A33
( Header: flags, saved name and link )
BYTES 830000D3065A
CELL 5A3B ( native entry point )
LDA.ZP F7            ( 5A3B )
JSR.ABS 3B69         ( 5A3D )
RTS                  ( 5A40 )
AT 5A41

( ADVANCE-ROW-TEMPLATE | NFA 5A41 CFA 5A47 )
( Inferred descriptive name, not recovered original: Adds )
( three to template pointer $F2/$F3; native RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5A41
( Header: flags, saved name and link )
BYTES 830000CC335A
CELL 5A49 ( native entry point )
LDA.# 03             ( 5A49 )
CLC                  ( 5A4B )
ADC.ZP F2            ( 5A4C )
STA.ZP F2            ( 5A4E )
BCC 5A54             ( 5A50 )
INC.ZP F3            ( 5A52 )
RTS                  ( 5A54 )
AT 5A55

( EXPAND-SIX-ROWS | NFA 5A55 CFA 5A5B )
( Inferred descriptive name, not recovered original: )
( Repeats the three-byte row expansion six times, )
( decrementing remaining height and advancing both )
( pointers; native RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5A55
( Header: flags, saved name and link )
BYTES 830000B6415A
CELL 5A5D ( native entry point )
LDX.# 06             ( 5A5D )
DEC.ZP F8            ( 5A5F )
JSR.ABS 5A0E         ( 5A61 )
JSR.ABS 5A49         ( 5A64 )
JSR.ABS 5A3B         ( 5A67 )
DEX                  ( 5A6A )
BNE 5A61             ( 5A6B )
RTS                  ( 5A6D )
AT 5A6E

( EXPAND-PICTURE-FRAME | NFA 5A6E CFA 5A74 )
( Inferred descriptive name, not recovered original: )
( Expands the first six template rows, repeats the middle )
( six-row strip, then adds a final strip; used to frame )
( zoom pictures. )
( Stack: -- )
AT 5A6E
( Header: flags, saved name and link )
BYTES 830000C7555A
CELL 5A76 ( native entry point )
STX.ZP D1            ( 5A76 )
JSR.ABS 5A5D         ( 5A78 )
JSR.ABS 3B43         ( 5A7B )
JSR.ABS 3B31         ( 5A7E )
JSR.ABS 5A5D         ( 5A81 )
LDA.# 00             ( 5A84 )
CMP.ZP F8            ( 5A86 )
BNE 5A7E             ( 5A88 )
JSR.ABS 5A5D         ( 5A8A )
LDX.ZP D1            ( 5A8D )
JMP.ABS 0F47         ( 5A8F )
AT 5A92

( PREPARE-ZOOM-FRAME | NFA 5A92 CFA 5A98 )
( Inferred descriptive name, not recovered original: )
( Fetches an object's four-byte geometry, enlarges it by )
( two columns and12 rows, clears/configures the zoom hit )
( map, then expands a repeated border around the scene )
( picture. )
( Stack: object -- )
AT 5A92
( Header: flags, saved name and link )
BYTES 830000C26E5A
DOCOL
t.SPLIT-OBJECT-ID t.NESTED-BANK-RECORD t.DROP
t.SCENE-PICTURE-BUFFER t.SWAP LIT16 0004 t.FETCH-BANK-RANGE
t.-1 t.SCENE-PICTURE-BUFFER t.+! LIT16 FFFA
t.SCENE-PICTURE-BUFFER t.1+ t.+! t.2 t.SCENE-PICTURE-BUFFER
t.2+ t.+! LIT16 000C t.SCENE-PICTURE-BUFFER t.3 t.+ t.+! t.1
t.HIT-MAP-SELECTOR t.! t.SCENE-PICTURE-BUFFER t.2+ t.HIT-MAP@
t.2 t.CMOVE t.HIT-MAP@ t.1+ t.DUP t.C@ LIT16 0006 t./ t.SWAP
t.C! t.HIT-MAP@ t.BYTE-PAIR@ t.* t.HIT-MAP@ t.2+ t.SWAP
t.ERASE t.2 t.FETCH-RESOURCE t.0 t.RESOURCE-ADDR LIT16 0004
t.+ t.GRAPHICS-DEST-PTR t.! t.SCENE-PICTURE-BUFFER LIT16 0004
t.+ t.GRAPHICS-SOURCE-PTR t.! t.HIT-MAP@ t.BYTE-PAIR@ t.1 t.-
t.RLE-SIZE! t.EXPAND-PICTURE-FRAME t.;S
AT 5B2A

( COMPOSE-OBJECT-LIST | NFA 5B2A CFA 5B30 )
( Inferred descriptive name, not recovered original: Walks )
( the byte list range; item-class IDs use dropped-item )
( composition and scene-class IDs use picture/mask )
( composition. )
( Stack: address end start -- )
AT 5B2A
( Header: flags, saved name and link )
BYTES 830000C2925A
DOCOL
t.(DO)
( label 5B34 )
t.DUP t.I t.+ t.C@ t.CLASSIFY-OBJECT t.-DUP
t.0BRANCH CELL 0012 ( -> 5B54 )
t.1 t.=
t.0BRANCH CELL 0008 ( -> 5B52 )
t.COMPOSE-DROPPED-ITEM
t.BRANCH CELL 0004 ( -> 5B54 )
( label 5B52 )
t.COMPOSE-PICTURE-AND-MASK
( label 5B54 )
t.(LOOP) CELL FFDE ( -> 5B34 )
t.DROP t.;S
AT 5B5C

( COMPOSE-VIEW | NFA 5B5C CFA 5B61 )
( Inferred descriptive name, not recovered original: Gets )
( the current room's view list, prepares its first object's )
( zoom frame, then composes every listed object into it. )
( Stack: view -- )
AT 5B5C
( Header: flags, saved name and link )
BYTES 8200C22A5B
DOCOL
t.CURRENT-ROOM t.@ t.SWAP t.ROOM-VIEW-OBJECTS t.DUP t.2+ t.C@
t.PREPARE-ZOOM-FRAME t.WORD-COUNT t.0 t.COMPOSE-OBJECT-LIST
t.;S
AT 5B7B

( RESTORE-SCENE-BACKGROUND | NFA 5B7B CFA 5B80 )
( Inferred descriptive name, not recovered original: Draws )
( the saved background picture at $0A00 through )
( DRAW-DECODED-PICTURE. The extra banked byte restore )
( present in Klatwa is absent. )
( Stack: -- )
AT 5B7B
( Header: flags, saved name and link )
BYTES 8200BC5C5B
DOCOL
t.SCENE-BACKUP-PICTURE t.DRAW-DECODED-PICTURE t.;S
AT 5B88

( PUSH-AND-DRAW-VIEW | NFA 5B88 CFA 5B8D )
( Inferred descriptive name, not recovered original: )
( Composes the view, saves the base background when )
( entering the first zoom, pushes its ID, draws its picture )
( and configures its cursor. )
( Stack: view -- )
AT 5B88
( Header: flags, saved name and link )
BYTES 8200DA7B5B
DOCOL
t.DUP t.COMPOSE-VIEW t.VIEW-STACK t.C@ t.0=_12DE
t.0BRANCH CELL 0004 ( -> 5B9F )
t.SAVE-SCENE-BACKGROUND
( label 5B9F )
t.PUSH-VIEW t.SCENE-PICTURE-BUFFER t.DRAW-DECODED-PICTURE
t.CONFIGURE-VIEW-CURSOR t.;S
AT 5BA9

( ENTER-VIEW | NFA 5BA9 CFA 5BB0 )
( Inferred descriptive name, not recovered original: Saves )
( current cursor position, invokes $5B8D and centers the )
( new view cursor. )
( Stack: view -- )
AT 5BA9
( Header: flags, saved name and link )
BYTES 84000000CC885B
DOCOL
t.SAVE-VIEW-CURSOR t.PUSH-AND-DRAW-VIEW t.CENTER-VIEW-CURSOR
t.;S
AT 5BBA

( REDRAW-CURRENT-VIEW | NFA 5BBA CFA 5BC1 )
( Inferred descriptive name, not recovered original: )
( Fetches top view ID through P, recomposes it and draws )
( the scene picture. )
( Stack: -- )
AT 5BBA
( Header: flags, saved name and link )
BYTES 84000000CCA95B
DOCOL
t.P t.COMPOSE-VIEW t.SCENE-PICTURE-BUFFER
t.DRAW-DECODED-PICTURE t.;S
AT 5BCD

( LEAVE-VIEW | NFA 5BCD CFA 5BD4 )
( Inferred descriptive name, not recovered original: )
( Pops/discards the current view; redraws the preceding )
( zoom or restores the base background, then )
( reconfigures/restores its cursor. )
( Stack: -- )
AT 5BCD
( Header: flags, saved name and link )
BYTES 84000000CCBA5B
DOCOL
t.POP-VIEW t.DROP t.VIEW-STACK t.C@
t.0BRANCH CELL 0008 ( -> 5BE8 )
t.REDRAW-CURRENT-VIEW
t.BRANCH CELL 000A ( -> 5BF0 )
( label 5BE8 )
t.RESTORE-SCENE-BACKGROUND t.0 t.HIT-MAP-SELECTOR t.!
( label 5BF0 )
t.CONFIGURE-VIEW-CURSOR t.RESTORE-VIEW-CURSOR t.;S
AT 5BF6

( ENTER-INVENTORY-VIEW | NFA 5BF6 CFA 5BFC )
( Inferred descriptive name, not recovered original: Saves )
( any active zoom background/cursor, pushes view1 and )
( composes its special room0/view1 object list before )
( drawing and configuring the cursor. )
( Stack: -- )
AT 5BF6
( Header: flags, saved name and link )
BYTES 830000DACD5B
DOCOL
t.VIEW-STACK t.C@
t.0BRANCH CELL 0004 ( -> 5C08 )
t.RESTORE-SCENE-BACKGROUND
( label 5C08 )
t.SAVE-VIEW-CURSOR t.1 t.PUSH-VIEW t.0 t.1 t.ROOM-VIEW-OBJECTS
t.DUP t.2+ t.C@ t.CLASSIFY-OBJECT
t.0BRANCH CELL 0004 ( -> 5C22 )
t.DECODE-ZOOM-PICTURE
( label 5C22 )
t.WORD-COUNT t.1 t.COMPOSE-OBJECT-LIST t.SAVE-SCENE-BACKGROUND
t.SCENE-PICTURE-BUFFER t.DRAW-DECODED-PICTURE
t.CENTER-VIEW-CURSOR t.CONFIGURE-VIEW-CURSOR t.;S
AT 5C34

( LEAVE-INVENTORY-VIEW | NFA 5C34 CFA 5C3A )
( Inferred descriptive name, not recovered original: Pops )
( inventory view, restores base background, then rebuilds )
( the preceding nested views and restores saved cursor )
( coordinates. )
( Stack: -- )
AT 5C34
( Header: flags, saved name and link )
BYTES 830000DAF65B
DOCOL
t.POP-VIEW t.DROP t.RESTORE-SCENE-BACKGROUND t.0
t.HIT-MAP-SELECTOR t.! t.CONFIGURE-VIEW-CURSOR t.VIEW-STACK
t.C@ t.-DUP
t.0BRANCH CELL 001E ( -> 5C70 )
t.2 t.=
t.0BRANCH CELL 000C ( -> 5C66 )
t.POP-VIEW t.PUSH-AND-DRAW-VIEW t.RESTORE-VIEW-CURSOR
t.BRANCH CELL 000C ( -> 5C70 )
( label 5C66 )
t.POP-VIEW t.POP-VIEW t.PUSH-AND-DRAW-VIEW
t.PUSH-AND-DRAW-VIEW t.RESTORE-VIEW-CURSOR
( label 5C70 )
t.CONFIGURE-VIEW-CURSOR t.RESTORE-VIEW-CURSOR t.;S
AT 5C76

( LOAD-ITEM-ART-ENABLED | NFA 5C76 CFA 5C7C )
( Inferred descriptive name, not recovered original: When )
( nonzero, $5C88 loads the following resource group into )
( ITEM-RESOURCE-BASE after the main banked group succeeds. )
( Stack: -- address )
AT 5C76
( Header: flags, saved name and link )
BYTES 830000C3345C
DOVAR
CELL 0001
AT 5C80

( LOAD-PART-RESOURCES | NFA 5C80 CFA 5C88 )
( Inferred descriptive name, not recovered original: Loads )
( up to120 sectors into logical bank offset0; if item-art )
( loading is enabled, also loads60 sectors of the next )
( group into item-art RAM. Retries on disk failure. )
( Stack: group -- )
AT 5C80
( Header: flags, saved name and link )
BYTES 8500000000CB765C
DOCOL
t.>R t.1 t.TRANSFER-IS-LOAD t.!
( label 5C92 )
t.1 t.BANKED-TRANSFER t.! t.0 LIT8 78 t.R t.TRY-GROUP-TRANSFER
t.DROP t.2DROP t.LAST-DISK-STATUS t.@ t.0=_12DE
t.LOAD-ITEM-ART-ENABLED t.@ t.*
t.0BRANCH CELL 0019 ( -> 5CCC )
t.0 t.BANKED-TRANSFER t.! t.0 t.ITEM-RESOURCE-ADDR LIT8 3C t.R
t.1+ t.TRY-GROUP-TRANSFER t.DROP t.2DROP
( label 5CCC )
t.LAST-DISK-STATUS t.@ t.0=_12DE
t.0BRANCH CELL FFBE ( -> 5C92 )
t.R> t.DROP t.;S
AT 5CDC

( NIC | NFA 5CDC CFA 5CE2 )
( Candidate name; structural sequence match, not an )
( independently verified semantic match. Corresponding )
( AD2044 CFA $7146 [NIC] in contiguous 3-definition )
( sequence matching header flags, name suffix, word kind )
( and body size. GAM FORTH 42_A_GrafDos.ATR CFA $A4BE, )
( identical body after known address relocation; surviving )
( name length and suffix match )
AT 5CDC
( Header: flags, saved name and link )
BYTES 830000C3805C
DOCOL
t.;S
AT 5CE6

( KEYBOARD-SELECTION | NFA 5CE6 CFA 5CEC )
( Inferred descriptive name, not recovered original: Input )
( wait stores the one-based key-list match here. A nonzero )
( value also ends the wait even if the trigger is not )
( pressed. )
( Stack: -- address )
AT 5CE6
( Header: flags, saved name and link )
BYTES 830000C1DC5C
DOVAR
CELL 0000
AT 5CF0

( KEYBOARD-SHORTCUTS-ENABLED | NFA 5CF0 CFA 5CF6 )
( Inferred descriptive name, not recovered original: )
( Multiplier applied to the raw key-list match in input )
( wait; zero suppresses keyboard selection. )
( Stack: -- address )
AT 5CF0
( Header: flags, saved name and link )
BYTES 830000C4E65C
DOVAR
CELL 0001
AT 5CFA

( BASE-VIEW-KEYS-ENABLED | NFA 5CFA CFA 5D00 )
( Inferred descriptive name, not recovered original: )
( Together with an empty view stack, gates whether input )
( wait interprets the shortcut key list; high-level modal )
( screens change this flag. )
( Stack: -- address )
AT 5CFA
( Header: flags, saved name and link )
BYTES 82004BA0F05C
DOVAR
CELL 0001
AT 5D04

( WAIT-TRIGGER-RELEASE | NFA 5D04 CFA 5D09 )
( Inferred descriptive name, not recovered original: )
( Repeatedly samples active-low controller0 trigger with )
( five-frame pauses until released. )
( Stack: -- )
AT 5D04
( Header: flags, saved name and link )
BYTES 8200C7FA5C
DOCOL
( label 5D0B )
t.0 t.JOYSTICK-TRIGGER LIT8 05 t.WAIT-FRAMES
t.0BRANCH CELL FFF5 ( -> 5D0B )
t.;S
AT 5D1A

( SHORTCUT-KEYCODES | NFA 5D1A CFA 5D20 )
( Inferred descriptive name, not recovered original: Three )
( bytes at body address $5D22 are raw CH keycodes21,05,28; )
( input wait searches them directly. The saved DOCOL field )
( is not executed. )
( Data body referenced by literal address; do not execute )
( its saved DOCOL entry. )
AT 5D1A
( Header: flags, saved name and link )
BYTES 830000CC045D
DOCOL
( Trailing code/data at 5D22; retained exactly )
BYTES 2105287712
AT 5D27

( WAIT-GAME-INPUT | NFA 5D27 CFA 5D2E )
( Inferred descriptive name, not recovered original: Clears )
( CH, initializes cursor players, waits for trigger )
( release, applies controller0 movements and shortcut keys )
( until trigger/key selection, then returns the grid x/y )
( bytes and disables players. )
( Stack: -- x y )
AT 5D27
( Header: flags, saved name and link )
BYTES 84000000DA1A5D
DOCOL
LIT8 FF LIT16 02FC t.C! t.INIT-CURSOR-PLAYERS
t.WAIT-TRIGGER-RELEASE t.1 t.CURSOR-AXIS t.! t.CURSOR-PIXEL
t.SET-CURSOR-PM-Y t.0 t.CURSOR-AXIS t.! t.CURSOR-PIXEL
t.SET-CURSOR-PM-X
( label 5D51 )
t.NIC t.0 LIT8 4D t.C! t.0 t.JOYSTICK-DELTA t.1 t.CURSOR-AXIS
t.! t.STEP-CURSOR t.0 t.CURSOR-AXIS t.! t.STEP-CURSOR
LIT16 02FC t.C@ LIT8 FF t.= t.0=_12DE
t.0BRANCH CELL 0033 ( -> 5DB0 )
t.VIEW-STACK t.C@ t.0=_12DE t.BASE-VIEW-KEYS-ENABLED t.@ t.*
t.0BRANCH CELL 001A ( -> 5DA7 )
LIT16 02FC t.C@ LIT16 5D22 t.3 t.FIND-BYTE-FIRST
t.KEYBOARD-SHORTCUTS-ENABLED t.@ t.* t.KEYBOARD-SELECTION t.!
( label 5DA7 )
LIT8 FF LIT16 02FC t.C!
( label 5DB0 )
t.0 t.JOYSTICK-TRIGGER t.0=_12DE t.KEYBOARD-SELECTION t.@ t.+
t.0BRANCH CELL FF93 ( -> 5D51 )
t.0 t.CURSOR-AXIS t.! t.CURSOR-GRID-POS t.C@ t.CURSOR-GRID-POS
t.1+ t.C@ t.DISABLE-PLAYERS t.;S
AT 5DD4

( DEFAULT-GAME-COLORS | NFA 5DD4 CFA 5DDA )
( Inferred descriptive name, not recovered original: )
( Initial color bytes copied into GAME-COLOR-TABLE by )
( $5E1A, with the seventh byte used for COLPF3 shadow. )
( Stack: -- address )
AT 5DD4
( Header: flags, saved name and link )
BYTES 830000B2275D
DOVAR
BYTES 34E8DC14182C2A5420
AT 5DE5

( INSTALL-GAME-COLORS | NFA 5DE5 CFA 5DEB )
( Inferred descriptive name, not recovered original: Points )
( the DLI at GAME-COLOR-TABLE, enables two display-list )
( interrupt bits, installs the handler and writes COLPF3 )
( shadow. )
( Stack: -- )
AT 5DE5
( Header: flags, saved name and link )
BYTES 830000C9D45D
DOCOL
t.GAME-COLOR-TABLE t.DLI-COLOR-POINTER t.! LIT16 A701
t.ENABLE-DLI-AT LIT16 A7E4 t.ENABLE-DLI-AT t.INSTALL-COLOR-DLI
t.GAME-COLOR-TABLE LIT16 0006 t.+ t.C@ LIT16 02C7 t.C! t.;S
AT 5E13

( RESET-GAME-COLORS | NFA 5E13 CFA 5E1A )
( Inferred descriptive name, not recovered original: Copies )
( seven default color bytes to the live table and installs )
( the game's color DLI. )
( Stack: -- )
AT 5E13
( Header: flags, saved name and link )
BYTES 84000000D0E55D
DOCOL
t.DEFAULT-GAME-COLORS t.GAME-COLOR-TABLE LIT16 0007 t.CMOVE
t.INSTALL-GAME-COLORS t.;S
AT 5E2A

( AUDIO-RESOURCE-ANCHOR | NFA 5E2A CFA 5E2F )
( Inferred descriptive name, not recovered original: )
( Constant $8CB9 is the anchor from which gameplay CMC )
( module location is calculated; $5FBB subtracts $076C to )
( select actual module address $854D. )
( Stack: -- address )
AT 5E2A
( Header: flags, saved name and link )
BYTES 8200CA135E
DOCON
CELL 8CB9
AT 5E33

( CMC-MODULE-ADDRESS | NFA 5E33 CFA 5E3A )
( Inferred descriptive name, not recovered original: Cell )
( supplied as X/Y to CMC command $70 by $5E81; stores the )
( module load address. )
( Stack: -- address )
AT 5E33
( Header: flags, saved name and link )
BYTES 84000000DA2A5E
DOVAR
CELL 0000
AT 5E3E

( SAVED-DMA-CONTROL | NFA 5E3E CFA 5E44 )
( Inferred descriptive name, not recovered original: )
( Receives the previous Atari SDMCTL $022F value before )
( display DMA is disabled. )
AT 5E3E
( Header: flags, saved name and link )
BYTES 830000C7335E
DOVAR
CELL 0000
AT 5E48

( DISPLAY-OFF | NFA 5E48 CFA 5E4E )
( Inferred descriptive name, not recovered original: Saves )
( SDMCTL $022F and writes zero to disable display DMA. )
AT 5E48
( Header: flags, saved name and link )
BYTES 830000C13E5E
DOCOL
LIT16 022F t.C@ t.SAVED-DMA-CONTROL t.! t.0 LIT16 022F t.C!
t.;S
AT 5E64

( RESTORE-DISPLAY | NFA 5E64 CFA 5E6A )
( Inferred descriptive name, not recovered original: )
( Restores the saved value of SDMCTL $022F. )
AT 5E64
( Header: flags, saved name and link )
BYTES 830000C9485E
DOCOL
t.SAVED-DMA-CONTROL t.@ LIT16 022F t.C! t.;S
AT 5E78

( INITIALIZE-AUDIO | NFA 5E78 CFA 5E81 )
( Inferred descriptive name, not recovered original: Native )
( routine passes the audio data address and initialization )
( selector to the embedded player entry $3003. )
AT 5E78
( Header: flags, saved name and link )
BYTES 860000000000DA645E
CELL 5E83 ( native entry point )
STX.ZP D1            ( 5E83 )
LDX.ABS 5E3C         ( 5E85 )
LDY.ABS 5E3D         ( 5E88 )
LDA.# 70             ( 5E8B )
JSR.ABS 3003         ( 5E8D )
LDX.# 00             ( 5E90 )
TXA                  ( 5E92 )
JSR.ABS 3003         ( 5E93 )
LDX.ZP D1            ( 5E96 )
JMP.ABS 0F47         ( 5E98 )
AT 5E9B

( CMC-SONG-NUMBER | NFA 5E9B CFA 5EA0 )
( Inferred descriptive name, not recovered original: Low )
( byte is supplied in X to CMC command0 by $5EAA; )
( PLAY-MUSIC stores its requested song here. )
( Stack: -- address )
AT 5E9B
( Header: flags, saved name and link )
BYTES 8200D3785E
DOVAR
CELL 0000
AT 5EA4

( START-CMC-SONG | NFA 5EA4 CFA 5EAA )
( Inferred descriptive name, not recovered original: )
( Preserves Forth X, invokes dispatcher $3003 with A=0 and )
( song number in X, restores X and returns NEXT. )
( Stack: -- )
AT 5EA4
( Header: flags, saved name and link )
BYTES 830000CE9B5E
CELL 5EAC ( native entry point )
STX.ZP D1            ( 5EAC )
LDX.ABS 5EA2         ( 5EAE )
LDA.# 00             ( 5EB1 )
JSR.ABS 3003         ( 5EB3 )
LDX.ZP D1            ( 5EB6 )
JMP.ABS 0F47         ( 5EB8 )
AT 5EBB

( SELECT-AUDIO-SEQUENCE | NFA 5EBB CFA 5EC2 )
( Inferred descriptive name, not recovered original: Stores )
( the requested audio sequence then invokes the embedded )
( player via the adjacent native helper. )
AT 5EBB
( Header: flags, saved name and link )
BYTES 84000000C7A45E
DOCOL
t.CMC-SONG-NUMBER t.! t.START-CMC-SONG t.;S
AT 5ECC

( STOP-AUDIO | NFA 5ECC CFA 5ED6 )
( Inferred descriptive name, not recovered original: Native )
( call to embedded player $3003 with selector $40; called )
( when the title is skipped. )
AT 5ECC
( Header: flags, saved name and link )
BYTES 87000000000000C7BB5E
CELL 5ED8 ( native entry point )
STX.ZP D1            ( 5ED8 )
LDA.# 40             ( 5EDA )
JSR.ABS 3003         ( 5EDC )
LDX.ZP D1            ( 5EDF )
JMP.ABS 0F47         ( 5EE1 )
AT 5EE4

( MUSIC-PAUSED | NFA 5EE4 CFA 5EEA )
( Inferred descriptive name, not recovered original: )
( Console-key music handler toggles this byte when )
( pausing/resuming CMC playback. )
( Stack: -- address )
AT 5EE4
( Header: flags, saved name and link )
BYTES 830000CDCC5E
DOVAR
CELL 0000
AT 5EEE

( UPDATE-CMC-MUSIC | NFA 5EEE CFA 5EF5 )
( Inferred descriptive name, not recovered original: )
( VBI-callable native routine checks CONSOL: value3 sends )
( stop command$40 and sets pause flag; value5 sends )
( resume$60 and clears it. Always calls player frame )
( routine$3006 before RTS. )
( Assembly subroutine entry; returns with RTS. )
AT 5EEE
( Header: flags, saved name and link )
BYTES 84000000DAE45E
CELL 5EF7 ( native entry point )
LDA.ABS 5EEC         ( 5EF7 )
BNE 5F0E             ( 5EFA )
LDA.ABS D01F         ( 5EFC )
CMP.# 03             ( 5EFF )
BNE 5F0B             ( 5F01 )
LDA.# 40             ( 5F03 )
JSR.ABS 3003         ( 5F05 )
INC.ABS 5EEC         ( 5F08 )
JMP.ABS 5F1D         ( 5F0B )
LDA.ABS D01F         ( 5F0E )
CMP.# 05             ( 5F11 )
BNE 5F1D             ( 5F13 )
LDA.# 60             ( 5F15 )
JSR.ABS 3003         ( 5F17 )
DEC.ABS 5EEC         ( 5F1A )
JSR.ABS 3006         ( 5F1D )
RTS                  ( 5F20 )
AT 5F21

( CMC-EFFECT-PARAMETERS | NFA 5F21 CFA 5F26 )
( Inferred descriptive name, not recovered original: Two )
( bytes passed as X/Y to CMC command$21 by $5F30. )
( Stack: -- address )
AT 5F21
( Header: flags, saved name and link )
BYTES 8200C9EE5E
DOVAR
CELL 0000
AT 5F2A

( PLAY-CMC-EFFECT | NFA 5F2A CFA 5F30 )
( Inferred descriptive name, not recovered original: )
( Preserves Forth X, calls CMC dispatcher with A=$21 and )
( parameter bytes X/Y from $5F26, then returns NEXT. )
( Stack: -- )
AT 5F2A
( Header: flags, saved name and link )
BYTES 830000DA215F
CELL 5F32 ( native entry point )
STX.ZP D1            ( 5F32 )
LDA.# 21             ( 5F34 )
LDX.ABS 5F28         ( 5F36 )
LDY.ABS 5F29         ( 5F39 )
JSR.ABS 3003         ( 5F3C )
LDX.ZP D1            ( 5F3F )
JMP.ABS 0F47         ( 5F41 )
AT 5F44

( CMC-EFFECT! | NFA 5F44 CFA 5F4A )
( Inferred descriptive name, not recovered original: Stores )
( the two bytes in CMC-EFFECT-PARAMETERS then invokes )
( PLAY-CMC-EFFECT. )
( Stack: x-parameter y-parameter -- )
AT 5F44
( Header: flags, saved name and link )
BYTES 830000AA2A5F
DOCOL
t.CMC-EFFECT-PARAMETERS t.1+ t.C! t.CMC-EFFECT-PARAMETERS t.C!
t.PLAY-CMC-EFFECT t.;S
AT 5F5A

( SOUND-EFFECT-TABLE | NFA 5F5A CFA 5F60 )
( Inferred descriptive name, not recovered original: Cell )
( array of paired CMC effect bytes. PLAY-SOUND-EFFECT at )
( $5F9C indexes an effect, reads its two parameters and )
( invokes CMC-EFFECT!. )
( Stack: index -- address )
AT 5F5A
( Header: flags, saved name and link )
BYTES 830000CF445F
DODOES
( DOES> thread at 51DC )
BYTES DC51202028073709C800370B280F202084045A076E05A012B4166407
BYTES AA0E28096902B906600599110C033C131E155A15445AD755
AT 5F96

( PLAY-SOUND-EFFECT | NFA 5F96 CFA 5F9C )
( Inferred descriptive name, not recovered original: When )
( MUSIC-PAUSED is nonzero, indexes SOUND-EFFECT-TABLE, )
( fetches its byte pair and calls CMC-EFFECT!; otherwise )
( discards the effect number. )
( Stack: effect -- )
AT 5F96
( Header: flags, saved name and link )
BYTES 830000D75A5F
DOCOL
t.MUSIC-PAUSED t.@
t.0BRANCH CELL 000C ( -> 5FB0 )
t.SOUND-EFFECT-TABLE t.BYTE-PAIR@ t.CMC-EFFECT!
t.BRANCH CELL 0004 ( -> 5FB2 )
( label 5FB0 )
t.DROP
( label 5FB2 )
t.;S
AT 5FB4

( SET-GAME-MUSIC-ADDRESS | NFA 5FB4 CFA 5FBB )
( Inferred descriptive name, not recovered original: )
( Subtracts $076C from AUDIO-RESOURCE-ANCHOR [$8CB9], )
( storing $854D as the CMC module address for gameplay. )
( Stack: -- )
AT 5FB4
( Header: flags, saved name and link )
BYTES 84000000A1965F
DOCOL
t.AUDIO-RESOURCE-ANCHOR LIT16 076C t.- t.CMC-MODULE-ADDRESS
t.! t.;S
AT 5FCB

( INITIALIZE-GAME-DISPLAY | NFA 5FCB CFA 5FD1 )
( Inferred descriptive name, not recovered original: )
( Disables the display, installs game display resources and )
( font at $BC00, initializes audio, then restores DMA. )
AT 5FCB
( Header: flags, saved name and link )
BYTES 830000CCB45F
DOCOL
t.1 LIT16 02F0 t.C! t.DISPLAY-OFF t.SET-GAME-MUSIC-ADDRESS
LIT8 0C t.CMC-MODULE-ADDRESS t.@ LIT16 0006 t.-
t.FETCH-RESOURCE-TO t.INITIALIZE-AUDIO t.0
t.SELECT-AUDIO-SEQUENCE t.INIT-GAME-SCREEN t.RESET-GAME-COLORS
LIT16 0007 LIT16 BC00 t.FETCH-RESOURCE-TO LIT16 00BC
LIT16 02F4 t.C! t.RESTORE-DISPLAY t.;S
AT 6010
