; palettes.asm
; Game Palettes, and helper Macros

; Convenience Macro to define a 15-bit color with given RGB values.
; e.g:  RGB X, Y, Z
; where 0 <= X, Y, Z <= 31

LoadBGP:
        swap    a
        rrca
        or      GBCP_INDEX_INCREMENT
        ld      [rBCPS], a
        REPT    8
                ldi     a, [hl]
                ld      [rBCPD], a
        ENDR
        ret

LoadOBP:
        swap    a
        rrca
        or      GBCP_INDEX_INCREMENT
        ld      [rOCPS], a
        REPT    8
                ldi     a, [hl]
                ld      [rOCPD], a
        ENDR
        ret


BGPDefault:
        RGB     00, 00, 00
        RGB     15, 15, 15
        RGB     23, 23, 23
        RGB     31, 31, 31

OBPDefault:
        RGB     23, 23, 23
        RGB     00, 00, 00
        RGB     15, 15, 15
        RGB     31, 31, 31

