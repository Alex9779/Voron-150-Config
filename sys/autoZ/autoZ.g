if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28 ; home
  set global.klicky_skipNextDock = true
  G32 ; quad gantry leveling

M98 P"/sys/autoZ/init.g" ; load autoz framework
G29 S2 ; disable mesh
M290 R0 S0 ; RESET BABY STEPPING


; ---------- probe the nozzle ----------
M98 P"/sys/klicky/scripts/safeZhop.g"
M400
M98 P"/sys/autoZ/scripts/use_pin.g" ; use the z pin
M400
M98 P"/sys/autoZ/scripts/pin_XY.g" ; go to the z pin
M400
;M98 P"/sys/autoZ/scripts/configure_Zdrive.g" ; set z drive safe physics
G30 ; zero the z axis to the nozzle
M400
;M98 P"/sys/autoZ/scripts/restore_Zdrive.g" ; restore the z drive to the state before autoz
M400


; ---------- prepare the klicky ----------
M98 P"/sys/autoZ/scripts/use_klicky.g" ; use the klicky probe
M400
M98 P"/sys/klicky/attach.g"
M400
M98 P"/sys/autoZ/scripts/pin_XY_klicky.g" ; move the klicky probe switch body over the z pin
M400
;M98 P"/sys/autoZ/scripts/configure_Zdrive.g" ; set z drive safe physics
M400


; ---------- probe klicky switch body ----------
M98 P"/sys/autoZ/scripts/use_pin.g" ; use the z pin
M400
M98 P"/sys/autoZ/scripts/probeklicky.g" ; probe the klicky body with the z pin
M400
M98 P"/sys/autoZ/scripts/calculate.g" ; simple z offset calculation and average
M400
M98 P"/sys/autoZ/scripts/comptomesh.g"


; ---------- probe bed with klicky ----------
M98 P"/sys/autoZ/scripts/use_klicky.g" ; use the klicky probe
M98 P"/sys/klicky/scripts/safeZhop.g"
M400
M98 P"/sys/autoZ/scripts/bedcenter.g" ; go to the center of the bed 
M400
G30 ; set Z0 according to the klicky
M400


; ---------- get final result ----------
M98 P"/sys/autoZ/scripts/finaloffset.g"


; ---------- restore settings ----------
;M98 P"/sys/autoZ/scripts/restore_Zdrive.g" ; restore the z drive to the state before autoz
M574 Z1 S1 P{global.zpinname}
M558 P5 C{global.klickypinname} H5 F120 T6000 A30 S0.01   ; set Z probe type to unmodulated and the dive height + speeds
G31 P500 X-0.7 Y22.6 Z6.42                   ; set Z probe trigger value, offset and trigger height

; finalize
M98 P"/sys/klicky/dock.g"
M400
M291 T5 R"AutoZ complete" P"Z offset was detected"
