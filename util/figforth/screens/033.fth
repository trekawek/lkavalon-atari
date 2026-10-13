( EDITOR )

: N   FIND 0 M ;

: F   1 TEXT N ;

: B   PAD C@ MINUS M ;

: X   1 TEXT FIND PAD C@ DELETE
      0 M ;

: TILL   #LEAD + 1 TEXT 1LINE 0=
         0 ?ERROR #LEAD + SWAP -
         DELETE 0 M ;

-->
