; main.asm
; The game's ROM map. Assembly begins here.

; Include macros immediately to make them globally available.
INCLUDE "macros.inc"

SECTION "Home", ROM0

INCLUDE "lib/header.asm"
INCLUDE "game.asm"

SECTION "Video RAM", VRAM

GbVram:
GbVramTile:
        DS $1800
GbVramMap0:
        DS $400
GbVramMap1:
        DS $400

SECTION "Variables", WRAM0

INCLUDE "engine/variables.asm"

SECTION "Battery", SRAM

SECTION "Hi RAM", HRAM

; $FF80. The DMA Update routine is copied here after startup.
DmaUpdate:
        DS $0A ; Subroutine length.

