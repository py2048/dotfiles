# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# nnn config
source ~/.config/nnn/nnn.zsh

# lf icons
source ~/.config/lf/icons.sh

# zsh plugins
source ~/Apps/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/Apps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# z.lua
eval "$(lua $HOME/Apps/z.lua/z.lua --init zsh enhanced once echo)"
export _ZL_DATA=$HOME/.cache/zlua

source ~/.config/fzf/general.zsh
source ~/.config/fzf/key-bindings.zsh
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
# --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
# '

# Activate conda environment
# conda()
# {
#     source /path/to/conda/env.zsh
#     conda activate base
# }

# Starship prompt
eval "$(starship init zsh)"
