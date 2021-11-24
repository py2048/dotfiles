#!/usr/bin/env bash

dp=$(yabai -m query --spaces | sed 's/is-visible/isvis/g' | jq -r '.[] | select(.isvis == true) | .display')
echo $dp > ~/.cache/last_display

# yabai -m query --displays | jq -r ".[] | select(.index == $dp) | .frame[]" >> ~/.cache/last_display

yabai -m query --displays | jq -r ".[] | select(.index == $dp) | .id" >> ~/.cache/last_display


