stack = $500
stack_hi = $501
stack_lo = $500

    dex
    dex
    stz stack_hi,x
    lda #6
    sta stack_lo,x

    jsr star        ; includes inx inx

    dex
    dex
    lda #>array
    sta stack_hi,x
    lda #<array
    sta stack_lo,x
    
    jsr plus        ; includes inx inx

;;;;;;;;;;;;;;;;;;;;;;;
;;;;; if ZP is used as data stack
;;;;; this will be one instruction
;;;;; lda (0,x) ; add stack ptr (.X) to stack base
;;;;;           ; and fetch the data from that address

    lda #stack_lo
    sta ptr_lo
    lda #stack_hi
    sta ptr_hi
    txa
    clc
    adc ptr_lo
    sta ptr_lo
    adc ptr_hi
    sta ptr_hi

;;;;;;;;;;;;;;;;;;;;;;;;
    lda (ptr)

    sta stack_lo,x
    stz stack_hi,x

