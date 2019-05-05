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
        ; duart_mra       = %      ;Mode Register A (MR0A, MR1A, MR2A)
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


        nxx1freq =3686400              ;X1 clock frequency in Hz
        nxctscal =nxx1freq/2           ;C/T scaled clock
;
;
;   ACR — auxiliary control register
;
        duart_arbrt = %00110000            ;...
;
;   a) Use baud rate table #5 —— see data sheet.
;   b) C/T acts as a counter.
;   c) C/T clock source is scaled to X1 ÷ 16.
;
;
;   CR — command register commands
;
         duart_crrxe = %00000001            ;enable receiver
         duart_crrxd = %00000010            ;disable receiver
         duart_crtxe = %00000100            ;enable transmitter
         duart_crtxd = %00001000            ;disable transmitter
         duart_crmr1 = %00010000            ;select MR1
         duart_crrxr = %00100000            ;reset receiver
         duart_crtxr = %00110000            ;reset transmitter
         duart_cresr = %01000000            ;reset error status
         duart_crbir = %01010000            ;reset received break change IRQ
         duart_crbks = %01100000            ;start break
         duart_crbke = %01110000            ;stop break
         duart_crrsa = %10000000            ;assert request to send
         duart_crrsd = %10010000            ;deassert request to send
         duart_crtme = %10100000            ;select C/T timer mode
         duart_crmr0 = %10110000            ;select MR0
         duart_crtmd = %11000000            ;Disable time out mode.
         duart_crpwd = %11100000            ;Power down mode on (used on 28L92?)
         duart_crpwu = %11110000            ;Power up DUART (used on 28L92?)
;
;
;   ACR[7] = 0 and MR0[2] = 1 (Extended mode II), see table 35 (p. 33) in datasheet.
;   CSR — clock select register...
;
        duart_csdef = %01100110             ;RxD & TxD at 115.2 Kbps...
;
;
;   CT — counter/timer...
;   These definitions are here only for reference if a jiffy timer
;   running at 100 Hz is enabled.
        hz = 100
        duart_ctdef =nxctscal/hz            ;HZ underflows per second
        duart_ctdlo =<duart_ctdef           ;underflows/sec LSB
        duart_ctdhi =>duart_ctdef           ;underflows/sec MSB
;
;
;   MR0 — mode 0 register...
;
        duart_m0def =%11001100            ;if using a 28L92 ...
;
;   11001100
;   ||||||||
;   |||||+++———> extended baud rate #2
;   ||||+——————> 16-deep FIFO
;   ||++———————> TxD interrupts only when FIFO is empty
;   |+—————————> RxD interrupts only when FIFO is full (see also MR1:6)
;   +——————————> enable RxD watchdog timer
;
;   IMR = Interrupt Mask Register
;
        duart_irqmask =%00001011
;
;   00001011
;   ||||||||
;   |||||||+———> TxA interrupt enabled
;   ||||||+————> RxA interrupt enabled
;   |||||+—————> Channel A change in break disabled
;   ||||+——————> Counter ready enabled
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
;
;
;   OPCR — output port configuration register...
;
        duart_opdef =%00000000            ;no operation
;
;
;   combined setup commands...
;
        duart_crrtd =duart_crtxd|duart_crrxd    ;disable transmitter & receiver
        duart_crrte =duart_crtxe|duart_crrxe    ;enable transmitter & receiver

;PHILIPS/NXP DUAL UART INITIALIZATION DATA
;
;   ————————————————————————————————————————————————————————————————————————
;   The following data table is used to initialize the 28L92 DUART
;   following reset.  Each entry in this table consists of a chip register
;   offset paired with the parameter that is to be loaded into the register.
;   Table entries are read in reverse order during device setup.
;   ————————————————————————————————————————————————————————————————————————
;
        .align $20,$ea
        ;* = * - 2   ;force table to cross page boundary
duart_sutab:
        .byte duart_imr, duart_irqmask  ;IMR (enables IRQs)
        .byte duart_ctu, duart_ctdhi    ;CTU
        .byte duart_ctl, duart_ctdlo    ;CTL
        .byte duart_crb, duart_crtxe    ;CRB
        .byte duart_csrb,duart_csdef    ;CSRB
        .byte duart_mrb, duart_m2def    ;MR2B
        .byte duart_mrb, duart_m1def    ;MR1B
        .byte duart_crb, duart_crmr1    ;CRB
        .byte duart_mrb, duart_m0def    ;MR0B
        .byte duart_crb, duart_crmr0    ;CRB
        .byte duart_cra, duart_crrsa    ;CRA
        .byte duart_cra, duart_crrte    ;CRA
        .byte duart_csra,duart_csdef    ;CSRA
        .byte duart_mra, duart_m2def    ;MR2A
        .byte duart_mra, duart_m1def    ;MR1A
        .byte duart_cra, duart_crmr1    ;CRA
        .byte duart_mra, duart_m0def    ;MR0A
        .byte duart_cra, duart_crmr0    ;CRA
        .byte duart_acr, duart_arbrt    ;ACR
        .byte duart_opcr,duart_opdef    ;OPCR
        .byte duart_crb, duart_crtmd    ;CRB
        .byte duart_crb, duart_cresr    ;CRB
        .byte duart_crb, duart_crbir    ;CRB
        .byte duart_crb, duart_crtxr    ;CRB
        .byte duart_crb, duart_crrxr    ;CRB
        .byte duart_crb, duart_crrsd    ;CRB
        .byte duart_cra, duart_crtmd    ;CRA
        .byte duart_cra, duart_cresr    ;CRA
        .byte duart_cra, duart_crbir    ;CRA
        .byte duart_cra, duart_crtxr    ;CRA
        .byte duart_cra, duart_crrxr    ;CRA
        .byte duart_cra, duart_crrsd    ;CRA
        .byte duart_cra, duart_crpwd    ;CRA
        .byte duart_imr, 0         ;IMR (disable IRQs)

        s_duart_tab = * - duart_sutab


        delay_bit = 7                   ;Delay bit in control_flags
