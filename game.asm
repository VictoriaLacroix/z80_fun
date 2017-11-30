; game.asm
; Game code begins here.

Start:
.init:
; Point Stack to top of WRAM
        ld      sp, $CFFF
; Enable VBL interrupts
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
        ld      bc, $1810 ; (8,8)
        ld      de, $0100 ; (1st tile), no attrs
        call    SpriteWrite
; Enable BG and Sprite Layers
        ld      a, LCDC_ON | LCDC_OBJ_ON | LCDC_BG_ON
        ld      [rLCDC], a
; Setup DMA handler
        call    DmaSetup
.loop:
; Game Logic
        SPRITE_SEL 0
        call    GetJoypadMovementDelta
        call    SpriteMove
        call    ScrollCamera
; Game Rendering
        call    WaitVBlank
        call    DmaUpdate
        call    JoypadNextFrame
        call    JoypadReadHardware
        jr      .loop

; Waits for a VBlank interrupt.
WaitVBlank:
.loop:
        halt
        ld      a, [rIF]
        and     IF_VBLANK
        jr      nz, .loop
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
INCLUDE "engine/joypad.asm"
INCLUDE "engine/movement.asm"
INCLUDE "gfx/color.asm"
INCLUDE "gfx/sprite.asm"

; Data
Font1BPP:
INCBIN  "data/font.bin"
Sprites:
INCBIN  "data/sprites.chr", $10, $50 ; don't include the blank bit.

