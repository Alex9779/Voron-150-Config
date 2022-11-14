if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
    G28 ; home

var centerx = move.axes[0].max / 2

if move.axes[2].machinePosition < 50
    G1 X{var.centerx} Y0 Z50 F10000
else
    G1 X{var.centerx} Y0 F10000