; vim: ft=asm
; hardware/joypad.inc
; Constants and Addresses for interacting with Gameboy Joypad Hardware.

rPAD    EQU $FF00

PAD_DIRECTIONS  EQU %00100000
PAD_BUTTIONS    EQU %00010000

; These bits are 0 when the appropriate button is pressed.
PAD_ALL         EQU %00001111
PAD_DOWN        EQU %00001000
PAD_UP          EQU %00000100
PAD_LEFT        EQU %00000010
PAD_RIGHT       EQU %00000001
PAD_START       EQU %00001000
PAD_SELECT      EQU %00000100
PAD_B           EQU %00000010
PAD_A           EQU %00000001

