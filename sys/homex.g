; homex.g
; called to home the X axis
G91              ; relative positioning
G1 H2 Z{global.ZEndstopZ + 1} F6000   ; lift Z relative to current position

M561                       ; clear any bed transform
M290 R0 Z0                 ; clear babystepping

G1 H1 X155 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 X-5 F6000     ; go back a few mm
G1 H1 X155 F360  ; move slowly to X axis endstop once more (second pass)
G1 H2 Z{-(global.ZEndstopZ + 1)} F6000  ; lower Z again
G90              ; absolute positioning
