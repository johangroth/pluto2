        * = $8000
        .cpu "w65c02"

;
; =============================================================================
; RTC main file
.if emulator==false
.include "rtc.asm"
.fi

; =============================================================================
; IDE
; .include "ide_routines.asm"

; =============================================================================
; CFS (Commodore File System, part of IDE64 project)
;.include "cfs.asm"

; =============================================================================
; xmodem
.include "xmodem.asm"

; =============================================================================
; ascii_to_binary subroutines
.include "ascii_to_bin.asm"

; =============================================================================
; binary to ascii subroutines
.include "bin_to_ascii.asm"

; =============================================================================
; utils subroutines (bcd->bin->bcd and out)
.include "bcd_bin_utils.asm"

; =============================================================================
; Monitor
.include "monitor.asm"

; =============================================================================
; Mini-assembler
.include "miniassembler.asm"

; =============================================================================
; 65C22 VIA subroutines
.if emulator==false
.include "via.asm"
.fi

; =============================================================================
; SC28L92 DUART subroutines
;.if emulator==false
;.include "duart_sc28l92.asm"
;.fi

; =============================================================================
; ST16C550 UART subroutines
.if emulator==false
.include "uart_st16c550.asm"
.fi

.include "rc2014/16c550_irq.asm"
; .include "rc2014/16c550_buffer.asm"
; =============================================================================
; KERNEL
.include "bios.asm"

; =============================================================================
; END
.end
