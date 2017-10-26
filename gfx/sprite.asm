; gfx/sprite.asm
; Routines for manipulating sprites on the LCD.

; Write to a pre-selected sprite.
; b     y coordinate
; c     x coordinate
; d     tile
; e     attributes
; hl    destination sprite
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

; Read the data for a pre-selected sprite.
; hl    source sprite
SpriteRead:
        push    af
        ldi     a, [hl]
        ld      b, a
        ldi     a, [hl]
        ld      c, a
        ldi     a, [hl]
        ld      d, a
        ldi     a, [hl]
        ld      e, a
        pop     af
        ret

; Read the coordinates of a pre-selected sprite.
; hl    source sprite
SpriteReadYX:
        push    af
        ldi     a, [hl]
        ld      b, a
        ldi     a, [hl]
        ld      c, a
        pop     af
        ret

; Move a pre-selected sprite.
; b     y delta
; c     x delta
; hl    destination sprite
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

; Invokes a DMA transfer. This is copied into HiRAM at boot.
DmaSource:
        ld      a, $C0
        ld      [rDMA], a
        ; Wait 160us
        ld      a, 40
.loop:
        dec     a
        jr      nz, .loop
        ret

; Copies the code from DMASource into HiRAM. Invoked at boot.
DmaSetup:
        ld      b, $0A
        ld      c, $80
        ld      hl, DmaSource
.loop:
        ldi     a, [hl]
        ld      [c], a
        inc     c
        dec     b
        jr      nz, .loop
        ret

