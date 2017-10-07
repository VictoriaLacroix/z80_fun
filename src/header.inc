; vim: ft=asm
; header.inc
; Contains many header-related constants.

GBC_UNSUPPORTED         EQU     %00000000
GBC_SUPPORTED           EQU     %10000000
GBC_EXCLUSIVE           EQU     %11000000

SGB_UNSUPPORTED         EQU     %00000000
SGB_SUPPORTED           EQU     %00000011

CART_ROM_ONLY           EQU     $00
CART_MBC1               EQU     $01
CART_MBC1_RAM           EQU     $02
CART_MBC1_RAM_BATT      EQU     $03
CART_MBC2               EQU     $05
CART_MBC2_BATT          EQU     $06
CART_ROM_RAM            EQU     $08
CART_ROM_RAM_BATT       EQU     $09
CART_MMM01              EQU     $0B
CART_MMM01_RAM          EQU     $0C
CART_MMM01_RAM_BATT     EQU     $0D
CART_MBC3_TIMR_BATT     EQU     $0F
CART_MBC3_TIMR_RAM_BATT EQU     $10
CART_MBC3               EQU     $11
CART_MBC3_RAM           EQU     $12
CART_MBC3_RAM_BATT      EQU     $13
CART_MBC4               EQU     $15
CART_MBC4_RAM           EQU     $16
CART_MBC4_RAM_BATT      EQU     $17
CART_MBC5               EQU     $19
CART_MBC5_RAM           EQU     $1A
CART_MBC5_RAM_BATT      EQU     $1B
CART_MBC5_RMBL          EQU     $1C
CART_MBC5_RMBL_RAM      EQU     $1D
CART_MBC5_RMBL_RAM_BATT EQU     $1E
CART_POCKET_CAM         EQU     $FC
CART_BANDAI_TAMA5       EQU     $FD
CART_HUC3               EQU     $FE
CART_HUC1_RAM_BATT      EQU     $FF

CART_ROMBANKS_2         EQU     $00
CART_ROMBANKS_4         EQU     $01
CART_ROMBANKS_6         EQU     $02
CART_ROMBANKS_8         EQU     $03
CART_ROMBANKS_10        EQU     $04
CART_ROMBANKS_12        EQU     $05
CART_ROMBANKS_14        EQU     $06
CART_ROMBANKS_16        EQU     $07
CART_ROMBANKS_18        EQU     $52
CART_ROMBANKS_20        EQU     $53
CART_ROMBANKS_22        EQU     $54

CART_RAM_NONE           EQU     $00
CART_RAM_8K             EQU     $01
CART_RAM_16K            EQU     $02
CART_RAM_32K            EQU     $03

DEST_JAPAN              EQU     $00
DEST_INTL               EQU     $01

LICENSE_USE_NEW         EQU     $33

