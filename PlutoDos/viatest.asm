        * = $8000
        .cpu "w65c02"

start:
        lda #$ff
        tax
        txs
        sta $7fc2
        sta $7fc3

loop:
        lda #$aa
        sta $7fc0
        sta $7fc1
        bra loop

        * = $fffa
        .word   start         ;NMI
        .word   start   ;RESET
        .word   start         ;IRQ
