M574 Z0 C"nil" ; no Z endstop switch, free up Z endstop input may not be needed
M558 P8 C{global.klickypinname} I0 A30 H3 R0.1 F240:120 T99999 S0.0025 ; probe up to 30 times
G31 P1000 X0 Y18 Z0.0
