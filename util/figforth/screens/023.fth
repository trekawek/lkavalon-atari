( STACK PRINTER )

HEX

: DEPTH SP@ 12 +ORIGIN @ SWAP - 2 / ;
: S.  ( PRINTS THE STACK )
   DEPTH -DUP IF
      0 DO  CR  ." TOP+" I .
      SP@ I 2 * + @ U. LOOP
   ELSE ." Stack Empty" THEN CR ;



BASE !

-->
