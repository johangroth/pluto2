EESchema Schematic File Version 4
LIBS:pluto-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 7
Title "Power supply and mounting holes"
Date "2017-06-07"
Rev "0.1"
Comp "Linux Grotto"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L pluto-rescue:Mounting_Hole-mechanical MK2
U 1 1 59149E60
P 1825 3025
F 0 "MK2" H 1825 3225 50  0000 C CNN
F 1 "Mounting_Hole" H 1825 3150 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 1825 3025 50  0001 C CNN
F 3 "" H 1825 3025 50  0001 C CNN
	1    1825 3025
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:Mounting_Hole-mechanical MK3
U 1 1 59149E83
P 1825 3450
F 0 "MK3" H 1825 3650 50  0000 C CNN
F 1 "Mounting_Hole" H 1825 3575 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 1825 3450 50  0001 C CNN
F 3 "" H 1825 3450 50  0001 C CNN
	1    1825 3450
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:Mounting_Hole-mechanical MK1
U 1 1 5932DD04
P 1125 3950
F 0 "MK1" H 1125 4150 50  0000 C CNN
F 1 "Mounting_Hole" H 1125 4075 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 1125 3950 50  0001 C CNN
F 3 "" H 1125 3950 50  0001 C CNN
	1    1125 3950
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:Mounting_Hole-mechanical MK4
U 1 1 5932DD62
P 1825 3950
F 0 "MK4" H 1825 4150 50  0000 C CNN
F 1 "Mounting_Hole" H 1825 4075 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 1825 3950 50  0001 C CNN
F 3 "" H 1825 3950 50  0001 C CNN
	1    1825 3950
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:CONN_02X05-conn J8
U 1 1 59F22BEE
P 4275 3000
F 0 "J8" H 4275 3300 50  0000 C CNN
F 1 "JTAG" H 4275 2700 50  0000 C CNN
F 2 "Connectors_IDC:IDC-Header_2x05_Pitch2.54mm_Straight" H 4275 1800 50  0001 C CNN
F 3 "" H 4275 1800 50  0001 C CNN
	1    4275 3000
	1    0    0    -1  
$EndComp
Text HLabel 3775 3000 0    60   Output ~ 0
TDI
Text HLabel 3775 3100 0    60   Input ~ 0
TDO
Text HLabel 3775 2800 0    60   Output ~ 0
TCK
Text HLabel 3775 2900 0    60   Output ~ 0
TMS
Wire Wire Line
	3775 2800 4025 2800
Wire Wire Line
	3775 2900 4025 2900
Wire Wire Line
	3775 3000 4025 3000
Wire Wire Line
	3775 3100 4025 3100
Wire Wire Line
	4525 2800 4775 2800
Wire Wire Line
	4775 2900 4525 2900
Wire Wire Line
	4525 3000 4900 3000
Wire Wire Line
	4775 3100 4525 3100
Wire Wire Line
	4775 2675 4775 2800
Connection ~ 4775 2800
$Comp
L power:GND #PWR024
U 1 1 59F407A0
P 4775 2675
F 0 "#PWR024" H 4775 2425 50  0001 C CNN
F 1 "GND" H 4775 2525 50  0000 C CNN
F 2 "" H 4775 2675 50  0001 C CNN
F 3 "" H 4775 2675 50  0001 C CNN
	1    4775 2675
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR025
U 1 1 59F407C6
P 4900 3000
F 0 "#PWR025" H 4900 2850 50  0001 C CNN
F 1 "VCC" V 4900 3175 50  0000 C CNN
F 2 "" H 4900 3000 50  0001 C CNN
F 3 "" H 4900 3000 50  0001 C CNN
	1    4900 3000
	0    1    1    0   
$EndComp
Connection ~ 4775 2900
NoConn ~ 4525 3200
NoConn ~ 4025 3200
$Comp
L pluto-rescue:Mounting_Hole-mechanical MK5
U 1 1 59F424EE
P 2600 3000
F 0 "MK5" H 2600 3200 50  0000 C CNN
F 1 "Mounting_Hole" H 2600 3125 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 2600 3000 50  0001 C CNN
F 3 "" H 2600 3000 50  0001 C CNN
	1    2600 3000
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:Mounting_Hole-mechanical MK6
U 1 1 59F42548
P 2600 3350
F 0 "MK6" H 2600 3550 50  0000 C CNN
F 1 "Mounting_Hole" H 2600 3475 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 2600 3350 50  0001 C CNN
F 3 "" H 2600 3350 50  0001 C CNN
	1    2600 3350
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:CONN_01X04-conn J4
U 1 1 5A1609CD
P 7650 1725
F 0 "J4" H 7650 1975 50  0000 C CNN
F 1 "POWER" V 7750 1725 50  0000 C CNN
F 2 "Connectors_Molex:Molex_NanoFit_1x04x2.50mm_Angled" H 7650 1725 50  0001 C CNN
F 3 "" H 7650 1725 50  0001 C CNN
	1    7650 1725
	1    0    0    -1  
$EndComp
Wire Wire Line
	7125 1675 7275 1675
Wire Wire Line
	7375 1775 7450 1775
$Comp
L power:VCC #PWR026
U 1 1 5A160A6E
P 6200 1525
F 0 "#PWR026" H 6200 1375 50  0001 C CNN
F 1 "VCC" H 6200 1675 50  0000 C CNN
F 2 "" H 6200 1525 50  0001 C CNN
F 3 "" H 6200 1525 50  0001 C CNN
	1    6200 1525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 5A160AE2
P 7125 1675
F 0 "#PWR027" H 7125 1425 50  0001 C CNN
F 1 "GND" H 7100 1450 50  0000 C CNN
F 2 "" H 7125 1675 50  0001 C CNN
F 3 "" H 7125 1675 50  0001 C CNN
	1    7125 1675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5A164DA9
P 2125 5625
F 0 "#PWR028" H 2125 5375 50  0001 C CNN
F 1 "GND" H 2125 5475 50  0000 C CNN
F 2 "" H 2125 5625 50  0001 C CNN
F 3 "" H 2125 5625 50  0001 C CNN
	1    2125 5625
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR029
U 1 1 5A164DEA
P 2125 5025
F 0 "#PWR029" H 2125 4875 50  0001 C CNN
F 1 "VCC" H 2125 5200 50  0000 C CNN
F 2 "" H 2125 5025 50  0001 C CNN
F 3 "" H 2125 5025 50  0001 C CNN
	1    2125 5025
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG030
U 1 1 5A171315
P 7275 1675
F 0 "#FLG030" H 7275 1750 50  0001 C CNN
F 1 "PWR_FLAG" H 7275 1825 50  0000 C CNN
F 2 "" H 7275 1675 50  0001 C CNN
F 3 "" H 7275 1675 50  0001 C CNN
	1    7275 1675
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG031
U 1 1 5A171393
P 7350 1450
F 0 "#FLG031" H 7350 1525 50  0001 C CNN
F 1 "PWR_FLAG" H 7350 1600 50  0000 C CNN
F 2 "" H 7350 1450 50  0001 C CNN
F 3 "" H 7350 1450 50  0001 C CNN
	1    7350 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7375 1675 7375 1775
Connection ~ 7275 1675
NoConn ~ 7450 1875
Connection ~ 7375 1675
$Comp
L pluto-rescue:Fuse_Small-device F1
U 1 1 5A30BB96
P 6800 1575
F 0 "F1" H 6800 1515 50  0000 C CNN
F 1 "1Amp" H 6800 1635 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_open_Schurter_0031_8201" H 6800 1575 50  0001 C CNN
F 3 "" H 6800 1575 50  0001 C CNN
	1    6800 1575
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:SPDT-standard S1
U 1 1 5A30BD5A
P 6425 1625
F 0 "S1" H 6425 1775 60  0000 C CNN
F 1 "SPDT" H 6425 1475 60  0000 C CNN
F 2 "Switches_THT:SW-SPDT-0900766b81587629" H 6425 1625 60  0001 C CNN
F 3 "" H 6425 1625 60  0001 C CNN
	1    6425 1625
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 1575 7350 1575
Wire Wire Line
	7350 1450 7350 1575
Connection ~ 7350 1575
$Comp
L pluto-rescue:LED D1
U 1 1 5A30C5EA
P 5975 1625
F 0 "D1" H 5975 1725 50  0000 C CNN
F 1 "LED" H 5975 1525 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 5975 1625 50  0001 C CNN
F 3 "" H 5975 1625 50  0001 C CNN
	1    5975 1625
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:R_Small-device R1
U 1 1 5A30C649
P 5625 1625
F 0 "R1" V 5700 1575 50  0000 L CNN
F 1 "1kOhm" V 5525 1525 50  0000 L CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" H 5625 1625 50  0001 C CNN
F 3 "" H 5625 1625 50  0001 C CNN
	1    5625 1625
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR032
U 1 1 5A30C680
P 5425 1625
F 0 "#PWR032" H 5425 1375 50  0001 C CNN
F 1 "GND" H 5425 1475 50  0000 C CNN
F 2 "" H 5425 1625 50  0001 C CNN
F 3 "" H 5425 1625 50  0001 C CNN
	1    5425 1625
	0    1    1    0   
$EndComp
Wire Wire Line
	6125 1625 6200 1625
Wire Wire Line
	5725 1625 5825 1625
Wire Wire Line
	5425 1625 5525 1625
$Comp
L pluto-rescue:TEST_1P-conn J1
U 1 1 5A30C731
P 1450 5025
F 0 "J1" H 1450 5295 50  0000 C CNN
F 1 "VCC1" H 1450 5225 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 1650 5025 50  0001 C CNN
F 3 "" H 1650 5025 50  0001 C CNN
	1    1450 5025
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:TEST_1P-conn J3
U 1 1 5A30C776
P 1775 5025
F 0 "J3" H 1775 5295 50  0000 C CNN
F 1 "VCC2" H 1775 5225 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 1975 5025 50  0001 C CNN
F 3 "" H 1975 5025 50  0001 C CNN
	1    1775 5025
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:TEST_1P-conn J9
U 1 1 5A30C7BB
P 2125 5025
F 0 "J9" H 2125 5295 50  0000 C CNN
F 1 "VCC3" H 2125 5225 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 2325 5025 50  0001 C CNN
F 3 "" H 2325 5025 50  0001 C CNN
	1    2125 5025
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:TEST_1P-conn J2
U 1 1 5A30C814
P 1450 5625
F 0 "J2" H 1450 5895 50  0000 C CNN
F 1 "GND1" H 1450 5825 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 1650 5625 50  0001 C CNN
F 3 "" H 1650 5625 50  0001 C CNN
	1    1450 5625
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:TEST_1P-conn J5
U 1 1 5A30C853
P 1775 5625
F 0 "J5" H 1775 5895 50  0000 C CNN
F 1 "GND2" H 1775 5825 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 1975 5625 50  0001 C CNN
F 3 "" H 1975 5625 50  0001 C CNN
	1    1775 5625
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:TEST_1P-conn J10
U 1 1 5A30C89C
P 2125 5625
F 0 "J10" H 2125 5895 50  0000 C CNN
F 1 "GND3" H 2125 5825 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 2325 5625 50  0001 C CNN
F 3 "" H 2325 5625 50  0001 C CNN
	1    2125 5625
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR033
U 1 1 5A30CA5A
P 1775 5025
F 0 "#PWR033" H 1775 4875 50  0001 C CNN
F 1 "VCC" H 1775 5200 50  0000 C CNN
F 2 "" H 1775 5025 50  0001 C CNN
F 3 "" H 1775 5025 50  0001 C CNN
	1    1775 5025
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR034
U 1 1 5A30CAAD
P 1450 5025
F 0 "#PWR034" H 1450 4875 50  0001 C CNN
F 1 "VCC" H 1450 5200 50  0000 C CNN
F 2 "" H 1450 5025 50  0001 C CNN
F 3 "" H 1450 5025 50  0001 C CNN
	1    1450 5025
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR035
U 1 1 5A30CB00
P 1775 5625
F 0 "#PWR035" H 1775 5375 50  0001 C CNN
F 1 "GND" H 1775 5475 50  0000 C CNN
F 2 "" H 1775 5625 50  0001 C CNN
F 3 "" H 1775 5625 50  0001 C CNN
	1    1775 5625
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5A30CB53
P 1450 5625
F 0 "#PWR036" H 1450 5375 50  0001 C CNN
F 1 "GND" H 1450 5475 50  0000 C CNN
F 2 "" H 1450 5625 50  0001 C CNN
F 3 "" H 1450 5625 50  0001 C CNN
	1    1450 5625
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1575 6575 1575
Wire Wire Line
	6200 1525 6200 1625
Connection ~ 6200 1625
Text Label 6950 1575 0    60   ~ 0
PWR_IN
Text HLabel 9400 4775 2    60   Output ~ 0
~7FCX
Text HLabel 9400 4875 2    60   Output ~ 0
~7FAX
Text HLabel 8100 4875 0    60   Input ~ 0
~IRQ
Text HLabel 8100 4975 0    60   Output ~ 0
~RES
Text HLabel 9400 4075 2    60   Output ~ 0
~MRD
Text HLabel 9400 4175 2    60   Output ~ 0
~MWR
Text HLabel 9400 4275 2    60   Output ~ 0
R/~W
Text HLabel 9400 4975 2    60   Output ~ 0
CLK
$Comp
L pluto-rescue:Conn_02x20_Odd_Even J11
U 1 1 5A389077
P 8700 4075
F 0 "J11" H 8750 5075 50  0000 C CNN
F 1 "Expansion Bus" V 8750 3925 50  0000 C CNN
F 2 "Connectors_IDC:IDC-Header_2x20_Pitch2.54mm_Straight" H 8700 4075 50  0001 C CNN
F 3 "" H 8700 4075 50  0001 C CNN
	1    8700 4075
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR037
U 1 1 5A403B6B
P 8750 2775
F 0 "#PWR037" H 8750 2625 50  0001 C CNN
F 1 "VCC" H 8750 2925 50  0000 C CNN
F 2 "" H 8750 2775 50  0001 C CNN
F 3 "" H 8750 2775 50  0001 C CNN
	1    8750 2775
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3175 8500 2775
Wire Wire Line
	8500 2775 8750 2775
Wire Wire Line
	9000 2775 9000 3175
Connection ~ 8750 2775
Wire Wire Line
	8500 3275 8100 3275
Wire Wire Line
	8500 3375 8100 3375
Wire Wire Line
	8500 3475 8100 3475
Wire Wire Line
	8500 3575 8100 3575
Wire Wire Line
	8500 3675 8100 3675
Wire Wire Line
	8500 3775 8100 3775
Wire Wire Line
	8500 3875 8100 3875
Wire Wire Line
	8500 3975 8100 3975
Wire Wire Line
	8500 4075 8100 4075
Wire Wire Line
	8500 4175 8100 4175
Wire Wire Line
	8500 4275 8100 4275
Wire Wire Line
	8500 4375 8100 4375
Wire Wire Line
	8500 4475 8100 4475
Wire Wire Line
	8500 4575 8100 4575
Wire Wire Line
	8500 4675 8100 4675
Wire Wire Line
	8500 4775 8100 4775
Entry Wire Line
	8000 3175 8100 3275
Entry Wire Line
	8000 3275 8100 3375
Entry Wire Line
	8000 3375 8100 3475
Entry Wire Line
	8000 3475 8100 3575
Entry Wire Line
	8000 3575 8100 3675
Entry Wire Line
	8000 3675 8100 3775
Entry Wire Line
	8000 3775 8100 3875
Entry Wire Line
	8000 3875 8100 3975
Entry Wire Line
	8000 3975 8100 4075
Entry Wire Line
	8000 4075 8100 4175
Entry Wire Line
	8000 4175 8100 4275
Entry Wire Line
	8000 4275 8100 4375
Entry Wire Line
	8000 4375 8100 4475
Entry Wire Line
	8000 4475 8100 4575
Entry Wire Line
	8000 4575 8100 4675
Entry Wire Line
	8000 4675 8100 4775
Wire Bus Line
	8000 3175 7700 3175
Wire Wire Line
	9000 3275 9400 3275
Wire Wire Line
	9000 3375 9400 3375
Wire Wire Line
	9000 3475 9400 3475
Wire Wire Line
	9000 3575 9400 3575
Wire Wire Line
	9000 3675 9400 3675
Wire Wire Line
	9000 3775 9400 3775
Wire Wire Line
	9000 3875 9400 3875
Wire Wire Line
	9000 3975 9400 3975
Entry Wire Line
	9400 3275 9500 3175
Entry Wire Line
	9400 3275 9500 3175
Entry Wire Line
	9400 3275 9500 3175
Entry Wire Line
	9400 3275 9500 3175
Entry Wire Line
	9400 3375 9500 3275
Entry Wire Line
	9400 3475 9500 3375
Entry Wire Line
	9400 3575 9500 3475
Entry Wire Line
	9400 3675 9500 3575
Entry Wire Line
	9400 3775 9500 3675
Entry Wire Line
	9400 3875 9500 3775
Entry Wire Line
	9400 3975 9500 3875
Wire Bus Line
	9500 3175 9975 3175
Wire Wire Line
	9000 4075 9400 4075
Wire Wire Line
	9000 4175 9400 4175
Wire Wire Line
	9000 4275 9400 4275
Wire Wire Line
	9000 4375 9400 4375
Wire Wire Line
	9000 4475 9400 4475
Wire Wire Line
	9000 4775 9400 4775
Wire Wire Line
	9000 4875 9400 4875
Wire Wire Line
	9000 4975 9400 4975
Wire Wire Line
	8500 4875 8100 4875
Wire Wire Line
	8500 4975 8100 4975
$Comp
L power:GND #PWR038
U 1 1 5A404FE9
P 8750 5475
F 0 "#PWR038" H 8750 5225 50  0001 C CNN
F 1 "GND" H 8750 5325 50  0000 C CNN
F 2 "" H 8750 5475 50  0001 C CNN
F 3 "" H 8750 5475 50  0001 C CNN
	1    8750 5475
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 5075 8500 5475
Wire Wire Line
	8500 5475 8750 5475
Wire Wire Line
	9000 5475 9000 5075
Connection ~ 8750 5475
NoConn ~ 6575 1675
Text HLabel 9400 4375 2    60   Input ~ 0
~NMI
Text HLabel 9400 4475 2    60   Input ~ 0
RDY
NoConn ~ 9000 4575
NoConn ~ 9000 4675
Text HLabel 9975 3175 2    60   BiDi ~ 0
D[0..7]
Text HLabel 7700 3175 0    60   Input ~ 0
A[0..15]
Text Label 8100 3275 0    60   ~ 0
A0
Text Label 8100 3375 0    60   ~ 0
A1
Text Label 8100 3475 0    60   ~ 0
A2
Text Label 8100 3575 0    60   ~ 0
A3
Text Label 8100 3675 0    60   ~ 0
A4
Text Label 8100 3775 0    60   ~ 0
A5
Text Label 8100 3875 0    60   ~ 0
A6
Text Label 8100 3975 0    60   ~ 0
A7
Text Label 8100 4075 0    60   ~ 0
A8
Text Label 8100 4175 0    60   ~ 0
A9
Text Label 8100 4275 0    60   ~ 0
A10
Text Label 8100 4375 0    60   ~ 0
A11
Text Label 8100 4475 0    60   ~ 0
A12
Text Label 8100 4575 0    60   ~ 0
A13
Text Label 8100 4675 0    60   ~ 0
A14
Text Label 8100 4775 0    60   ~ 0
A15
Text Label 9400 3275 2    60   ~ 0
D0
Text Label 9400 3375 2    60   ~ 0
D1
Text Label 9400 3475 2    60   ~ 0
D2
Text Label 9400 3575 2    60   ~ 0
D3
Text Label 9400 3675 2    60   ~ 0
D4
Text Label 9400 3775 2    60   ~ 0
D5
Text Label 9400 3875 2    60   ~ 0
D6
Text Label 9400 3975 2    60   ~ 0
D7
Wire Wire Line
	4775 2800 4775 2900
Wire Wire Line
	4775 2900 4775 3100
Wire Wire Line
	7275 1675 7375 1675
Wire Wire Line
	7375 1675 7450 1675
Wire Wire Line
	7350 1575 7450 1575
Wire Wire Line
	6200 1625 6275 1625
Wire Wire Line
	8750 2775 9000 2775
Wire Wire Line
	8750 5475 9000 5475
Wire Bus Line
	9500 3175 9500 3875
Wire Bus Line
	8000 3175 8000 4675
$EndSCHEMATC
