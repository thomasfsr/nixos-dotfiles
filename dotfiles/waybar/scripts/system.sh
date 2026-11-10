#!/usr/bin/env bash

STATE_FILE="$HOME/.cache/waybar-system"

if [[ ! -f "$STATE_FILE" ]]; then
    echo "cpu" > "$STATE_FILE"
fi

STATE=$(<"$STATE_FILE")

case "$STATE" in
    cpu)
        USAGE=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f", usage}')
        echo " ${USAGE}%"
        ;;
memory)
        USED=$(free -m | awk '/^Mem:/ {printf "%.1f", $3/1024}')
        echo " ${USED}GB"
        ;;
esac
