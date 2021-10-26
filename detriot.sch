EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 614E0E4C
P 5300 3050
F 0 "A1" H 5300 1961 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5300 1870 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5300 3050 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5300 3050 50  0001 C CNN
	1    5300 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 614E2E33
P 3750 3650
F 0 "BZ1" H 3902 3679 50  0000 L CNN
F 1 "Buzzer" H 3902 3588 50  0000 L CNN
F 2 "" V 3725 3750 50  0001 C CNN
F 3 "~" V 3725 3750 50  0001 C CNN
	1    3750 3650
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 614E4082
P 6500 3350
F 0 "SW3" H 6500 3635 50  0000 C CNN
F 1 "SW_Push" H 6500 3544 50  0000 C CNN
F 2 "" H 6500 3550 50  0001 C CNN
F 3 "~" H 6500 3550 50  0001 C CNN
	1    6500 3350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 614E472C
P 6500 3750
F 0 "SW2" H 6500 4035 50  0000 C CNN
F 1 "SW_Push" H 6500 3944 50  0000 C CNN
F 2 "" H 6500 3950 50  0001 C CNN
F 3 "~" H 6500 3950 50  0001 C CNN
	1    6500 3750
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 614E525B
P 4050 2750
F 0 "SW1" H 4050 3035 50  0000 C CNN
F 1 "SW_Push" H 4050 2944 50  0000 C CNN
F 2 "" H 4050 2950 50  0001 C CNN
F 3 "~" H 4050 2950 50  0001 C CNN
	1    4050 2750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 614E7BF0
P 4000 3950
F 0 "J1" H 4028 3976 50  0000 L CNN
F 1 "WS2812 Connector" H 4028 3885 50  0000 L CNN
F 2 "" H 4000 3950 50  0001 C CNN
F 3 "~" H 4000 3950 50  0001 C CNN
	1    4000 3950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 614E8FF5
P 4900 5000
F 0 "#PWR0101" H 4900 4750 50  0001 C CNN
F 1 "GND" H 4905 4827 50  0000 C CNN
F 2 "" H 4900 5000 50  0001 C CNN
F 3 "" H 4900 5000 50  0001 C CNN
	1    4900 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4050 5400 4050
Wire Wire Line
	6300 3750 6150 3750
$Comp
L Device:R R1
U 1 1 614E711E
P 6150 2200
F 0 "R1" H 6220 2246 50  0000 L CNN
F 1 "47K" H 6220 2155 50  0000 L CNN
F 2 "" V 6080 2200 50  0001 C CNN
F 3 "~" H 6150 2200 50  0001 C CNN
	1    6150 2200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 614FA7FB
P 6500 2900
F 0 "SW4" H 6500 3185 50  0000 C CNN
F 1 "SW_Push" H 6500 3094 50  0000 C CNN
F 2 "" H 6500 3100 50  0001 C CNN
F 3 "~" H 6500 3100 50  0001 C CNN
	1    6500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2350 6150 3750
Connection ~ 6150 3750
Wire Wire Line
	6150 3750 5800 3750
Wire Wire Line
	4250 2750 4800 2750
Wire Wire Line
	5800 3550 5950 3550
Wire Wire Line
	5950 3550 5950 3350
Wire Wire Line
	5950 3350 6300 3350
Wire Wire Line
	6700 3350 6700 3750
Connection ~ 6700 3750
Wire Wire Line
	6700 2900 6700 3350
Connection ~ 6700 3350
Wire Wire Line
	6300 2900 6300 3050
Wire Wire Line
	6300 3050 5800 3050
Text Notes 6200 2500 0    50   ~ 0
A7 is analogue only \ninput (no pull up)
$Comp
L power:+5V #PWR?
U 1 1 61511750
P 5500 1900
F 0 "#PWR?" H 5500 1750 50  0001 C CNN
F 1 "+5V" H 5515 2073 50  0000 C CNN
F 2 "" H 5500 1900 50  0001 C CNN
F 3 "" H 5500 1900 50  0001 C CNN
	1    5500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2050 5500 1900
Text Notes 3350 4150 0    50   ~ 0
up to 7 LEDs
Text Notes 3150 2150 0    50   ~ 0
Serial Comms and Power via \nNano Mini-USB connector \n(USB Power pack once worn)
$Comp
L Device:R R2
U 1 1 61514F7C
P 4100 3550
F 0 "R2" H 4170 3596 50  0000 L CNN
F 1 "100" H 4170 3505 50  0000 L CNN
F 2 "" V 4030 3550 50  0001 C CNN
F 3 "~" H 4100 3550 50  0001 C CNN
	1    4100 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 3550 4800 3550
Wire Wire Line
	3950 3550 3850 3550
Wire Wire Line
	4400 3850 4200 3850
Wire Wire Line
	4400 3650 4800 3650
Wire Wire Line
	4200 4050 4300 4050
Connection ~ 5500 1900
Wire Wire Line
	5500 1900 6150 1900
Wire Wire Line
	6150 1900 6150 2050
Wire Wire Line
	3850 2750 3250 2750
Wire Wire Line
	6700 4850 5400 4850
Wire Wire Line
	6700 3750 6700 4850
Wire Wire Line
	5400 4050 5400 4850
Connection ~ 5400 4050
Connection ~ 5400 4850
Wire Wire Line
	5400 4850 4900 4850
Wire Wire Line
	4400 3650 4400 3850
Wire Wire Line
	4900 5000 4900 4850
Wire Wire Line
	4900 4850 4750 4850
Wire Wire Line
	3250 2750 3250 4850
Connection ~ 4900 4850
Connection ~ 4750 4850
$Comp
L Device:C_Small C1
U 1 1 615220D5
P 4500 4500
F 0 "C1" V 4729 4500 50  0000 C CNN
F 1 "C_Small" V 4638 4500 50  0000 C CNN
F 2 "" H 4500 4500 50  0001 C CNN
F 3 "~" H 4500 4500 50  0001 C CNN
	1    4500 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 4850 3850 4850
Wire Wire Line
	4400 4500 4300 4500
Wire Wire Line
	4300 4500 4300 4050
Connection ~ 4300 4050
Wire Wire Line
	4300 4050 4300 1900
Wire Wire Line
	4300 1900 5500 1900
Wire Wire Line
	4750 4850 4750 4500
Wire Wire Line
	4200 3950 4750 3950
Wire Wire Line
	4600 4500 4750 4500
Connection ~ 4750 4500
Wire Wire Line
	4750 4500 4750 3950
Wire Wire Line
	3850 3750 3850 4850
Connection ~ 3850 4850
Wire Wire Line
	3850 4850 4750 4850
$EndSCHEMATC
