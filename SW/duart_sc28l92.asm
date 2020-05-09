        .include "include/duart_sc28l92.inc"

        ; .align $100,$00                     ; page align code to force a page break when accessing
                                            ; the setup table. Necessary workaround for WDC 65C02
                                            ; indexed absolute addressing mode.
;;;
;; Initialise DUART (SC28L92)
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
;         ldy #s_duart_tab-2
; l1:
;         lda #<(duart_base)              ; Store the
;         sta index_low                   ; base address to
;         lda #>(duart_base)              ; DUART in
;         sta index_high                  ; index_low/index_high
;         ldx duart_sutab,y               ; Load .X with the register to initialse.
;         clc                             ; Prepare for addition.
;         txa                             ; Move register number to .A.
;         adc index_low                   ; Add register number to base address
;         sta index_low                   ; and store the result in index_low.
;         lda #0                          ; Add any
;         adc index_high                  ; carry that might have been
;         sta index_high                  ; produced from the above addition.
;         lda duart_sutab+1,y             ; Load .A with SC28L92 register value
;         sta (index_low)                 ; Set register
;         nop                             ; Some NOPs to give DUART enough time to update its registers.
;         nop
;         nop
;         nop
;         nop
;         dey                             ;Decrement table pointer to
;         dey                             ;to next register and data for that register.
;         bpl l1                          ;Loop back if we still got registers to initialse.
        lda #0
        sta imr_duart
        jsr some_nops
        lda #duart_cra_dpd      ; %11110000
        sta cra_duart
        jsr some_nops
        lda #duart_cra_rsd      ; %10010000
        sta cra_duart
        jsr some_nops
        lda #duart_cra_rxr      ; %00100000
        sta cra_duart
        jsr some_nops
        lda #duart_cra_txr      ; %00110000
        sta cra_duart
        jsr some_nops
        lda #duart_cra_abr      ; %01010000
        sta cra_duart
        jsr some_nops
        lda #duart_cra_esr      ; %01000000
        sta cra_duart
        jsr some_nops
        lda #duart_cra_dto      ; %11000000
        sta cra_duart
        jsr some_nops
        lda #duart_crb_rsd      ; %10010000
        sta crb_duart
        jsr some_nops
        lda #duart_crb_rxr      ; %00100000
        sta crb_duart
        jsr some_nops
        lda #duart_crb_txr      ; %00110000
        sta crb_duart
        jsr some_nops
        lda #duart_crb_abr      ; %01010000
        sta crb_duart
        jsr some_nops
        lda #duart_crb_esr      ; %01000000
        sta crb_duart
        jsr some_nops
        lda #duart_crb_dto      ; %11000000
        sta crb_duart
        jsr some_nops
        lda #duart_opdef        ; %00000000
        sta opcr_duart
        jsr some_nops
        lda #duart_arbrt        ; %00110000
        sta acr_duart
        jsr some_nops
        lda #duart_cra_mr0      ; %10110000
        sta cra_duart
        jsr some_nops
        lda #duart_m0def        ; %11001100
        sta mra_duart
        jsr some_nops
        lda #duart_cra_mr1      ; %10100000
        sta cra_duart
        jsr some_nops
        lda #duart_m1def        ; %11010011
        sta mra_duart
        jsr some_nops
        lda #duart_m2def        ; %00010111
        sta mra_duart
        jsr some_nops
        lda #duart_csrdef       ; %01100110
        sta csra_duart
        jsr some_nops
        lda #duart_cra_rte      ; %00000101
        sta cra_duart
        jsr some_nops
        lda #duart_cra_rsa      ; %10000000
        sta cra_duart
        jsr some_nops
        lda #duart_crb_mr0      ; %10110000
        sta crb_duart
        jsr some_nops
        lda #duart_m0def        ; %11001100
        sta mrb_duart
        jsr some_nops
        lda #duart_crb_mr1      ; %00010000
        sta crb_duart
        jsr some_nops
        lda #duart_m1def        ; %11010011
        sta mrb_duart
        jsr some_nops
        lda #duart_m2def        ; %00010111
        sta mrb_duart
        jsr some_nops
        lda #duart_csrdef       ; %01100110
        sta csrb_duart
        jsr some_nops
        lda #duart_crb_txe      ; %00000100
        sta crb_duart
        jsr some_nops
        lda #duart_ctdlo        ; %00000000
        sta ctl_duart
        jsr some_nops
        lda #duart_ctdhi        ; %01001000
        sta ctu_duart
        jsr some_nops

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
        bra done ;;;;;;;;;;;;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;
        ;;;;;;;;; remove when duart works
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

some_nops:  .proc
        nop
        nop
        nop
        nop
        nop
        rts
        .pend
