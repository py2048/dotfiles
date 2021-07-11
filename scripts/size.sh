#!/usr/local/bin/zsh
f=$1
if (( $(stat -f "%z" $f) > 104857600 )); then
    echo $(stat -f "%z" $f)
    echo 0
else
    echo 1
fi
