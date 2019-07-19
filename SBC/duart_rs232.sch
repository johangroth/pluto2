EESchema Schematic File Version 4
LIBS:pluto-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L pluto:MAX238 U22
U 1 1 59ECC5AA
P 3675 2800
F 0 "U22" H 4200 4250 50  0000 R CNN
F 1 "MAX238" H 3825 3450 50  0000 R CNN
F 2 "Housings_DIP:DIP-24_W7.62mm_Socket" H 3725 1750 50  0001 L CNN
F 3 "" H 3675 3000 50  0001 C CNN
	1    3675 2800
	-1   0    0    -1  
$EndComp
$Comp
L pluto:SC28L92PLCC44 U23
U 1 1 59ECC687
P 6975 3225
F 0 "U23" H 6750 4250 60  0000 C CNN
F 1 "SC28L92PLCC44" V 7075 2675 60  0000 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 7075 3225 60  0001 C CNN
F 3 "" H 7075 3225 60  0001 C CNN
	1    6975 3225
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_02X05 J6
U 1 1 59ECCE48
P 1500 2750
F 0 "J6" H 1500 3050 50  0000 C CNN
F 1 "RS232a" H 1500 2450 50  0000 C CNN
F 2 "Connectors_IDC:IDC-Header_2x05_Pitch2.54mm_Straight" H 1500 1550 50  0001 C CNN
F 3 "" H 1500 1550 50  0001 C CNN
	1    1500 2750
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_02X05 J7
U 1 1 59ECCF01
P 1500 3475
F 0 "J7" H 1500 3775 50  0000 C CNN
F 1 "RS232b" H 1500 3175 50  0000 C CNN
F 2 "Connectors_IDC:IDC-Header_2x05_Pitch2.54mm_Straight" H 1500 2275 50  0001 C CNN
F 3 "" H 1500 2275 50  0001 C CNN
	1    1500 3475
	1    0    0    -1  
$EndComp
$Comp
L device:CP1_Small C18
U 1 1 59ECCF2A
P 4650 1575
F 0 "C18" H 4660 1645 50  0000 L CNN
F 1 "1.0uF" H 4700 1500 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_Tantal_D4.5mm_P2.50mm" H 4650 1575 50  0001 C CNN
F 3 "" H 4650 1575 50  0001 C CNN
	1    4650 1575
	1    0    0    -1  
$EndComp
$Comp
L device:CP1_Small C19
U 1 1 59ECCF53
P 4650 1975
F 0 "C19" H 4660 2045 50  0000 L CNN
F 1 "1.0uF" H 4700 1900 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_Tantal_D4.5mm_P2.50mm" H 4650 1975 50  0001 C CNN
F 3 "" H 4650 1975 50  0001 C CNN
	1    4650 1975
	1    0    0    -1  
$EndComp
$Comp
L device:CP1_Small C15
U 1 1 59ECCF86
P 2750 1250
F 0 "C15" H 2825 1325 50  0000 L CNN
F 1 "1.0uF" H 2800 1175 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_Tantal_D4.5mm_P2.50mm" H 2750 1250 50  0001 C CNN
F 3 "" H 2750 1250 50  0001 C CNN
	1    2750 1250
	-1   0    0    1   
$EndComp
$Comp
L device:CP1_Small C16
U 1 1 59ECCFE5
P 2750 1775
F 0 "C16" H 2875 1850 50  0000 L CNN
F 1 "1.0uF" H 2800 1700 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_Tantal_D4.5mm_P2.50mm" H 2750 1775 50  0001 C CNN
F 3 "" H 2750 1775 50  0001 C CNN
	1    2750 1775
	-1   0    0    1   
$EndComp
$Comp
L device:CP1_Small C17
U 1 1 59ECD006
P 4325 1150
F 0 "C17" V 4250 950 50  0000 L CNN
F 1 "1.0uF" V 4400 900 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_Tantal_D4.5mm_P2.50mm" H 4325 1150 50  0001 C CNN
F 3 "" H 4325 1150 50  0001 C CNN
	1    4325 1150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR043
U 1 1 59ECE27A
P 2750 1875
F 0 "#PWR043" H 2750 1625 50  0001 C CNN
F 1 "GND" H 2750 1725 50  0000 C CNN
F 2 "" H 2750 1875 50  0001 C CNN
F 3 "" H 2750 1875 50  0001 C CNN
	1    2750 1875
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR044
U 1 1 59ECE2B2
P 3675 1075
F 0 "#PWR044" H 3675 925 50  0001 C CNN
F 1 "VCC" H 3675 1225 50  0000 C CNN
F 2 "" H 3675 1075 50  0001 C CNN
F 3 "" H 3675 1075 50  0001 C CNN
	1    3675 1075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR045
U 1 1 59ECE354
P 4650 1150
F 0 "#PWR045" H 4650 900 50  0001 C CNN
F 1 "GND" V 4650 975 50  0000 C CNN
F 2 "" H 4650 1150 50  0001 C CNN
F 3 "" H 4650 1150 50  0001 C CNN
	1    4650 1150
	0    -1   -1   0   
$EndComp
Text Label 7975 2375 2    60   ~ 0
D0
Text Label 7975 2500 2    60   ~ 0
D1
Text Label 7975 2625 2    60   ~ 0
D2
Text Label 7975 2750 2    60   ~ 0
D3
Text Label 7975 2875 2    60   ~ 0
D4
Text Label 7975 3000 2    60   ~ 0
D5
Text Label 7975 3125 2    60   ~ 0
D6
Text Label 7975 3250 2    60   ~ 0
D7
Text Label 7975 3575 2    60   ~ 0
A0
Text Label 7975 3700 2    60   ~ 0
A1
Text Label 7975 3825 2    60   ~ 0
A2
Text Label 7975 3950 2    60   ~ 0
A3
Entry Wire Line
	7975 2375 8075 2275
Entry Wire Line
	7975 2500 8075 2400
Entry Wire Line
	7975 2625 8075 2525
Entry Wire Line
	7975 2750 8075 2650
Entry Wire Line
	7975 2875 8075 2775
Entry Wire Line
	7975 3125 8075 3025
Entry Wire Line
	7975 3000 8075 2900
Entry Wire Line
	7975 3250 8075 3150
Text Label 8375 1775 2    60   ~ 0
D[0..7]
Text HLabel 8625 1775 2    60   BiDi ~ 0
D[0..7]
$Comp
L power:GND #PWR046
U 1 1 59ED2D15
P 7075 5525
F 0 "#PWR046" H 7075 5275 50  0001 C CNN
F 1 "GND" H 7075 5375 50  0000 C CNN
F 2 "" H 7075 5525 50  0001 C CNN
F 3 "" H 7075 5525 50  0001 C CNN
	1    7075 5525
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR047
U 1 1 59ED2EFD
P 7075 2075
F 0 "#PWR047" H 7075 1925 50  0001 C CNN
F 1 "VCC" H 7075 2225 50  0000 C CNN
F 2 "" H 7075 2075 50  0001 C CNN
F 3 "" H 7075 2075 50  0001 C CNN
	1    7075 2075
	1    0    0    -1  
$EndComp
Entry Wire Line
	7975 3700 8075 3600
Entry Wire Line
	7975 3825 8075 3725
Entry Wire Line
	7975 3950 8075 3850
Entry Wire Line
	7975 3575 8075 3475
Text Label 8375 3350 2    60   ~ 0
A[0..3]
Text HLabel 8575 3350 2    60   Input ~ 0
A[0..15]
$Comp
L device:C_Small C20
U 1 1 59ED58A6
P 7475 5525
F 0 "C20" V 7600 5475 50  0000 L CNN
F 1 "0.1uF" V 7350 5450 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 7475 5525 50  0001 C CNN
F 3 "" H 7475 5525 50  0001 C CNN
	1    7475 5525
	0    1    1    0   
$EndComp
Text Label 6225 2950 0    60   ~ 0
CTSa
Text Label 6225 3075 0    60   ~ 0
CTSb
Text Label 6225 4025 0    60   ~ 0
RTSb
Text Label 6225 3900 0    60   ~ 0
RTSa
$Comp
L power:GND #PWR048
U 1 1 59ED763B
P 3675 4150
F 0 "#PWR048" H 3675 3900 50  0001 C CNN
F 1 "GND" H 3675 4000 50  0000 C CNN
F 2 "" H 3675 4150 50  0001 C CNN
F 3 "" H 3675 4150 50  0001 C CNN
	1    3675 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2375 7975 2375
Wire Wire Line
	7650 2500 7975 2500
Wire Wire Line
	7650 2625 7975 2625
Wire Wire Line
	7650 2750 7975 2750
Wire Wire Line
	7650 3000 7975 3000
Wire Wire Line
	7650 2875 7975 2875
Wire Wire Line
	7650 3125 7975 3125
Wire Wire Line
	7650 3250 7975 3250
Wire Wire Line
	7650 3575 7975 3575
Wire Wire Line
	7650 3700 7975 3700
Wire Wire Line
	7650 3825 7975 3825
Wire Wire Line
	7650 3950 7975 3950
Wire Bus Line
	8075 1775 8625 1775
Wire Wire Line
	7075 5525 7375 5525
Wire Wire Line
	7575 5525 8400 5525
Wire Wire Line
	8400 5525 8400 2075
Wire Wire Line
	8400 2075 7075 2075
Wire Bus Line
	8075 3350 8575 3350
Wire Wire Line
	4475 1475 4650 1475
Wire Wire Line
	4475 1675 4650 1675
Wire Wire Line
	4475 1875 4650 1875
Wire Wire Line
	4475 2075 4650 2075
Wire Wire Line
	2925 1675 2750 1675
Wire Wire Line
	3675 1075 3675 1150
Wire Wire Line
	2750 1150 3675 1150
Connection ~ 3675 1150
Wire Wire Line
	4425 1150 4650 1150
Wire Wire Line
	2925 1475 2750 1475
Wire Wire Line
	2750 1475 2750 1350
Wire Wire Line
	6450 2375 4475 2375
Wire Wire Line
	6450 2500 4950 2500
Wire Wire Line
	4950 2500 4950 2550
Wire Wire Line
	4950 2550 4475 2550
Wire Wire Line
	5000 3900 6450 3900
Wire Wire Line
	5000 3900 5000 2725
Wire Wire Line
	5000 2725 4475 2725
Wire Wire Line
	4925 4025 6450 4025
Wire Wire Line
	4925 4025 4925 2900
Wire Wire Line
	4925 2900 4475 2900
Wire Wire Line
	6450 2625 5075 2625
Wire Wire Line
	5075 2625 5075 3100
Wire Wire Line
	5075 3100 4475 3100
Wire Wire Line
	6450 2750 5150 2750
Wire Wire Line
	5150 2750 5150 3275
Wire Wire Line
	5150 3275 4475 3275
Wire Wire Line
	5225 2950 6450 2950
Wire Wire Line
	5225 2950 5225 3450
Wire Wire Line
	5225 3450 4475 3450
Wire Wire Line
	5300 3075 6450 3075
Wire Wire Line
	5300 3075 5300 3625
Wire Wire Line
	5300 3625 4475 3625
NoConn ~ 6450 3200
NoConn ~ 6450 3325
NoConn ~ 6450 3450
NoConn ~ 6450 3575
NoConn ~ 6450 3700
NoConn ~ 6450 4150
NoConn ~ 6450 4275
NoConn ~ 6450 4400
NoConn ~ 6450 4525
NoConn ~ 6450 4650
NoConn ~ 6450 4775
Text HLabel 8575 4750 2    60   Input ~ 0
RES
Wire Wire Line
	8575 4750 7650 4750
Text HLabel 8575 4500 2    60   Input ~ 0
~MRD
Wire Wire Line
	8575 4500 7650 4500
Text HLabel 8575 4375 2    60   Input ~ 0
~MWR
Wire Wire Line
	8575 4375 7650 4375
Text HLabel 8575 4625 2    60   Output ~ 0
~IRQ
Wire Wire Line
	8575 4625 7650 4625
Text HLabel 8575 4250 2    60   Input ~ 0
~7FEX
Wire Wire Line
	8575 4250 7650 4250
NoConn ~ 7650 5000
$Comp
L Oscillators:CXO_DIP8 X2
U 1 1 59EDF126
P 9675 4875
F 0 "X2" H 9475 5125 50  0000 L CNN
F 1 "3.6864MHz" H 9175 4600 50  0000 L CNN
F 2 "Oscillators:Oscillator_DIP-8" H 10125 4525 50  0001 C CNN
F 3 "" H 9575 4875 50  0001 C CNN
	1    9675 4875
	-1   0    0    -1  
$EndComp
$Comp
L power:VCC #PWR049
U 1 1 59EE01CB
P 9675 4575
F 0 "#PWR049" H 9675 4425 50  0001 C CNN
F 1 "VCC" H 9675 4725 50  0000 C CNN
F 2 "" H 9675 4575 50  0001 C CNN
F 3 "" H 9675 4575 50  0001 C CNN
	1    9675 4575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR050
U 1 1 59EE022C
P 9675 5175
F 0 "#PWR050" H 9675 4925 50  0001 C CNN
F 1 "GND" H 9675 5025 50  0000 C CNN
F 2 "" H 9675 5175 50  0001 C CNN
F 3 "" H 9675 5175 50  0001 C CNN
	1    9675 5175
	1    0    0    -1  
$EndComp
Wire Wire Line
	9375 4875 7650 4875
$Comp
L power:VCC #PWR051
U 1 1 59EE05A1
P 8575 5125
F 0 "#PWR051" H 8575 4975 50  0001 C CNN
F 1 "VCC" V 8575 5300 50  0000 C CNN
F 2 "" H 8575 5125 50  0001 C CNN
F 3 "" H 8575 5125 50  0001 C CNN
	1    8575 5125
	0    1    1    0   
$EndComp
Wire Wire Line
	8575 5125 7650 5125
NoConn ~ 9975 4875
NoConn ~ 1250 2550
NoConn ~ 1750 2650
NoConn ~ 1750 2750
NoConn ~ 1250 2950
NoConn ~ 1750 2950
NoConn ~ 1250 3275
NoConn ~ 1750 3375
NoConn ~ 1750 3475
NoConn ~ 1250 3675
NoConn ~ 1750 3675
Wire Wire Line
	1750 3275 2925 3275
Wire Wire Line
	1750 2550 2250 2550
Wire Wire Line
	2250 2550 2250 3100
Wire Wire Line
	2250 3100 2925 3100
Wire Wire Line
	2925 2375 1125 2375
Wire Wire Line
	1125 2375 1125 2650
Wire Wire Line
	1125 2650 1250 2650
Wire Wire Line
	2925 2550 2325 2550
Wire Wire Line
	2325 2550 2325 3125
Wire Wire Line
	2325 3125 1125 3125
Wire Wire Line
	1125 3125 1125 3375
Wire Wire Line
	1125 3375 1250 3375
Wire Wire Line
	1750 2850 2575 2850
Wire Wire Line
	2575 2850 2575 3450
Wire Wire Line
	2575 3450 2925 3450
Wire Wire Line
	1750 3575 2575 3575
Wire Wire Line
	2575 3575 2575 3625
Wire Wire Line
	2575 3625 2925 3625
Wire Wire Line
	1250 2850 1025 2850
Wire Wire Line
	1025 2850 1025 2300
Wire Wire Line
	1025 2300 2575 2300
Wire Wire Line
	2575 2300 2575 2725
Wire Wire Line
	2575 2725 2925 2725
Wire Wire Line
	1250 3575 1125 3575
Wire Wire Line
	1125 3575 1125 3900
Wire Wire Line
	1125 3900 2750 3900
Wire Wire Line
	2750 3900 2750 2900
Wire Wire Line
	2750 2900 2925 2900
Wire Wire Line
	1250 3475 900  3475
Wire Wire Line
	900  3475 900  3775
Wire Wire Line
	1250 2750 900  2750
Wire Wire Line
	900  2750 900  3050
$Comp
L power:GND #PWR052
U 1 1 59F06F3D
P 900 3050
F 0 "#PWR052" H 900 2800 50  0001 C CNN
F 1 "GND" H 900 2900 50  0000 C CNN
F 2 "" H 900 3050 50  0001 C CNN
F 3 "" H 900 3050 50  0001 C CNN
	1    900  3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR053
U 1 1 59F06F91
P 900 3775
F 0 "#PWR053" H 900 3525 50  0001 C CNN
F 1 "GND" H 900 3625 50  0000 C CNN
F 2 "" H 900 3775 50  0001 C CNN
F 3 "" H 900 3775 50  0001 C CNN
	1    900  3775
	1    0    0    -1  
$EndComp
Wire Wire Line
	3675 1150 3675 1200
Wire Wire Line
	3675 1150 4225 1150
Wire Bus Line
	8075 3350 8075 3850
Wire Bus Line
	8075 1775 8075 3150
$EndSCHEMATC
