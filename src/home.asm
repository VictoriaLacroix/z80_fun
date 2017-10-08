; $0150: Execution immediately jumps to here.
Start:
.init:
        ei
; Load Font
        ld      hl, GbVram + $0100
        ld      de, Font1BPP
        ld      bc, $0300
        call    MemDecomp
; Load Palette
        ld      a, 0
        ld      hl, BGPDefault
        call    LoadBGP
        ld      a, 0
        ld      hl, OBPDefault
        call    LoadOBP
; Enable LCD
        ld      a, LCDC_ON | LCDC_BG_ON
        ld      [rLCDC], a
.loop:
        call    WaitVBlank
        nop
        jr      .loop

WaitVBlank:
.loop:
        halt
        ld      a, [rIF]
        and     IF_VBLANK
        jr      z, .loop
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

INCLUDE "lib/memory.asm"

INCLUDE "gfx/color.asm"

Font1BPP:
INCBIN  "gfx/font.bin"

