#!/usr/local/bin/bash

(
    printf '[\n"%s",\n"%s %s",\n' $1 $2 $3
    yabai -m query --spaces
    printf ',\n'
    yabai -m query --windows
    printf ']\n'
) | ~/.config/sketchybar/plugins/spaceic.py
