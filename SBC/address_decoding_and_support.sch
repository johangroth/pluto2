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
L pluto-rescue:CXO_DIP8-Oscillators X1
U 1 1 58D6C921
P 4350 6450
F 0 "X1" H 4150 6700 50  0000 L CNN
F 1 "8 MHz" H 4400 6200 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-8" H 4800 6100 50  0001 C CNN
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
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 1650 3850 50  0001 C CNN
F 3 "" H 1650 3850 50  0001 C CNN
	1    1650 3650
	0    -1   -1   0   
$EndComp
Text Label 6450 6250 2    60   ~ 0
CLK
Text HLabel 6475 6250 2    60   Output ~ 0
CLK
Text HLabel 4675 1800 2    60   BiDi ~ 0
~IRQ
Text HLabel 4675 1900 2    60   BiDi ~ 0
~NMI
Text HLabel 4675 2000 2    60   Output ~ 0
BE
Text HLabel 4675 2100 2    60   Output ~ 0
~PWR
Text HLabel 4675 2200 2    60   Output ~ 0
RDY
Text HLabel 4675 2500 2    60   Output ~ 0
~RES
Text HLabel 4675 2400 2    60   Output ~ 0
~KS
Text HLabel 4675 2300 2    60   Output ~ 0
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
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5500 6450 50  0001 C CNN
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
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3250 6350 50  0001 C CNN
F 3 "" H 3250 6350 50  0001 C CNN
	1    3250 6350
	1    0    0    -1  
$EndComp
$Comp
L pluto:TL7705B U5
U 1 1 5A37C438
P 2850 3225
F 0 "U5" H 3100 3675 50  0000 C CNN
F 1 "TL7705B" H 3150 2777 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 2850 3225 50  0001 C CNN
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
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P7.62mm_Vertical" H 1650 2975 50  0001 C CNN
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
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P7.62mm_Vertical" H 2050 3700 50  0001 C CNN
F 3 "" H 2050 3700 50  0001 C CNN
	1    2050 3700
	1    0    0    -1  
$EndComp
Text HLabel 4675 2600 2    60   Output ~ 0
RES
$Comp
L pluto-rescue:CP_Small-device C4
U 1 1 5A37EF31
P 2050 4025
F 0 "C4" H 2060 4095 50  0000 L CNN
F 1 "15uF" V 1950 3950 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P2.50mm" H 2050 4025 50  0001 C CNN
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
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 3650 3625 50  0001 C CNN
F 3 "" H 3650 3625 50  0001 C CNN
	1    3650 3625
	1    0    0    -1  
$EndComp
$Comp
L pluto-rescue:R_Small-device R4
U 1 1 5A3880A9
P 3950 3475
F 0 "R4" V 4025 3450 50  0000 L CNN
F 1 "3.3k" V 3875 3400 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P7.62mm_Vertical" H 3950 3475 50  0001 C CNN
F 3 "" H 3950 3475 50  0001 C CNN
	1    3950 3475
	-1   0    0    1   
$EndComp
Wire Wire Line
	4350 1600 4350 1800
Wire Wire Line
	4350 1800 4675 1800
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
	3650 3225 3950 3225
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
Wire Wire Line
	3650 1600 3650 2500
Wire Wire Line
	4250 1600 4250 1900
Wire Wire Line
	4250 1900 4675 1900
Wire Wire Line
	4150 1600 4150 2000
Wire Wire Line
	4150 2000 4675 2000
Wire Wire Line
	4050 1600 4050 2100
Wire Wire Line
	4050 2100 4675 2100
Wire Wire Line
	3950 1600 3950 2200
Wire Wire Line
	3950 2200 4675 2200
Wire Wire Line
	3850 1600 3850 2300
Wire Wire Line
	3850 2300 4675 2300
Wire Wire Line
	3750 1600 3750 2400
Wire Wire Line
	3750 2400 4675 2400
$Comp
L Device:R_Network08 RN1
U 1 1 5D76ADD1
P 4050 1400
F 0 "RN1" V 3550 1325 50  0000 L CNN
F 1 "3.3k" V 4450 1300 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4525 1400 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4050 1400 50  0001 C CNN
	1    4050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4675 2500 3650 2500
Connection ~ 3650 2500
Wire Wire Line
	3650 2500 3650 3000
Wire Wire Line
	3950 2600 4675 2600
Wire Wire Line
	3950 2600 3950 3225
Connection ~ 3950 3225
Wire Wire Line
	3950 3225 3950 3375
$Comp
L Device:Q_NPN_CBE Q1
U 1 1 5D779D75
P 2650 5050
F 0 "Q1" H 2841 5004 50  0000 L CNN
F 1 "DS1813" H 2350 5200 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline" H 2850 5150 50  0001 C CNN
F 3 "~" H 2650 5050 50  0001 C CNN
	1    2650 5050
	-1   0    0    1   
$EndComp
$Comp
L pluto-rescue:SW_Push-switches SW2
U 1 1 5D77D642
P 2100 5050
F 0 "SW2" H 2025 4950 50  0000 L CNN
F 1 "PANIC" H 2100 5225 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 2100 5250 50  0001 C CNN
F 3 "" H 2100 5250 50  0001 C CNN
	1    2100 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2100 4850 2550 4850
Wire Wire Line
	2550 4850 2550 4600
Connection ~ 2550 4850
Wire Wire Line
	2100 5250 2550 5250
$Comp
L power:GND #PWR013
U 1 1 5D7850F3
P 2550 5250
F 0 "#PWR013" H 2550 5000 50  0001 C CNN
F 1 "GND" H 2555 5077 50  0000 C CNN
F 2 "" H 2550 5250 50  0001 C CNN
F 3 "" H 2550 5250 50  0001 C CNN
	1    2550 5250
	1    0    0    -1  
$EndComp
Connection ~ 2550 5250
$Comp
L power:VCC #PWR023
U 1 1 5D7854C4
P 2850 5050
F 0 "#PWR023" H 2850 4900 50  0001 C CNN
F 1 "VCC" H 2867 5223 50  0000 C CNN
F 2 "" H 2850 5050 50  0001 C CNN
F 3 "" H 2850 5050 50  0001 C CNN
	1    2850 5050
	1    0    0    -1  
$EndComp
Text Label 2550 4600 3    60   ~ 0
~NMI
Text Label 4675 1900 2    60   ~ 0
~NMI
$Comp
L Grotto:PlutoDecoder U6
U 1 1 5D793D9D
P 8375 1675
F 0 "U6" H 8225 2375 50  0000 C CNN
F 1 "PlutoDecoder" V 8350 1775 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm_Socket" H 6750 675 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0735.pdf" H 8375 1625 50  0001 C CNN
	1    8375 1675
	1    0    0    -1  
$EndComp
Wire Wire Line
	7775 1125 7475 1125
Wire Wire Line
	7775 1225 7475 1225
Wire Wire Line
	7775 1325 7475 1325
Wire Wire Line
	7775 1425 7475 1425
Wire Wire Line
	7775 1525 7475 1525
Wire Wire Line
	7775 1625 7475 1625
Wire Wire Line
	7775 1725 7475 1725
Wire Wire Line
	7775 1825 7475 1825
Wire Wire Line
	7775 1925 7475 1925
Wire Wire Line
	7775 2025 7475 2025
Wire Wire Line
	7775 2125 7475 2125
Entry Wire Line
	7375 1025 7475 1125
Entry Wire Line
	7375 1125 7475 1225
Entry Wire Line
	7375 1225 7475 1325
Entry Wire Line
	7375 1325 7475 1425
Entry Wire Line
	7375 1425 7475 1525
Entry Wire Line
	7375 1525 7475 1625
Entry Wire Line
	7375 1625 7475 1725
Entry Wire Line
	7375 1725 7475 1825
Entry Wire Line
	7375 1825 7475 1925
Entry Wire Line
	7375 1925 7475 2025
Entry Wire Line
	7375 2025 7475 2125
Wire Bus Line
	7375 1025 6525 1025
Text Label 6675 1025 0    60   ~ 0
A[0..15]
Text HLabel 6525 1025 0    60   Input ~ 0
A[0..15]
Text Label 7475 1125 0    60   ~ 0
A5
Text Label 7475 1225 0    60   ~ 0
A6
Text Label 7475 1325 0    60   ~ 0
A7
Text Label 7475 1425 0    60   ~ 0
A8
Text Label 7475 1525 0    60   ~ 0
A9
Text Label 7475 1625 0    60   ~ 0
A10
Text Label 7475 1725 0    60   ~ 0
A11
Text Label 7475 1825 0    60   ~ 0
A12
Text Label 7475 1925 0    60   ~ 0
A13
Text Label 7475 2025 0    60   ~ 0
A14
Text Label 7475 2125 0    60   ~ 0
A15
Wire Wire Line
	8975 1125 9275 1125
Wire Wire Line
	8975 1225 9275 1225
Wire Wire Line
	8975 1325 9275 1325
Wire Wire Line
	8975 1425 9275 1425
Wire Wire Line
	8975 1525 9275 1525
Wire Wire Line
	8975 1625 9275 1625
Wire Wire Line
	8975 1725 9275 1725
Wire Wire Line
	8975 1825 9275 1825
Wire Wire Line
	8975 1925 9275 1925
Wire Wire Line
	8975 2025 9275 2025
Wire Wire Line
	8975 2125 9275 2125
Text Label 9275 1125 2    60   ~ 0
CLK
Text Label 9275 1225 2    60   ~ 0
R-~W
Text HLabel 9275 1125 2    60   Input ~ 0
CLK
Text HLabel 9275 1225 2    60   Input ~ 0
R-~W
Text HLabel 9275 1325 2    60   Output ~ 0
~MRD
Text HLabel 9275 1425 2    60   Output ~ 0
~MWR
Text HLabel 9275 1725 2    60   Output ~ 0
~RAMSEL
Text HLabel 9275 1625 2    60   Output ~ 0
~ROMSEL
Text HLabel 9275 1825 2    60   Output ~ 0
~DUART
Text HLabel 9275 1525 2    60   Output ~ 0
~VIA1SEL
Text HLabel 9275 1925 2    60   Output ~ 0
~VIA2SEL
Text HLabel 9275 2025 2    60   Output ~ 0
~RTC
Text HLabel 9275 2125 2    60   Output ~ 0
~IO
$Comp
L Device:C_Small C9
U 1 1 5D79F10F
P 8900 800
F 0 "C9" V 8775 800 50  0000 C CNN
F 1 "0.1uF" V 9025 800 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 8900 800 50  0001 C CNN
F 3 "~" H 8900 800 50  0001 C CNN
	1    8900 800 
	0    1    1    0   
$EndComp
Wire Wire Line
	8375 875  8375 800 
Wire Wire Line
	8375 800  8800 800 
Wire Wire Line
	8375 2375 8375 2550
Wire Wire Line
	8375 2550 9800 2550
Wire Wire Line
	9800 2550 9800 800 
Wire Wire Line
	9800 800  9000 800 
$Comp
L power:VCC #PWR030
U 1 1 5D7AC40A
P 8375 800
F 0 "#PWR030" H 8375 650 50  0001 C CNN
F 1 "VCC" H 8392 973 50  0000 C CNN
F 2 "" H 8375 800 50  0001 C CNN
F 3 "" H 8375 800 50  0001 C CNN
	1    8375 800 
	1    0    0    -1  
$EndComp
Connection ~ 8375 800 
$Comp
L power:GND #PWR031
U 1 1 5D7AC704
P 8375 2550
F 0 "#PWR031" H 8375 2300 50  0001 C CNN
F 1 "GND" H 8380 2377 50  0000 C CNN
F 2 "" H 8375 2550 50  0001 C CNN
F 3 "" H 8375 2550 50  0001 C CNN
	1    8375 2550
	1    0    0    -1  
$EndComp
Connection ~ 8375 2550
Wire Bus Line
	7375 1025 7375 2025
Text Notes 5925 2675 0    60   ~ 12
RAM\nIO \nRTC\nVIA2\nVIA1\nDUART
Text Notes 6225 2675 0    60   ~ 12
$0000 - $7EFF\n$7F60 - $7F7F\n$7F80 - $7F9F\n$7FA0 - $7FBF\n$7FC0 - $7FDF\n$7FE0 - $7FFF
$EndSCHEMATC
