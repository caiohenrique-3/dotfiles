#!/bin/bash

# Default screenshot directory
DEFAULT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DEFAULT_DIR"

# Function to take a screenshot based on user choice
take_screenshot() {
    case "$1" in
        "1: Screenshot Whole Screen")
            FILEPATH="$DEFAULT_DIR/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
            maim "$FILEPATH"
            ;;
        "2: Screenshot Selection")
            FILEPATH="$DEFAULT_DIR/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
            maim -s "$FILEPATH"
            ;;
        "3: Screenshot and Copy to Clipboard")
            FILEPATH="/tmp/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
            maim "$FILEPATH" && xclip -selection clipboard -t image/png < "$FILEPATH"
            ;;
        "4: Screenshot Selection and Copy to Clipboard")
            FILEPATH="/tmp/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
            maim -s "$FILEPATH" && xclip -selection clipboard -t image/png < "$FILEPATH"
            ;;
    esac
}

# Show dmenu to select the screenshot option
OPTION=$(echo -e "1: Screenshot Whole Screen\n2: Screenshot Selection\n3: Screenshot and Copy to Clipboard\n4: Screenshot Selection and Copy to Clipboard" | dmenu -c -l 4 -i -p "Select Screenshot Option:")

# Take the screenshot based on user choice
if [ -n "$OPTION" ]; then
    take_screenshot "$OPTION"

    # Ask if the user wants to specify a custom path
    CUSTOM_PATH=$(echo -e "No\nYes" | dmenu -i -p "Do you want to specify a custom path?")

    if [ "$CUSTOM_PATH" == "Yes" ]; then
        # Prompt for the custom file path
        CUSTOM_FILEPATH=$(dmenu -p "Enter custom file path:" < <(compgen -d "$HOME/"))

        if [ -n "$CUSTOM_FILEPATH" ]; then
            mv "$FILEPATH" "$CUSTOM_FILEPATH"
            notify-send "Screenshot saved to" "$CUSTOM_FILEPATH"
        else
            notify-send "Cancelled" "Screenshot not saved"
        fi
    else
        notify-send "Screenshot saved to" "$FILEPATH"
    fi
else
    notify-send "Cancelled" "No screenshot taken"
fi
