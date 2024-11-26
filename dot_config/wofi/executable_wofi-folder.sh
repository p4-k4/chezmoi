#!/bin/bash

# Get all visible directories in home, excluding hidden ones
folders=$(find $HOME -maxdepth 1 -type d ! -name ".*" ! -path "$HOME" -printf "%f\n" | sort)

# Present folders in wofi
selected=$(echo "$folders" | wofi --dmenu --prompt "Select Folder" --cache-file /dev/null)

# If a folder was selected, open it
if [ ! -z "$selected" ]; then
  # You can modify this to use your preferred file manager
  # Examples:
  # thunar "$HOME/$selected"     # For Thunar
  # nautilus "$HOME/$selected"   # For Nautilus
  # dolphin "$HOME/$selected"    # For Dolphin
  # pcmanfm "$HOME/$selected"    # For PCManFM
  xdg-open "$HOME/$selected" # Uses default file manager
fi
