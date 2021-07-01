# Set PATH

# User executable
export PATH="$HOME/.local/bin:$PATH"
# Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"
# Npm global packages
export PATH="$HOME/.npm-global/bin:$PATH"
# Go binaries
export PATH="$HOME/go/bin:$PATH"


# MANPAGER
# export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Set language environment
export LANG=en_US.UTF-8

# Set editor
export EDITOR='nvim'
export VISUAL="nvim"


# User aliases

# Neovim aliases
alias v='nvim'
# alias vim="~/Apps/nvcode/nvim"
alias nv='cd ~/.config/nvim && nvim ~/.config/nvim/init.vim'

# Lsd replace for ls
alias ls='lsd'
alias la='ls -a'
alias l='ls -la'
# Vim bindings
alias :q='exit'
alias p="nvim $ZDOTDIR/.zshrc"

# Tree
alias tree='tree -C'

# terminal config
alias k="v ~/.config/kitty/kitty.conf"

# Git
alias gc="git clone"
alias gp="git pull"

# Open
type open > /dev/null || alias open='xdg-open'


# Set env for intel
export FEAPHOME8_4=/home/py1024/FEAP/ver84
source /opt/intel/oneapi/compiler/latest/env/vars.sh
source /opt/intel/oneapi/mkl/latest/env/vars.sh
source /opt/intel/oneapi/mpi/latest/env/vars.sh


# Custom function

# Print out which 
bwhich(){
    bat $(which $1)
}
compdef _path_commands bwhich 

# Update zsh plugin
plug_update(){
    find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull
}

function z_plug() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}
