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
        lda isr_duart   ;Load interrupt status register
        and imr_duart   ;Check if DUART made an interrupt
        beq done        ;

; BIT	#%00000100	;Test for RHR having a character
; BNE	UART_RCV	;If yes, put the character in the buffer
; BIT	#%00000001	;Test for THR ready to receive a character
; BNE	UART_XMT	;If yes, get character from buffer
; BIT	#%00010000	;Test for Counter ready (RTC)
; BNE	UART_RTC	;If yes, go increment RTC variables
        bit #%00000010      ;Test for RxA interrupt
        bne rcva_duart      ;Yes, put character in buffer
        bit #%00000001      ;Test for TxD interrupt
        bne xmta_duart      ;Yes, get character from buffer
        bit #%00001000      ;Test for C/T interrupt
        bne stop_counter    ;Yes, stop the counter, the delay is done
rcva_duart:
xmta_duart:

        ;Stop the counter by first disable timout out mode
        ;and then stop the counter.
stop_counter:
        lda #duart_crtmd        ;Disable
        sta cra_duart           ;time out mode
        lda stopcc_duart        ;Stop counter command
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
