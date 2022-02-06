#!/usr/bin/env zsh

# Remove .DS_Store
find . -name ".DS_Store" -print -delete
# stow to HOME
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
        verbose.sh stow macos
        ;;

    Fedora | Ubuntu | "Linux Mint")
        verbose.sh stow linux_other sway
        command -v logid > /dev/null && sudo /usr/bin/stow logitech -t /etc
        ;;

    *)
        ;;

esac

(cd scripts && ./install.sh)
verbose.sh stow color goldendict mpv nvim paraview productivity rc zsh
