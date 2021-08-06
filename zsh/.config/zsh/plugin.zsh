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
# Change zlua cache location
export _ZL_DATA=$ZDOTDIR/.zlua

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # MacOS
[ -f ~/.config/fzf/general.zsh ] && source ~/.config/fzf/general.zsh
[ -f ~/.config/fzf/key-bindings.zsh ] && source ~/.config/fzf/key-bindings.zsh

# Activate conda environment
conda()
{
    [ -f /usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh ] && source /usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh # MacOS
    [ -f ~/.miniconda3/etc/profile.d/conda.sh ] && source ~/.miniconda3/etc/profile.d/conda.sh
    conda activate base
    [ -z "$1" ] || conda $@
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

last_c(){
}

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
