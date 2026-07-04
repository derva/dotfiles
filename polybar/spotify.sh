#!/bin/bash

status=$(playerctl -p spotify status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)
    echo "%{F#8ABEB7} $artist - $title%{F-}"
elif [ "$status" = "Paused" ]; then
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)
    echo "%{F#F0C674} $artist - $title%{F-}"
else
    echo "%{F#707880} Spotify stopped%{F-}"
fi
