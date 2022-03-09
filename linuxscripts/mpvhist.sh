#!/usr/bin/env bash
echo -ne '\e[5 q'
tac ~/.cache/mpv_history | fzf --color=border:#5f5f5f --border sharp --preview 'echo {}' --preview-window down:3:wrap:sharp | grep -oP '^\[\d{2}/\w{3}/\d{2}\s\d{2}:\d{2}:\d{2}\]\s\K.+' | xargs -I {} open '{}'

