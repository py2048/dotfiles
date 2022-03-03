#!/usr/bin/env zsh

cmd_green(){
    bold=$(tput bold)
    green=$(tput setaf 2)
    reset=$(tput sgr0)
    echo "\n${bold}${green}❯ ${@}${reset}\n"
}

# stow to HOME
# alias stow="stow -t ~"

! [ -z "$1" ] && stow -t ~ "$@" && exit

case "$OSTYPE" in

    darwin*)
        # Remove .DS_Store
        find . -name ".DS_Store" -print -delete
        (cd macscripts && ./install.sh)
        verbose.sh stow macos
        ;;

    [Ll]inux*)
        cmd_green stow linux_other sway
        stow -t ~ linux_other sway
        command -v logid > /dev/null && sudo /usr/bin/stow logitech -t /etc
        ;;

    *)
        ;;

esac

(cd scripts && ./install.sh)
cmd_green stow color goldendict mpv nvim paraview productivity rc zsh
stow -t ~ color goldendict mpv nvim paraview productivity rc zsh
