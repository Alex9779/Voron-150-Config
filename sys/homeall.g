; homeall.g
; called to home all axes
;
G91                   ; relative positioning
G1 H2 Z{global.ZEndstopZ + 1} F6000        ; lift Z relative to current position

M561                       ; clear any bed transform
M290 R0 Z0                 ; clear babystepping

G1 H1 X155 F1800      ; move quickly to X endstop and stop there (first pass)
G1 H1 Y155 F1800      ; move quickly to Y endstop and stop there (first pass)
G1 H1 X155            ; home X axis
G1 H1 Y155            ; home Y axis
G1 X-5 Y-5 F6000      ; go back a few mm
G1 H1 X155 F360       ; move slowly to X axis endstop once more (second pass)
G1 H1 Y155            ; then move slowly to Y axis endstop

G90
G1 X{global.ZEndstopX} Y{global.ZEndstopY} F6000   ; move to Z pin position
G91

G1 H1 Z-130 F360      ; move Z down stopping at the endstop
G90                   ; absolute positioning
G92 Z{global.ZEndstopZ} ; set Z position to axis minimum (you may want to adjust this)

G91                   ; relative positioning
G1 Z5 F100            ; lift Z relative to current position
G90                   ; absolute positioning
