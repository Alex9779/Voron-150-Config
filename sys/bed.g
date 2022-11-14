; bed.g
; called to perform automatic bed compensation via G32
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28 ; home

if move.axes[2].machinePosition <= {global.klicky_safeZ}
  G90
  G1 Z{global.klicky_safeZ}
 
M561 ; clear any bed transform
M290 R0 Z0 ; clear babystepping

M98 P"/sys/klicky/attach.g"

G90
G1 X{10 - global.klicky_offsetX} Y{35 - global.klicky_offsetY}; move to first point

; Gantry levelling
G30 P0 X10 Y35 Z-99999 ; probe near a leadscrew
G30 P1 X10 Y135 Z-99999 ; probe near a leadscrew
G30 P2 X140 Y135 Z-99999 ; probe near a leadscrew
G30 P3 X140 Y35 Z-99999 S4 ; probe near a leadscrew and calibrate 3 motors

G28 ; home

M98 P"/sys/klicky/dock.g"