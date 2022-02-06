#!/usr/local/bin/bash

(printf "%s\n\n" $1; echo $2 $3; echo; yabai -m query --spaces; echo; yabai -m query --windows) | ~/.config/sketchybar/plugins/spaceic.py | bash
