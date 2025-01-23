#!/bin/sh

GAME_EXEC="/path/to/game/executable"
WINE_PREFIX="/path/to/prefix"
WINE_CMD="/path/to/wine/executable"
MANGOHUD_CONFIGFILE="/path/to/config.conf"

bubblejail run wine_games sh -c "
    WINEPREFIX=$WINE_PREFIX \
    WINEFSYNC=1 \
    env -u DISPLAY WAYLAND_DISPLAY=wayland-0 \
    MANGOHUD_CONFIGFILE=$MANGOHUD_CONFIG \
    mangohud $WINE_CMD $GAME_EXEC
"
