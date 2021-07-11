#!/bin/sh

# Update System Packages Manager

apt_update(){
    set -x
    sudo apt update
    sudo apt upgrade
}

brew_update(){
    set -x
    brew update
    brew upgrade
    brew list --cask | xargs brew upgrade --cask
}

os_update(){
    if [ $(uname) = "Darwin" ]; then
        NAME="MacOS"
    elif [ $(uname) = "Linux" ]; then
        . /etc/os-release 
    fi
    case $NAME in

        MacOS)
            brew_update
            ;;

        Ubuntu)
            apt_update
            ;;

        *)
            echo Cannot update packages manager: unknown operating system

    esac

}

# Other Packages Manager

cargo_update(){
    set -x
    cargo install --list | sed -n 'p;n' | awk '{print $1}' | xargs cargo install
}

pip_update(){
    set -x
    [ $CONDA_DEFAULT_ENV ] && echo Cannot update pip: anaconda environment is activated && return 1
    # pip3 install -U numpy matplotlib scipy pandas pynvim yapf
    pip list --user | tail -n +3 | awk '{print $1}' | xargs pip install -U --user
}

conda_update(){
    set -x
    [ -z $CONDA_DEFAULT_ENV ] && echo Cannot update conda: anaconda environment is not activated && return 1
    conda update --all
    [ "$CONDA_DEFAULT_ENV" = "base" ] && conda update conda
}

# Update zsh plugin
zsh_update(){
    set -x
    find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull
}

# Update from arguments
update_argv(){
    for a in "$@"; do
        ${a}_update
    done
}

[ -z "$1" ] && os_update || update_argv "$@"

