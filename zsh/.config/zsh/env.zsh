# Set PATH
add_path(){
    [ -d "$1" ] && export PATH="$1:$PATH"
}

# Source file
load_file(){
    [ -f "$1" ] && source "$1"
}

# Set go env
export GOPATH=$HOME/.go

# Local executable
add_path $HOME/.local/bin
# Rust
add_path $HOME/.cargo/bin
# Node js
add_path $HOME/.npm-global/bin
# Go
add_path $HOME/.go/bin


# MANPAGER
export MANPATH="/usr/local/man:$MANPATH"
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER="most"

# Set language environment
export LANG=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8

# Set editor
export EDITOR='nvim'
export VISUAL="nvim"


# lf
source ~/.config/lf/lfcd.sh
source ~/.config/lf/icons.sh

# ls colors

command -v vivid > /dev/null && export LS_COLORS="$(vivid generate ~/.config/vivid/iceberg-dark.yml)"
# Color for suggestions
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


# User aliases

# Neovim aliases
alias v='nvim'
# alias vim="~/Apps/nvcode/nvim"
alias nv='cd ~/.config/nvim && nvim ~/.config/nvim/init.vim'
alias vim='nvim -u ~/.config/nvcode/init.vim'

# Lsd replace for ls
alias ls='lsd'
alias la='ls -a'
alias l='ls -laF'
# Vim bindings
alias :q='exit'

# profile
alias p="nvim $ZDOTDIR/.zshrc"
alias d="cd ~/repo/dotfiles"

# Tree
alias tree='tree -C'

# terminal config
alias k="v ~/.config/kitty/kitty.conf"

# Git
alias g='git'
alias gc='git clone'
alias gpl='git pull'
alias gp='git push'
alias ga='git add'
alias gm='git commit -m'
alias gl='git log'
alias gst='git status'

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

#
# Custom function

# Print out which 
bwhich(){
    bat $(which $1)
}
compdef _path_commands bwhich 

# Edit which 
vwhich(){
    nvim $(which $1)
}
compdef _path_commands vwhich

function z_plug() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" || \
        eval "$(lua $ZDOTDIR/plugins/$PLUGIN_NAME/z.lua --init zsh enhanced once echo)"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" || \
        eval "$(lua $ZDOTDIR/plugins/$PLUGIN_NAME/z.lua --init zsh enhanced once echo)"

    fi
}


# Os specific
if [ $(uname) = "Darwin" ]; then
    NAME="MacOS"
elif [ $(uname) = "Linux" ]; then
    . /etc/os-release 
fi
case "$NAME" in

    MacOS)
        load_file $ZDOTDIR/mac.zsh
        ;;

    Ubuntu | Ferora | "Linux Mint")
        load_file $ZDOTDIR/linux.zsh
        ;;
    Fedora)
        load_file $ZDOTDIR/linux.zsh
        ;;

esac
