; vim: ft=asm
; hardware/interrupts.inc
; Constants and Addresses for dealing with Gameboy Hardware Interrupts.

; Interrupts.
rIF     EQU $FF0F
rIE     EQU $FFFF

IF_VBLANK       EQU %00000001
IF_STAT         EQU %00000010
IF_TIMER        EQU %00000100
IF_SERIAL       EQU %00001000
IF_JOYPAD       EQU %00010000

