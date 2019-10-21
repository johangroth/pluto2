        .include "ansi_macros.inc"
;;;
;; Welcome message
;;;
welcome:
        cup "1", "1"
        .byte "--- PLUTO SINGLE BOARD COMPUTER ---"
        cup "1", "2"
        .byte "Designed by Johan Groth"
        cup "1", "4"
        .byte "RAM               32KiB Static"
        cup "1", "5"
        .byte "ROM               32KiB EEPROM"
        cup "1", "6"
        .byte "Main Processor    WDC W65C02S-14 (ticking at 4MHz)"
        cup "1", "7"
        .byte "Serial port       19200 baud, 8-N-1"
        cup "1", "8"
        .byte "Hardware Version  "
        .byte "1.0"
        .byte " (13/06/2017)"
        cup "0","34" ;Move cursor to last line -1 that is supported by Geoff Graham's VT100 terminal
        .byte 0

clear_screen:
        ed2
        .byte 0

destructive_backspace:
        .byte a_bs, " ", a_bs, $00

prompt_text:
        .byte "M-", $00

inverted_question_mark:
        sgr7
        .byte '?'
        sgr0
        .byte 0

.macro crlf
        .byte a_cr, a_lf
.endmacro

beginning_of_line:
        cub '3'
        .byte 0

.macro print_text text
        lda #<text
        sta index_low
        lda #>text
        sta index_high
        jsr b_prout
.endmacro

;;;
;; Macro will also RTS
;;;
.macro print_text_rts text
        lda #<text
        sta index_low
        lda #>text
        sta index_high
        jmp b_prout
.endmacro

.macro print_a
        sta temp1
        jsr b_hex_byte
.endmacro

.macro print_x
        stx temp1
        jsr b_hex_byte
.endmacro

.macro print_y
        sty temp1
        jsr b_hex_byte
.endmacro

.macro print_char char
        lda #char
        jsr b_chout
.endmacro
;;;
;; Help text for all the monitor commands.
;;;
help_text:
        .byte "D Dump memory"
        crlf
        .byte "CTRL-D Download file"
        crlf
        .byte "F Fill memory"
        crlf
        .byte "H This text"
        crlf
        .byte "T Display time and date"
        crlf
        .byte "CTRL-T Set time and date"
        crlf
        .byte $00

abort_command_text:
        .byte "[ESC] to abort, any other to proceed", $00

;;;
;; Date and time strings
;;;
;;;
days_of_week:
        .byte "MON", $00
        .byte "TUE", $00
        .byte "WED", $00
        .byte "THU", $00
        .byte "FRI", $00
        .byte "SAT", $00
        .byte "SUN", $00

;;  Fill prompts
;;;
fill_start:
        .byte "Fill start: $", $00
fill_length:
        .byte "Len: $", $00
fill_byte:
        .byte "Value: $", $00

clear_line:
        el2
        .byte $00
