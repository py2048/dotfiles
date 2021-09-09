#!/usr/bin/env zsh

alias stow="stow -R -t ../.."

if [ $(uname) = "Darwin" ]; then
    NAME="MacOS"
elif [ $(uname) = "Linux" ]; then
    . /etc/os-release 
fi
case $NAME in

    MacOS)
        (cd macscripts && ./install.sh)
        stow yabai
        ;;

    Fedora)
        stow rc
        stow sway
        ;;

    *)
        ;;

esac

stow color conda lf nnn nvcode nvim zsh
