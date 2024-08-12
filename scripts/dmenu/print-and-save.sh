#!/bin/bash

maim ~/Pictures/$(date +%s).png
notify-send -i /usr/share/icons/Adwaita/symbolic/legacy/applets-screenshooter-symbolic.svg -t 2500 "Screenshot saved to Pictures folder"
