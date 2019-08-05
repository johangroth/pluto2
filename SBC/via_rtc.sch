EESchema Schematic File Version 4
LIBS:pluto-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
Title "VIA and RTC"
Date "2017-03-25"
Rev "0.1"
Comp "Linux Grotto"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 6125 3350
$Comp
L pluto-rescue:C C5
U 1 1 59074B76
P 6575 3850
F 0 "C5" V 6750 3800 50  0000 L CNN
F 1 "0.1uF" V 6425 3750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6613 3700 50  0001 C CNN
F 3 "" H 6575 3850 50  0001 C CNN
	1    6575 3850
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 5924C55A
P 5575 1975
F 0 "#PWR07" H 5575 1825 50  0001 C CNN
F 1 "VCC" V 5650 2075 50  0000 C CNN
F 2 "" H 5575 1975 50  0001 C CNN
F 3 "" H 5575 1975 50  0001 C CNN
	1    5575 1975
	0    -1   -1   0   
$EndComp
Text HLabel 7375 2175 2    60   BiDi ~ 0
D[0..7]
Text HLabel 7375 1300 2    60   Input ~ 0
A[0..15]
Text Label 6450 2275 2    60   ~ 0
D0
Text Label 6450 2375 2    60   ~ 0
D1
Text Label 6450 2475 2    60   ~ 0
D2
Text Label 6450 2575 2    60   ~ 0
D3
Text Label 6450 2675 2    60   ~ 0
D4
Text Label 6450 2775 2    60   ~ 0
D5
Text Label 6450 2875 2    60   ~ 0
D6
Text Label 6450 2975 2    60   ~ 0
D7
Entry Wire Line
	6450 2275 6550 2175
Entry Wire Line
	6450 2375 6550 2275
Entry Wire Line
	6450 2475 6550 2375
Entry Wire Line
	6450 2575 6550 2475
Entry Wire Line
	6450 2675 6550 2575
Entry Wire Line
	6450 2775 6550 2675
Entry Wire Line
	6450 2875 6550 2775
Entry Wire Line
	6450 2975 6550 2875
Text Label 4750 2275 0    60   ~ 0
A0
Text Label 4750 2375 0    60   ~ 0
A1
Text Label 4750 2475 0    60   ~ 0
A2
Text Label 4750 2575 0    60   ~ 0
A3
Text Label 4750 2675 0    60   ~ 0
A4
Entry Wire Line
	4650 2175 4750 2275
Entry Wire Line
	4650 2275 4750 2375
Entry Wire Line
	4650 2375 4750 2475
Entry Wire Line
	4650 2475 4750 2575
Entry Wire Line
	4650 2575 4750 2675
Text HLabel 6450 3100 2    60   Output ~ 0
~PWR
Text HLabel 4750 3450 0    60   Output ~ 0
~RES
Text HLabel 4750 3325 0    60   Output ~ 0
~IRQ
Text HLabel 4750 3125 0    60   Input ~ 0
~MWR
Text HLabel 4750 3000 0    60   Input ~ 0
~MRD
Text HLabel 4750 2875 0    60   Input ~ 0
~RTC
Wire Wire Line
	5075 2675 4750 2675
Wire Wire Line
	5075 2575 4750 2575
Wire Wire Line
	5075 2475 4750 2475
Wire Wire Line
	5075 2375 4750 2375
Wire Wire Line
	4750 2875 5075 2875
Wire Wire Line
	5075 3000 4750 3000
Wire Wire Line
	5075 3125 4750 3125
Wire Wire Line
	5075 3325 4750 3325
Wire Wire Line
	5075 3450 4750 3450
Wire Wire Line
	6125 2975 6450 2975
Wire Wire Line
	6125 2875 6450 2875
Wire Wire Line
	6125 2775 6450 2775
Wire Wire Line
	6125 2675 6450 2675
Wire Wire Line
	6125 2575 6450 2575
Wire Wire Line
	6125 2475 6450 2475
Wire Wire Line
	6125 2375 6450 2375
Wire Wire Line
	6125 3100 6450 3100
Wire Wire Line
	5575 1825 5575 1975
Wire Wire Line
	6800 3850 6725 3850
Wire Wire Line
	6800 1825 6800 3850
Wire Wire Line
	6800 1825 5575 1825
Wire Wire Line
	6125 2275 6450 2275
Wire Wire Line
	5075 2275 4750 2275
$Comp
L pluto-rescue:DS1511Y+-saturn U4
U 1 1 58D61FB4
P 5550 2850
AR Path="/58D61FB4" Ref="U4"  Part="1" 
AR Path="/58D58980/58D61FB4" Ref="U4"  Part="1" 
F 0 "U4" H 5375 3575 60  0000 C CNN
F 1 "DS1511Y+" V 5600 2850 60  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 5300 3300 60  0001 C CNN
F 3 "" H 5300 3300 60  0001 C CNN
	1    5550 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 3225 6450 3225
Wire Wire Line
	6125 3475 6250 3475
Wire Wire Line
	5500 3850 5625 3850
Connection ~ 5625 3850
Text HLabel 6450 3225 2    60   Input ~ 0
~KS
Wire Wire Line
	6250 3475 6250 3850
Connection ~ 6250 3850
$Comp
L power:GND #PWR08
U 1 1 5A162751
P 5500 3850
F 0 "#PWR08" H 5500 3600 50  0001 C CNN
F 1 "GND" H 5500 3700 50  0000 C CNN
F 2 "" H 5500 3850 50  0001 C CNN
F 3 "" H 5500 3850 50  0001 C CNN
	1    5500 3850
	1    0    0    -1  
$EndComp
Wire Bus Line
	6550 2175 7375 2175
Wire Bus Line
	4650 1300 7375 1300
Wire Wire Line
	5625 3850 6250 3850
Wire Wire Line
	6250 3850 6425 3850
Wire Bus Line
	4650 1300 4650 2575
Wire Bus Line
	6550 2175 6550 2875
$EndSCHEMATC
