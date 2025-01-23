#!/bin/sh

SELECTION=$(tofi-run)
if [ -n "$SELECTION" ]; then
    eval "$SELECTION &"
fi
