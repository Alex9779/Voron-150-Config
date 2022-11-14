if !exists(global.comptomesh)
 global comptomesh = 1

if !exists(global.klickypinname)
 global klickypinname = "^io6.in"

if !exists(global.zpinname)
 global zpinname = "^io5.in"

if !exists(global.klickyoffset)
 global klickyoffset = 0.0001

if !exists(global.zpinx)
 global zpinx = 19.7

if !exists(global.zpiny)
 global zpiny = 257

; ---------- Data ----------
if !exists(global.autoz)
 global autoz = 0

if !exists(global.autoz_avg0)
 global autoz_avg0 = 0

if !exists(global.autoz_temp0)
 global autoz_temp0 = 10
 
if !exists(global.autoz_temp1)
 global autoz_temp1 = 15
 
if !exists(global.autoz_temp2)
 global autoz_temp2 = 20


; ---------- DRIVE ----------
if !exists(global.autozdrivecurrent)
 global autozdrivecurrent = 255 

if !exists(global.autozdrivespeed)
 global autozdrivespeed = 500 

if !exists(global.autozdriveaccel)
 global autozdriveaccel = 2500 

if !exists(global.autozdrivejerk)
 global autozdrivejerk = 150
 
if !exists(global.restorezidle)
 global restorezidle = move.idle.factor

if !exists(global.restorezcurrent)
 global restorezcurrent = move.axes[2].current

if !exists(global.restorezspeed)
 global restorezspeed = move.axes[2].speed

if !exists(global.restorezaccel)
 global restorezaccel = move.axes[2].acceleration

if !exists(global.restorezjerk)
 global restorezjerk = move.axes[2].jerk
