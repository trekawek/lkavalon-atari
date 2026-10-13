( FLOATING POINT )

: <F    FR1 F! FR0 F! ;
: F>  FR0 F@ ;
: FS  FR0 F! ;

: F+   <F FADD F> ;
: F-   <F FSUB F> ;
: F*   <F FMUL F> ;
: F/   <F FDIV F> ;
: FLOAT   FR0 ! IFP F> ;
: FIX   FS FPI FR0 @ ;
: FLOG   FS FLG F> ;
: FLOG10 FS FLG10 F> ;
: FEXP  FS FEX F> ;
: FEXP10 FS FEX10 F> ;  -->
