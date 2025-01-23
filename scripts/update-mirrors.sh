#!/bin/sh

timestamp=$(date +%Y%m%d_%H%M%S)

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist_$timestamp

sudo reflector --country 'Germany,France' -l 10 --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
