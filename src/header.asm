include "header.inc"

; RST handlers
; $0000: RST00
RST00:
        ret
        DS 7

; $0008: RST08
RST08:
        ret
        DS 7

; $0010: RST10
RST10:
        ret
        DS 7

; $0018: RST18
RST18:
        ret
        DS 7

; $0020: RST20
RST20:
        ret
        DS 7

; $0028: RST28
RST28:
        ret
        DS 7

; $0030: RST30
RST30:
        ret
        DS 7

; $0038: RST38
RST38:
        ret
        DS 7

; Interrupt Handlers
; $0040: VBlank Interrupt
INT40:
        jp draw
        DS 5

; $0048: Status Interrupt
INT48:
        jp stat
        DS 5

; $0050: Timer Interrupt
INT50:
        jp timer
        DS 5

; $0058: Serial Interrupt
INT58:
        jp serial
        DS 5

; $0060: Joypad Interrupt
INT50:
        jp joypad
        DS 5

; $0068 - $0099: Free Space
DS $98 ; Pad until $0100

; $0100: Start Routine. Execution begins here.
nop
jp main

; $0104 - $0133: The Nintendo Logo. Required to begin execution.
DB $CE, $ED, $66, $66, $CC, $0D, $00, $0B
DB $03, $73, $00, $83, $00, $0C, $00, $0D
DB $00, $08, $11, $1F, $88, $89, $00, $0E
DB $DC, $CC, $6E, $E6, $DD, $DD, $D9, $99
DB $BB, $BB, $67, $63, $6E, $0E, $EC, $CC
DB $DD, $DC, $99, $9F, $BB, $B9, $33, $3E

; $0134 - $013E: Game Title. Must be padded if less than 11 bytes.
DB "Gameboy Test"
DS 0 ; no padding necessary

; $013F - $0142: Manufacturer code.
DS 4

; $0143: GBC Compatibility
DB GBC_EXCLUSIVE

; $0144 - $0145: Licensee Code
DS 2

; $0146: SGB Compatibility
DB SGB_SUPPORTED

; $0147: Cart Type
DB ROM_RAM_BATT

; $0148: Cart ROM Size / Amount of Banks
DB CART_ROMBANKS_2 ; 2 * 4K = 8K

; $0149: Cart RAM Size
DB CART_RAM_NONE

; $014A: Destination Region
DB DEST_INTL

; $014B: Old Licensee Code
DB LICENSE_USE_NEW

; $014C: ROM Version Number
DB $00

; $014D: Header Checksum. Handled by the Linker.
DB $00

; $014E - $014F: Full ROM checksum. Handled by the Linker.
DW $0000

