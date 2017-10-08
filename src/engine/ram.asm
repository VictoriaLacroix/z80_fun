; engine/ram.asm
; Engine specific memory allocation.

INCLUDE "engine/joypad.inc"

JoypadCurrentState:     DS 1    ; Current Joypad state.
JoypadPreviousState:    DS 1    ; Previous Joypad state.

