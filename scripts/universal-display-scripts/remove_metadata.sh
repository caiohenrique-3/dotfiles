#!/bin/sh

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <file1.jpg/file1.png> [file2.jpg/file2.png ...]"
  exit 1
fi

for file in "$@"; do
  if [ ! -f "$file" ]; then
    echo "File not found: $file"
    continue
  fi

  exiftool -overwrite_original -All= "$file"

  fixed_date="2012-01-01"

  random_hour=$(printf "%02d" $((RANDOM % 24)))
  random_minute=$(printf "%02d" $((RANDOM % 60)))
  random_second=$(printf "%02d" $((RANDOM % 60)))

  random_time="${fixed_date}T${random_hour}:${random_minute}:${random_second} UTC"

  touch -a -m -d "$random_time" "$file"

  echo "Metadata removed and last modification and access time set for $file: $random_time"
done
