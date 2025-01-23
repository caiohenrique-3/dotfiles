#!/bin/sh

options="ä\nö\nü\nÄ\nÖ\nÜ"

selected_option=$(echo -e "$options" | wmenu -f "monospace 18" -p "Umlaut auswählen:")

case $selected_option in
    "ä") echo -n "ä" | wl-copy ;;
    "ö") echo -n "ö" | wl-copy ;;
    "ü") echo -n "ü" | wl-copy ;;
    "Ä") echo -n "Ä" | wl-copy ;;
    "Ö") echo -n "Ö" | wl-copy ;;
    "Ü") echo -n "Ü" | wl-copy ;;
    *) ;;
esac
