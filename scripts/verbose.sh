#!/usr/bin/env zsh

cmd_green(){
    bold=$(tput bold)
    green=$(tput setaf 2)
    reset=$(tput sgr0)
    echo "\n${bold}${green}❯ $(</dev/stdin)${reset}\n"
}

echo "$@" | tee >(cmd_green) | zsh
