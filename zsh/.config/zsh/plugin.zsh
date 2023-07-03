# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# fzf
load_file ~/.config/fzf/completion.zsh
load_file ~/.config/fzf/key-bindings.zsh

# fzf config
export FZF_CTRL_T_COMMAND="fd --type f --exclude .git --exclude .npm --exclude .julia --exclude .cache --follow --hidden"

# fzf theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#cbccc6,hl:#707a8c
 --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
 --color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6
 --color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff'


# zsh plugins
function z_plug() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # source plugins
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" > /dev/null || \
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" > /dev/null
    else
        # install plugins
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"

    fi
}

# zsh plugins
z_plug "zsh-users/zsh-autosuggestions"
z_plug "zsh-users/zsh-syntax-highlighting"
z_plug "hlissner/zsh-autopair"
z_plug "kutsan/zsh-system-clipboard"
z_plug "skywind3000/z.lua"

# zsh-autosuggestions bindings
bindkey '^[[24~' autosuggest-accept
# Change zlua cache location
export _ZL_DATA=$XDG_CACHE_HOME/zlua


# anaconda
# conda()
# {
#     if [ -f "$HOME/.miniconda3/etc/profile.d/conda.sh" ]; then
#         source $HOME/.miniconda3/etc/profile.d/conda.sh
#     elif [ -f "/opt/intel/oneapi/intelpython/latest/env/vars.sh" ]; then
#         source /opt/intel/oneapi/intelpython/latest/env/vars.sh
#     else
#         return
#     fi
  
#     conda activate base
#     [ -z "$1" ] || conda $@
# }

mamba() {
    z_plug "conda-incubator/conda-zsh-completion"
    compinit
    if [ -f "/home/dquan/.mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/dquan/.mambaforge/etc/profile.d/conda.sh"
    fi
    if [ -f "/home/dquan/.mambaforge/etc/profile.d/mamba.sh" ]; then
        . "/home/dquan/.mambaforge/etc/profile.d/mamba.sh"
    fi
    mamba activate base
    [ -z "$1" ] || mamba $@
}


# Set PS1 prompt
setopt prompt_subst

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd(){
    # Last command status
    [ "$?" != 0 ] && status_color="%{$fg[red]%}" || status_color="%{$fg[green]%}"
    # Check conda env
    [ -z $CONDA_DEFAULT_ENV ] && conda_env='' || conda_env="🅒 $CONDA_DEFAULT_ENV"
    # Check git
    vcs_info
}
zstyle ':vcs_info:git:*' formats '  %b' # Change git style

NEWLINE=$'\n'
# Current Directory
PS1="${NEWLINE}%B%{$fg[cyan]%}%~%b"

# Git branch
PS1+=" %{$fg[yellow]%}"
PS1+=\$vcs_info_msg_0_

# Conda
PS1+=" %{$fg[green]%}"
PS1+=\$conda_env

#Optional
PS1+=\$_optional_env

# New line prompt
PS1+="${NEWLINE}"
PS1+=\$status_color
PS1+="❯ "
