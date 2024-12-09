#!/bin/sh

GAME_EXEC="/path/to/game/executable"

USE_BUBBLEJAIL=true

if [ "$USE_BUBBLEJAIL" = true ]; then
  bubblejail run game_instance sh -c "cd '/path/to/game/dir' && ./game"
else 
  $GAME_EXEC
fi
