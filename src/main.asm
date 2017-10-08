SECTION "Main", ROM0

INCLUDE "misc/macros.inc"

INCLUDE "hardware/hardware.inc"
INCLUDE "header.asm"

; $0150: Execution immediately jumps to here.
Main:
.init:
; Load Font
        ei      ; Permanently enable interrupts.
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
        ld     [rLCDC], a
.loop:
        call    WaitVBlank
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
        reti

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

INCLUDE "gfx/palettes.asm"

Font1BPP:
INCBIN  "gfx/font.bin"

