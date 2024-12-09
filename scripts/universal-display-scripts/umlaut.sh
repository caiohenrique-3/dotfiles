#!/bin/sh

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    clipboard_cmd="wl-copy"
    menu_cmd="wmenu"
else
    clipboard_cmd="xclip -selection clipboard"
    menu_cmd="dmenu"
fi

options="ä\nö\nü\nÄ\nÖ\nÜ"

selected_option=$(echo -e "$options" | $menu_cmd -f "JetBrainsMono Nerd Font 14" -p "Umlaut auswählen:")

case $selected_option in
    "ä") echo -n "ä" | $clipboard_cmd ;;
    "ö") echo -n "ö" | $clipboard_cmd ;;
    "ü") echo -n "ü" | $clipboard_cmd ;;
    "Ä") echo -n "Ä" | $clipboard_cmd ;;
    "Ö") echo -n "Ö" | $clipboard_cmd ;;
    "Ü") echo -n "Ü" | $clipboard_cmd ;;
    *) ;;
esac
