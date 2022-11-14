if !exists(param.E) || !exists(param.B)
    echo "Not enough paramaters!"
    abort

M568 P0 S0 R0 A0 ; disable hotend
M140 S0 R0
M140 S-273.1 ; disable bed heater

; bed top
if {param.B} <= 61
    M307 H0 R0.217 K0.172:0.000 D14.87 E1.35 S0.80 B0
elif {param.B} <= 71
    M307 H0 R0.225 K0.148:0.000 D12.40 E1.35 S0.80 B0
elif {param.B} <= 81
    M307 H0 R0.226 K0.146:0.000 D12.27 E1.35 S0.80 B0
elif {param.B} <= 91
    M307 H0 R0.223 K0.147:0.000 D12.06 E1.35 S0.80 B0
elif {param.B} <= 101
    M307 H0 R0.212 K0.140:0.000 D11.35 E1.35 S0.80 B0
else
    M307 H0 R0.217 K0.145:0.000 D12.32 E1.35 S0.80 B0

; hotend
if {param.E} <= 201
    M307 H1 R6.348 K0.905:0.743 D2.27 E1.35 S1.00 B0 V24.0
elif {param.E} <= 211
    M307 H1 R6.414 K0.919:0.684 D2.17 E1.35 S1.00 B0 V24.0
elif {param.E} <= 221
    M307 H1 R6.632 K0.946:0.678 D2.15 E1.35 S1.00 B0 V24.0
elif {param.E} <= 231
    M307 H1 R6.337 K0.868:0.615 D2.13 E1.35 S1.00 B0 V24.0
elif {param.E} <= 241
    M307 H1 R6.297 K0.885:0.593 D2.00 E1.35 S1.00 B0 V24.0
elif {param.E} <= 251
    M307 H1 R6.236 K0.868:0.521 D2.03 E1.35 S1.00 B0 V24.0
else
    M307 H1 R6.151 K0.849:0.453 D2.04 E1.35 S1.00 B0 V24.0

M561 ; clear any bed transform
M290 R0 Z0 ; clear babystepping
M220 S100 ; reset speed factor
M221 S100 D0 ; reset extrusion factor
G90 ; use absolute coordinates
M83 ; use relative distances for extrusion

M140 S{param.B} R40 ; set bed temperature

G28 ; home
M98 P"/macros/Maintenance" ; goto maintancne position

M190 S{param.B} ; set bed temperature and wait
M568 P0 S{param.E} R160 A1

set global.klicky_skipNextDock = true
G32 ; quad gantry leveling
G29 ; AutoZ

G1 X100 Y155 Z10 F3000 ; move nozzel to prime positon

T0 ; activate tool 0

;purge and wipe
G1 F250 E20.5
G1 F2400 X148
G1 F250 E5
G1 F50 E5
G1 F2400 X148 Y145 Z0.3
G1 F225 Y125 E1
G1 F550 Y110 Z0.2 E1
