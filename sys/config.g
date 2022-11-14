; Configuration file for Duet 3 Mini 5+ (firmware version 3.3)
; executed by the firmware on start-up

; set globals
M98 P"/sys/globals.g"

; load settings
M98 P"/sys/settings.g"

; calls to additional scripts
M98 P"/sys/klicky/init.g"
M98 P"/sys/autoZ/init.g"

; General preferences
M575 P1 S1 B57600                            ; enable support for PanelDue
G90                                          ; send absolute coordinates...
M83                                          ; ...but relative extruder moves
M550 P"Voron 150"                            ; set printer name
M669 K1                                      ; select CoreXY mode

; Network
M552 S1                                      ; enable network
M586 P0 S1                                   ; enable HTTP
M586 P1 S0                                   ; disable FTP
M586 P2 S0                                   ; disable Telnet

; Drives
M569 P0.0 S1                                 ; physical drive 0.0 goes backwards
M569 P0.1 S0                                 ; physical drive 0.1 goes forwards
M569 P0.2 S1                                 ; physical drive 0.2 goes backwards
M569 P0.3 S0                                 ; physical drive 0.3 goes forwards

M569 P0.5 S1                                 ; physical drive 0.5 goes forwards
M569 P0.6 S1                                 ; physical drive 0.6 goes forwards

M569 P0.4 S0                        		 ; physical drive 0.4 goes backwards

M584 X0.5 Y0.6 Z0.0:0.1:0.2:0.3 E0.4         ; set drive mapping
M350 X16 Y16 Z16 E16 I1                      ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z800.00 E729.00            ; set steps per mm
M566 X600 Y600 Z12 E150                      ; set maximum instantaneous speed changes (mm/min)
M203 X30000 Y30000 Z720 E1800                ; set maximum speeds (mm/min)
M201 X9000 Y9000 Z500 E10000                 ; set accelerations (mm/s^2)
M201.1 X500 Y500 Z100                        ; set accelerations for special moves (mm/s^2)
M906 X950 Y950 Z850 E700 I70                 ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                      ; Set idle timeout

; Gantry levelling
M671 X-60.0:-60.0:210.0:210.0 Y-10.0:220.0:220.0:-10.0 S15.0

; Axis Limits
M208 X-3 Y0 Z0 S1                            ; set axis minima
M208 X151 Y159 Z120 S0                       ; set axis maxima

; Endstops
M574 X2 S1 P"!io2.in"                        ; configure switch-type (e.g. microswitch) endstop for high end on X via pin io2.in
M574 Y2 S1 P"!io3.in"                        ; configure switch-type (e.g. microswitch) endstop for high end on Y via pin io3.in
M574 Z1 S1 P"^io5.in"                        ; configure switch-type (e.g. microswitch) endstop for low end on Z via pin !io5.in

; Z-Probe (Klicky)
M558 P5 C"^io6.in" H5 F120 T6000 A30 S0.01   ; set Z probe type to unmodulated and the dive height + speeds
G31 P500 X{global.klicky_offsetX} Y{global.klicky_offsetY} Z{global.klicky_offsetZ}

; Heaters
; Bed
M308 S0 P"temp0" Y"thermistor" A"Bed bottom" T100000 B3950 ; configure sensor 0 as thermistor on pin temp0
M308 S1 P"temp1" Y"thermistor" A"Bed" T100000 B3950 ; configure sensor 1 as thermistor on pin temp1
M950 H0 C"out6" T1                           ; create bed heater output on out6 and map it to sensor 0
M307 H0 B0 S0.8                              ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                      ; map heated bed to heater 0
M143 H0 T0 S125                              ; set temperature limit for heater 0 to 125°C
M143 H0 T1 S150                              ; set temperature limit for heater 0 to 150°C
M307 H0 R0.217 K0.145:0.000 D12.32 E1.35 S0.80 B0

; Hotend
M308 S2 P"temp2" Y"thermistor" a"Hotend" T100000 B4725 C7.060000e-8 ; configure sensor 2 as thermistor on pin temp2
M950 H1 C"out1" T2                           ; create nozzle heater output on out2 and map it to sensor 2
M307 H1 B0 S1.00                             ; disable bang-bang mode for heater and set PWM limit
M143 H1 S285                                 ; set temperature limit for heater 1 to 320C
M307 H1 R6.151 K0.849:0.453 D2.04 E1.35 S1.00 B0 V24.0

M308 S3 Y"mcu-temp" A"MCU"                   ; configure sensor 2 as on-chip MCU temperature sensor
M308 S4 Y"drivers" A"Drivers"                ; configure sensor 3 as temperature warning and overheat flags on the TMC2660 on Duet

; Fans
; 24V
M950 F0 C"out5" Q250                         ; create fan on pin out3 and set its frequency
M106 P0 C"Hotend" S0 H2 T45                  ; set fan name and value. Thermostatic control is turned on

; 12V
M950 F1 C"out3" Q250                         ; create fan on pin out5 and set its frequency
M106 P1 C"Part" S0 H-1                       ; set fan name and value. Thermostatic control is turned off
M950 F2 C"!out4+out4.tach"                   ; fan 3 uses out4, but we are using a PWM fan so the output needs to be inverted, and using out4.tach as a tacho input
M106 P2 C"Electronics" H3:4 L0.3 X1 T40:60   ; set fan name and value. Thermostatic control is turned on

; Tools
M563 P0 D0.4 H1 F1 S"Print head"             ; define tool 0
G10 P0 X0 Y0 Z0                              ; set tool 0 axis offsets
G10 P0 R0 S0                                 ; set initial tool 0 active and standby temperatures to 0C

; Case LEDs (3.1W)
M950 P0 C"out2" Q500
M42 P0 S1.0

; NeoPixel LEDs
M150 X3                         			 ; set LED type to NeoPixel
M150 W55 P255 S3 F0

; Accelerometer
M955 P0 C"io1.out+io1.in" I41                ; set accelerometer use io1, just temporarily connected, +Z/-X and +X/+Y

; Miscellaneous
;M501                                         ; load saved parameters from non-volatile memory
