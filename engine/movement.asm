; engine/movement.asm
; Routines to control a character with the gamepad.

; Loads a delta into bc based on the current joypad state.
; When "Up" and "Down" are pressed, "Down" takes precedence here.
; When "Left" and "Right" are pressed, "Right" takes precedence here.
GetJoypadMovementDelta:
        push    af
        ld      bc, $0000
.up:
        IS_INPUT_DOWN ENGINE_PAD_UP
        jr      z, .down
        dec     b
.down:
        IS_INPUT_DOWN ENGINE_PAD_DOWN
        jr      z, .left
        inc     b
.left:
        IS_INPUT_DOWN ENGINE_PAD_LEFT
        jr      z, .right
        dec     c
.right:
        IS_INPUT_DOWN ENGINE_PAD_RIGHT
        jr      z, .end
        inc     c
.end:
        pop     af
        ret

; Scrolls the hardward camera of the DMG.
; bc    y/x delta to scroll the camera by
ScrollCamera:
        push    af
        ld      a, b
        ld      [rSCY], a
        ld      a, c
        ld      [rSCX], a
        pop     af
        ret

