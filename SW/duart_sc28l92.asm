        .include "include/duart_sc28l92.inc"

;;;
;; Initialise DUART
;;  Communication will be set to 115kBAUD, no parity, 8 bits, 1 stop bit.
;;  16 byte FIFO, transmit and receive interrupt are enabled.
;;
;;   Preparatory Ops: none
;;
;;   Returned Values:   a: used
;;                      x: used
;;                      y: used
;;;
duart_init: .proc
        ldy #s_duart_tab
l1:
        ldx duart_sutab-2,y             ;table is page aligned so force a page break
        lda duart_sutab-2+1,y           ;to fix 65c02 absolute indexed addressing bug
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
        lda isr_duart           ;Get DUART interrupt status register
        beq done                ;If not DUART interrupting, skip ahead

receive_duart:
        lda #%00000010          ;Load interrupt mask for channel A RxD interrupt
        bit isr_duart           ;RHR empty?
        beq xmit_duart          ;Yes, skip ahead
        ldy rxfifoa_duart       ;Get data from RHR
        lda in_buffer_head      ;Get input buffer index
        ina                     ;next position
        and #$7f                ;Wrap pointer
        cmp in_buffer_tail      ;if tail == head
        beq duart_irq           ;then input buffer is full, so empty RHR (FIFO)

        ;; Room exists in buffer
        ldx in_buffer_tail      ;input buffer store index
        tya                     ;copy the data
        sta in_buffer,x         ;store data in input buffer
        txa                     ;copy input buffer store index
        ina                     ;next position
        and #$7f                ;wrap in
        sta in_buffer_tail      ;store position
        bra receive_duart

        ; lda rxfifoa_duart       ; Read datum
        ; ldy in_buffer_counter   ; Get current number of characters in input buffer
        ; bmi done                ; Branch if buffer is full
        ; ldy in_buffer_tail      ; Get pointer in input buffer
        ; sta in_buffer,y         ; Store character in input buffer
        ; inc in_buffer_tail      ; Increment tail pointer
        ; rmb 7,in_buffer_tail    ; Strip of bit 7. Buffer is only 128 bytes
        ; inc in_buffer_counter   ; Increment character count

xmit_duart:
        lda #%00000001          ;Test for TxD interrupt
        bit isr_duart           ;Transmitter interrupting?
        beq shutdown_channel    ;No data, turn off transmitter

        ; lda out_buffer_counter  ; Get output buffer counter
        ; beq done                ; Branch if there is nothing to transmit
        ; ldy out_buffer_head     ; Get pointer in output buffer
        ; lda out_buffer,y        ; Get character to transmit from output buffer
        ; sta txfifoa_duart       ; Send character
        ; inc out_buffer_head     ; Increment head pointer
        ; rmb 7,out_buffer_head   ; Strip off bit 7. Buffer is only 128 bytes
        ; dec out_buffer_counter  ; Decrement character count

shutdown_channel:
        lda #duart_cra_txd                  ;Command to disable transmitter A
        sta cra_duart                       ;Tell DUART to stop interrupting when FIFO is empty
        smb ch_a_transmitter, control_flags ;Tell foreground that transmitter is disabled.

        ;Stop the counter by first disable timout out mode
        ;and then stop the counter.
; stop_counter:
;         bit #%00001000          ;Test for C/T interrupt
;         lda #duart_cra_dto        ;Disable
;         sta cra_duart           ;time out mode
;         lda stopcc_duart        ;Stop counter command
;         smb delay_bit, control_flags
done:
        jmp (via1_soft_vector)
        .bend

;;;
;; DELAY
;; Time delay is given in µs
;;;
delay: .macro
        lda #>(3686400.0 / 2.0 / (1.0 / ( \1.0 / 1000000.0) ))
        sta ctpu_duart
        lda #<(3686400.0 / 2.0 / (1.0 / ( \1.0 / 1000000.0) ))
        sta ctpl_duart
        lda startcc_duart
wait:
        bbr delay_bit, control_flags, wait
        .endm
