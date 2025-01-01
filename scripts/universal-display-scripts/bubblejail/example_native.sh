#!/bin/sh

GAME_EXEC="/path/to/game/executable"
GAME_DIR=$(dirname "$GAME_EXEC")
MANGOHUD_CONFIGFILE="/path/to/config.conf"

bubblejail run native_games sh -c "
    cd $GAME_DIR &&
    MANGOHUD_CONFIGFILE=$MANGOHUD_CONFIGFILE \
    mangohud $GAME_EXEC
"
