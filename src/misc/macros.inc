; vim: ft=asm
; macros.inc
; Macros! Macros! Macros!
; Apparently, macros can be imported despite what the RGBDS documentation says.
; Thanks, Rednex.

RGB:    MACRO
        DW ((\3) << 10) + ((\2) << 5) + ((\1))
        ENDM

INC_BC: MACRO
        inc     c
        jr      nz,     .end\@
        inc     b
.end\@: ENDM

DEC_BC: MACRO
        dec     c
        jr      nz,     .end\@
        dec     b
.end\@: ENDM

INC_DE: MACRO
        inc     e
        jr      nz,     .end\@
        inc     d
.end\@: ENDM

DEC_DE: MACRO
        dec     e
        jr      nz,     .end\@
        dec     d
.end\@: ENDM

