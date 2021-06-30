# Set PATH
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.npm-global/bin:$HOME/go/bin:$PATH"

# MANPAGER
# export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Set editor
export EDITOR='nvim'
export VISUAL="nvim"

# Change starhip config location
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# User aliases

alias v="nvim"
# alias vim="~/Apps/nvcode/nvim"

# Lsd replace for ls
alias ls='lsd'
alias la='ls -a'
alias l='ls -la'
# Vim bindings
alias :q='exit'
alias p='nvim ~/.zshrc'
# alias nv='nvim ~/.config/nvim/init.vim'

# Tree
alias tree='tree -C'

# terminal config
alias k="v ~/.config/kitty/kitty.conf"

# Git
alias gc="git clone"
alias gp="git pull"


# Set env for intel
export FEAPHOME8_4=/home/py1024/FEAP/ver84
source /opt/intel/oneapi/compiler/latest/env/vars.sh
source /opt/intel/oneapi/mkl/latest/env/vars.sh
source /opt/intel/oneapi/mpi/latest/env/vars.sh


# print out which 
bwhich(){
    bat $(which $1)
}
compdef _path_commands bwhich 

