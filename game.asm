; game.asm
; Game code begins here.

Start:
.init:
        ld      sp, $CFFF
        ld      a, %00000001
        ld      [rIE], a
        ei
; Load Font
        ld      hl, GbVram + $0200
        ld      de, Font1BPP
        ld      bc, ($0600 / 2)
        call    MemDupli
; Load Sprites
        ld      hl, GbVram + $10
        ld      de, Sprites
        ld      bc, $50
        call    MemCopy
; Load Palettes
        ld      a, 0
        ld      hl, BGPDefault
        call    LoadBGP
        ld      a, 0
        ld      hl, OBPDefault
        call    LoadOBP
; Create a Sprite
        SPRITE_SEL 0
        ld      bc, $1010
        ld      de, $0100
        call    SpriteWrite
; Enable BG and Sprite Layers
        ld      a, LCDC_ON | LCDC_OBJ_ON | LCDC_BG_ON
        ld      [rLCDC], a
        call    DmaSetup
.loop:
        call    WaitVBlank
        call    DmaUpdate
        jr      .loop

WaitVBlank:
.loop:
        halt
        ret

; VBlank Handler
Draw:
; Status Handler
Status:
; Timer Handler
Timer:
; Serial Handler
Serial:
; Joypad Handler
Joypad:
        reti

; Library code
INCLUDE "lib/math.asm"
INCLUDE "lib/memory.asm"
INCLUDE "gfx/color.asm"
INCLUDE "gfx/sprite.asm"

; Data
Font1BPP:
INCBIN  "gfx/font.bin"
Sprites:
INCBIN  "gfx/sprites.bin", $10, $50 ; only include what I've entered

