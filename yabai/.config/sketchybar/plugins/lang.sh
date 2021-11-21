#!/usr/bin/env bash

lang_change=true
[ "$1" = 're' ] && lang_change=false

if [ "$(~/.local/bin/xkbswitch -g)" = "1" ]; then
    ! $lang_change && sketchybar -m --set lang label=V label.padding_right=3 icon.padding_left=4 && exit 0
    ~/.local/bin/xkbswitch -s 2
    sketchybar -m --set lang label=E label.padding_right=6 icon.padding_left=5
else
    ! $lang_change && sketchybar -m --set lang label=E label.padding_right=6 icon.padding_left=5 && exit 0
    ~/.local/bin/xkbswitch -s 1
    sketchybar -m --set lang label=V label.padding_right=3 icon.padding_left=4
fi

