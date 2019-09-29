EESchema Schematic File Version 4
LIBS:pluto-cache
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 6 7
Title "IDE interface for PLUTO"
Date "2016-11-07"
Rev "V1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L pluto-rescue:74LS574 U19
U 1 1 5932FB29
P 4950 1850
F 0 "U19" H 4950 1850 50  0000 C CNN
F 1 "74LS574" H 5150 1400 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket" H 4950 1850 50  0001 C CNN
F 3 "" H 4950 1850 50  0000 C CNN
	1    4950 1850
	-1   0    0    -1  
$EndComp
$Comp
L pluto-rescue:74LS574 U20
U 1 1 5932FB2A
P 4975 4050
F 0 "U20" H 4975 4050 50  0000 C CNN
F 1 "74LS574" H 5150 3575 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket" H 4975 4050 50  0001 C CNN
F 3 "" H 4975 4050 50  0000 C CNN
	1    4975 4050
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:74HC245 U21
U 1 1 5932FB2B
P 5000 5850
F 0 "U21" H 5100 6425 50  0000 L BNN
F 1 "74HC245" H 5000 5400 50  0000 L TNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket" H 5000 5850 50  0001 C CNN
F 3 "" H 5000 5850 50  0000 C CNN
	1    5000 5850
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:R R6
U 1 1 5932FB2F
P 9750 5450
F 0 "R6" V 9830 5450 50  0000 C CNN
F 1 "3.3K" V 9750 5450 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 9680 5450 50  0001 C CNN
F 3 "" H 9750 5450 50  0000 C CNN
	1    9750 5450
	0    1    1    0   
$EndComp
$Comp
L pluto-rescue:R R7
U 1 1 5932FB30
P 9750 5650
F 0 "R7" V 9830 5650 50  0000 C CNN
F 1 "1K" V 9750 5650 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 9680 5650 50  0001 C CNN
F 3 "" H 9750 5650 50  0000 C CNN
	1    9750 5650
	0    1    1    0   
$EndComp
$Comp
L pluto-rescue:R R8
U 1 1 5932FB31
P 9750 5850
F 0 "R8" V 9830 5850 50  0000 C CNN
F 1 "1K" V 9750 5850 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 9680 5850 50  0001 C CNN
F 3 "" H 9750 5850 50  0000 C CNN
	1    9750 5850
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR039
U 1 1 5932FB32
P 9500 5250
F 0 "#PWR039" H 9500 5100 50  0001 C CNN
F 1 "VCC" H 9500 5400 50  0000 C CNN
F 2 "" H 9500 5250 50  0000 C CNN
F 3 "" H 9500 5250 50  0000 C CNN
	1    9500 5250
	1    0    0    -1  
$EndComp
Text Label 6150 1350 2    60   ~ 0
IDE-D8
Text Label 6150 1450 2    60   ~ 0
IDE-D9
Text Label 6150 1550 2    60   ~ 0
IDE-D10
Text Label 6150 1650 2    60   ~ 0
IDE-D11
Text Label 6150 1750 2    60   ~ 0
IDE-D12
Text Label 6150 1850 2    60   ~ 0
IDE-D13
Text Label 6150 1950 2    60   ~ 0
IDE-D14
Text Label 6150 2050 2    60   ~ 0
IDE-D15
Text Label 6150 3550 2    60   ~ 0
IDE-D8
Text Label 6150 3650 2    60   ~ 0
IDE-D9
Text Label 6150 3750 2    60   ~ 0
IDE-D10
Text Label 6150 3850 2    60   ~ 0
IDE-D11
Text Label 6150 3950 2    60   ~ 0
IDE-D12
Text Label 6150 4050 2    60   ~ 0
IDE-D13
Text Label 6150 4150 2    60   ~ 0
IDE-D14
Text Label 6150 4250 2    60   ~ 0
IDE-D15
Text Label 3925 1350 0    60   ~ 0
IDE-D0
Text Label 3925 1450 0    60   ~ 0
IDE-D1
Text Label 3925 1550 0    60   ~ 0
IDE-D2
Text Label 3925 1650 0    60   ~ 0
IDE-D3
Text Label 3925 1750 0    60   ~ 0
IDE-D4
Text Label 3925 1850 0    60   ~ 0
IDE-D5
Text Label 3925 1950 0    60   ~ 0
IDE-D6
Text Label 3925 2050 0    60   ~ 0
IDE-D7
Text Label 3925 3550 0    60   ~ 0
IDE-D0
Text Label 3925 3650 0    60   ~ 0
IDE-D1
Text Label 3925 3750 0    60   ~ 0
IDE-D2
Text Label 3925 3850 0    60   ~ 0
IDE-D3
Text Label 3925 3950 0    60   ~ 0
IDE-D4
Text Label 3925 4050 0    60   ~ 0
IDE-D5
Text Label 3925 4150 0    60   ~ 0
IDE-D6
Text Label 3925 4250 0    60   ~ 0
IDE-D7
Text Label 6050 5350 2    60   ~ 0
IDE-D0
Text Label 6050 5450 2    60   ~ 0
IDE-D1
Text Label 6050 5550 2    60   ~ 0
IDE-D2
Text Label 6050 5650 2    60   ~ 0
IDE-D3
Text Label 6050 5750 2    60   ~ 0
IDE-D4
Text Label 6050 5850 2    60   ~ 0
IDE-D5
Text Label 6050 5950 2    60   ~ 0
IDE-D6
Text Label 6050 6050 2    60   ~ 0
IDE-D7
Text Label 3900 5350 0    60   ~ 0
D0
Text Label 3900 5450 0    60   ~ 0
D1
Text Label 3900 5550 0    60   ~ 0
D2
Text Label 3900 5650 0    60   ~ 0
D3
Text Label 3900 5750 0    60   ~ 0
D4
Text Label 3900 5850 0    60   ~ 0
D5
Text Label 3900 5950 0    60   ~ 0
D6
Text Label 3900 6050 0    60   ~ 0
D7
$Comp
L pluto-rescue:CONN_02X20-conn P1
U 1 1 5932FB36
P 10300 2825
F 0 "P1" H 10300 3875 50  0000 C CNN
F 1 "IDE0" V 10300 2825 50  0000 C CNN
F 2 "Connectors_IDC:IDC-Header_2x20_Pitch2.54mm_Straight" H 10300 1875 50  0001 C CNN
F 3 "" H 10300 1875 50  0000 C CNN
	1    10300 2825
	1    0    0    -1  
$EndComp
Text Label 9725 1875 0    60   ~ 0
~RES
Text Label 9650 1975 0    60   ~ 0
IDE-D7
Text Label 9650 2075 0    60   ~ 0
IDE-D6
Text Label 9650 2175 0    60   ~ 0
IDE-D5
Text Label 9650 2275 0    60   ~ 0
IDE-D4
Text Label 9650 2375 0    60   ~ 0
IDE-D3
Text Label 9650 2475 0    60   ~ 0
IDE-D2
Text Label 9650 2575 0    60   ~ 0
IDE-D1
Text Label 9650 2675 0    60   ~ 0
IDE-D0
Text Label 11050 1975 2    60   ~ 0
IDE-D8
Text Label 11050 2075 2    60   ~ 0
IDE-D9
Text Label 11050 2175 2    60   ~ 0
IDE-D10
Text Label 11050 2275 2    60   ~ 0
IDE-D11
Text Label 11050 2375 2    60   ~ 0
IDE-D12
Text Label 11050 2475 2    60   ~ 0
IDE-D13
Text Label 11050 2575 2    60   ~ 0
IDE-D14
Text Label 11050 2675 2    60   ~ 0
IDE-D15
NoConn ~ 10550 2775
Text Label 9650 2875 0    60   ~ 0
DMARQ
Text Label 9650 2975 0    60   ~ 0
~DIOW
Text Label 9650 3075 0    60   ~ 0
~DIOR
Text Label 9650 3175 0    60   ~ 0
IORDY
Text Label 9500 3275 0    60   ~ 0
~IDE:DMACK
Text Label 9650 3375 0    60   ~ 0
~IRQ
Text Label 8975 3475 0    60   ~ 0
A1
Text Label 8975 3575 0    60   ~ 0
A0
Text Label 11050 3575 2    60   ~ 0
A2
Text Label 9650 3675 0    60   ~ 0
~IDE:CS0
Text Label 9650 3775 0    60   ~ 0
~IDE:DASP
Text Label 11050 3675 2    60   ~ 0
~IDE:CS1
Text Label 11050 3775 2    60   ~ 0
GND
NoConn ~ 9650 2875
Text Label 9650 2775 0    60   ~ 0
GND
Text Label 11050 1875 2    60   ~ 0
GND
Text Label 11050 2875 2    60   ~ 0
GND
Text Label 11050 2975 2    60   ~ 0
GND
Text Label 11050 3075 2    60   ~ 0
GND
NoConn ~ 10550 3175
NoConn ~ 10550 3475
NoConn ~ 9650 3175
Text Label 11050 3275 2    60   ~ 0
GND
Text Label 10800 5450 2    60   ~ 0
~IDE:DMACK
Text Label 10800 5650 2    60   ~ 0
~IDE:CS1
Text Label 10800 5850 2    60   ~ 0
~IDE:DASP
Text Label 11050 3375 2    60   ~ 0
GND
Wire Wire Line
	9500 5250 9500 5450
Wire Wire Line
	9600 5650 9500 5650
Connection ~ 9500 5650
Wire Wire Line
	9600 5450 9500 5450
Connection ~ 9500 5450
Wire Wire Line
	9900 5450 10800 5450
Wire Wire Line
	9900 5650 10800 5650
Wire Wire Line
	9500 5850 9600 5850
Wire Wire Line
	9900 5850 10000 5850
Wire Wire Line
	10300 5850 10800 5850
Wire Wire Line
	5650 1350 6150 1350
Wire Wire Line
	5650 1450 6150 1450
Wire Wire Line
	5650 1550 6150 1550
Wire Wire Line
	5650 1650 6150 1650
Wire Wire Line
	5650 1750 6150 1750
Wire Wire Line
	5650 1850 6150 1850
Wire Wire Line
	5650 1950 6150 1950
Wire Wire Line
	5650 2050 6150 2050
Wire Wire Line
	5675 3550 6150 3550
Wire Wire Line
	5675 3650 6150 3650
Wire Wire Line
	5675 3750 6150 3750
Wire Wire Line
	5675 3850 6150 3850
Wire Wire Line
	5675 3950 6150 3950
Wire Wire Line
	5675 4050 6150 4050
Wire Wire Line
	5675 4150 6150 4150
Wire Wire Line
	5675 4250 6150 4250
Wire Wire Line
	4250 1350 3925 1350
Wire Wire Line
	4250 1450 3925 1450
Wire Wire Line
	4250 1550 3925 1550
Wire Wire Line
	4250 1650 3925 1650
Wire Wire Line
	4250 1750 3925 1750
Wire Wire Line
	4250 1850 3925 1850
Wire Wire Line
	4250 1950 3925 1950
Wire Wire Line
	4250 2050 3925 2050
Wire Wire Line
	4275 3550 3925 3550
Wire Wire Line
	4275 3650 3925 3650
Wire Wire Line
	4275 3750 3925 3750
Wire Wire Line
	4275 3850 3925 3850
Wire Wire Line
	4275 3950 3925 3950
Wire Wire Line
	4275 4050 3925 4050
Wire Wire Line
	4275 4150 3925 4150
Wire Wire Line
	4275 4250 3925 4250
Wire Wire Line
	5700 5350 6050 5350
Wire Wire Line
	5700 5450 6050 5450
Wire Wire Line
	5700 5550 6050 5550
Wire Wire Line
	5700 5650 6050 5650
Wire Wire Line
	5700 5750 6050 5750
Wire Wire Line
	5700 5850 6050 5850
Wire Wire Line
	5700 5950 6050 5950
Wire Wire Line
	5700 6050 6050 6050
Wire Wire Line
	4300 5350 3900 5350
Wire Wire Line
	4300 5450 3900 5450
Wire Wire Line
	4300 5550 3900 5550
Wire Wire Line
	4300 5650 3900 5650
Wire Wire Line
	4300 5750 3900 5750
Wire Wire Line
	4300 5850 3900 5850
Wire Wire Line
	4300 5950 3900 5950
Wire Wire Line
	4300 6050 3900 6050
Wire Wire Line
	9650 1875 10050 1875
Wire Wire Line
	10050 1975 9650 1975
Wire Wire Line
	10050 2075 9650 2075
Wire Wire Line
	10050 2175 9650 2175
Wire Wire Line
	10050 2275 9650 2275
Wire Wire Line
	10050 2375 9650 2375
Wire Wire Line
	10050 2475 9650 2475
Wire Wire Line
	10050 2575 9650 2575
Wire Wire Line
	10050 2675 9650 2675
Wire Wire Line
	10050 2775 9650 2775
Wire Wire Line
	10050 2875 9650 2875
Wire Wire Line
	10050 2975 9500 2975
Wire Wire Line
	10050 3075 9500 3075
Wire Wire Line
	10050 3175 9650 3175
Wire Wire Line
	10050 3275 9500 3275
Wire Wire Line
	10050 3475 8975 3475
Wire Wire Line
	10050 3575 8975 3575
Wire Wire Line
	10050 3675 9650 3675
Wire Wire Line
	10050 3775 9650 3775
Wire Wire Line
	10550 1975 11050 1975
Wire Wire Line
	10550 2075 11050 2075
Wire Wire Line
	10550 2175 11050 2175
Wire Wire Line
	10550 2275 11050 2275
Wire Wire Line
	10550 2375 11050 2375
Wire Wire Line
	10550 2475 11050 2475
Wire Wire Line
	10550 2575 11050 2575
Wire Wire Line
	10550 2675 11050 2675
Wire Wire Line
	10550 2875 11325 2875
Wire Wire Line
	10550 2975 11325 2975
Wire Wire Line
	11325 3075 10550 3075
Wire Wire Line
	11325 3275 10550 3275
Wire Wire Line
	10550 3575 11050 3575
Wire Wire Line
	10550 3675 11050 3675
Wire Wire Line
	11325 3775 10550 3775
Wire Wire Line
	10550 1875 11050 1875
Wire Wire Line
	8975 3375 10050 3375
Wire Wire Line
	11325 3375 10550 3375
Entry Wire Line
	6150 1350 6250 1450
Entry Wire Line
	6150 1450 6250 1550
Entry Wire Line
	6150 1550 6250 1650
Entry Wire Line
	6150 1650 6250 1750
Entry Wire Line
	6150 1750 6250 1850
Entry Wire Line
	6150 1850 6250 1950
Entry Wire Line
	6150 1950 6250 2050
Entry Wire Line
	6150 2050 6250 2150
Entry Wire Line
	6150 3550 6250 3450
Entry Wire Line
	6150 3650 6250 3550
Entry Wire Line
	6150 3750 6250 3650
Entry Wire Line
	6150 3850 6250 3750
Entry Wire Line
	6150 3950 6250 3850
Entry Wire Line
	6150 4050 6250 3950
Entry Wire Line
	6150 4150 6250 4050
Entry Wire Line
	6150 4250 6250 4150
Entry Wire Line
	6050 5350 6150 5250
Entry Wire Line
	6050 5450 6150 5350
Entry Wire Line
	6050 5550 6150 5450
Entry Wire Line
	6050 5650 6150 5550
Entry Wire Line
	6050 5750 6150 5650
Entry Wire Line
	6050 5850 6150 5750
Entry Wire Line
	6050 5950 6150 5850
Entry Wire Line
	6050 6050 6150 5950
Text Notes 4525 2550 0    60   ~ 0
High byte from IDE\n
Text Notes 4600 4750 0    60   ~ 0
High byte to IDE
Entry Wire Line
	3825 1450 3925 1350
Entry Wire Line
	3825 1550 3925 1450
Entry Wire Line
	3825 1650 3925 1550
Entry Wire Line
	3825 1750 3925 1650
Entry Wire Line
	3825 1850 3925 1750
Entry Wire Line
	3825 1950 3925 1850
Entry Wire Line
	3825 2050 3925 1950
Entry Wire Line
	3825 2150 3925 2050
Entry Wire Line
	3825 3650 3925 3550
Entry Wire Line
	3825 3750 3925 3650
Entry Wire Line
	3825 3850 3925 3750
Entry Wire Line
	3825 3950 3925 3850
Entry Wire Line
	3825 4050 3925 3950
Entry Wire Line
	3825 4150 3925 4050
Entry Wire Line
	3825 4250 3925 4150
Entry Wire Line
	3825 4350 3925 4250
Entry Wire Line
	3800 5450 3900 5350
Entry Wire Line
	3800 5550 3900 5450
Entry Wire Line
	3800 5650 3900 5550
Entry Wire Line
	3800 5750 3900 5650
Entry Wire Line
	3800 5850 3900 5750
Entry Wire Line
	3800 5950 3900 5850
Entry Wire Line
	3800 6050 3900 5950
Entry Wire Line
	3800 6150 3900 6050
Text Label 8900 1450 2    60   ~ 0
IDE[D8..D15]
Wire Bus Line
	3825 5025 6150 5025
Entry Wire Line
	11050 1975 11150 2075
Entry Wire Line
	11050 2075 11150 2175
Entry Wire Line
	11050 2175 11150 2275
Entry Wire Line
	11050 2275 11150 2375
Entry Wire Line
	11050 2375 11150 2475
Entry Wire Line
	11050 2475 11150 2575
Entry Wire Line
	11050 2575 11150 2675
Entry Wire Line
	11050 2675 11150 2775
Entry Wire Line
	9550 1875 9650 1975
Entry Wire Line
	9550 1975 9650 2075
Entry Wire Line
	9550 2075 9650 2175
Entry Wire Line
	9550 2175 9650 2275
Entry Wire Line
	9550 2275 9650 2375
Entry Wire Line
	9550 2375 9650 2475
Entry Wire Line
	9550 2475 9650 2575
Entry Wire Line
	9550 2575 9650 2675
Wire Bus Line
	11150 2775 11775 2775
Text Label 7900 1875 0    60   ~ 0
IDE[D0..D7]
Wire Bus Line
	3800 6775 3225 6775
Text Label 3450 6775 0    60   ~ 0
D[0..7]
Text HLabel 3225 6775 0    60   BiDi ~ 0
D[0..7]
$Comp
L power:GND #PWR040
U 1 1 5933B988
P 11050 1875
F 0 "#PWR040" H 11050 1625 50  0001 C CNN
F 1 "GND" H 11050 1725 50  0000 C CNN
F 2 "" H 11050 1875 50  0001 C CNN
F 3 "" H 11050 1875 50  0001 C CNN
	1    11050 1875
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR041
U 1 1 5933C0BC
P 9650 2775
F 0 "#PWR041" H 9650 2525 50  0001 C CNN
F 1 "GND" H 9650 2625 50  0000 C CNN
F 2 "" H 9650 2775 50  0001 C CNN
F 3 "" H 9650 2775 50  0001 C CNN
	1    9650 2775
	0    1    1    0   
$EndComp
Wire Wire Line
	9650 1875 9650 1650
Wire Wire Line
	9650 1650 8975 1650
Text HLabel 8975 1650 0    60   Input ~ 0
~RES
Text HLabel 8975 3375 0    60   Output ~ 0
~IRQ
$Comp
L power:GND #PWR042
U 1 1 5934CB71
P 11325 3775
F 0 "#PWR042" H 11325 3525 50  0001 C CNN
F 1 "GND" H 11325 3625 50  0000 C CNN
F 2 "" H 11325 3775 50  0001 C CNN
F 3 "" H 11325 3775 50  0001 C CNN
	1    11325 3775
	1    0    0    -1  
$EndComp
Wire Wire Line
	11325 2875 11325 2975
Connection ~ 11325 3375
Connection ~ 11325 3275
Connection ~ 11325 3075
Connection ~ 11325 2975
Entry Wire Line
	8875 3675 8975 3575
Entry Wire Line
	8875 3575 8975 3475
Wire Bus Line
	8875 3575 8875 3675
Wire Bus Line
	8875 3675 8400 3675
Text Label 8400 3675 0    60   ~ 0
A[0..15]
Text HLabel 8400 3675 0    60   Input ~ 0
A[0..15]
$Comp
L pluto-rescue:LED D3
U 1 1 59388E35
P 10150 5850
F 0 "D3" H 10150 5950 50  0000 C CNN
F 1 "LED" H 10150 5750 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 10150 5850 50  0001 C CNN
F 3 "" H 10150 5850 50  0001 C CNN
	1    10150 5850
	-1   0    0    1   
$EndComp
Text HLabel 4250 4550 0    60   Input ~ 0
TO_OE
Text HLabel 4250 4450 0    60   Input ~ 0
TO_CLK
Text HLabel 5675 2250 2    60   Input ~ 0
FROM_CLK
Text HLabel 5675 2350 2    60   Input ~ 0
FROM_OE
Text HLabel 4275 6250 0    60   Input ~ 0
OBT_DIR
Text HLabel 4275 6350 0    60   Input ~ 0
OBT_OE
Wire Wire Line
	5650 2250 5675 2250
Wire Wire Line
	5650 2350 5675 2350
Wire Wire Line
	4275 4450 4250 4450
Wire Wire Line
	4275 4550 4250 4550
Wire Wire Line
	4300 6250 4275 6250
Wire Wire Line
	4300 6350 4275 6350
Text HLabel 9650 3675 0    60   Input ~ 0
IDE_CS0
Text HLabel 9500 3075 0    60   Input ~ 0
DIOR
Text HLabel 9500 2975 0    60   Input ~ 0
DIOW
Wire Wire Line
	9500 5650 9500 5850
Wire Wire Line
	9500 5450 9500 5650
Wire Wire Line
	11325 3375 11325 3775
Wire Wire Line
	11325 3275 11325 3375
Wire Wire Line
	11325 3075 11325 3275
Wire Wire Line
	11325 2975 11325 3075
Wire Bus Line
	6250 1450 11775 1450
Wire Bus Line
	11775 1450 11775 2775
Wire Bus Line
	7650 5950 7650 1875
Wire Bus Line
	7650 1875 9550 1875
Wire Bus Line
	6150 5950 7650 5950
Wire Bus Line
	11150 2075 11150 2775
Wire Bus Line
	9550 1875 9550 2575
Wire Bus Line
	3800 5450 3800 6775
Wire Bus Line
	6150 5025 6150 5950
Wire Bus Line
	6250 1450 6250 4150
Wire Bus Line
	3825 1450 3825 5025
$EndSCHEMATC
