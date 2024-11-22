#!/bin/bash

# Dependencies: exiftool and touch

# Check if at least one file is provided
if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <file1.jpg/file1.png> [file2.jpg/file2.png ...]"
  exit 1
fi

# Loop through all provided files
for file in "$@"; do
  # Check if the file exists
  if [ ! -f "$file" ]; then
    echo "File not found: $file"
    continue
  fi

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
done
