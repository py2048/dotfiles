#!/usr/bin/env zsh

# Remove .DS_Store
find . -name ".DS_Store" -print -delete
# stow to HOME
alias stow="stow -t ~"

! [ -z "$1" ] && stow "$@" && exit

case "$OSTYPE" in

    darwin*)
        (cd macscripts && ./install.sh)
        verbose.sh stow macos
        ;;

    [Ll]inux*)
        verbose.sh stow linux_other sway
        command -v logid > /dev/null && sudo /usr/bin/stow logitech -t /etc
        ;;

    *)
        ;;

esac

(cd scripts && ./install.sh)
verbose.sh stow color goldendict mpv nvim paraview productivity rc zsh
