; engine/movement.asm
; Routines to control a character with the gamepad.

; Moves SPRITE_0 based on joypad inputs.
ControlSprite:
        push    af
        ld      bc, $0000
.up:
        IS_INPUT_DOWN ENGINE_PAD_UP
        jr      z, .down
        inc     b
.down:
        IS_INPUT_DOWN ENGINE_PAD_DOWN
        jr      z, .left
        dec     b
.left:
        IS_INPUT_DOWN ENGINE_PAD_LEFT
        jr      z, .right
        inc     c
.right:
        IS_INPUT_DOWN ENGINE_PAD_RIGHT
        jr      z, .end
        dec     c
.end:
        pop     af
        ret

