SECTION "MAIN", ROM0

INCLUDE "header.asm"
INCLUDE "hardware/hardware.inc"

; $0150: Execution immediately jumps to here.
Main:   halt
        nop
        ld      a,      FLAG_VBLANK
        or      a
        jrz     Main

; VBlank Handler
Draw:   jp      Render
        nop

; Status Handler
Status:
; Timer Handler
Timer:
; Serial Handler
Serial:
; Joypad Handler
Joypad: reti

