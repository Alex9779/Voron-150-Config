# Voron 150 with Duet Mini 5+ config
This is the config of my Voron 150 with a Duet Mini 5+.

It uses a [Klicky Probe](https://github.com/jlas1/Klicky-Probe) for gantry leveling and I implemented an automatic Z offset calibration based on [this script collection](https://github.com/pRINTERnOODLE/Auto-Z-calibration-for-RRF-3.3-or-later-and-Klicky-Probe) by [pRINTERnOODLE](https://github.com/pRINTERnOODLE). Many thanks for the basis!

Though I cleaned the scripts, refactored configuration and removed a lot of stuff (still not fully fnished yet). The part changing motor configuration for Auto-Z is disabled at the moment, for this printer it does not seem to be necessary.

## Configuration

Basically everything is configured in [config.g](sys/config.g). There is a [settings.g](sys/settings.g) with some global variables for the Z endstop also.

Each script collection, one for controlling the [Klicky Probe](https://github.com/jlas1/Klicky-Probe) and one for the Auto-Z calibration, has it own *settings.g*:

- Klick Probe: [settings.g](sys/klicky/settings.g)
- Auto-Z: [settings.g](sys/autoZ/settings.g)

Printer scpecific values have to be adjusted in these files.
