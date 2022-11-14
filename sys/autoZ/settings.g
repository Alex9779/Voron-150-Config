; ---------- ---------- EDIT THESE VALUES FOR YOUR MACHINE ---------- ----------

; ---------- Mesh Setting ----------
set global.comptomesh = 2 ; 1 for compensation to the mesh 2 for compensation to the actual bed

; ---------- Pin Names ----------
; THIS IS THE NAME OF THE PIN YOUR CLICKY PROBE IS CONNECTED TO
set global.klickypinname = "^io6.in" ; < edit leaving quotes

; THIS IS THE NAME OF THE PIN YOUR Z PIN IS CONNECTED TO
set global.zpinname = "^io5.in" ; < edit leaving quotes

; ---------- Coordinates ----------
; THIS IS THE DISTANCE FROM THE BODY OF THE CLICKY PROBE TO IT'S OWN TRIGGER POINT
set global.klickyoffset = 0.600 ; larger values here means nozzle closer to the bed after autoz

; THIS IS THE ABSOLUTE X LOCATION OF THE MECHANICAL Z PIN
set global.zpinx = {global.ZEndstopX}

; THIS IS THE ABSOLUTE Y LOCATION OF THE MECHANICAL Z PIN
set global.zpiny = {global.ZEndstopY}

; --------- Z Drive Electrical Params ----------
; THIS IS THE DRIVE CURRENT USED DURING AUTO Z
set global.autozdrivecurrent = 550


; THIS IS THE MAXIMUM SPEED FOR ALL Z MOVES DURING AUTOZ
set global.autozdrivespeed = 250


; THIS IS THE MAXIMUM ACCEL FOR ALL Z MOVES DURING AUTOZ
set global.autozdriveaccel = 800


; THIS IS THE MAXIMUM JERK FOR ALL Z MOVES DURING AUTOZ
set global.autozdrivejerk = 150
