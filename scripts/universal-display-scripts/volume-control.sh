#!/bin/sh

DEFAULT_SINK=$(pactl info | grep 'Default Sink' | cut -d ' ' -f3)

function send_notification {
    dunstify -i /usr/share/icons/Adwaita/scalable/devices/audio-headphones.svg -r 1337 "Volume Control" "$1"
}

function get_volume {
    pactl list sinks | grep -A 15 '^[[:space:]]*Name: .*'${DEFAULT_SINK} | grep '^[[:space:]]Volume:' | awk -F/ '{print $2}' | sed 's/ //g'
}

function vol_up {
    pactl set-sink-volume "$DEFAULT_SINK" +5%
    VOLUME=$(get_volume)
    send_notification "Volume: $VOLUME"
}

function vol_down {
    pactl set-sink-volume "$DEFAULT_SINK" -5%
    VOLUME=$(get_volume)
    send_notification "Volume: $VOLUME"
}

function vol_mute {
    pactl set-sink-mute "$DEFAULT_SINK" toggle
    MUTED=$(pactl list sinks | grep -A 15 '^[[:space:]]*Name: .*'${DEFAULT_SINK} | grep '^[[:space:]]Mute:' | awk '{print $2}')
    if [ "$MUTED" = "yes" ]; then
        send_notification "Volume Muted"
    else
        VOLUME=$(get_volume)
        send_notification "Volume Unmuted: $VOLUME"
    fi
}

case $1 in
    up)
        vol_up
        ;;
    down)
        vol_down
        ;;
    mute)
        vol_mute
        ;;
    *)
        echo "Invalid option: $1"
        echo "Use: $0 {up|down|mute}"
        exit 1
        ;;
esac
