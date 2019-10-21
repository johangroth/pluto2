;;;
;; 
;; STANDARD ANSI VT100 DEFINITIONS
;; 
;;;

        .include "ascii.inc"

.macro ansi_cs
                .byte a_esc, "["
.endmacro

.macro decawm
		        ansi_cs
		        .byte "?7h"	; auto-wrap mode on (default)
.endmacro

.macro decawmo
        		ansi_cs
        		.byte "?7l"	; auto-wrap mode off
.endmacro

.macro declrg
                ansi_cs
                .byte "?9l"     ;Set 36 lines per screen
.endmacro

.macro decsml
                ansi_cs        ;Set 24 lines per screen (default)
                .byte "?9h"
.endmacro

.macro sgr0
		        ansi_cs
		        .byte "m"	;turn off character attributes
.endmacro

.macro sgr0m
		        ansi_cs
		        .byte "0m"	;turn off character attributes
.endmacro

.macro sgr3
                ansi_cs
                .byte "3m"      ;select font 2 (large characters)
.endmacro

.macro sgr4
		        ansi_cs
                .byte "4m"	;turn underline mode on
.endmacro

.macro sgr6
                ansi_cs
                .byte "6m"	;select font 2 (jumbo characters)
.endmacro

.macro sgr7
		        ansi_cs
                .byte "7m"	;turn reverse video on
.endmacro

.macro sgr8
		        ansi_cs
                .byte "8m"	;turn invisible text mode on
.endmacro

.macro cuu n
                ansi_cs
                .byte n, "A"   ; move cursor up n lines
.endmacro

.macro cud n
                ansi_cs
                .byte n, "B"	; move cursor down n lines
.endmacro

.macro cuf n
                ansi_cs
                .byte n, "C"	;move cursor right n lines
.endmacro

.macro cub n
                ansi_cs
                .byte n, "D"	;move cursor left n lines
.endmacro

.macro cursorhome
		        ansi_cs
                .byte "H"	;move cursor to upper left corner
.endmacro

.macro cursorhome1
                ansi_cs
                .byte ";H"	;move cursor to upper left corner
.endmacro

.macro cup x1, y1
                ansi_cs
                .byte y1, ";", x1, "H"	;move cursor to screen location x1, y1
.endmacro

.macro hvhome
                ansi_cs
                .byte "f"	;move cursor to upper left corner
.endmacro

.macro hvhome1
                 ansi_cs
                 .byte ";f"	;move cursor to upper left corner
.endmacro

.macro cup1 v, h
                ansi_cs
                .byte v, ";", h, "f"	;move cursor to screen location v,h
.endmacro

.macro ind
                .byte a_esc, "D"	;move/scroll window up one line
.endmacro

.macro ri
                .byte a_esc, "M"	;move/scroll window down one line
.endmacro

.macro nel
                .byte a_esc, "E"	;move to next line
.endmacro

.macro decsc
                .byte a_esc, "7"	;save cursor position and attributes
.endmacro

.macro decscr
                .byte a_esc, "8"	;restore cursor position and attributes
.endmacro

.macro el01
                ansi_cs
                .byte "K"	;clear line from cursor right
.endmacro

.macro el02
                ansi_cs
                .byte "0K"	;clear line from cursor right
.endmacro

.macro el1
                ansi_cs
                .byte "1K"	;clear line from cursor left
.endmacro

.macro el2
                ansi_cs
                .byte "2K"	;clear entire line
.endmacro


.macro ed01
                ansi_cs
                .byte "J"	;clear screen from cursor down
.endmacro

.macro ed02
                ansi_cs
                .byte "0J"	;clear screen from cursor down
.endmacro

.macro ed1
                ansi_cs
                .byte "1J"	;clear screen from cursor up
.endmacro

.macro ed2
                ansi_cs
                .byte "2J"	;clear entire screen
.endmacro


.macro dsr
                .byte a_esc, "5n"	;device status report
                                        ;Esc0n	;response: terminal is ok
                                        ;Esc3n	;response: terminal is not ok
.endmacro

.macro curpos
                .byte a_esc, "6n"	;get cursor position
                                        ;response is EscLine;ColumnR
.endmacro

.macro rstterm
                .byte a_esc, "c"        ; reset terminal to initial state
.endmacro

.macro drawline x1, y1, x2, y2                         ; draw a line from x1, y1 to x2, y2
                ansi_cs
                .byte "Z1;"
                .byte x1                ; x1
                .byte ";"
                .byte y1                ; y1
                .byte ";"
                .byte x2                ; x2
                .byte ";"
                .byte y2                ; y2
                .byte "Z"
.endmacro

.macro drawbox x1, y1, x2, y2                          ; draw a box with upper left corner x1, y2 and lower right corner x2, y2
                ansi_cs
                .byte "Z2;"
                .byte x1                ; x1
                .byte ";"
                .byte y1                ; y1
                .byte ";"
                .byte x2                ; x2
                .byte ";"
                .byte y2                ; y2
                .byte "Z"
.endmacro

.macro drawfbox x1, y1, x2, y2                         ;draw a filled box with upper left corner x1, y2 and lower right corner x2, y2
                ansi_cs
                .byte "Z3;"
                .byte x1                ; x1
                .byte ";"
                .byte y1                ; y1
                .byte ";"
                .byte x2                ; x2
                .byte ";"
                .byte y2                ; y2
                .byte "Z"
.endmacro

.macro drawcircle x1, y1, r                       ;Draw a circle x1, y1, r
                .byte "Z4;"
                .byte x1               ; x1
                .byte ";"
                .byte y1                ; y1
                .byte ";"
                .byte r                ; r
                .byte "Z"
.endmacro

.macro drawfcircle x1, y1, r                      ;Draw a filled circle x, y, r
                .byte "Z5;"
                .byte x1               ; x
                .byte ";"
                .byte y1                ; y
                .byte ";"
                .byte r                ; r
                .byte "Z"
.endmacro

.macro up
                ansi_cs
                .byte "A"
.endmacro

.macro down
                ansi_cs
                .byte "B"
.endmacro

.macro left
                ansi_cs
                .byte "C"
.endmacro

.macro right
                ansi_cs
                .byte "D"
.endmacro

.macro home
                ansi_cs
                .byte "1~"
.endmacro

.macro inserts
                ansi_cs
                .byte "2~"
.endmacro

.macro del
                ansi_cs
                .byte "3~"
.endmacro

.macro end
                ansi_cs
                .byte "4~"
.endmacro

.macro pup
                ansi_cs
                .byte "5~"
.endmacro

.macro pdown
                ansi_cs
                .byte "6~"
.endmacro

.macro f1
                ansi_cs
                .byte "11~"
.endmacro

.macro f2
                ansi_cs
                .byte "12~"
.endmacro

.macro f3
                ansi_cs
                .byte "13~"
.endmacro

.macro f4
                ansi_cs
                .byte "14~"
.endmacro

.macro f5
                ansi_cs
                .byte "15~"
.endmacro

.macro f6
                ansi_cs
                .byte "17~"
.endmacro

.macro f7
                ansi_cs
                .byte "18~"
.endmacro

.macro f8
                ansi_cs
                .byte "19~"
.endmacro

.macro f9
                ansi_cs
                .byte "20~"
.endmacro

.macro f10
                ansi_cs
                .byte "21~"
.endmacro

.macro f11
                ansi_cs
                .byte "23~"
.endmacro

.macro f12
                ansi_cs
                .byte "24~"
.endmacro
