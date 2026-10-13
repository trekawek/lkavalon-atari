( EDITOR )

: M   R# +! CR SPACE #LEAD TYPE
      17 EMIT #LAG TYPE #LOCATE
      . DROP ;
: T   DUP C/L * R# ! DUP H 0 M ;
: L   SCR @ LIST 0 M ;
: R   PAD 1+ SWAP -MOVE ;
: P   1 TEXT R ;
: I   DUP S R ;
: TOP   0 R# ! ;


  -->


