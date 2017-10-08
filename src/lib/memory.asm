; memory.asm
; Memory Routines.

; Fills a range in memory with a specified byte value.
; hl    destination address
; bc    byte count
; a     byte value
MemWrite:
        inc     c
        inc     b
        jr      .start
.loop:
        ldi     [hl],   a
.start:
        dec     c
        jr      nz,     .loop
        dec     b
        jr      nz,     .loop
        ret

; Copies count bytes from source to destination.
; de    source address
; hl    destination address
; bc    byte count
MemCopy:
        inc     c
        inc     b
        jr      .start
.loop:
        ld      a,      [de]
        inc     de
        ldi     [hl],   a
.start:
        dec     c
        jr      nz,     .loop
        dec     b
        jr      nz,     .loop
        ret

; Copies bytes twice over. Esepcially useful for decompressing Monochrome GFX.
; de    source address
; hl    destination address
; bc    byte count
MemDecomp:
        inc     c
        inc     b
        jr      .start
.loop:
        ld      a,      [de]
        inc     de
        ldi     [hl],   a
        ldi     [hl],   a
.start:
        dec     c
        jr      nz,     .loop
        dec     b
        jr      nz,     .loop
        ret

