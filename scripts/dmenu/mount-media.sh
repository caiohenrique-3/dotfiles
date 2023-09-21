#!/bin/bash

# Define some variables
action=$(echo -e "Mount\nUnmount" | dmenu -p "Select action:")
drives=$(lsblk -rno NAME,LABEL,TYPE,MOUNTPOINT | awk '/part/ && !/\/boot|\/home|\/swap/ {print $1,$2}')

# Function to send notification
send_notification() {
    dunstify -i /usr/share/icons/Adwaita/scalable/devices/drive-removable-media.svg -r 1337 "Drive Manager" "$1"
}

if [[ $action == "Mount" ]]; then
    chosen_drive=$(echo -e "$drives" | dmenu -p "Select drive to mount:" | awk '{print $1}')
    if [[ -z $chosen_drive ]]; then
        send_notification "Mount action canceled"
    else
        udisksctl mount -b "/dev/$chosen_drive"
        send_notification "Mounted $chosen_drive"
    fi
elif [[ $action == "Unmount" ]]; then
    chosen_drive=$(echo -e "$drives" | dmenu -p "Select drive to unmount:" | awk '{print $1}')
    if [[ -z $chosen_drive ]]; then
        send_notification "Unmount action canceled"
    else
        udisksctl unmount -b "/dev/$chosen_drive"
        send_notification "Unmounted $chosen_drive"
    fi
fi

