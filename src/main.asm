SECTION "MAIN", ROM0

include "header.asm"

; $0150: Execution immediately jumps to here.
Main::
.loop:
        halt
        jr .loop

Draw:
Status:
Timer:
Serial:
Joypad:
        reti

