#!/bin/sh

for o in $(wlr-randr | grep -e "^[^[:space:]]\+" | cut -d " " -f 1); do
    wlr-randr --output "${o}" --toggle
done
