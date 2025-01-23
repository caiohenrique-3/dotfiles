#!/bin/sh

shutdown_icon=""
reboot_icon=""
logout_icon=""

choices="$shutdown_icon Shutdown\n$reboot_icon Reboot\n$logout_icon Logout"

chosen=$(echo -e "$choices" | wmenu -f "monospace 18" -p "Choose an action:")

case "$chosen" in
    "$shutdown_icon Shutdown")
        poweroff
        ;;
    "$reboot_icon Reboot")
        reboot
        ;;
    "$logout_icon Logout")
        pkill -u "$(whoami)"
        ;;
esac
