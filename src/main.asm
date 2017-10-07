SECTION "Main", ROM0

INCLUDE "hardware/hardware.inc"
INCLUDE "header.asm"

; $0150: Execution immediately jumps to here.
Main:
.loop:
        call    WaitVBlank
        jr      .loop

WaitVBlank:
.loop:
        halt
        ld      a,      [GbInterruptFlag]
        and     GB_INTERRUPT_VBLANK
        jr      z,      .loop
        ret

; VBlank Handler
Draw:
        jp      Render
        nop

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

