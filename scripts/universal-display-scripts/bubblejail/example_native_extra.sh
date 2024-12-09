#!/bin/sh

GAME_EXEC="/path/to/game/executable"

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

if [ "$USE_BUBBLEJAIL" = true ]; then
  bubblejail run game_instance sh -c "cd '/path/to/game/dir' && $GAMESCOPE_CMD $MANGOHUD_CMD ./game"
else 
  $GAMESCOPE_CMD $MANGOHUD_CMD $GAME_EXEC
fi
