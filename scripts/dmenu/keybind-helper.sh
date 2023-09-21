#!/bin/bash

# Define your keybindings in an array
keybindings=(
    "super + shift + return  : open st"                
    "super + p               : dmenu_run"
    "super + e               : lf" 
    "super + shift + e       : thunar" 
    "F2                      : decrease volume" 
    "F3                      : increase volume" 
    "F4                      : mute volume" 
    "super + s               : print" 
    "super + shift + h       : keybind helper" 
    "super + ctrl + e        : emoji menu" 
    "super + shift + m       : mount media" 
    "super + shift + p       : power menu" 
    "super + b               : toggle bar" 
    "super + j               : focus stack forward" 
    "super + k               : focus stack backward" 
    "super + i               : increase master window count" 
    "super + d               : decrease master window count" 
    "super + h               : decrease master window size" 
    "super + l               : increase master window size" 
    "super + return          : set new master" 
    "super + tab             : toggle last tag" 
    "super + w               : kill window" 
    "super + t               : tile layout" 
    "super + f               : floating layout" 
    "super + m               : monocle layout" 
    "super + space           : toggle layout" 
    "super + shift + space   : toggle floating" 
    "super + shift + f       : toggle fullscreen" 
    "super + 0               : view all tags" 
    "super + shift + 0       : tag all windows" 
    "super + comma           : focus monitor left" 
    "super + period          : focus monitor right" 
    "super + shift + comma   : tag monitor left" 
    "super + shift + period  : tag monitor right" 
    "super + minus           : decrease gaps" 
    "super + equal           : increase gaps" 
    "super + shift + minus   : reset gaps" 
    "super + shift + equal   : toggle gaps" 
    "super + shift + q       : quit dwm" 
    "super + ctrl + escape   : reload dunst" 
)

# Join the keybindings array into a string
keybindings_string=$(printf "%s\n" "${keybindings[@]}")

# Display the keybindings using dmenu
echo "$keybindings_string" | dmenu -c -i -l 5 -p "Keybindings:"
