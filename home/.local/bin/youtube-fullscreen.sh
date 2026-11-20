#!/bin/bash
# Open YouTube video in Firefox Dev Edition, fullscreen, and auto-play

URL="https://www.youtube.com/watch?v=2qBlE2-WL60"

# Open Firefox Dev Edition with the URL in a new window
firefox-developer-edition --new-window "$URL" &

# Wait for Firefox to open and the page to start loading
sleep 4

# Try to send F11 for fullscreen using available tools
# Priority: wtype (Wayland) > ydotool > xdotool
if command -v wtype &> /dev/null; then
    # Wait a bit more for page to load, then send F11
    sleep 2
    wtype -k F11
    # Wait a moment, then send space to play
    sleep 1
    wtype " "
elif command -v ydotool &> /dev/null; then
    sleep 2
    ydotool key 125:1 125:0  # F11 key
    sleep 1
    ydotool key 57:1 57:0  # Space key
elif command -v xdotool &> /dev/null; then
    sleep 2
    # Find Firefox window with YouTube
    WID=$(xdotool search --name "YouTube" | head -1)
    if [ -z "$WID" ]; then
        # Try finding by class name
        WID=$(xdotool search --class "firefox" | head -1)
    fi
    if [ -n "$WID" ]; then
        xdotool windowactivate "$WID"
        sleep 0.5
        xdotool key F11
        sleep 1
        xdotool key space
    fi
else
    # Fallback: Just open the URL, user can manually fullscreen
    # Note: Install wtype for automatic fullscreen: sudo pacman -S wtype
    echo "Note: Install 'wtype' for automatic fullscreen: sudo pacman -S wtype"
fi

