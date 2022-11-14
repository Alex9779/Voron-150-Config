; tpost0.g
; called after tool 0 has been selected
;
; Wait for set temperatures to be reached
M116 P0

G92 E0                        ; zero the extruder
G1 E15.0 F250                 ; load filament