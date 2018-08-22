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
;;   two fixed 128 byte buffers (right now just channel A). It is also responsible
;;   for handling the counter. It will stop the counter if it has triggered an
;;   interrupt and sets a delay flag to indicate the counter has reached zero.
;;   The block is part of the ISR (interrupt service routine) so no registers are preserved here.
;;   They have already been pushed to the stack by the main ISR.
;;
;;   Returned Values: none
;;
;;;
duart_irq: .block
        lda duart_isr
        and duart_imr
        beq done

        ;Stop the counter by first disable timout out mode
        ;and then stop the counter.
        lda #duart_crtmd        ;Disable
        sta duart_cra           ;time out mode
        lda stop_cc             ;Stop counter command
done:
        jmp irq_end
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
