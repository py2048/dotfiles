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
        stow linux_other
        stow sway
        stow fzf
        sudo /usr/bin/stow logitech -t /etc
        ;;

    *)
        ;;

esac

(cd scripts && ./install.sh)
stow color conda lf nnn nvcode nvim paraview rc zsh
