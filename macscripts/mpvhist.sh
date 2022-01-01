#!/usr/bin/env zsh
echo -ne '\e[5 q'
tac ~/.cache/mpv_history | fzf | grep --color -oP '^\[\d{2}/\w{3}/\d{2}\s\d{2}:\d{2}:\d{2}\]\s\K.+' | xargs -I {} open '{}'

