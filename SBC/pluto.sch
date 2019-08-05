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
F7 "R-~W" O L 1350 1850 60 
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
F9 "~KS" I L 7025 2125 60 
F10 "~RTC" I L 7025 1225 60 
$EndSheet
$Sheet
S 3825 900  2075 2450
U 58D589A4
F0 "Address decoding and support section" 60
F1 "address_decoding_and_support.sch" 60
F2 "CLK" O R 5900 1750 60 
F3 "~IRQ" B R 5900 2000 60 
F4 "~NMI" O L 3825 1750 60 
F5 "BE" O L 3825 2250 60 
F6 "~PWR" O R 5900 1625 60 
F7 "RDY" O L 3825 1200 60 
F8 "~RES" O L 3825 2400 60 
F9 "~KS" O R 5900 2125 60 
F10 "~SO" O L 3825 1975 60 
F11 "RES" O L 3825 2575 60 
F12 "A[0..15]" I R 5900 3275 60 
F13 "R-~W" I R 5900 1875 60 
F14 "~MRD" O L 3825 1000 60 
F15 "~MWR" O L 3825 1100 60 
F16 "~RAMSEL" O L 3825 1450 60 
F17 "~ROMSEL" O L 3825 1325 60 
F18 "~DUART" O L 3825 3275 60 
F19 "~VIA1SEL" O L 3825 2775 60 
F20 "~VIA2SEL" O L 3825 2925 60 
F21 "~RTC" O R 5900 1225 60 
F22 "~IO" O R 5900 2975 60 
$EndSheet
$Sheet
S 7575 3875 2050 1850
U 58D589DC
F0 "Power and mounting holes" 60
F1 "power_and_expansion.sch" 60
F2 "~IRQ" O L 7575 4700 60 
F3 "~RES" O R 9625 5100 60 
F4 "~MRD" I L 7575 4825 60 
F5 "~MWR" I L 7575 4950 60 
F6 "R/~W" I L 7575 4575 60 
F7 "CLK" I L 7575 4450 60 
F8 "~NMI" I R 9625 4900 60 
F9 "RDY" I R 9625 5300 60 
F10 "D[0..7]" B R 9625 3950 60 
F11 "A[0..15]" I R 9625 4075 60 
F12 "~IO" O L 7575 5100 60 
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
F6 "R-~W" I R 5900 4875 60 
F7 "CLK" I L 3750 4325 60 
F8 "~VIA2SEL" I L 3750 4575 60 
F9 "~VIA1SEL" I L 3750 4900 60 
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
F8 "~DUART" I R 2700 3275 60 
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
	3325 2500 3325 4325
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
	6400 6350 6400 4875
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
	6400 4875 5900 4875
Wire Wire Line
	6125 650  6125 1000
Wire Wire Line
	6025 775  6025 1100
Wire Wire Line
	9650 3550 9650 2500
Wire Wire Line
	5900 1750 6100 1750
Wire Wire Line
	5900 1875 6400 1875
Wire Bus Line
	9625 3950 10150 3950
Wire Bus Line
	9625 4075 10275 4075
Connection ~ 10275 4075
Connection ~ 10150 3950
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
Wire Wire Line
	3750 4325 3325 4325
Connection ~ 3325 4325
Wire Wire Line
	3325 4325 3325 6025
Connection ~ 6400 4875
Wire Wire Line
	6400 4875 6400 1875
Wire Wire Line
	3825 1000 3425 1000
Connection ~ 3425 1000
Wire Wire Line
	3825 1100 3550 1100
Connection ~ 3550 1100
Wire Wire Line
	7575 5100 6675 5100
Wire Wire Line
	6675 5100 6675 2975
Wire Wire Line
	6675 2975 5900 2975
Wire Wire Line
	3825 2925 3675 2925
Wire Wire Line
	3675 2925 3675 4575
Wire Wire Line
	3675 4575 3750 4575
Wire Wire Line
	3825 2775 3600 2775
Wire Wire Line
	3600 2775 3600 4900
Wire Wire Line
	3600 4900 3750 4900
$EndSCHEMATC
