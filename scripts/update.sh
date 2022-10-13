#!/usr/bin/env zsh

echo_green(){
    bold=$(tput bold)
    green=$(tput setaf 2)
    reset=$(tput sgr0)
    echo "\n${bold}${green}${@}${reset}\n"
}

echo_red(){
    red=$(tput setaf 1)
    reset=$(tput sgr0)
    echo "\n${bold}${red}${@}${reset}\n"
}

# Update System Packages Manager
apt_update(){
    verbose.sh sudo apt update
    verbose.sh sudo apt upgrade -y
}

brew_update(){
    verbose.sh brew update
    verbose.sh brew upgrade
    brew list --cask | xargs verbose.sh brew upgrade --cask
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

        Ubuntu | "Linux Mint")
            apt_update
            ;;

        Fedora)
            sudo dnf update
            ;;
        EndeavourOS)
            yay
            ;;
        *)
            echo_red Cannot update packages manager: unknown operating system
            ;;

    esac

}

# Other Packages Manager

cargo_update(){
    ! [ -x "$(command -v cargo)" ] && echo_red rust is not installed && return
    cargo install --list | sed -n 'p;n' | awk '{print $1}' | xargs verbose.sh cargo install
}

pip_update(){
    ! [ -x "$(command -v pip)" ] && echo_red pip is not installed && return
    [ $CONDA_DEFAULT_ENV ] && echo_red Cannot update pip: anaconda environment is activated && return
    # pip install -U pip
    pip list --user | tail -n +3 | awk '{print $1}' | xargs verbose.sh pip install -U --user
}

pipenv_update(){
    ! [ -x "$(command -v pip)" ] && echo_red pip is not installed && return
    if [ $CONDA_DEFAULT_ENV ]; then
        echo Anaconda environment is activated. Are you sure to update pip\? y\[n\]
        read ans
        [ "$ans" = "y" ] || return
        pip install -U pip
        pip list | tail -n +3 | awk '{print $1}' | xargs verbose.sh pip install -U
    else
        echo Anaconda environment is not activated
    fi
}

conda_update(){
    [ -z $CONDA_DEFAULT_ENV ] && echo_red Cannot update conda: anaconda environment is not activated && return
    verbose.sh conda update --all
    [ "$CONDA_DEFAULT_ENV" = "base" ] && verbose.sh conda update conda
}

# Update zsh plugin
zsh_update(){
    echo_green Updating zsh plugins...
    find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull
}

# Binaries udpate
bin_update() {
    echo_green Updating Binaries
    ~/repo/dotfiles/scripts/github_update/update.py
}


# Update all
all_update(){
    os_update
    zsh_update
    bin_update
    # cargo_update
    # conda_update
    # pip_update
    # [ "$RANDOM" -lt "10000" ] && echo_green Cleanning history && clear_hist.sh
}

# Update from arguments
update_argv(){
    for a in "$@"; do
        ${a}_update
    done
}

[ -z "$1" ] && os_update || update_argv "$@"

