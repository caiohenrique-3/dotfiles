#!/bin/sh

GAME_EXEC="$HOME/Game/game"
RUN_WITH_BUBBLEJAIL=true

if [ "$RUN_WITH_BUBBLEJAIL" = true ]; then
  bubblejail run game_instance sh -c "cd '$HOME/Game/' && ./game"
else 
  $GAME_EXEC
fi
