#!/bin/sh

SCREENSHOT_DIR="$HOME/Pictures/wl-screenshots"

if ! command -v grim &> /dev/null; then
  notify-send "Error" "grim is not installed"
  exit 1
fi

if ! command -v slurp &> /dev/null; then
  notify-send "Error" "slurp is not installed"
  exit 1
fi

if ! command -v wmenu &> /dev/null; then
  notify-send "Error" "wmenu is not installed"
  exit 1
fi

take_screenshot() {
  local filename=$1
  local copy_to_clipboard=$2
  local selection_area=$3
  local monitor=$4

  if [ "$selection_area" == "true" ]; then
    grim -g "$(slurp)" "$filename"
  elif [ "$monitor" ]; then
    grim -o "$monitor" "$filename"
  else
    grim "$filename"
  fi

  if [ "$copy_to_clipboard" == "true" ]; then
    if wl-copy < "$filename"; then
      notify-send "Screenshot Taken" "Screenshot copied to clipboard"
    else
      notify-send "Error" "Failed to copy screenshot to clipboard"
    fi
  fi
}

take_temp_screenshot() {
  local copy_to_clipboard=$1
  local selection_area=$2
  local monitor=$3

  FILENAME=$(mktemp /tmp/screenshot-XXXXXX.png)

  take_screenshot "$FILENAME" "$copy_to_clipboard" "$selection_area" "$monitor"
}

FILENAME="$SCREENSHOT_DIR/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

CHOICE=$(echo -e "Screenshot Whole Screen\nScreenshot Selection\nScreenshot Whole Screen and Copy to Clipboard\nScreenshot Selection and Copy to Clipboard" | wmenu -f "JetBrainsMono Nerd Font 14")

case "$CHOICE" in
  "Screenshot Whole Screen")
    take_screenshot "$FILENAME" "false" "false" "HDMI-A-1"
    ;;
  "Screenshot Selection")
    take_screenshot "$FILENAME" "false" "true" ""
    ;;
  "Screenshot Whole Screen and Copy to Clipboard")
    take_temp_screenshot "true" "false" "HDMI-A-1"
    ;;
  "Screenshot Selection and Copy to Clipboard")
    take_temp_screenshot "true" "true" ""
    ;;
  *)
    echo "Invalid option"
    ;;
esac

notify-send "Screenshot Taken" "Screenshot saved to $FILENAME"
