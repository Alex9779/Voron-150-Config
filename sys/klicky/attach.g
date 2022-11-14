; Macro to attach the Klicky
M98 P"/sys/klicky/settings.g"
M98 P"/sys/klicky/scripts/status.g"

if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
    G28

M98 P"/sys/klicky/scripts/safeZhop.g"

if global.klicky_status != "attached"
    M98 P"/sys/klicky/scripts/dockpos.g"

    G91
    G1 Y{global.klicky_attachMove} F6000
    G1 Y{-global.klicky_attachMove}
    M400

    M98 P"/sys/klicky/scripts/status.g"

if global.klicky_status = "attached"
    echo "Klicky ATTACHED"
else
    echo "Error Klicky not attached - aborting"
    abort
