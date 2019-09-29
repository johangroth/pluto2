EESchema Schematic File Version 4
LIBS:pluto-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
Title "Pluto SCB"
Date "2017-03-25"
Rev "0.1"
Comp "Linux Grotto"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1350 900  1875 1650
U 58D5892B
F0 "CPU, ROM and RAM" 60
F1 "cpu_rom_ram.sch" 60
F2 "A[0..15]" O L 1350 2375 60 
F3 "D[0..7]" B L 1350 2200 60 
F4 "RDY" I R 3225 1200 60 
F5 "BE" I R 3225 2250 60 
F6 "~IRQ" I L 1350 2050 60 
F7 "R/~W" O L 1350 1850 60 
F8 "~NMI" I R 3225 1750 60 
F9 "CLK" I R 3225 2500 60 
F10 "~MRD" I R 3225 1000 60 
F11 "~MWR" I R 3225 1100 60 
F12 "~RAMSEL" I R 3225 1450 60 
F13 "~ROMSEL" I R 3225 1325 60 
F14 "~RES" I R 3225 2400 60 
F15 "~SO" I R 3225 1975 60 
$EndSheet
$Sheet
S 7025 900  2250 2075
U 58D58980
F0 "RTC" 60
F1 "via_rtc.sch" 60
F2 "D[0..7]" B R 9275 1650 60 
F3 "A[0..15]" I R 9275 1475 60 
F4 "~PWR" O L 7025 1625 60 
F5 "~RES" O R 9275 2500 60 
F6 "~IRQ" O L 7025 2000 60 
F7 "~MWR" I L 7025 1100 60 
F8 "~MRD" I L 7025 1000 60 
F9 "~7F8X" I L 7025 1225 60 
F10 "~KS" I L 7025 2125 60 
$EndSheet
$Sheet
S 3825 900  2075 2450
U 58D589A4
F0 "Address decoding and support section" 60
F1 "address_decoding_and_support.sch" 60
F2 "CLK" O R 5900 1750 60 
F3 "A[0..15]" I R 5900 3275 60 
F4 "~MRD" O R 5900 1000 60 
F5 "~MWR" O R 5900 1100 60 
F6 "~ROMSEL" O L 3825 1325 60 
F7 "~RAMSEL" O L 3825 1450 60 
F8 "R/~W" I R 5900 1875 60 
F9 "~IRQ" B R 5900 2000 60 
F10 "~NMI" O L 3825 1750 60 
F11 "BE" O L 3825 2250 60 
F12 "~PWR" O R 5900 1625 60 
F13 "RDY" O L 3825 1200 60 
F14 "~RES" O L 3825 2400 60 
F15 "~7F8X" O R 5900 1225 60 
F16 "~7FEX" O L 3825 3275 60 
F17 "~KS" O R 5900 2125 60 
F18 "~SO" O L 3825 1975 60 
F19 "RES" O L 3825 2575 60 
F20 "TDI" I R 5900 2250 60 
F21 "TDO" O R 5900 2350 60 
F22 "TCK" I R 5900 2450 60 
F23 "TMS" I R 5900 2550 60 
F24 "FROM_OE" O R 5900 3075 60 
F25 "FROM_CLK" O L 3825 3000 60 
F26 "TO_OE" O R 5900 3175 60 
F27 "TO_CLK" O L 3825 2900 60 
F28 "OBT_OE" O L 3825 2800 60 
F29 "OBT_DIR" O L 3825 2700 60 
F30 "DIOR" O R 5900 2875 60 
F31 "DIOW" O R 5900 2975 60 
F32 "IDE_CS0" O R 5900 2775 60 
F33 "~7FAX" O R 5900 1325 60 
F34 "~7FCX" O R 5900 1450 60 
$EndSheet
$Sheet
S 7575 3875 2050 1850
U 58D589DC
F0 "Power and mounting holes" 60
F1 "power_and_expansion.sch" 60
F2 "TDI" O L 7575 4000 60 
F3 "TDO" I L 7575 4100 60 
F4 "TCK" O L 7575 4200 60 
F5 "TMS" O L 7575 4300 60 
F6 "~7FAX" I R 9625 4550 60 
F7 "~7FCX" I R 9625 4425 60 
F8 "~IRQ" O L 7575 4700 60 
F9 "~RES" O R 9625 5100 60 
F10 "~MRD" I L 7575 4825 60 
F11 "~MWR" I L 7575 4950 60 
F12 "R/~W" I L 7575 4575 60 
F13 "CLK" I L 7575 4450 60 
F14 "~NMI" I R 9625 4900 60 
F15 "RDY" I R 9625 5300 60 
F16 "D[0..7]" B R 9625 3950 60 
F17 "A[0..15]" I R 9625 4075 60 
$EndSheet
$Sheet
S 3750 3775 2150 2050
U 5932EBB3
F0 "16bit IDE interface" 60
F1 "IDE16bit.sch" 60
F2 "D[0..7]" I L 3750 5575 60 
F3 "~RES" I L 3750 4000 60 
F4 "A[0..15]" I R 5900 5575 60 
F5 "~IRQ" O R 5900 4750 60 
F6 "TO_OE" I R 5900 4875 60 
F7 "TO_CLK" I L 3750 4250 60 
F8 "FROM_CLK" I L 3750 4150 60 
F9 "FROM_OE" I R 5900 5000 60 
F10 "OBT_DIR" I L 3750 4450 60 
F11 "OBT_OE" I L 3750 4350 60 
F12 "IDE_CS0" I R 5900 4175 60 
F13 "DIOR" I R 5900 4075 60 
F14 "DIOW" I R 5900 3975 60 
$EndSheet
Text Label 975  2375 0    60   ~ 0
A[0..15]
Text Label 900  2200 0    60   ~ 0
D[0..7]
$Sheet
S 1325 2825 1375 1900
U 59ECC1E1
F0 "DUART and RS232" 60
F1 "duart_rs232.sch" 60
F2 "D[0..7]" I L 1325 3175 60 
F3 "A[0..15]" I L 1325 2975 60 
F4 "RES" I R 2700 3075 60 
F5 "~MRD" I L 1325 3700 60 
F6 "~MWR" I L 1325 3525 60 
F7 "~IRQ" O L 1325 3350 60 
F8 "~7FEX" I R 2700 3275 60 
$EndSheet
Wire Wire Line
	5900 2000 6200 2000
Wire Wire Line
	5900 1000 6125 1000
Wire Wire Line
	5900 1100 6025 1100
Wire Wire Line
	5900 1625 7025 1625
Wire Wire Line
	3225 1000 3425 1000
Wire Wire Line
	3425 1000 3425 650 
Wire Wire Line
	600  650  3425 650 
Connection ~ 6125 1000
Wire Wire Line
	3225 1100 3550 1100
Wire Wire Line
	3550 1100 3550 775 
Wire Wire Line
	675  775  3550 775 
Connection ~ 6025 1100
Wire Wire Line
	3225 1200 3625 1200
Wire Wire Line
	3225 1325 3825 1325
Wire Wire Line
	3225 1450 3825 1450
Wire Wire Line
	5900 1225 7025 1225
Wire Wire Line
	9275 2500 9650 2500
Wire Wire Line
	2700 3275 3825 3275
Wire Wire Line
	3225 2500 3325 2500
Wire Wire Line
	3325 2500 3325 6025
Wire Wire Line
	3225 2400 3425 2400
Wire Wire Line
	3425 2400 3425 3550
Wire Wire Line
	3225 2250 3825 2250
Wire Bus Line
	1350 2375 975  2375
Wire Bus Line
	975  2375 975  2975
Wire Bus Line
	975  2975 1325 2975
Wire Bus Line
	1350 2200 900  2200
Wire Bus Line
	900  2200 900  3175
Wire Bus Line
	900  3175 1325 3175
Wire Wire Line
	1350 2050 825  2050
Wire Wire Line
	825  575  825  2050
Wire Wire Line
	825  3350 1325 3350
Wire Wire Line
	1350 1850 750  1850
Wire Wire Line
	750  1850 750  6350
Wire Bus Line
	9275 1650 10150 1650
Wire Bus Line
	10150 1650 10150 3950
Wire Bus Line
	10150 6150 3600 6150
Wire Bus Line
	9275 1475 10275 1475
Wire Bus Line
	10275 1475 10275 4075
Wire Bus Line
	10275 6250 6300 6250
Connection ~ 975  2975
Connection ~ 900  3175
Wire Bus Line
	3750 5575 3600 5575
Wire Bus Line
	3600 5575 3600 6150
Connection ~ 3600 6150
Wire Bus Line
	5900 5575 6025 5575
Wire Bus Line
	6025 5575 6025 6250
Connection ~ 6025 6250
Wire Wire Line
	6100 1750 6100 6025
Wire Wire Line
	825  575  6200 575 
Wire Wire Line
	6200 575  6200 2000
Connection ~ 6200 2000
Connection ~ 825  2050
Wire Wire Line
	6200 4750 5900 4750
Connection ~ 3425 2400
Wire Wire Line
	3425 4000 3750 4000
Wire Wire Line
	3425 3550 9650 3550
Connection ~ 3425 3550
Wire Wire Line
	3225 1750 3750 1750
Wire Bus Line
	5900 3275 6300 3275
Wire Bus Line
	6300 3275 6300 6250
Connection ~ 6300 6250
Wire Wire Line
	750  6350 6400 6350
Wire Wire Line
	6400 6350 6400 1875
Wire Wire Line
	6100 6025 3325 6025
Wire Wire Line
	7025 2125 5900 2125
Wire Wire Line
	3825 1975 3225 1975
Wire Wire Line
	675  775  675  3525
Wire Wire Line
	675  3525 1325 3525
Connection ~ 3550 775 
Wire Wire Line
	600  650  600  3700
Wire Wire Line
	600  3700 1325 3700
Connection ~ 3425 650 
Wire Wire Line
	3825 2575 3525 2575
Wire Wire Line
	3525 2575 3525 3075
Wire Wire Line
	3525 3075 2700 3075
Wire Wire Line
	5900 3175 6500 3175
Wire Wire Line
	6500 3175 6500 4875
Wire Wire Line
	6500 4875 5900 4875
Wire Wire Line
	5900 3075 6600 3075
Wire Wire Line
	6600 3075 6600 5000
Wire Wire Line
	6600 5000 5900 5000
Wire Wire Line
	3825 3000 3700 3000
Wire Wire Line
	3700 3000 3700 4150
Wire Wire Line
	3700 4150 3750 4150
Wire Wire Line
	3825 2900 3675 2900
Wire Wire Line
	3675 2900 3675 4250
Wire Wire Line
	3675 4250 3750 4250
Wire Wire Line
	3825 2800 3650 2800
Wire Wire Line
	3650 2800 3650 4350
Wire Wire Line
	3650 4350 3750 4350
Wire Wire Line
	3825 2700 3625 2700
Wire Wire Line
	3625 2700 3625 4450
Wire Wire Line
	3625 4450 3750 4450
Wire Wire Line
	6125 650  6125 1000
Wire Wire Line
	6025 775  6025 1100
Wire Wire Line
	5900 2975 5950 2975
Wire Wire Line
	5950 2975 5950 3975
Wire Wire Line
	5950 3975 5900 3975
Wire Wire Line
	5900 2875 5975 2875
Wire Wire Line
	5975 2875 5975 4075
Wire Wire Line
	5975 4075 5900 4075
Wire Wire Line
	5900 2775 6000 2775
Wire Wire Line
	6000 2775 6000 4175
Wire Wire Line
	6000 4175 5900 4175
Wire Wire Line
	9650 3550 9650 2500
Wire Wire Line
	5900 1750 6100 1750
Wire Wire Line
	5900 1875 6400 1875
Wire Wire Line
	5900 1450 6925 1450
Wire Wire Line
	5900 1325 6900 1325
Wire Wire Line
	5900 2550 6925 2550
Wire Wire Line
	6925 2550 6925 4300
Wire Wire Line
	6925 4300 7575 4300
Wire Wire Line
	7575 4200 6950 4200
Wire Wire Line
	6950 4200 6950 2450
Wire Wire Line
	6950 2450 5900 2450
Wire Wire Line
	5900 2350 6975 2350
Wire Wire Line
	6975 2350 6975 4100
Wire Wire Line
	6975 4100 7575 4100
Wire Wire Line
	7000 4000 7575 4000
Wire Wire Line
	7000 2250 7000 4000
Wire Wire Line
	7000 2250 5900 2250
Wire Bus Line
	9625 3950 10150 3950
Wire Bus Line
	9625 4075 10275 4075
Connection ~ 10275 4075
Connection ~ 10150 3950
Wire Wire Line
	6925 1450 6925 750 
Wire Wire Line
	6925 750  9725 750 
Wire Wire Line
	9725 750  9725 4425
Wire Wire Line
	9725 4425 9625 4425
Wire Wire Line
	6900 1325 6900 700 
Wire Wire Line
	6900 700  9775 700 
Wire Wire Line
	9775 700  9775 4550
Wire Wire Line
	9775 4550 9625 4550
Wire Wire Line
	6900 1750 6900 4450
Wire Wire Line
	6900 4450 7575 4450
Connection ~ 6100 1750
Wire Wire Line
	6875 1875 6875 4575
Wire Wire Line
	6875 4575 7575 4575
Connection ~ 6400 1875
Wire Wire Line
	7575 4700 6850 4700
Wire Wire Line
	6850 4700 6850 2000
Connection ~ 6850 2000
Wire Wire Line
	7575 4825 6800 4825
Wire Wire Line
	6800 4825 6800 1000
Connection ~ 6800 1000
Wire Wire Line
	7575 4950 6750 4950
Wire Wire Line
	6750 4950 6750 1100
Connection ~ 6750 1100
Wire Wire Line
	3750 1750 3750 675 
Wire Wire Line
	3750 675  9825 675 
Wire Wire Line
	9825 675  9825 4900
Wire Wire Line
	9825 4900 9625 4900
Connection ~ 3750 1750
Wire Wire Line
	9625 5100 9875 5100
Wire Wire Line
	9875 5100 9875 600 
Wire Wire Line
	9875 600  3700 600 
Wire Wire Line
	3700 600  3700 2400
Connection ~ 3700 2400
Wire Wire Line
	9625 5300 9925 5300
Wire Wire Line
	9925 5300 9925 525 
Wire Wire Line
	9925 525  3625 525 
Wire Wire Line
	3625 525  3625 1200
Connection ~ 3625 1200
Wire Wire Line
	6125 1000 6800 1000
Wire Wire Line
	6025 1100 6750 1100
Wire Bus Line
	975  2975 975  6250
Wire Bus Line
	900  3175 900  6150
Wire Bus Line
	3600 6150 900  6150
Wire Bus Line
	6025 6250 975  6250
Wire Wire Line
	6200 2000 6850 2000
Wire Wire Line
	6200 2000 6200 4750
Wire Wire Line
	825  2050 825  3350
Wire Wire Line
	3425 2400 3700 2400
Wire Wire Line
	3425 3550 3425 4000
Wire Bus Line
	6300 6250 6025 6250
Wire Wire Line
	3550 775  6025 775 
Wire Wire Line
	3425 650  6125 650 
Wire Bus Line
	10275 4075 10275 6250
Wire Bus Line
	10150 3950 10150 6150
Wire Wire Line
	6100 1750 6900 1750
Wire Wire Line
	6400 1875 6875 1875
Wire Wire Line
	6850 2000 7025 2000
Wire Wire Line
	6800 1000 7025 1000
Wire Wire Line
	6750 1100 7025 1100
Wire Wire Line
	3750 1750 3825 1750
Wire Wire Line
	3700 2400 3825 2400
Wire Wire Line
	3625 1200 3825 1200
$EndSCHEMATC
