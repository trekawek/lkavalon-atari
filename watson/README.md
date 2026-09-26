# Watson

The [LK Avalon Other 1 archive](http://sources.pigwa.net/files/programy/lk_avalon_other_1.zip) contains two Watson source revisions. The original ZIP is preserved in `archive/`.

`src/WATSON2.ASM` was decoded from the packed `Backup 02 ASM ASM A/WATSON.ASM` source using `util/decode-jbw.py`. `src/AUX2.ASM` and `src/WGEM.ASM` came from the archive's plain ATASCII sources; their packed Backup 02 versions decode to the same text. Together they form the `watson.xex` build. The earlier `src/WATSON.ASM`, `src/NEW.ASM`, `src/DEC.ASM`, and `src/NEW2.ASM` form the `watson-5.xex` build. The converted UTF-8 files include MADS syntax repairs.

Run `make` to assemble both revisions. `make test` checks that they assemble with MADS; the recorded build used MADS 2.1.7. Each XEX ends with a RUNAD vector pointing to the source's startup stub at `$0480`. Both versions were checked to reach their disk monitor screens in Atari800 4.2.0. **The archive has no matching Watson executable or disk image**, so these generated XEX files cannot yet be verified byte for byte against an original. Disk operations and the original loader details have not been verified. A matching original is needed to complete byte-identical verification.
