# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# nnn config
source ~/.config/nnn/nnn.zsh

# zsh plugins
z_plug "zsh-users/zsh-autosuggestions"
z_plug "zsh-users/zsh-syntax-highlighting"
z_plug "kutsan/zsh-system-clipboard"
z_plug "skywind3000/z.lua"
#
# zsh-autosuggestions bindings
bindkey '^[[24~' autosuggest-accept
# Change zlua cache location
export _ZL_DATA=$HOME/.cache/zlua


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

# New line prompt
PS1+="${NEWLINE}"
PS1+=\$status_color
PS1+="❯ "
