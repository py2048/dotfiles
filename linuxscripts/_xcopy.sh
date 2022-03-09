#!/usr/bin/env bash
current_app=$(xprop -id `xdotool getactivewindow` | awk '/^WM_CLASS/{print $4}')
echo $current_app >> ~/.cache/xcopy.log

if [ "$current_app" = '"kitty"' ]; then
    # xdotool key --clearmodifiers super+c
    xclip -out -selection primary | xclip -in -selection clipboard
else
    xclip -out -selection primary | xclip -in -selection clipboard
    # xdotool key --clearmodifiers ctrl+c
fi
