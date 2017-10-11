; engine/ram.asm
; Work RAM allocations.

; Data to be copied into OAM at DMA.
INCLUDE "engine/dma_oam.asm"

JoypadPreviousState:    DS 1    ; Previous Joypad state.
JoypadCurrentState:     DS 1    ; Current Joypad state.

