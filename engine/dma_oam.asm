; engine/dmaoam.asm
; Source RAM for OAM copy during DMA.

; 40 OAM frames, 4 bytes each.
DmaOam:
REPT 40
        DS 1 ; Y coord
        DS 1 ; X coord
        DS 1 ; Tile
        DS 1 ; Attribute
ENDR

