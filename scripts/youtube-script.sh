#!/bin/sh

HISTORY_DIR="$HOME/.local/share/youtube-script"
HISTORY_FILE="$HISTORY_DIR/history"
LOG_FILE="$HISTORY_DIR/mpv_log.txt"
ENABLE_CLIPBOARD_PROMPT=true
ALWAYS_USE_CLIPBOARD=${ALWAYS_USE_CLIPBOARD:-false}

mkdir -p "$HISTORY_DIR"

function add_to_history() {
    local title="$1"
    local url="$2"
    local entry="$title - $url"

    if ! grep -Fxq "$entry" "$HISTORY_FILE"; then
        echo "$entry" | cat - "$HISTORY_FILE" > temp && mv temp "$HISTORY_FILE"
    fi
}

function play_video() {
    local url="$1"
    local from_history="${2:-false}"
    local audio_only="${3:-false}"

    if [[ "$from_history" == "false" ]]; then
        if [[ "$audio_only" == "true" ]]; then
            mpv --no-video --log-file="$LOG_FILE" "$url"
        else
            mpv --log-file="$LOG_FILE" "$url"
        fi

        # Extract the line containing the JSON data
        local json_line=$(grep -m 1 'user-data/mpv/ytdl/json-subprocess-result=' "$LOG_FILE")

        # Extract the JSON data from the line
        local json=$(echo "$json_line" | sed 's/.*user-data\/mpv\/ytdl\/json-subprocess-result=//')

        # Extract the command line options line for the playlist URL
        local cmd_line=$(grep -m 1 'Command line options:' "$LOG_FILE")
        local playlist_url=$(echo "$cmd_line" | grep -oP 'https?://[^ ]+/playlist\?list=[^ ]*')

        # Parse the JSON to get the title
        local title=$(echo "$json" | jq -r '.stdout | fromjson | .title')

        if [[ -n "$title" ]]; then
            if [[ -n "$playlist_url" ]]; then
                # Remove any trailing characters from the URL
                playlist_url=$(echo "$playlist_url" | sed "s/'//g")
                add_to_history "$title" "$playlist_url"
            else
                add_to_history "$title" "$(echo $url | grep -oP 'https?://[^ ]+/watch\?v=[\w-]{11}')"
            fi
        else
            echo "Failed to extract video title."
        fi
    else
        if [[ "$audio_only" == "true" ]]; then
            mpv --no-video "$url"
        else
            mpv "$url"
        fi
    fi
}

function prompt_for_link() {
    if [ "$ALWAYS_USE_CLIPBOARD" = true ]; then
        url=$(wl-paste)
        echo "Using clipboard content: $url"
    elif [ "$ENABLE_CLIPBOARD_PROMPT" = true ]; then
        echo -n "wl-clipboard? (y/n): "
        read -n 1 use_clipboard
        echo

        if [[ "$use_clipboard" =~ ^[Yy]$ ]]; then
            url=$(wl-paste)
            echo "Using clipboard content: $url"
        else
            read -p "Enter the link of your video or playlist: " url
        fi
    else
        read -p "Enter the link of your video or playlist: " url
    fi

    if [[ "$url" =~ ^https://[a-zA-Z0-9./?=_-]+$ || "$url" =~ ^http://[a-zA-Z0-9./?=_-]+$ || "$url" =~ ^[a-zA-Z0-9_-]{11}$ ]]; then
        if [[ ! "$url" =~ ^https ]]; then
            url="https://www.youtube.com/watch?v=$url"
        fi
        play_video "$url" false "$1"
    else
        echo "Invalid URL or video/playlist ID."
    fi
}

function show_history() {
    if [[ ! -f "$HISTORY_FILE" ]]; then
        echo "No history found."
        exit 1
    fi

    local selection
    selection=$(cat "$HISTORY_FILE" | fzf --height 40% --reverse --border --prompt="Select a video: ")

    if [[ -n "$selection" ]]; then
        local id
        id=$(echo "$selection" | sed 's/.* - //')
        play_video "$id" true "$1"
    fi
}

function show_usage() {
    echo "Usage: youtube-script <COMMAND> [audio-only]"
    echo
    echo "Commands:"
    echo "  help          Show usage information"
    echo "  watch         Watch a video and save it to history"
    echo "  history       Show video history and select an item to watch"
    echo
    echo "Optional flags:"
    echo "  audio-only    Play audio only"
}

case "$1" in
    help)
        show_usage
        ;;
    watch)
        if [[ "$2" == "audio-only" ]]; then
            prompt_for_link "true"
        else
            prompt_for_link "false"
        fi
        ;;
    history)
        if [[ "$2" == "audio-only" ]]; then
            show_history "true"
        else
            show_history "false"
        fi
        ;;
    *)
        show_usage
        ;;
esac
