; audio/wave.asm
; Tables for the rWAVTAB register, and a procedure to load them.

WAV_LEN EQU 16

; Loads a new hardware Wavetable.
; de    source address
WaveLoad:
        ld      bc, WAV_LEN
        ld      hl, [rWAVTAB]
        call    MemCopy
        ret

; 50% Pulse Wave
Wave50:
        DB $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
        DB $00, $00, $00, $00, $00, $00, $00, $00

; 32% Pulse Wave
Wave32:
        DB $FF, $FF, $FF, $FF, $FF, $FF, $00, $00
        DB $00, $00, $00, $00, $00, $00, $00, $00

; 25% Pulse Wave
Wave25:
        DB $FF, $FF, $FF, $FF, $00, $00, $00, $00
        DB $00, $00, $00, $00, $00, $00, $00, $00

; 12% Pulse Wave
Wave12:
        DB $FF, $FF, $00, $00, $00, $00, $00, $00
        DB $00, $00, $00, $00, $00, $00, $00, $00

; Sawtooth Wave
WaveSaw:
        DB $88, $99, $AA, $BB, $CC, $DD, $EE, $FF
        DB $00, $11, $22, $33, $44, $55, $66, $77

; Triangle Wave
WaveTri:
        DB $89, $AB, $CD, $EF, $FE, $DC, $BA, $98
        DB $76, $54, $32, $10, $01, $23, $45, $67

; Sine Wave
WaveSine:
        DB $9A, $CD, $EE, $FF, $FF, $EE, $DC, $A9
        DB $65, $32, $11, $00, $00, $11, $23, $56

; White Noise Wave
WaveWhite:
        DB $F7, $5D, $82, $52, $78, $F6, $ED, $63
        DB $9F, $95, $ED, $75, $C8, $84, $4B, $94

