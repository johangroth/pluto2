EESchema Schematic File Version 4
LIBS:pluto-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
Title "Clock, pullups and decoding logic"
Date "2017-03-25"
Rev "0.1"
Comp "Linux Grotto"
Comment1 "The decoding logic is a slightly modied version of Daryl Rictor's SBC-2 v2.5"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L pluto-rescue:R_Network07-device RN2
U 1 1 58D6C524
P 3950 1400
F 0 "RN2" V 3550 1400 50  0000 C CNN
F 1 "3.3 kOhm" V 4350 1400 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP8" V 4425 1400 50  0001 C CNN
F 3 "" H 3950 1400 50  0001 C CNN
	1    3950 1400
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:CXO_DIP8-Oscillators X1
U 1 1 58D6C921
P 4350 6450
F 0 "X1" H 4150 6700 50  0000 L CNN
F 1 "8 MHz" H 4400 6200 50  0000 L CNN
F 2 "Oscillators:Oscillator_DIP-8" H 4800 6100 50  0001 C CNN
F 3 "" H 4250 6450 50  0001 C CNN
	1    4350 6450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR09
U 1 1 58D6CEDE
P 4350 6050
F 0 "#PWR09" H 4350 5900 50  0001 C CNN
F 1 "VCC" H 4350 6200 50  0000 C CNN
F 2 "" H 4350 6050 50  0001 C CNN
F 3 "" H 4350 6050 50  0001 C CNN
	1    4350 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 58D6CF02
P 4350 6925
F 0 "#PWR010" H 4350 6675 50  0001 C CNN
F 1 "GND" H 4350 6775 50  0000 C CNN
F 2 "" H 4350 6925 50  0001 C CNN
F 3 "" H 4350 6925 50  0001 C CNN
	1    4350 6925
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR011
U 1 1 58D6D2F3
P 2050 2675
F 0 "#PWR011" H 2050 2525 50  0001 C CNN
F 1 "VCC" H 2050 2825 50  0000 C CNN
F 2 "" H 2050 2675 50  0001 C CNN
F 3 "" H 2050 2675 50  0001 C CNN
	1    2050 2675
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:SW_Push-switches SW1
U 1 1 58D6D3A4
P 1650 3650
F 0 "SW1" H 1575 3550 50  0000 L CNN
F 1 "RESET" H 1650 3825 50  0000 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_PUSH_6mm_h4.3mm" H 1650 3850 50  0001 C CNN
F 3 "" H 1650 3850 50  0001 C CNN
	1    1650 3650
	0    -1   -1   0   
$EndComp
Text Label 6450 6250 2    60   ~ 0
CLK
Text HLabel 6475 6250 2    60   Output ~ 0
CLK
Entry Wire Line
	7475 1375 7575 1275
Entry Wire Line
	7475 1500 7575 1400
Entry Wire Line
	7475 1625 7575 1525
Entry Wire Line
	7475 1750 7575 1650
Entry Wire Line
	7475 1875 7575 1775
Entry Wire Line
	7475 2000 7575 1900
Entry Wire Line
	7475 2125 7575 2025
Entry Wire Line
	7475 2250 7575 2150
Text HLabel 6475 1250 0    60   Input ~ 0
A[0..15]
Text HLabel 10000 1775 2    60   Output ~ 0
~MRD
Text HLabel 10000 1900 2    60   Output ~ 0
~MWR
Text HLabel 10000 1650 2    60   Output ~ 0
~ROMSEL
Text HLabel 10000 1525 2    60   Output ~ 0
~RAMSEL
Text HLabel 10000 1275 2    60   Input ~ 0
CLK
Text HLabel 10000 1400 2    60   Input ~ 0
R/~W
Text HLabel 4575 1800 2    60   BiDi ~ 0
~IRQ
Text HLabel 4575 1975 2    60   BiDi ~ 0
~NMI
Text HLabel 4575 2125 2    60   Output ~ 0
BE
Text HLabel 4575 2275 2    60   Output ~ 0
~PWR
Text HLabel 4575 2425 2    60   Output ~ 0
RDY
Text HLabel 4575 2575 2    60   Output ~ 0
~RES
Text HLabel 7800 3275 0    60   Output ~ 0
~7F8X
Text HLabel 1975 6925 2    60   Output ~ 0
~KS
$Comp
L pluto-rescue:R_Network07-device RN1
U 1 1 594C05A8
P 1350 6000
F 0 "RN1" V 950 6000 50  0000 C CNN
F 1 "3.3 kOhm" V 1750 6000 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP8" V 1825 6000 50  0001 C CNN
F 3 "" H 1350 6000 50  0001 C CNN
	1    1350 6000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR013
U 1 1 594C0808
P 1050 5800
F 0 "#PWR013" H 1050 5650 50  0001 C CNN
F 1 "VCC" H 1050 5950 50  0000 C CNN
F 2 "" H 1050 5800 50  0001 C CNN
F 3 "" H 1050 5800 50  0001 C CNN
	1    1050 5800
	1    0    0    -1  
$EndComp
Text HLabel 1975 6400 2    60   Output ~ 0
~SO
$Comp
L power:VCC #PWR014
U 1 1 594C1459
P 3650 1025
F 0 "#PWR014" H 3650 875 50  0001 C CNN
F 1 "VCC" H 3650 1175 50  0000 C CNN
F 2 "" H 3650 1025 50  0001 C CNN
F 3 "" H 3650 1025 50  0001 C CNN
	1    3650 1025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 595DE156
P 2650 7025
F 0 "#PWR015" H 2650 6775 50  0001 C CNN
F 1 "GND" H 2650 6875 50  0000 C CNN
F 2 "" H 2650 7025 50  0001 C CNN
F 3 "" H 2650 7025 50  0001 C CNN
	1    2650 7025
	1    0    0    -1  
$EndComp
NoConn ~ 3850 6150
NoConn ~ 3850 6550
NoConn ~ 4050 6450
$Comp
L pluto-rescue:74HC74 U8
U 2 1 59EC7963
P 5500 6450
F 0 "U8" H 5650 6750 50  0000 C CNN
F 1 "74HC74" H 5800 6155 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm_Socket" H 5500 6450 50  0001 C CNN
F 3 "" H 5500 6450 50  0001 C CNN
	2    5500 6450
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:74HC74 U8
U 1 1 59EC7994
P 3250 6350
F 0 "U8" H 3400 6650 50  0000 C CNN
F 1 "74HC74" H 3550 6055 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm_Socket" H 3250 6350 50  0001 C CNN
F 3 "" H 3250 6350 50  0001 C CNN
	1    3250 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 59F107DB
P 8700 4450
F 0 "#PWR016" H 8700 4200 50  0001 C CNN
F 1 "GND" H 8700 4300 50  0000 C CNN
F 2 "" H 8700 4450 50  0001 C CNN
F 3 "" H 8700 4450 50  0001 C CNN
	1    8700 4450
	1    0    0    -1  
$EndComp
Text Label 7575 1400 0    60   ~ 0
A5
Text Label 7575 1525 0    60   ~ 0
A6
Text Label 7575 1650 0    60   ~ 0
A7
Text Label 7575 1775 0    60   ~ 0
A8
Text Label 7575 1900 0    60   ~ 0
A9
Text Label 7575 2025 0    60   ~ 0
A10
Text Label 7575 2150 0    60   ~ 0
A11
Text Label 7575 2275 0    60   ~ 0
A12
Text Label 7575 2400 0    60   ~ 0
A13
Text Label 7575 2525 0    60   ~ 0
A14
Text Label 7575 2650 0    60   ~ 0
A15
Text Label 10000 1525 2    60   ~ 0
~RAMSEL
Text Label 10000 1650 2    60   ~ 0
~ROMSEL
Text Label 10000 1900 2    60   ~ 0
~MWR
Text Label 10000 1775 2    60   ~ 0
~MRD
Text Label 10000 1400 2    60   ~ 0
R/~W
Text Label 10000 1275 2    60   ~ 0
CLK
Entry Wire Line
	7475 2375 7575 2275
Entry Wire Line
	7475 2625 7575 2525
Text HLabel 9875 3675 2    60   Input ~ 0
TDI
Text HLabel 9875 3775 2    60   Output ~ 0
TDO
Text HLabel 9875 3475 2    60   Input ~ 0
TCK
Text HLabel 9875 3575 2    60   Input ~ 0
TMS
NoConn ~ 1050 6200
Entry Wire Line
	7475 2500 7575 2400
$Comp
L power:VCC #PWR017
U 1 1 59F10359
P 8650 700
F 0 "#PWR017" H 8650 550 50  0001 C CNN
F 1 "VCC" H 8525 775 50  0000 C CNN
F 2 "" H 8650 700 50  0001 C CNN
F 3 "" H 8650 700 50  0001 C CNN
	1    8650 700 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR018
U 1 1 59F43AD4
P 8750 700
F 0 "#PWR018" H 8750 550 50  0001 C CNN
F 1 "VCC" H 8875 775 50  0000 C CNN
F 2 "" H 8750 700 50  0001 C CNN
F 3 "" H 8750 700 50  0001 C CNN
	1    8750 700 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 59F43B3B
P 8875 4450
F 0 "#PWR019" H 8875 4200 50  0001 C CNN
F 1 "GND" H 8875 4300 50  0000 C CNN
F 2 "" H 8875 4450 50  0001 C CNN
F 3 "" H 8875 4450 50  0001 C CNN
	1    8875 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 59F43B5E
P 8525 4450
F 0 "#PWR020" H 8525 4200 50  0001 C CNN
F 1 "GND" H 8525 4300 50  0000 C CNN
F 2 "" H 8525 4450 50  0001 C CNN
F 3 "" H 8525 4450 50  0001 C CNN
	1    8525 4450
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:C_Small-device C22
U 1 1 59F44526
P 9375 4350
F 0 "C22" V 9250 4300 50  0000 L CNN
F 1 "0.1uF" V 9500 4250 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 9375 4350 50  0001 C CNN
F 3 "" H 9375 4350 50  0001 C CNN
	1    9375 4350
	0    1    1    0   
$EndComp
$Comp
L pluto-rescue:C_Small-device C21
U 1 1 59F44553
P 8175 4350
F 0 "C21" V 8050 4300 50  0000 L CNN
F 1 "0.1uF" V 8300 4225 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 8175 4350 50  0001 C CNN
F 3 "" H 8175 4350 50  0001 C CNN
	1    8175 4350
	0    1    1    0   
$EndComp
Text HLabel 1975 6725 2    60   Input ~ 0
TDI
Text HLabel 1975 6825 2    60   Output ~ 0
TDO
Text HLabel 1975 6525 2    60   Input ~ 0
TCK
Text HLabel 1975 6625 2    60   Input ~ 0
TMS
Text Label 7575 1275 0    60   ~ 0
A3
Entry Wire Line
	7475 2750 7575 2650
$Comp
L pluto:ispMACH4A5 U7
U 1 1 59F0F447
P 8700 2150
F 0 "U7" H 8275 3275 60  0000 C CNN
F 1 "ispMACH4A5" V 8700 1775 60  0000 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 8375 2125 60  0001 C CNN
F 3 "" H 8375 2125 60  0001 C CNN
	1    8700 2150
	1    0    0    -1  
$EndComp
Text HLabel 10000 2275 2    60   Output ~ 0
FROM_OE
Text HLabel 10000 2400 2    60   Output ~ 0
FROM_CLK
Text HLabel 10000 2525 2    60   Output ~ 0
TO_OE
Text HLabel 10000 2650 2    60   Output ~ 0
TO_CLK
Text HLabel 10000 2775 2    60   Output ~ 0
OBT_OE
Text HLabel 10000 2900 2    60   Output ~ 0
OBT_DIR
Text HLabel 10000 3025 2    60   Output ~ 0
DIOR
Text HLabel 10000 3150 2    60   Output ~ 0
DIOW
Text HLabel 10000 3275 2    60   Output ~ 0
IDE_CS0
Text Label 6475 1250 0    60   ~ 0
A[0..15]
Text HLabel 7800 2900 0    60   Output ~ 0
~7FEX
$Comp
L pluto:TL7705B U5
U 1 1 5A37C438
P 2850 3225
F 0 "U5" H 3100 3675 50  0000 C CNN
F 1 "TL7705B" H 3150 2777 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 2850 3225 50  0001 C CNN
F 3 "" H 2850 3225 50  0001 C CNN
	1    2850 3225
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:R_Small-device R2
U 1 1 5A37C778
P 1650 2975
F 0 "R2" H 1680 2995 50  0000 L CNN
F 1 "22k" V 1575 2900 50  0000 L CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0411_L9.9mm_D3.6mm_P7.62mm_Vertical" H 1650 2975 50  0001 C CNN
F 3 "" H 1650 2975 50  0001 C CNN
	1    1650 2975
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:R_Small-device R3
U 1 1 5A37C7D7
P 2050 3700
F 0 "R3" H 2080 3720 50  0000 L CNN
F 1 "475" V 1975 3625 50  0000 L CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0411_L9.9mm_D3.6mm_P7.62mm_Vertical" H 2050 3700 50  0001 C CNN
F 3 "" H 2050 3700 50  0001 C CNN
	1    2050 3700
	1    0    0    -1  
$EndComp
Text HLabel 4575 2725 2    60   Output ~ 0
RES
$Comp
L pluto-rescue:CP_Small-device C4
U 1 1 5A37EF31
P 2050 4025
F 0 "C4" H 2060 4095 50  0000 L CNN
F 1 "15uF" V 1950 3950 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_Tantal_D4.5mm_P2.50mm" H 2050 4025 50  0001 C CNN
F 3 "" H 2050 4025 50  0001 C CNN
	1    2050 4025
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:C_Small-device C6
U 1 1 5A37FB89
P 3650 3625
F 0 "C6" H 3650 3700 50  0000 L CNN
F 1 "0.1uF" H 3425 3550 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 3650 3625 50  0001 C CNN
F 3 "" H 3650 3625 50  0001 C CNN
	1    3650 3625
	1    0    0    -1  
$EndComp
Text HLabel 7800 3150 0    60   Output ~ 0
~7FAX
Text HLabel 7800 3025 0    60   Output ~ 0
~7FCX
NoConn ~ 7975 3400
NoConn ~ 9425 2025
NoConn ~ 9425 2150
$Comp
L pluto-rescue:R_Small-device R4
U 1 1 5A3880A9
P 3950 3475
F 0 "R4" V 4025 3450 50  0000 L CNN
F 1 "3.3k" V 3875 3400 50  0000 L CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0411_L9.9mm_D3.6mm_P7.62mm_Vertical" H 3950 3475 50  0001 C CNN
F 3 "" H 3950 3475 50  0001 C CNN
	1    3950 3475
	-1   0    0    1   
$EndComp
NoConn ~ 3750 1600
Wire Wire Line
	4250 1600 4250 1800
Wire Wire Line
	4250 1800 4575 1800
Wire Wire Line
	4150 1600 4150 1975
Wire Wire Line
	4150 1975 4575 1975
Wire Wire Line
	4050 1600 4050 2125
Wire Wire Line
	4050 2125 4575 2125
Wire Wire Line
	3950 1600 3950 2275
Wire Wire Line
	3950 2275 4575 2275
Wire Wire Line
	3850 1600 3850 2425
Wire Wire Line
	3850 2425 4575 2425
Wire Wire Line
	3650 1200 3650 1025
Wire Wire Line
	4650 6450 4900 6450
Wire Wire Line
	4350 6750 4350 6925
Wire Wire Line
	4350 6150 4350 6050
Wire Wire Line
	4750 7000 5500 7000
Wire Wire Line
	4750 5900 4750 6150
Wire Wire Line
	4750 6150 4350 6150
Wire Wire Line
	5500 5900 4750 5900
Connection ~ 4750 6150
Wire Wire Line
	4900 6250 4900 5800
Wire Wire Line
	4900 5800 6200 5800
Wire Wire Line
	6200 5800 6200 6650
Wire Wire Line
	6200 6650 6100 6650
Wire Wire Line
	6100 6250 6475 6250
Wire Wire Line
	3250 5800 2650 5800
Wire Wire Line
	2650 5800 2650 6150
Connection ~ 2650 6150
Connection ~ 2650 6350
Wire Wire Line
	3250 6900 2650 6900
Connection ~ 2650 6900
Wire Wire Line
	1650 6200 1650 6400
Wire Wire Line
	1650 6400 1975 6400
Wire Wire Line
	9475 4350 10925 4350
Wire Wire Line
	10925 4350 10925 800 
Wire Wire Line
	8075 4350 7125 4350
Wire Wire Line
	7125 4350 7125 800 
Wire Wire Line
	8750 700  8750 800 
Wire Wire Line
	8650 700  8650 800 
Wire Wire Line
	7125 800  8650 800 
Connection ~ 8650 800 
Wire Wire Line
	10925 800  8750 800 
Connection ~ 8750 800 
Wire Wire Line
	1975 6525 1550 6525
Wire Wire Line
	1550 6525 1550 6200
Wire Wire Line
	1450 6200 1450 6625
Wire Wire Line
	1450 6625 1975 6625
Wire Wire Line
	1975 6725 1350 6725
Wire Wire Line
	1350 6725 1350 6200
Wire Wire Line
	1250 6200 1250 6825
Wire Wire Line
	1250 6825 1975 6825
Wire Wire Line
	9425 3475 9875 3475
Wire Wire Line
	9425 3575 9875 3575
Wire Wire Line
	9425 3675 9875 3675
Wire Wire Line
	9425 3775 9875 3775
Wire Wire Line
	8875 4275 8875 4350
Wire Wire Line
	9275 4350 8875 4350
Connection ~ 8875 4350
Wire Wire Line
	8525 4275 8525 4350
Wire Wire Line
	8275 4350 8525 4350
Connection ~ 8525 4350
Wire Wire Line
	8650 4275 8700 4275
Wire Wire Line
	8700 4450 8700 4275
Connection ~ 8700 4275
Wire Wire Line
	7975 1275 7575 1275
Wire Wire Line
	7975 1400 7575 1400
Wire Wire Line
	7975 1900 7575 1900
Wire Wire Line
	7975 2025 7575 2025
Wire Wire Line
	7975 2150 7575 2150
Wire Wire Line
	7975 1775 7575 1775
Wire Wire Line
	7975 2275 7575 2275
Wire Wire Line
	7975 2400 7575 2400
Wire Wire Line
	7975 2525 7575 2525
Wire Wire Line
	7975 2650 7575 2650
Wire Wire Line
	7975 1525 7575 1525
Wire Wire Line
	7975 1650 7575 1650
Wire Wire Line
	7800 3275 7975 3275
Wire Wire Line
	9425 1275 10000 1275
Wire Wire Line
	9425 2400 10000 2400
Wire Wire Line
	9425 2525 10000 2525
Wire Wire Line
	9425 1775 10000 1775
Wire Wire Line
	9425 2650 10000 2650
Wire Wire Line
	9425 2775 10000 2775
Wire Wire Line
	9425 2900 10000 2900
Wire Wire Line
	9425 3025 10000 3025
Wire Wire Line
	9425 2275 10000 2275
Wire Wire Line
	9425 3150 10000 3150
Wire Wire Line
	9425 3275 10000 3275
Wire Wire Line
	9425 1400 10000 1400
Wire Wire Line
	9425 1525 10000 1525
Wire Wire Line
	9425 1650 10000 1650
Wire Wire Line
	9425 1900 10000 1900
Wire Bus Line
	7475 1250 6475 1250
Wire Wire Line
	7975 2900 7800 2900
Wire Wire Line
	1150 6200 1150 6925
Wire Wire Line
	1150 6925 1975 6925
Wire Wire Line
	3650 1600 3650 2575
Wire Wire Line
	3650 2575 4575 2575
Connection ~ 3650 2575
Wire Wire Line
	2050 3000 2050 2675
Wire Wire Line
	1650 2675 2050 2675
Wire Wire Line
	2050 3225 1650 3225
Wire Wire Line
	2050 3450 2050 3600
Wire Wire Line
	2050 3800 2050 3925
Wire Wire Line
	3650 3450 3650 3525
Wire Wire Line
	7975 3150 7800 3150
Wire Wire Line
	7975 3025 7800 3025
Wire Wire Line
	3950 2725 3950 3225
Wire Wire Line
	3950 2725 4575 2725
Wire Wire Line
	3650 3225 3950 3225
Connection ~ 3950 3225
$Comp
L power:GND #PWR0101
U 1 1 5A4A00BC
P 2850 4125
F 0 "#PWR0101" H 2850 3875 50  0001 C CNN
F 1 "GND" H 2850 3975 50  0000 C CNN
F 2 "" H 2850 4125 50  0001 C CNN
F 3 "" H 2850 4125 50  0001 C CNN
	1    2850 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4125 2850 3775
Wire Wire Line
	1650 4125 2050 4125
Wire Wire Line
	1650 3075 1650 3225
Wire Wire Line
	1650 3850 1650 4125
Connection ~ 2050 4125
Connection ~ 1650 3225
Wire Wire Line
	1650 2875 1650 2675
Connection ~ 2050 2675
Wire Wire Line
	4750 6150 4750 7000
Wire Wire Line
	2650 6150 2650 6350
Wire Wire Line
	2650 6350 2650 6900
Wire Wire Line
	2650 6900 2650 7025
Wire Wire Line
	8650 800  8650 900 
Wire Wire Line
	8750 800  8750 900 
Wire Wire Line
	8875 4350 8875 4450
Wire Wire Line
	8525 4350 8525 4450
Wire Wire Line
	8700 4275 8775 4275
Wire Wire Line
	3650 2575 3650 3000
Wire Wire Line
	3950 3225 3950 3375
Wire Wire Line
	2050 4125 2850 4125
Wire Wire Line
	1650 3225 1650 3450
Wire Wire Line
	2050 2675 2850 2675
Wire Wire Line
	2850 4125 3650 4125
Wire Wire Line
	3950 4125 3950 3575
Connection ~ 2850 4125
Wire Wire Line
	3650 3725 3650 4125
Connection ~ 3650 4125
Wire Wire Line
	3650 4125 3950 4125
Wire Bus Line
	7475 1250 7475 2750
$EndSCHEMATC
