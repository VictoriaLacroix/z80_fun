; palettes.asm
; Game Palettes, and helper Macros

; Convenience Macro to define a 15-bit color with given RGB values.
; e.g:  RGB X, Y, Z
; where 0 <= X, Y, Z <= 31

LoadBGP:
        push bc
        ld      b, a
        MUL_8
        or      GBCP_INDEX_INCREMENT
        ld      [rBCPS], a
REPT    8
        ldi     a, [hl]
        ld      [rBCPD], a
ENDR
        ld      a, b
        pop bc
        ret

LoadOBP:
        MUL_8
        or      GBCP_INDEX_INCREMENT
        ld      [rOCPS], a
REPT    8
        ldi     a, [hl]
        ld      [rOCPD], a
ENDR
        ret


BGPDefault:
        RGB     31, 31, 31
        RGB     23, 23, 23
        RGB     15, 15, 15
        RGB     00, 00, 00

OBPDefault:
        RGB     23, 23, 23
        RGB     31, 31, 31
        RGB     15, 15, 15
        RGB     00, 00, 00

