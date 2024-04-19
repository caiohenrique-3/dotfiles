#!/bin/sh

# Create a timestamp
timestamp=$(date +%Y%m%d_%H%M%S)

# Backup the current mirrorlist
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist_$timestamp

# Update the mirrorlist
sudo reflector --country 'United States,Brazil' -l 10 --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
