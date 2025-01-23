#!/bin/sh

LAUNCHERS_DIR="/path/to/game/launcher/scripts"

if [ ! -d "$LAUNCHERS_DIR" ]; then
  echo "Launchers directory not found: $LAUNCHERS_DIR"
  exit 1
fi

SELECTED_LAUNCHER=$(find "$LAUNCHERS_DIR" -type f ! -name "*example*" -exec basename {} \; | fzf --prompt="Select a game: ")

if [ -z "$SELECTED_LAUNCHER" ]; then
  echo "No game selected. Exiting."
  exit 0
fi

LAUNCHER_PATH="$LAUNCHERS_DIR/$SELECTED_LAUNCHER"

if [ -x "$LAUNCHER_PATH" ]; then
  "$LAUNCHER_PATH" &
  exit 0
else
  echo "Selected launcher is not executable: $LAUNCHER_PATH"
  exit 1
fi
