( Put common emitters above aliases for faster lookup. )
: B, B, ;
: W, W, ;
: #8 #8 ;
: #16 #16 ;
: T-AT T-AT ;
: BYTES BYTES ;
( Prefix operands bypass dictionary searches for numeric data. )
: CELL H# W, ;
: LIT16 H# #16 ;
: LIT8 H# #8 ;
: AT H# T-AT ;
