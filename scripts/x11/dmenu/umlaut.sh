#!/bin/sh

options="ä\nö\nü\nÄ\nÖ\nÜ"

selected_option=$(echo -e "$options" | dmenu -p "Umlaut auswählen:")

case $selected_option in
    "ä") echo -n "ä" | xclip -selection clipboard ;;
    "ö") echo -n "ö" | xclip -selection clipboard ;;
    "ü") echo -n "ü" | xclip -selection clipboard ;;
    "Ä") echo -n "Ä" | xclip -selection clipboard ;;
    "Ö") echo -n "Ö" | xclip -selection clipboard ;;
    "Ü") echo -n "Ü" | xclip -selection clipboard ;;
    *) ;;
esac
