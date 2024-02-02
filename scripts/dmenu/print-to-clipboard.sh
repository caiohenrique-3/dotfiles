#!/bin/bash

maim -o -s | xclip -selection clipboard -t image/png
notify-send -i /usr/share/icons/Adwaita/symbolic/legacy/applets-screenshooter-symbolic.svg -t 2500 "Screenshot copied to clipboard"
