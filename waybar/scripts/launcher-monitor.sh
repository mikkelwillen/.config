#!/bin/bash

TEMP_FILE="/tmp/waybar-input"
echo "" > "$TEMP_FILE"

# Launch dmenu and capture input
selected_app=$(dmenu_path | wmenu | tee "$TEMP_FILE" | xargs swaymsg exec --)
echo "$selected_app" > "$TEMP_FILE"

