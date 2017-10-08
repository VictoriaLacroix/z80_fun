; main.asm
; The game's ROM map. Assembly begins here.

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

; INCLUDE "engine/variables.asm"

SECTION "Sprites", OAM

GbOam:
REPT 40
        DS 1 ; X Coord
        DS 1 ; Y Coord
        DS 1 ; Tile
        DS 1 ; Attribute
ENDR

