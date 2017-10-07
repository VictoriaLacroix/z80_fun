; vim: ft=asm
; timer.inc
; Constants and Addresses for interacting with the Gameboy Hardware Timer.

GbTimerDivider  EQU     $FF04
GbTimerCounter  EQU     $FF05
GbTimerModulo   EQU     $FF06
GbTimerCtrl     EQU     $FF07

GB_TIMER_CTRL_STOP              EQU     %00000000
GB_TIMER_CTRL_START             EQU     %00000100
GB_TIMER_CTRL_CLOCK_4096        EQU     $00
GB_TIMER_CTRL_CLOCK_262144      EQU     $01
GB_TIMER_CTRL_CLOCK_65536       EQU     $02
GB_TIMER_CTRL_CLOCK_16384       EQU     $03

