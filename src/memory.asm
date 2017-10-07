; memory.asm
; Memory Routines.

; Fills a range in memory with a specified byte value.
; hl    destination address
; bc    byte count
; a     byte value
MemSet:
        inc     c
        inc     b
        jr      .start
.loop:
        ldi     [hl],   a
.start:
        dec     c
        jr      .loop,  nz
        dec     b
        jr      .loop,  nz
        ret

; Copies count bytes from source to destination.
; de    source address
; hl    destination address
; bc    byte count
MemCp1:
        inc     c
        inc     b
        jr      .start
.loop:
        ld      a,      [de]
        inc     de
        ldi     [hl],   a
.start:
        dec     c
        jr      .loop,  nz
        dec     b
        jr      .loop,  nz
        ret

; Copies bytes twice over. Esepcially useful for decompressing Monochrome GFX.
; de    source address
; hl    destination address
; bc    byte count
MemCp2:
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
        jr      .loop,  nz
        dec     b
        jr      .loop,  nz
        ret

