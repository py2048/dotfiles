#!/usr/bin/env bash
(printf "%s\n\n%d\n\n%d\n\n" $1 $2 $3; yabai -m query --spaces; echo; yabai -m query --windows) | ~/.config/sketchybar/refresh.py

