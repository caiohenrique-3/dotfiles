#!/bin/bash

# Options for dmenu
options="ä\nö\nü\nÄ\nÖ\nÜ"

# Use dmenu to select an option
selected_option=$(echo -e "$options" | dmenu -p "Umlaut auswählen:")

# Copy the selected umlaut to the clipboard
case $selected_option in
    "ä") echo -n "ä" | xclip -selection clipboard ;;
    "ö") echo -n "ö" | xclip -selection clipboard ;;
    "ü") echo -n "ü" | xclip -selection clipboard ;;
    "Ä") echo -n "Ä" | xclip -selection clipboard ;;
    "Ö") echo -n "Ö" | xclip -selection clipboard ;;
    "Ü") echo -n "Ü" | xclip -selection clipboard ;;
    *) ;;
esac
