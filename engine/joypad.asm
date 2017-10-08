; engine/joypad.asm
; Some engine Joypad routines.

INCLUDE "engine/joypad.inc"

; Verifies whether the specified inputs are down.
; a     the buttons to check
; nz    is set to true if the given buttons are down.
CheckJoypadDown:
        push    bc
        ld      b,      a
        ld      a,      [JoypadCurrentState]
        and     b
        ld      a,      b       ; Reset "A" to the passed value.
        pop     bc
        ret

; Verifies whether the specified inputs have been pressed in this frame.
; NOTE: This procedure is inexact. It WILL return false positives if checking
; for more than one button. Exercise caution.
; a     the buttons to check against
; nz    is set to true if the given buttons have been pressed
CheckJoypadPressed:
        call    CheckJoypadDown
        jz      .end
        push    bc
        ld      b,      a
        ld      a,      [JoypadPreviousState]
        and     b               ; Mask the previous state.
        xor     b               ; Becomes 0 if the button is being held.
        ld      a,      b       ; Reset "A" to the passed value.
        pop     bc
.end:
        ret

