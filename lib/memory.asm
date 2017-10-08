; memory.asm
; Memory Routines.

; Fills a range in memory with a specified byte value.
; a     byte value
; bc    byte count
; hl    destination address
MemWrite:
        push    bc
        inc     c
        inc     b
        jr      .start
.loop:
        ldi     [hl], a
.start:
        dec     c
        jr      nz, .loop
        dec     b
        jr      nz, .loop
        pop     bc
        ret

; Copies count bytes from source to destination.
; bc    byte count
; de    source address
; hl    destination address
MemCopy:
        push    af
        push    bc
        inc     c
        inc     b
        jr      .start
.loop:
        ld      a, [de]
        inc     de
        ldi     [hl], a
.start:
        dec     c
        jr      nz, .loop
        dec     b
        jr      nz, .loop
        pop     bc
        pop     af
        ret

; Copies bytes twice over. Esepcially useful for decompressing Monochrome GFX.
; bc    byte count
; de    source address
; hl    destination address
MemDupli:
        push    af
        push    bc
        inc     c
        inc     b
        jr      .start
.loop:
        ld      a, [de]
        inc     de
        ldi     [hl], a
        ldi     [hl], a
.start:
        dec     c
        jr      nz, .loop
        dec     b
        jr      nz, .loop
        pop     bc
        pop     af
        ret

