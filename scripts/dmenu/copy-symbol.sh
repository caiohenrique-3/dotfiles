#!/bin/bash

# Options for dmenu
options="Backslash\nPipe"

# Use dmenu to select an option
selected_option=$(echo -e "$options" | dmenu -p "Select symbol:")

# Copy the selected symbol to the clipboard
case $selected_option in
    "Backslash") echo -n "\\" | xclip -selection clipboard ;;
    "Pipe") echo -n "|" | xclip -selection clipboard ;;
    *) ;;
esac
