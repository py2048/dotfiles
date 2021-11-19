#!/usr/bin/env zsh

alias stow="stow -t ../.."

! [ -z "$1" ] && stow "$@" && exit

if [ $(uname) = "Darwin" ]; then
    NAME="MacOS"
elif [ $(uname) = "Linux" ]; then
    . /etc/os-release 
fi
case "$NAME" in

    MacOS)
        (cd macscripts && ./install.sh)
        stow yabai
        ;;

    Fedora | Ubuntu | "Linux Mint")
        stow linux_other
        stow sway
        stow fzf
        command -v logid > /dev/null && sudo /usr/bin/stow logitech -t /etc
        ;;

    *)
        ;;

esac

(cd scripts && ./install.sh)
stow color conda fzf lf mpv nnn nvcode nvim paraview rc zsh
