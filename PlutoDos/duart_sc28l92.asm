        .include "include/duart_sc28l92.inc"

;;;
;; Initialise DUART
;;  Communication will be set to 115kBAUD, no parity, 8 bits, 1 stop bit.
;;  16 byte FIFO, transmit and receive interrupt are enabled.
;;
;;   Preparatory Ops: none
;;
;;   Returned Values: a: destroyed
;;;
duart_init: .proc
        ldy #s_duart_tab - 2
l1:
        ldx duart_sutab,y
        lda duart_sutab+1,y
        sta duart_base,x
        nop
        nop
        nop
        nop
        nop
        bpl l1
        rts
        .pend


;;;
;;  duart_irq: DUART ISR
;;   This block is responsible for receving and transmitting characters using
;;   two fixed 128 byte buffers.
;;   The block is part of the ISR (interrupt service routine) so no registers are preserved here.
;;   They have already been pushed to the stack by the main ISR.
;;
;;   Returned Values: none
;;
;;;
duart_irq: .block
        rts
        .bend

;;;
;; DELAY
;; Time delay is given in µs
;;;
delay: .macro
delay_counter:
        .word 3686400.0 / 2.0 / (1.0 / ( \1.0 / 1000000.0) )
        lda #>delay_counter
        sta duart_ctpu
        lda #<delay_counter
        sta duart_ctpl
        ; start counter in SC28L92
        ; wait for
        .endm
