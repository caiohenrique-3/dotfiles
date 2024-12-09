#!/bin/sh

GAME_EXEC="/path/to/game/executable"

WINE_CMD="$HOME/path/to/wine/binary"
WINE_PREFIX="/path/to/prefix"

USE_BUBBLEJAIL=true
USE_MANGOHUD=false
USE_GAMESCOPE=false

if [ "$USE_MANGOHUD" = true ]; then
  MANGOHUD_CMD="mangohud"
else
  MANGOHUD_CMD=""
fi

if [ "$USE_GAMESCOPE" = true ]; then
  GAMESCOPE_CMD="gamescope --"
else
  GAMESCOPE_CMD=""
fi

if [ ! -d "$WINE_PREFIX" ]; then
  echo "Creating Wine prefix at $WINE_PREFIX"
  mkdir -p "$WINE_PREFIX"
  $WINE_CMD wineboot --init
fi

if [ "$USE_BUBBLEJAIL" = true ]; then
  bubblejail run wine_games sh -c "WINEPREFIX=$WINE_PREFIX $GAMESCOPE_CMD $MANGOHUD_CMD $WINE_CMD $GAME_EXEC"
else 
  WINEPREFIX=$WINE_PREFIX $GAMESCOPE_CMD $MANGOHUD_CMD $WINE_CMD $GAME_EXEC
fi
