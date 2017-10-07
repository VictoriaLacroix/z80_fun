; vim: ft=asm
; hardware/interrupts.inc
; Constants and Addresses for dealing with Gameboy Hardware Interrupts.

; Interrupts.
GbInterruptFlag         EQU $FF0F
GbInterrputEnabled      EQU $FFFF

GB_INTERRUPT_VBLANK     EQU %00000001
GB_INTERRUPT_STAT       EQU %00000010
GB_INTERRUPT_TIMER      EQU %00000100
GB_INTERRUPT_SERIAL     EQU %00000100   ; Nintendo, why?
GB_INTERRUPT_JOYPAD     EQU %00001000

