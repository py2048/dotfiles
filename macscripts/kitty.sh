#!/usr/bin/env bash

dp=$(tr -d '\n' < ~/.cache/last_display)
# dp=$(sed -n '1p' ~/.cache/last_display)


cd ~
if [ -S $TMPDIR/mykitty${dp} ]; then
    /usr/local/bin/kitty @ --to unix:$TMPDIR/mykitty${dp} launch --type=os-window
else
    /usr/local/bin/kitty --listen-on unix:$TMPDIR/mykitty${dp}
fi
