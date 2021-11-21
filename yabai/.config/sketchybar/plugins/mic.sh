#!/usr/bin/env bash

CHANGE=true
[ "$1" = "re" ] && CHANGE=false
MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')


if [[ $MIC_VOLUME -eq 0 ]]; then
    ! $CHANGE && sketchybar -m --set mic icon= && exit 0
    osascript -e 'set volume input volume 25'
    sketchybar -m --set mic icon=
elif [[ $MIC_VOLUME -gt 0 ]]; then
    ! $CHANGE && sketchybar -m --set mic icon= && exit 0
    osascript -e 'set volume input volume 0'
    sketchybar -m --set mic icon=
fi

