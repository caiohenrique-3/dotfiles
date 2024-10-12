#!/bin/bash

# File path to the list of YouTube channels
file_path="$1"

# Check if the file exists
if [[ ! -f "$file_path" ]]; then
  echo "File not found!"
  exit 1
fi

# Read the file and extract channel names and URLs without empty lines
channels=$(awk -F '#' 'NF {print $2 " " $1}' "$file_path")

# Use fzf to display a menu and select a channel
selected_channel=$(echo "$channels" | fzf --delimiter=' ' --with-nth=1)

# Extract the URL from the selected channel
channel_url=$(echo "$selected_channel" | awk '{print $NF}')

# Run the ytfzf command with the selected channel URL
ytfzf -c youtube-channel "$channel_url"
