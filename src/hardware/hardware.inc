; vim: ft=asm
; hardware.inc
; Contains various definitions for interaction with the Gameboy Hardware.

; Ram Areas

GbVram          EQU     $8000
GbRamTlie       EQU     $8000
GbRamMap1       EQU     $9800
GbRamMap2       EQU     $9C00
GbRamObj        EQU     $FE00
GbRamWave       EQU     $FF30

include "joypad.inc"
include "timer.inc"
include "interrupts.inc"
include "lcd.inc"
include "audio.inc"

