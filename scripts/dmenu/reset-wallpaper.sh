#!/bin/bash

# Read the current wallpaper from .fehbg
current_wallpaper=$(grep -v "feh --bg-fill ~/Pictures/black.jpg" ~/.fehbg)

# Check if the current wallpaper is not the placeholder
if [[ "$current_wallpaper" != *"black.jpg"* ]]; then
  echo "$current_wallpaper" > ~/.last_wallpaper
fi

# Reset the wallpaper to the placeholder
feh --bg-fill ~/Pictures/black.jpg

# Send a notification
notify-send -t 2500 "Wallpaper reset  ( ͡° ͜ʖ ͡°) "
