; gfx/sprite.asm
; Routines for manipulating sprites on the LCD.

; Select a sprite to load to: Macro Version
; arg1  OAM index 0-39
SPRITE_SEL:     MACRO
                ld      hl, (GbOam + (\1) * 4)
                ENDM

; Write to a pre-selected sprite.
; b     y coordinate
; c     x coordinate
; d     tile
; e     attributes
SpriteWrite:
        push    af
        ld      a, b
        ldi     [hl], a
        ld      a, c
        ldi     [hl], a
        ld      a, d
        ldi     [hl], a
        ld      a, e
        ldi     [hl], a
        pop     af
        ret

; Move a pre-selected sprite.
; b     y delta
; c     x delta
SpriteMove:
        push    af
        ld      a, [hl]
        add     b
        ldi     [hl], a
        ld      a, [hl]
        add     c
        ldi     [hl], a
        pop     af
        ret

