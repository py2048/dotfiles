#!/usr/bin/env bash
xcolor -s clipboard -f HEX
xsel -b | xargs notify-send -i xcolor
