;
;----------------------------------------------------------------
;DUART registers, masks and constants
        duart_base = $7fe0


;DUART SC28L92 internal registers

        ;Read operation registers
        duart_mra       = %0000    ;Mode Register A (MR0A, MR1A, MR2A)
        duart_sra       = %0001    ;Status Register A (SRA)
        duart_rxfifoa   = %0011    ;Rx Holding Register A (RxFIFOA)
        duart_ipcr      = %0100    ;Input Port Change Register (IPCR)
        duart_isr       = %0101    ;Interrupt Status Register (ISR)
        duart_ctu       = %0110    ;Counter/Timer Upper (CTU)
        duart_ctl       = %0111    ;Counter/Timer Lower (CTL)
        duart_mrb       = %1000    ;Mode Register B (MR0B, MR1B, MR2B)
        duart_srb       = %1001    ;Status Register B (SRB)
        duart_rxfifob   = %1011    ;Rx Holding Register B (RxFIFOB)
        duart_ipr       = %1101    ;Input Port Register (IPR)
        duart_startcc   = %1110    ;start counter command
        duart_stopcc    = %1111    ;stop counter command

        ;Write operation registers
        duart_mra_w     = %0000    ;Mode Register A (MR0A, MR1A, MR2A)
        duart_csra      = %0001    ;Clock Select Register A (CSRA)
        duart_cra       = %0010    ;Command Register A (CRA)
        duart_txfifoa   = %0011    ;Tx Holding Register A (TxFIFOA)
        duart_acr       = %0100    ;Auxiliary Control Register (ACR)
        duart_imr       = %0101    ;Interrupt Mask Register (IMR)
        duart_ctpu      = %0110    ;C/T Upper Preset Register (CTPU)
        duart_ctpl      = %0111    ;C/T Lower Preset Register (CTPL)
        duart_mrb_w     = %1000    ;Mode Register B (MR0B, MR1B, MR2B)
        duart_csrb      = %1001    ;Clock Select Register B (CSRB)
        duart_crb       = %1010    ;Command Register B (CRB)
        duart_txfifob   = %1011    ;Tx Holding Register B (TxFIFOB)
        duart_opcr      = %1101    ;Output Port Configuration Register (OPCR)
        duart_sopr      = %1110    ;Set Output Port Bits Command (SOPR)
        duart_ropr      = %1111    ;Reset output Port Bits Command (ROPR)

;
;
;DUART read absolute register addresses
;
        mra_duart       = duart_base + duart_mra        ;Mode Register A (MR0A, MR1A, MR2A)
        sra_duart       = duart_base + duart_sra        ;Status Register A (SRA)
        rxfifoa_duart   = duart_base + duart_rxfifoa    ;Rx Holding Register A (RxFIFOA)
        ipcr_duart      = duart_base + duart_ipcr       ;Input Port Change Register (IPCR)
        isr_duart       = duart_base + duart_isr        ;Interrupt Status Register (ISR)
        ctu_duart       = duart_base + duart_ctu        ;Counter/Timer Upper (CTU)
        ctl_duart       = duart_base + duart_ctl        ;Counter/Timer Lower (CTL)
        mrb_duart       = duart_base + duart_mrb        ;Mode Register B (MR0B, MR1B, MR2B)
        srb_duart       = duart_base + duart_srb        ;Status Register B (SRB)
        rxfifob_duart   = duart_base + duart_rxfifob    ;Rx Holding Register B (RxFIFOB)
        ipr_duart       = duart_base + duart_ipr        ;Input Port Register (IPR)
        startcc_duart   = duart_base + duart_startcc    ;Start counter command
        stopcc_duart    = duart_base + duart_stopcc     ;Stop counter command

;
;
;DUART write absolute register addresses
;
        csra_duart      = duart_base + duart_csra       ;Clock Select Register A (CSRA)
        cra_duart       = duart_base + duart_cra        ;Command Register A (CRA)
        txfifoa_duart   = duart_base + duart_txfifoa    ;Tx Holding Register A (TxFIFOA)
        acr_duart       = duart_base + duart_acr        ;Auxiliary Control Register (ACR)
        imr_duart       = duart_base + duart_imr        ;Interrupt Mask Register (IMR)
        ctpu_duart      = duart_base + duart_ctpu       ;C/T Upper Preset Register (CTPU)
        ctpl_duart      = duart_base + duart_ctpl       ;C/T Lower Preset Register (CTPL)
        mrb_w_duart     = duart_base + duart_mrb_w      ;Mode Register B (MR0B, MR1B, MR2B)
        csrb_duart      = duart_base + duart_csrb       ;Clock Select Register B (CSRB)
        crb_duart       = duart_base + duart_crb        ;Command Register B (CRB)
        txfifob_duart   = duart_base + duart_txfifob    ;Tx Holding Register B (TxFIFOB)
        opcr_duart      = duart_base + duart_opcr       ;Output Port Configuration Register (OPCR)
        sopr_duart      = duart_base + duart_sopr       ;Set Output Port Bits Command (SOPR)
        ropr_duart      = duart_base + duart_ropr       ;Reset output Port Bits Command (ROPR)


        nxx1freq = 3686400              ;X1 clock frequency in Hz
        nxctscal = nxx1freq/2           ;C/T scaled clock
;
;
;   ACR — auxiliary control register
;
        duart_arbrt = %00110000            ;set mode to crystal or external clock (X1/CLK) divided by 16
;
;   a) Use baud rate table #5 —— see data sheet.
;   b) C/T acts as a counter.
;   c) C/T clock source is scaled to X1 ÷ 16.
;

;;;
;;   CRA — channel A command register commands
;;;
        ; CRA[3:0]
        duart_cra_rxe = %00000001            ;enable receiver
        duart_cra_rxd = %00000010            ;disable receiver
        duart_cra_txe = %00000100            ;enable transmitter
        duart_cra_txd = %00001000            ;disable transmitter

        ; CRA[7:4]
        duart_cra_mr1 = %00010000           ;select MR1 (p35)
        duart_cra_rxr = %00100000           ;reset receiver as after HW reset
        duart_cra_txr = %00110000           ;reset transmitter as after HW reset
        duart_cra_esr = %01000000           ;reset error status (SRA[7:4])
        duart_cra_abr = %01010000           ;reset channel A break change interrupt (ISR[2] = 0)
        duart_cra_stb = %01100000           ;start break. Forces TxDA to LOW. (p36)
        duart_cra_spb = %01110000           ;stop break
        duart_cra_rsa = %10000000           ;assert request to send (RTSN)
        duart_cra_rsd = %10010000           ;deassert request to send (RTSN)
        duart_cra_eto = %10100000           ;enable time-out mode of C/T.
        duart_cra_mr0 = %10110000           ;select MR0
        duart_cra_dto = %11000000           ;disable time-out mode
        duart_cra_nop = %11010000           ;NOT USED
        duart_cra_epd = %11100000           ;power down mode. Stop oscillator thus suspending all functions depending on it.
        duart_cra_dpd = %11110000           ;disable power down mode. Restarts the oscillator.

;;;
;;   CRB — channel B command register commands
;;         Definitions are identical with CRA with the exception of $E and $F. Power down commands are not used
;;         in channel B.
;;;
        ; CRB[3:0]
        duart_crb_rxe = duart_cra_rxe            ;enable receiver
        duart_crb_rxd = duart_cra_rxd            ;disable receiver
        duart_crb_txe = duart_cra_txe            ;enable transmitter
        duart_crb_txd = duart_cra_txd            ;disable transmitter

        ; CRB[7:4]
        duart_crb_mr1 = duart_cra_mr1
        duart_crb_rxr = duart_cra_rxr
        duart_crb_txr = duart_cra_txr
        duart_crb_esr = duart_cra_esr
        duart_crb_abr = duart_cra_abr
        duart_crb_stb = duart_cra_stb
        duart_crb_spb = duart_cra_spb
        duart_crb_rsa = duart_cra_rsa
        duart_crb_rsd = duart_cra_rsd
        duart_crb_eto = duart_cra_eto
        duart_crb_mr0 = duart_cra_mr0
        duart_crb_dto = duart_cra_dto
        duart_crb_nop = duart_cra_nop

;
;
;   ACR[7] = 0 and MR0[2] = 1 (Extended mode II), see table 35 (p. 33) in datasheet.
;   CSR — clock select register...
;
        duart_csrdef = %01100110             ;RxD & TxD at 115.2 baud...
;
;
;   CT — counter/timer...
;   These definitions are here only for reference if a jiffy timer
;   running at 100 Hz is enabled.
        hz = 100
        duart_ctdef = nxctscal/hz            ;HZ underflows per second
        duart_ctdlo = <duart_ctdef           ;underflows/sec LSB
        duart_ctdhi = >duart_ctdef           ;underflows/sec MSB
;
;
;   MR0 — mode 0 register...
;
        duart_m0def =%11001100
;
;   11001100
;   ||||||||
;   |||||+++———> Baud rate extended mode II
;   ||||+——————> 16 bytes FIFO
;   ||++———————> TxD interrupts only when FIFO is empty
;   |+—————————> RxD interrupts only when FIFO is full (see also MR1[6])
;   +——————————> enable RxD watchdog timer
;
;   IMR = Interrupt Mask Register
;
        duart_irqmask =%00000011
;
;   00001011
;   ||||||||
;   |||||||+———> TxA interrupt enabled
;   ||||||+————> RxA interrupt enabled
;   |||||+—————> Channel A change in break disabled
;   ||||+——————> Counter ready disabled
;   |||+———————> TxB interrupt disabled
;   ||+————————> RxB interrupt disabled
;   |+—————————> Channel B change in break disabled
;   +——————————> Input port change disabled
;
;
;   MR1 — mode 1 register...

        duart_m1def =%11010011
;
;   11010011
;   ||||||||
;   ||||||++———> 8 bit char size
;   |||||+—————> parity type (ignored)
;   |||++——————> no parity generated or checked
;   ||+————————> character error mode
;   |+—————————> RxD interrupts only when FIFO is full (see also MR0:6)
;   +——————————> RxD controls RTS
;
;   MR2 — mode 2 register...
;

        duart_m2def =%00010111            ;normal mode, auto RTS
;   00010111
;   ||||||||
;   ||||++++———> 1 stop bit
;   |||+———————> CTS control enabled
;   ||+————————> No RTS control (p30)
;   ++—————————> normal mode (p29)
;
;
;
;   OPCR — output port configuration register...
;
        duart_opdef =%00000000            ;no operation
;
;
;   combined setup commands...
;
        duart_cra_rtd =duart_cra_txd | duart_cra_rxd    ;disable transmitter & receiver
        duart_cra_rte =duart_cra_txe | duart_cra_rxe    ;enable transmitter & receiver

;   same commands for channel B
        duart_crb_rtd = duart_cra_rtd
        duart_crb_rte = duart_cra_rte

;PHILIPS/NXP DUAL UART INITIALIZATION DATA
;
;   ————————————————————————————————————————————————————————————————————————
;   The following data table is used to initialize the 28L92 DUART
;   following reset.  Each entry in this table consists of a chip register
;   offset paired with the parameter that is to be loaded into the register.
;   Table entries are read in reverse order during device setup.
;   ————————————————————————————————————————————————————————————————————————
;

duart_sutab:
        ; .byte duart_imr, duart_irqmask      ;IMR (enables IRQs)
        ; .byte duart_ctu, duart_ctdhi        ;CTU
        ; .byte duart_ctl, duart_ctdlo        ;CTL
        .byte duart_crb, duart_crb_txe      ;CRB enable transmitter
        .byte duart_csrb,duart_csrdef       ;CSRB 115200 baud
        .byte duart_mrb, duart_m2def        ;MR2B CTS on and 1 stop bit
        .byte duart_mrb, duart_m1def        ;MR1B RTS on, no parity, 8 bits
        .byte duart_crb, duart_crb_mr1      ;CRB select MR1
        .byte duart_mrb, duart_m0def        ;MR0B See above
        .byte duart_crb, duart_crb_mr0      ;CRB select MR0
        .byte duart_cra, duart_cra_rsa      ;CRA assert RTS
        .byte duart_cra, duart_cra_rte      ;CRA enable transmitter and receiver
        .byte duart_csra,duart_csrdef       ;CSRA 115200 baud
        .byte duart_mra, duart_m2def        ;MR2A CTS on and 1 stop bit
        .byte duart_mra, duart_m1def        ;MR1A RTS on, no parity, 8 bits
        .byte duart_cra, duart_cra_mr1      ;CRA select MR1
        .byte duart_mra, duart_m0def        ;MR0A See above
        .byte duart_cra, duart_cra_mr0      ;CRA select MR0
        .byte duart_acr, duart_arbrt        ;ACR external clock (X1/CLK) / 16
        .byte duart_opcr,duart_opdef        ;OPCR no operation
        .byte duart_crb, duart_crb_dto      ;CRB disable time-out mode
        .byte duart_crb, duart_crb_esr      ;CRB reset error status (SRB[7:4])
        .byte duart_crb, duart_crb_abr      ;CRB reset channel B break change interrupt (ISR[6] = 0)
        .byte duart_crb, duart_crb_txr      ;CRB reset transmitter
        .byte duart_crb, duart_crb_rxr      ;CRB reset receiver
        .byte duart_crb, duart_crb_rsd      ;CRB dassert RTS
        .byte duart_cra, duart_cra_dto      ;CRA disable time-out mode
        .byte duart_cra, duart_cra_esr      ;CRA reset error status (SRA[7:4])
        .byte duart_cra, duart_cra_abr      ;CRA reset channel A break change interrupt (ISR[2] = 0)
        .byte duart_cra, duart_cra_txr      ;CRA reset transmitter
        .byte duart_cra, duart_cra_rxr      ;CRA reset receiver
        .byte duart_cra, duart_cra_rsd      ;CRA dassert RTS
        ; .byte duart_cra, duart_crpwd    ;CRA
        .byte duart_imr, 0         ;IMR (disable IRQs)

        s_duart_tab = * - duart_sutab


        delay_bit = 7                   ;Delay bit in control_flags
