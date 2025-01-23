#!/bin/sh

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

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

show_help() {
  echo "Usage: $0 {full|select|full_clip|select_clip|help}"
  echo "Options:"
  echo "  full        - Screenshot the whole screen"
  echo "  select      - Screenshot a selection"
  echo "  full_clip   - Screenshot the whole screen and copy to clipboard"
  echo "  select_clip - Screenshot a selection and copy to clipboard"
  echo "  help        - Display this help message"
}

case "$1" in
  full)
    take_screenshot "$FILENAME" "false" "false" "HDMI-A-1"
    notify-send "Screenshot Taken" "Screenshot saved to $FILENAME"
    ;;
  select)
    take_screenshot "$FILENAME" "false" "true" ""
    notify-send "Screenshot Taken" "Screenshot saved to $FILENAME"
    ;;
  full_clip)
    take_temp_screenshot "true" "false" "HDMI-A-1"
    notify-send "Screenshot Taken" "Screenshot saved to $FILENAME"
    ;;
  select_clip)
    take_temp_screenshot "true" "true" ""
    notify-send "Screenshot Taken" "Screenshot saved to $FILENAME"
    ;;
  help)
    show_help
    ;;
  *)
    echo "Invalid option. Use './script help' to see available options."
    exit 1
    ;;
esac
