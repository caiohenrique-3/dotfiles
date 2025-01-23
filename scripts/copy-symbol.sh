#!/bin/sh

options="Backslash\nPipe"

selected_option=$(echo -e "$options" | wmenu -f "monospace 18" -p "Select symbol:")

case $selected_option in
    "Backslash") printf "%s" "\\ " | wl-copy ;;
    "Pipe") echo -n "| " | wl-copy ;;
    *) ;;
esac
