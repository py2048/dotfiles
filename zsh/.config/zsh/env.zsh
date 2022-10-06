# Set PATH
add_path(){
    [ -d "$1" ] && export PATH="$1:$PATH"
}

# Source file
load_file(){
    [ -f "$1" ] && source "$1"
}

# Rust
add_path $HOME/.cargo/bin
# Node js
add_path $HOME/.npm-global/bin
# Go
export GOPATH=$HOME/.go
add_path $GOPATH/bin


# MANPAGER
# export MANPATH="/usr/local/man:$HOME/.local/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANPAGER="most"

# Set language environment
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8

# Set editor
export EDITOR='nvim'
export VISUAL="nvim"

# askpass
export SUDO_ASKPASS=/usr/lib/seahorse/ssh-askpass

# lf
load_file ~/.config/lf/lfcd.sh
load_file ~/.config/lf/icons.sh

# ls colors
command -v vivid > /dev/null && export LS_COLORS="$(vivid generate ~/.config/vivid/iceberg-dark.yml)"
# Color for suggestions
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


# User aliases

# open
alias open="xdg-open &>$HOME/.cache/xdg-open.log"

# ffmpeg
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'

# Neovim aliases
alias v='nvim'
alias nv='cd ~/.config/nvim && nvim ~/.config/nvim/init.vim'
alias vim='nvim -u ~/.config/nvcode/init.vim'

# Lsd replace for ls
command -v lsd > /dev/null && alias ls='lsd'
alias la='ls -a'
alias l1='ls -1'
alias l='ls -laF'
# Vim bindings
alias :q='exit'

# grep
alias grep="grep --color"

# profile
alias p="nvim $ZDOTDIR/.zshrc"
alias d="cd ~/repo/dotfiles"

# ipython
alias ipy="ipython"

# Julia
alias jl="julia -J$HOME/.local/lib/jlrepl -J$HOME/.local/lib/jlplots"

# Tree
alias tree='tree -C'

# terminal config
alias k="v ~/.config/kitty/kitty.conf"

# aria2
alias a2='aria2c'

# Clipboard
alias clip='xsel -b'

# Git
alias g='git'
alias gc='git clone'
alias gpl='git pull'
alias gp='git push'
alias ga='git add'
alias gm='git commit -m'
alias gl='git log'
alias gst='git status'
alias gd='git diff'
alias gt='gitui'

# Custom function

# Add, commit then push
gg(){
    mess="$1"
    shift
    
    # If no more arguments, git add all
    if [ -z "$1" ]; then
        git add .
    # If more arguments is provided, git add those directoris
    else
        for d in "$@"; do
            git add "$d"
        done
    fi

    git commit -m "$mess"
    # git push
}

#python venv
venv() {
    local rep
    if [ -d "./venv" ]; then
        source ./venv/bin/activate
    else
        echo "${PWD}/venv not found"
        vared -p "Would you like to create ${PWD}/venv [yN] " -c rep
        if [ "$rep" = 'y' ]; then
            python -m venv "${PWD}/venv"
            source ./venv/bin/activate
        fi
    fi
}

# Print out which 
bwhich(){
    local bin=$(whereis -b "$1" | awk '{print $2}')
    [ -z "$bin" ] && echo "$1 not found" || bat "$bin"
}
compdef _path_commands bwhich 

# Edit which 
vwhich(){
    local bin=$(whereis -b "$1" | awk '{print $2}')
    [ -z "$bin" ] && echo "$1 not found" || nvim "$bin"
}
compdef _path_commands vwhich

# delta
dt() {
    delta -s "$@"
}
compdef _path_files dt


# FEAP alias
alias feap=~/FEAP/ver84/main/feap

# Set env for intel compilers
export FEAPHOME8_4=$HOME/FEAP/ver84
export FEAPPVHOME5_1=$HOME/FEAP/feappv
load_file /opt/intel/oneapi/compiler/latest/env/vars.sh
load_file /opt/intel/oneapi/mkl/latest/env/vars.sh
load_file /opt/intel/oneapi/mpi/latest/env/vars.sh
# load_file /opt/intel/oneapi/tbb/latest/env/vars.sh
export I_MPI_F90=ifort
export I_MPI_F77=ifort
export I_MPI_FC=ifort
export I_MPI_CC=icc
export I_MPI_CXX=icpc


# Local executable
add_path $HOME/.local/bin

# Set PATH for paraview
add_path ~/Apps/paraview/egl/bin

# custom function
