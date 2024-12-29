#!/bin/sh

GAME_EXEC="/path/to/game/executable"
WINE_PREFIX="/path/to/prefix"
WINE_CMD="/path/to/wine/binary"

bubblejail run wine_games sh -c "WINEPREFIX=$WINE_PREFIX $WINE_CMD $GAME_EXEC"
