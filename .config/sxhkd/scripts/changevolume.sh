#!/bin/bash

# Increase volume
if [[ $1 == "up" ]]; then
    amixer set Master 5%+
fi

# Decrease volume
if [[ $1 == "down" ]]; then
    amixer set Master 5%-
fi

# Toggle mute
if [[ $1 == "toggle" ]]; then
    amixer set Master toggle
fi

