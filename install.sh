#!/usr/bin/env zsh

cmd_green(){
    bold=$(tput bold)
    green=$(tput setaf 2)
    reset=$(tput sgr0)
    echo "\n${bold}${green}❯ ${@}${reset}\n"
}

! [ -z "$1" ] && stow -t ~ "$@" && exit

command -v logid > /dev/null && sudo /usr/bin/stow logitech -t /etc
cmd_green stow color goldendict linux lib mpv nvim paraview productivity rc zsh
stow -t ~ color goldendict linux lib mpv nvim paraview productivity rc zsh
(cd scripts && ./install.sh)
