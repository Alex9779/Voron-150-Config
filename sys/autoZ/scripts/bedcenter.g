var centerx = move.axes[0].max / 2
var centery = move.axes[1].max / 2

G90
G1 X{var.centerx - global.klicky_offsetX} Y{var.centery - global.klicky_offsetY} F6000
