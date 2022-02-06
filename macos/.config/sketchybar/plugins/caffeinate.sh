#!/usr/bin/env bash

CHANGE=true
[ "$1" = "re" ] && CHANGE=false

if pgrep -x "caffeinate"; then
    ! $CHANGE && sketchybar -m --set caffeinate icon= && exit 0
    killall caffeinate
    sketchybar -m --set caffeinate icon=﯈
else
    ! $CHANGE && sketchybar -m --set caffeinate icon=﯈ && exit 0
    caffeinate -i &disown;
    sketchybar -m --set caffeinate icon= 
fi

