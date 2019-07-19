    * = $8000

    .include "include/via.inc"

nmi:
irq:
;;;
;; coldstart - initialises all hardware
;; power up and reset procedure.
;;;
coldstart: .block
        sei                     ;Turn off interrupts
        ;cld                     ;Make sure MPU is in binary mode, not needed for CMOS 65c02
;         ldx  #0
; l1:
;         stz  0,x                ;zero ZP
;         dex
;         bne  l1
        ldx #$ff
        txs                     ;Initialise stack register
l2:
        jsr via_init          ;No VIA on Pluto v2 (well, right now 24/08/2018 one is connected to the expansion bus)

;;;
;; test code
;; Test code for setting PA and PB off, on, off endlessly
;;;
        lda #$ff
        sta via1ddra        ; set all PA pins to be outputs
        sta via1ddrb        ; set all PB ping to be outputs
loop:
        stz via1ra
        stz via1rb
        jsr delay
        dec via1ra
        dec via1rb
        jsr delay
        bra loop
.endblock

delay: .proc
        lda #$20
loop1:
        jsr one_sec_delay
        dea
        bne loop1
        rts
        .pend

one_sec_delay: .proc
        ldx #$ff
loop1:
        ldy #$ff
loop2:
        dey
        bne loop2
        dex
        bne loop1
        rts
        .pend

    * = $fffa
    .word   nmi         ;NMI
    .word   coldstart   ;RESET
    .word   irq         ;IRQ
