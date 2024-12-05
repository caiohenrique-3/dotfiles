#!/bin/sh

GAME_EXEC="$HOME/Game/game"
RUN_WITH_BUBBLEJAIL=true
WINE_CMD="/path/to/wine/binary"
WINE_PREFIX="/path/to/prefix"

if [ "$RUN_WITH_BUBBLEJAIL" = true ]; then
  bubblejail run game_instance sh -c "$WINE_CMD $GAME_EXEC"
else 
  $GAME_EXEC
fi
