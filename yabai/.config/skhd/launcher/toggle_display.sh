#!/usr/bin/env bash
dfile="$HOME/.cache/ex_display"
[ -f "$dfile" ] && rm "$dfile" || touch "$dfile"
