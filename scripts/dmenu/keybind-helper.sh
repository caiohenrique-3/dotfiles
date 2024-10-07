#!/bin/bash

# Define your keybindings in an array
keybindings=(
    "super + shift + return  : open terminal"
    "super + p               : dmenu_run"
    "super + e               : open lf"
    "super + shift + e       : open thunar"
    "super + F2              : decrease volume"
    "super + F3              : increase volume"
    "super + F4              : mute volume"
    "super + s               : open flameshot"
    "super + shift + h       : keybind helper"
    "super + ctrl + e        : emoji menu"
    "super + shift + m       : mount media"
    "super + shift + p       : power menu"
    "super + shift + r       : reset wallpaper"
    "super + shift + u       : copy umlaut"
    "super + b               : toggle bar"
    "super + j               : focus stack backward"
    "super + k               : focus stack forward"
    "super + i               : increase master window count"
    "super + d               : decrease master window count"
    "super + h               : decrease master window size"
    "super + l               : increase master window size"
    "super + return          : toggle master window"
    "super + tab             : toggle last tag"
    "super + w               : kill window"
    "super + t               : tile layout"
    "super + f               : floating layout"
    "super + m               : monocle layout"
    "super + space           : set layout"
    "super + shift + space   : toggle floating"
    "super + shift + f       : toggle fullscreen"
    "super + 0               : view all tags"
    "super + shift + 0       : tag all windows"
    "super + comma           : focus monitor left"
    "super + period          : focus monitor right"
    "super + shift + comma   : send to left monitor"
    "super + shift + period  : send to right monitor"
    "super + minus           : decrease gaps"
    "super + equal           : increase gaps"
    "super + shift + minus   : reset gaps"
    "super + shift + equal   : toggle gaps"
    "super + shift + q       : restart dwm"
    "super + ctrl + escape   : reload dunst"
)

# Join the keybindings array into a string
keybindings_string=$(printf "%s\n" "${keybindings[@]}")

# Display the keybindings using dmenu
echo "$keybindings_string" | dmenu -c -i -l 5 -p "Keybindings:"
