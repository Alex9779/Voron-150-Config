; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)
T-1

M568 P0 A0 ; disable hotend
M140 S-273.1 ; disable bed heater
M106 P1 S0 ; disable part cooling fan

M98 P"/sys/maintenance.g"