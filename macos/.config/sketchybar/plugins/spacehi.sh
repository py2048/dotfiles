#!/usr/local/bin/bash

B_COLOR='0xFF3B465B'
B_COLOR_H='0xFFFEFEFE'

if [ "$SELECTED" = "false" ]; then
    sketchybar -m --set $NAME label.highlight=off icon.highlight=off background.color=$B_COLOR
else
    sketchybar -m --set $NAME label.highlight=on icon.highlight=on background.color=$B_COLOR_H
fi
