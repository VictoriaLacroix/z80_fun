; vim: ft=asm
; hardware/timer.inc
; Constants and Addresses for interacting with the Gameboy Hardware Timer.

rDIV    EQU $FF04
rTIMA   EQU $FF05
rTMA    EQU $FF06
rTAC    EQU $FF07

TAC_STOP                EQU %00000000
TAC_START               EQU %00000100
TAC_CLOCK_4096          EQU $00
TAC_CLOCK_262144        EQU $01
TAC_CLOCK_65536         EQU $02
TAC_CLOCK_16384         EQU $03

