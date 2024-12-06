#!/bin/sh

GAME_EXEC="/path/to/game/executable"
RUN_WITH_BUBBLEJAIL=true
WINE_CMD="$HOME/path/to/wine/binary"
WINE_PREFIX="/path/to/prefix"

if [ ! -d "$WINE_PREFIX" ]; then
  echo "Creating Wine prefix at $WINE_PREFIX"
  mkdir -p "$WINE_PREFIX"
  $WINE_CMD wineboot --init
fi

if [ "$RUN_WITH_BUBBLEJAIL" = true ]; then
  bubblejail run wine_games sh -c "WINEPREFIX=$WINE_PREFIX $WINE_CMD $GAME_EXEC"
else 
  WINEPREFIX=$WINE_PREFIX $WINE_CMD $GAME_EXEC
fi
