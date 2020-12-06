        .include "include/uart_st16c550.inc"

;;;
;; Initialise DUART (ST16C550)
;;  Communication will be set to 115kBAUD, no parity, 8 bits, 1 stop bit.
;;  16 byte FIFO, transmit and receive interrupt are enabled.
;;
;;   Preparatory Ops: none
;;
;;   Returned Values:   a: used
;;                      x: used
;;                      y: used
;;;

;
;***********************************************************************
; UART I/O Support Routines
; We'll use Daryl's routine names for compatibility with his software/code
; Otherwise, we'll use UART-agnostic nomemclature

;---------------------------------------------------------------------
;
uart_init:  .proc

        lda     #$80            ; Line control register, Set DLAB=1
        sta     uart_lcrw
        lda     #$02            ; 115200 with 3.6864MHz;  OSC / (16 * Baudrate)
        sta     uart_dll        ; LSB of Divisor latch
        lda     #$00
        sta     uart_dlm        ; MSB Divisor latch
        lda     #$03            ; line control register, 8n1, dlab=0
        sta     uart_lcrw
        lda     #$02            ; modem control register
        sta     uart_mcrw       ; enable rts
        lda     #$87            ; fifo enable, reset rcvr/xmit fifo
        sta     uart_fcr
        lda     #$00            ; disable receiver interrupt
        sta     uart_ierw
        ; jsr     AFE_16C550      ; Enable auto flow control
        rts                     ; done
        .pend

;---------------------------------------------------------------------
; Input char from UART (blocking)
; Exit: character in A
ACIA1_Input
uart_input: .proc
        lda      uart_lsr           ; Serial port status
        and      #$01               ; is recvr full
        beq      uart_input        ; no char to get
        lda      uart_rhr           ; get chr
        rts                      ;
        .pend

;---------------------------------------------------------------------
; Non-waiting get character routine
; Scan for input (no wait), C=1 char, C=0 no character
ACIA1_Scan
uart_scan:  .proc
        clc
        lda   uart_lsr        ; Serial port status
        and   #$01               ; mask rcvr full bit
        beq   uart_scan2        ; branch if no character to get
        lda   uart_rhr           ; get chr
        sec
uart_scan2:
        rts
        .pend

;---------------------------------------------------------------------
; output to OutPut Port
; Entry: character in A
; Exit: character in A
ACIA1_Output
uart_output:    .proc
        pha                      ; save registers
uart_out1:
        lda   uart_lsr           ; serial port status
        and   #$20               ; is tx buffer empty
        beq   uart_out1         ; no
        pla                      ; get chr
        sta   uart_thr           ; put character to Port
        rts                      ; done
        .pend

;---------------------------------------------------------------------
; Enable autoflow control
AFE_16C550:     .proc
                lda     #$87                  ; Trigger level, FIFO enable, reset FIFO
                sta     uart_fcr
                ; Use this to enable autoflow control
                lda     #$22                  ; Modem control register
                sta     uart_mcrw    ; Enable AFE
                rts
                .pend
;

uart_irq:   .block
        bra done

done:
        jmp (via1_soft_vector)
        .bend
