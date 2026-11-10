#!/usr/bin/env bash

STATE_FILE="$HOME/.cache/waybar-system"

if [[ "$(cat "$STATE_FILE" 2>/dev/null)" == "cpu" ]]; then
    echo "memory" > "$STATE_FILE"
else
    echo "cpu" > "$STATE_FILE"
fi
