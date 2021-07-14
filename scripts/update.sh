#!/bin/sh

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

# Print Command verbosely then execute
verbose() {
    log_cmd=${TMPDIR:-"/tmp"}/update_sh
    echo "$(</dev/stdin)" > $log_cmd

    read -r mess < $log_cmd
    echo_green "❯ ${mess}"

    zsh $log_cmd
}

# Update System Packages Manager
apt_update(){
    echo sudo apt upgrade | verbose
    echo sudo apt update | verbose
}

brew_update(){
    echo brew update | verbose
    echo brew upgrade | verbose
    brew list --cask | xargs echo brew upgrade --cask | verbose
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
    cargo install --list | sed -n 'p;n' | awk '{print $1}' | xargs cargo install
}

pip_update(){
    ! [ -x "$(command -v pip)" ] && echo_red pip is not installed && return
    [ $CONDA_DEFAULT_ENV ] && echo_red Cannot update pip: anaconda environment is activated && return
    pip list --user | tail -n +3 | awk '{print $1}' | xargs echo pip install -U --user | verbose
}

conda_update(){
    [ -z $CONDA_DEFAULT_ENV ] && echo_red Cannot update conda: anaconda environment is not activated && return
    echo conda update --all | verbose
    [ "$CONDA_DEFAULT_ENV" = "base" ] && echo conda update conda | verbose
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

