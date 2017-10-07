; vim: ft=asm
; joypad.inc
; Constants and Addresses for interacting with Gameboy Joypad Hardware.

GbJoyCtrl                       EQU     $FF00

GB_JOY_SELECT_DIRECTIONS        EQU     %00100000
GB_JOY_SELECT_BUTTONS           EQU     %00010000

; These bits are 0 when the appropriate button is pressed.
GB_JOY_MASK_ALL         EQU     %00001111
GB_JOY_MASK_DOWN        EQU     %00001000
GB_JOY_MASK_UP          EQU     %00000100
GB_JOY_MASK_LEFT        EQU     %00000010
GB_JOY_MASK_RIGHT       EQU     %00000001
GB_JOY_MASK_START       EQU     %00001000
GB_JOY_MASK_SELECT      EQU     %00000100
GB_JOY_MASK_B           EQU     %00000010
GB_JOY_MASK_A           EQU     %00000001

GB_JOY_BIT_DOWN         EQU     3
GB_JOY_BIT_UP           EQU     2
GB_JOY_BIT_LEFT         EQU     1
GB_JOY_BIT_RIGHT        EQU     0
GB_JOY_BIT_START        EQU     3
GB_JOY_BIT_SELECT       EQU     2
GB_JOY_BIT_B            EQU     1
GB_JOY_BIT_A            EQU     0

