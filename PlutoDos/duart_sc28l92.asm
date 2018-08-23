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
        beq done        ;No, next interrupt service routine
        bit #%00000010          ;Test for RxD interrupt
        bne rcva_duart          ;Yes, put character in buffer
        bit #%00000001          ;Test for TxD interrupt
        bne xmta_duart          ;Yes, get character from buffer
        bit #%00001000          ;Test for C/T interrupt
        bne stop_counter        ;Yes, stop the counter, the delay is done

rcva_duart:
        lda rxfifoa_duart       ; Read datum
        ldy in_buffer_counter   ; Get current number of characters in input buffer
        bmi done                ; Branch if buffer is full
        ldy in_buffer_tail      ; Get pointer in input buffer
        sta in_buffer,y         ; Store character in input buffer
        inc in_buffer_tail      ; Increment tail pointer
        rmb 7,in_buffer_tail    ; Strip of bit 7. Buffer is only 128 bytes
        inc in_buffer_counter   ; Increment character count

xmta_duart:
        lda out_buffer_counter  ; Get output buffer counter
        beq done                ; Branch if there is nothing to transmit
        ldy out_buffer_head     ; Get pointer in output buffer
        lda out_buffer,y        ; Get character to transmit from output buffer
        sta txfifoa_duart       ; Send character
        inc out_buffer_head     ; Increment head pointer
        rmb 7,out_buffer_head   ; Strip off bit 7. Buffer is only 128 bytes
        dec out_buffer_counter  ; Decrement character count

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
