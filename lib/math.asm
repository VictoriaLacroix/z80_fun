; vim: ft=asm
; lib/math.inc
; Maths macros and procedures.

MUL_4:  MACRO
        sla     a
        sla     a
        ENDM

MUL_8:  MACRO
        swap    a
        rrca
        ENDM

