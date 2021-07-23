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
    verbose.sh sudo apt upgrade
    verbose.sh sudo apt update
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

        Ubuntu)
            apt_update
            ;;

        *)
            echo_red Cannot update packages manager: unknown operating system

    esac

}

# Other Packages Manager

cargo_update(){
    ! [ -x "$(command -v cargo)" ] && echo_red cargo is not installed && return
    cargo install --list | sed -n 'p;n' | awk '{print $1}' | xargs verbose.sh cargo install
}

pip_update(){
    ! [ -x "$(command -v pip)" ] && echo_red pip is not installed && return
    [ $CONDA_DEFAULT_ENV ] && echo_red Cannot update pip: anaconda environment is activated && return
    pip list --user | tail -n +3 | awk '{print $1}' | xargs verbose.sh pip install -U --user
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

# Update all
all_update(){
    os_update
    zsh_update
    cargo_update
    pip_update
    conda_update
}

# Update from arguments
update_argv(){
    for a in "$@"; do
        ${a}_update
    done
}

[ -z "$1" ] && os_update || update_argv "$@"

