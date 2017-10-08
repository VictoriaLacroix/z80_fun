; vim: ft=asm
; hardware/joypad.inc
; Constants and Addresses for interacting with Gameboy Joypad Hardware.

rJOY    EQU $FF00

JOY_DIRECTIONS  EQU %00100000
JOY_BUTTIONS    EQU %00010000

; These bits are 0 when the appropriate button is pressed.
JOY_ALL         EQU %00001111
JOY_DOWN        EQU %00001000
JOY_UP          EQU %00000100
JOY_LEFT        EQU %00000010
JOY_RIGHT       EQU %00000001
JOY_START       EQU %00001000
JOY_SELECT      EQU %00000100
JOY_B           EQU %00000010
JOY_A           EQU %00000001

