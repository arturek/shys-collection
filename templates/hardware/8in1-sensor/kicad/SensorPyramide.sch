EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Sensor Pyramide"
Date "2020-11-18"
Rev "1.0"
Comp "Scheidler IT Solutions"
Comment1 "https://smarthomeyourself.de"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L mcu:NodeMCU_1.0_(ESP-12E) U1
U 1 1 5FB6006F
P 4790 3600
F 0 "U1" H 4790 4687 60  0000 C CNN
F 1 "NodeMCU_1.0_(ESP-12E)" H 4790 4581 60  0000 C CNN
F 2 "ESP8266:NodeMCU1.0(12-E)" H 4190 2750 60  0001 C CNN
F 3 "" H 4190 2750 60  0000 C CNN
	1    4790 3600
	1    0    0    -1  
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-3 J3
U 1 1 5FB71DB6
P 7740 2580
F 0 "J3" V 7881 2452 50  0000 R CNN
F 1 "HC-SR501" V 7790 2452 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x3_P2.54_Drill1.1mm" H 7940 2780 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7940 2880 60  0001 L CNN
F 4 "A19470-ND" H 7940 2980 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-3" H 7940 3080 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 7940 3180 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 7940 3280 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7940 3380 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-3/A19470-ND/259010" H 7940 3480 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 3POS 2.54MM" H 7940 3580 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 7940 3680 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7940 3780 60  0001 L CNN "Status"
	1    7740 2580
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-3 J7
U 1 1 5FB74B11
P 7740 4290
F 0 "J7" V 7881 4162 50  0000 R CNN
F 1 "NeoPixel Ring" V 7790 4162 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x3_P2.54_Drill1.1mm" H 7940 4490 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7940 4590 60  0001 L CNN
F 4 "A19470-ND" H 7940 4690 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-3" H 7940 4790 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 7940 4890 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 7940 4990 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7940 5090 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-3/A19470-ND/259010" H 7940 5190 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 3POS 2.54MM" H 7940 5290 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 7940 5390 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7940 5490 60  0001 L CNN "Status"
	1    7740 4290
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-3 J1
U 1 1 5FB76C24
P 2270 2800
F 0 "J1" V 2045 2808 50  0000 C CNN
F 1 "MQ-2" V 2136 2808 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x3_P2.54_Drill1.1mm" H 2470 3000 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 2470 3100 60  0001 L CNN
F 4 "A19470-ND" H 2470 3200 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-3" H 2470 3300 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2470 3400 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 2470 3500 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 2470 3600 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-3/A19470-ND/259010" H 2470 3700 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 3POS 2.54MM" H 2470 3800 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 2470 3900 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2470 4000 60  0001 L CNN "Status"
	1    2270 2800
	0    1    1    0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-3 J4
U 1 1 5FB77D53
P 7740 2970
F 0 "J4" V 7881 2842 50  0000 R CNN
F 1 "Lightlevel Sensor" V 7790 2842 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x3_P2.54_Drill1.1mm" H 7940 3170 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7940 3270 60  0001 L CNN
F 4 "A19470-ND" H 7940 3370 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-3" H 7940 3470 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 7940 3570 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 7940 3670 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7940 3770 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-3/A19470-ND/259010" H 7940 3870 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 3POS 2.54MM" H 7940 3970 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 7940 4070 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7940 4170 60  0001 L CNN "Status"
	1    7740 2970
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-3 J5
U 1 1 5FB78A93
P 7740 3360
F 0 "J5" V 7881 3232 50  0000 R CNN
F 1 "Sound-Sensor" V 7790 3232 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x3_P2.54_Drill1.1mm" H 7940 3560 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7940 3660 60  0001 L CNN
F 4 "A19470-ND" H 7940 3760 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-3" H 7940 3860 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 7940 3960 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 7940 4060 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7940 4160 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-3/A19470-ND/259010" H 7940 4260 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 3POS 2.54MM" H 7940 4360 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 7940 4460 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7940 4560 60  0001 L CNN "Status"
	1    7740 3360
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:640456-3 J6
U 1 1 5FB79AA4
P 7740 3760
F 0 "J6" V 7881 3632 50  0000 R CNN
F 1 "DHT-22" V 7790 3632 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x3_P2.54_Drill1.1mm" H 7940 3960 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7940 4060 60  0001 L CNN
F 4 "A19470-ND" H 7940 4160 60  0001 L CNN "Digi-Key_PN"
F 5 "640456-3" H 7940 4260 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 7940 4360 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 7940 4460 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=640456&DocType=Customer+Drawing&DocLang=English" H 7940 4560 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-amp-connectors/640456-3/A19470-ND/259010" H 7940 4660 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 3POS 2.54MM" H 7940 4760 60  0001 L CNN "Description"
F 11 "TE Connectivity AMP Connectors" H 7940 4860 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7940 4960 60  0001 L CNN "Status"
	1    7740 3760
	0    -1   -1   0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J8
U 1 1 5FB7AF02
P 7740 4640
F 0 "J8" V 7831 4512 50  0000 R CNN
F 1 "Piezo Beeper" V 7740 4512 50  0000 R CNN
F 2 "digikey-footprints:PinHeader_1x2_P2.54mm_Drill1.02mm" H 7940 4840 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 7940 4940 60  0001 L CNN
F 4 "WM4200-ND" H 7940 5040 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 7940 5140 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 7940 5240 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 7940 5340 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 7940 5440 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 7940 5540 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 7940 5640 60  0001 L CNN "Description"
F 11 "Molex" H 7940 5740 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7940 5840 60  0001 L CNN "Status"
	1    7740 4640
	0    -1   -1   0   
$EndComp
$Comp
L dk_Terminal-Blocks-Wire-to-Board:OSTTC022162 J2
U 1 1 5FB7DEB3
P 2940 4200
F 0 "J2" V 2715 4183 50  0000 C CNN
F 1 "V-IN (5V)" V 2806 4183 50  0000 C CNN
F 2 "digikey-footprints:Term_Block_1x2_P5.08MM" H 3140 4400 60  0001 L CNN
F 3 "http://www.on-shore.com/wp-content/uploads/OSTTCXX2162.pdf" H 3140 4500 60  0001 L CNN
F 4 "ED2609-ND" H 3140 4600 60  0001 L CNN "Digi-Key_PN"
F 5 "OSTTC022162" H 3140 4700 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 3140 4800 60  0001 L CNN "Category"
F 7 "Terminal Blocks - Wire to Board" H 3140 4900 60  0001 L CNN "Family"
F 8 "http://www.on-shore.com/wp-content/uploads/OSTTCXX2162.pdf" H 3140 5000 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-shore-technology-inc/OSTTC022162/ED2609-ND/614558" H 3140 5100 60  0001 L CNN "DK_Detail_Page"
F 10 "TERM BLK 2P SIDE ENT 5.08MM PCB" H 3140 5200 60  0001 L CNN "Description"
F 11 "On Shore Technology Inc." H 3140 5300 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3140 5400 60  0001 L CNN "Status"
	1    2940 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	3040 4300 3400 4300
Text GLabel 3400 4100 1    50   Input ~ 0
GND
Text GLabel 3400 4440 3    50   Input ~ 0
5V
Wire Wire Line
	3400 4440 3400 4300
Connection ~ 3400 4300
Wire Wire Line
	3400 4200 3400 4100
Connection ~ 3400 4200
Wire Wire Line
	3400 4200 3990 4200
Wire Wire Line
	3040 4200 3400 4200
Wire Wire Line
	3400 4300 3990 4300
Text GLabel 2500 2800 2    50   Input ~ 0
5V
Text GLabel 2500 2900 2    50   Input ~ 0
GND
Text GLabel 2500 3000 2    50   Input ~ 0
MQ2-Analog
Wire Wire Line
	2370 2900 2500 2900
Wire Wire Line
	2370 2800 2500 2800
Wire Wire Line
	2500 3000 2370 3000
Text GLabel 3840 2900 0    50   Input ~ 0
MQ2-Analog
Wire Wire Line
	3840 2900 3990 2900
Text GLabel 7390 2380 0    50   Input ~ 0
5V
Text GLabel 7390 2480 0    50   Input ~ 0
GND
Text GLabel 7390 2770 0    50   Input ~ 0
5V
Text GLabel 7390 2870 0    50   Input ~ 0
GND
Text GLabel 7390 3160 0    50   Input ~ 0
5V
Text GLabel 7390 3260 0    50   Input ~ 0
GND
Text GLabel 7150 3560 0    50   Input ~ 0
5V
Text GLabel 7150 3660 0    50   Input ~ 0
GND
$Comp
L Device:R R2
U 1 1 5FBA5F1E
P 7400 3560
F 0 "R2" V 7290 3560 50  0000 C CNN
F 1 "10K" V 7400 3560 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 7330 3560 50  0001 C CNN
F 3 "~" H 7400 3560 50  0001 C CNN
	1    7400 3560
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 3560 7190 3560
Wire Wire Line
	7190 3560 7190 3490
Wire Wire Line
	7190 3490 7640 3490
Wire Wire Line
	7640 3490 7640 3560
Connection ~ 7190 3560
Wire Wire Line
	7190 3560 7250 3560
Wire Wire Line
	7150 3760 7550 3760
Text GLabel 7150 3760 0    50   Input ~ 0
TEMPERATURE
Wire Wire Line
	7390 3160 7640 3160
Wire Wire Line
	7640 3260 7390 3260
Text GLabel 7390 3360 0    50   Input ~ 0
SOUND
Wire Wire Line
	7390 3360 7640 3360
Text GLabel 7390 2970 0    50   Input ~ 0
LIGHT
Wire Wire Line
	7390 2970 7640 2970
Wire Wire Line
	7390 2870 7640 2870
Wire Wire Line
	7640 2770 7390 2770
Wire Wire Line
	7390 2580 7640 2580
Wire Wire Line
	7390 2380 7640 2380
Text GLabel 7390 2580 0    50   Input ~ 0
MOTION
Wire Wire Line
	7390 2480 7640 2480
Text GLabel 7250 4090 0    50   Input ~ 0
5V
Text GLabel 7250 4190 0    50   Input ~ 0
GND
Text GLabel 7250 4290 0    50   Input ~ 0
RGB
Wire Wire Line
	7250 4090 7640 4090
Wire Wire Line
	7640 4190 7250 4190
Wire Wire Line
	7250 4290 7640 4290
$Comp
L Device:R R1
U 1 1 5FBAEC21
P 7340 4540
F 0 "R1" V 7420 4540 50  0000 C CNN
F 1 "100R" V 7340 4540 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 7270 4540 50  0001 C CNN
F 3 "~" H 7340 4540 50  0001 C CNN
	1    7340 4540
	0    1    -1   0   
$EndComp
Wire Wire Line
	7490 4540 7640 4540
Text GLabel 7070 4540 0    50   Input ~ 0
BUZZER
Wire Wire Line
	7070 4540 7190 4540
Text GLabel 7070 4640 0    50   Input ~ 0
GND
Wire Wire Line
	7070 4640 7640 4640
Text GLabel 5840 3000 2    50   Input ~ 0
MOTION
Text GLabel 5840 3100 2    50   Input ~ 0
LIGHT
Text GLabel 5840 3600 2    50   Input ~ 0
SOUND
Text GLabel 5830 3700 2    50   Input ~ 0
TEMPERATURE
Text GLabel 5840 3200 2    50   Input ~ 0
BUZZER
Text GLabel 5840 3800 2    50   Input ~ 0
RGB
Wire Wire Line
	5590 3000 5840 3000
Wire Wire Line
	5590 3100 5840 3100
Wire Wire Line
	5840 3200 5590 3200
Wire Wire Line
	5590 3600 5840 3600
Wire Wire Line
	5830 3700 5590 3700
Wire Wire Line
	5590 3800 5840 3800
NoConn ~ 3990 3000
NoConn ~ 3990 3100
NoConn ~ 3990 3200
NoConn ~ 3990 3300
NoConn ~ 3990 3400
NoConn ~ 3990 3500
NoConn ~ 3990 3600
NoConn ~ 3990 3700
NoConn ~ 3990 3800
NoConn ~ 3990 3900
NoConn ~ 3990 4000
NoConn ~ 3990 4100
NoConn ~ 5590 4300
NoConn ~ 5590 4200
NoConn ~ 5590 4100
NoConn ~ 5590 4000
NoConn ~ 5590 3900
NoConn ~ 5590 3500
NoConn ~ 5590 3400
NoConn ~ 5590 3300
NoConn ~ 5590 2900
NoConn ~ 10270 5220
Connection ~ 7550 3760
Wire Wire Line
	7550 3760 7640 3760
Wire Wire Line
	7150 3660 7640 3660
Wire Wire Line
	7550 3560 7550 3760
$EndSCHEMATC
