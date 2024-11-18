#!/bin/bash

# Dependencies: exiftool and touch

# Check if a file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file.jpg/file.png>"
  exit 1
fi

# Get the file name from the first argument
file="$1"

# Removing all metadata from file
exiftool -overwrite_original -All= "$file"

# Define the fixed date
fixed_date="2012-01-01"

# Generate random hour, minute, and second
random_hour=$(printf "%02d" $((RANDOM % 24)))
random_minute=$(printf "%02d" $((RANDOM % 60)))
random_second=$(printf "%02d" $((RANDOM % 60)))

# Combine the fixed date with random time
random_time="${fixed_date}T${random_hour}:${random_minute}:${random_second} UTC"

# Update the access time and modification time
touch -a -m -d "$random_time" "$file"

echo "Metadata removed and last modification and access time set for $file: $random_time"
