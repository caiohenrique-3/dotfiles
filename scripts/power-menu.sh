#!/bin/sh

shutdown_icon=""
reboot_icon=""
logout_icon=""

choices="$shutdown_icon Shutdown\n$reboot_icon Reboot\n$logout_icon Logout"

if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    chosen=$(echo -e "$choices" | wmenu -f "JetBrainsMono Nerd Font 14" -p "Choose an action:")
else
    chosen=$(echo -e "$choices" | dmenu -p "Choose an action:")
fi

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
