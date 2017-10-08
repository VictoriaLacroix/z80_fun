; vim: ft=asm
; macros.inc
; Macros! Macros! Macros!
; Apparently, macros can be imported despite what the RGBDS documentation says.
; Thanks, Rednex.

RGB:    MACRO
        DW ((\3) << 10) + ((\2) << 5) + ((\1))
        ENDM

MUL_8:  MACRO
        swap a
        rrca
        ENDM

