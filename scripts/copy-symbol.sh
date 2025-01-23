#!/bin/sh

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    clipboard_cmd="wl-copy"
    menu_cmd="wmenu"
else
    clipboard_cmd="xclip -selection clipboard"
    menu_cmd="dmenu"
fi

options="Backslash\nPipe"

selected_option=$(echo -e "$options" | $menu_cmd -f "JetBrainsMono Nerd Font 14" -p "Select symbol:")

case $selected_option in
    "Backslash") printf "%s" "\\ " | $clipboard_cmd ;;
    "Pipe") echo -n "| " | $clipboard_cmd ;;
    *) ;;
esac
