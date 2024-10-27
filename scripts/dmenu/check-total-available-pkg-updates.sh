#!/bin/sh

if ! ping -c 1 archlinux.org &> /dev/null; then
    notify-send "Package Updates" "No internet connection available"
    exit 1
fi

updates=$(checkupdates | wc -l)

notify-send "Package Updates" "There are $updates packages available for update"
