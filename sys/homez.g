; homez.g
; called to home the Z axis
G91                   ; relative positioning
G1 H2 Z{global.ZEndstopZ + 1} F6000        ; lift Z relative to current position

M561                       ; clear any bed transform
M290 R0 Z0                 ; clear babystepping

G90                   ; absolute positioning
G1 X{global.ZEndstopX} Y{global.ZEndstopY} F6000     ; move to Z pin position
G91                   ; relative positioning

G1 H1 Z-130 F360      ; move Z down stopping at the endstop
G90                   ; absolute positioning
G92 Z{global.ZEndstopZ}                ; set Z position to axis minimum (you may want to adjust this)

G91                   ; relative positioning
G1 Z5 F100            ; lift Z relative to current position
G90                   ; absolute positioning
