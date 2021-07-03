# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# nnn config
source ~/.config/nnn/nnn.zsh

# lf icons
source ~/.config/lf/icons.sh

# zsh plugins
z_plug "zsh-users/zsh-autosuggestions"
z_plug "zsh-users/zsh-syntax-highlighting"

# z.lua
eval "$(lua $HOME/Apps/z.lua/z.lua --init zsh enhanced once echo)"
# Change zlua cache location
export _ZL_DATA=$HOME/.cache/zlua

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/fzf/general.zsh ] && source ~/.config/fzf/general.zsh
[ -f ~/.config/fzf/key-bindings.zsh ] && source ~/.config/fzf/key-bindings.zsh

# Activate conda environment
conda()
{
    [ -f /usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh ] && source /usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh
    [ -f ~/.miniconda3/etc/profile.d/conda.sh ] && source ~/.miniconda3/etc/profile.d/conda.sh
    conda activate base
}

# Change starhip config location
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# Starship prompt
eval "$(starship init zsh)"
