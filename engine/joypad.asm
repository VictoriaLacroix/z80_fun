; engine/joypad.asm
; Some engine Joypad routines.

INCLUDE "engine/joypad.inc"

; Verifies whether the specified inputs are down.
; a     the buttons to check
; nz    is set to true if the given buttons are down.
CheckJoypadDown:
        push    bc
        ld      b, a
        ld      a, [JoypadCurrentState]
        and     b
        ld      a, b ; Reset "A" to the passed value.
        pop     bc
        ret

; Verifies whether the specified inputs have been pressed in this frame.
; NOTE: This procedure is inexact. It WILL return false positives if checking
; for more than one button. Exercise caution.
; a     the buttons to check against
; nz    is set to true if the given buttons have been pressed
CheckJoypadPressed:
        call    CheckJoypadDown
        jr      z, .end
        push    bc
        ld      b, a
        ld      a, [JoypadPreviousState]
        and     b    ; Mask the previous state.
        xor     b    ; Becomes 0 if the button is being held.
        ld      a, b ; Reset "A" to the passed value.
        pop     bc
.end:
        ret

; Copies the current joypad state into the previous gamepad state.
JoypadNextFrame:
        push    af
        ld      a, [JoypadCurrentState]
        ld      [JoypadPreviousState], a
        pop     af
        ret

; Copies the hardware joypad state into the current gamepad state.
JoypadReadHardware:
        push    af
        push    bc
        ld      a, PAD_DIRECTIONS
        ld      [rPAD], a
        ld      a, [rPAD]
        and     PAD_ALL
        swap    a
        ld      b, a
        ld      a, PAD_BUTTONS
        ld      [rPAD], a
        ld      a, [rPAD]
        and     PAD_ALL
        or      b
        ld      [JoypadCurrentState], a
        pop     bc
        pop     af
        ret

