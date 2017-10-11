; vim: ft=asm
; macros.inc
; Macros.

IS_INPUT_DOWN:  MACRO
                ld      a, [JoypadCurrentState]
                and     \1
                ENDM

; Select a WRAM sprite to load to.
; arg1  OAM index 0-39
SPRITE_SEL:     MACRO
                ld      hl, DmaOam + ((\1) * 4)
                ENDM

; Turn on the LCD.
LCD_TURN_ON:    MACRO
                ld      a, [rLCDC]
                or      LCDC_ON
                ld      [rLCDC], a
                ENDM

; Turn off the LCD.
LCD_TURN_OFF:   MACRO
                ld      a, [rLCDC]
                and     -LCDC_ON
                ld      [rLCDC], a
                ENDM

; Declare a color.
; arg1  red   0-31
; arg2  green 0-31
; arg3  blue  0-31
RGB:    MACRO
        DW ((\3) << 10) + ((\2) << 5) + ((\1))
        ENDM

; Multiply the accumulator by 4.
; a     multiplicand
MUL_4:  MACRO
        sla     a
        sla     a
        ENDM

; Multiply the accumulator by 8.
; a     multiplicand
MUL_8:  MACRO
        swap    a
        rrca
        ENDM

