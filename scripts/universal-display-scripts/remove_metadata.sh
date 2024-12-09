#!/bin/sh

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <file1.jpg/file1.png> [file2.jpg/file2.png ...]"
  exit 1
fi

generate_random_date() {
  year=$((RANDOM % 13 + 2009))

  month=$((RANDOM % 12 + 1))

  if [ "$month" -eq 2 ]; then
    if [ $((year % 4)) -eq 0 ] && { [ $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]; }; then
      # Leap year
      day=$((RANDOM % 29 + 1))
    else
      # Non-leap year
      day=$((RANDOM % 28 + 1))
    fi
  elif [ "$month" -eq 4 ] || [ "$month" -eq 6 ] || [ "$month" -eq 9 ] || [ "$month" -eq 11 ]; then
    day=$((RANDOM % 30 + 1))
  else
    day=$((RANDOM % 31 + 1))
  fi

  printf "%04d-%02d-%02d" "$year" "$month" "$day"
}

file_count="$#"
echo "Removing metadata of $file_count files..."

index=1

for file in "$@"; do
  if [ ! -f "$file" ]; then
    echo "File not found: $file"
    continue
  fi

  exiftool -overwrite_original -All= "$file"

  fixed_date=$(generate_random_date)

  random_hour=$(printf "%02d" $((RANDOM % 24)))
  random_minute=$(printf "%02d" $((RANDOM % 60)))
  random_second=$(printf "%02d" $((RANDOM % 60)))

  random_time="${fixed_date}T${random_hour}:${random_minute}:${random_second} UTC"

  touch -a -m -d "$random_time" "$file"

  echo "$index: $file set to $random_time"

  index=$((index + 1))
done

echo "All files processed successfully."
