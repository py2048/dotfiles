# History
HISTFILE=$XDG_CACHE_HOME/zsh_history
HISTSIZE=5000
SAVEHIST=5000

# Export var so clear_hist.sh can see
export HISTFILE

# Disable error sound
unsetopt BEEP

# Auto enter directory without cd
setopt autocd

# Do not save to HISTFILE if command start with space
setopt histignorespace

# Enable colors and change prompt:
autoload -U colors && colors

# Enable auto completion
# Color for ls
autoload -U compinit 

# Cycle through suggestions
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Completion for aliases
setopt complete_aliases

# Use vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Emacs bindings
bindkey -e

# Edit line in vim with ctrl-o:
autoload edit-command-line; zle -N edit-command-line
bindkey '^o' edit-command-line

# Basic movement
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^U" backward-kill-line
bindkey "^[[H"  beginning-of-line
bindkey "^[[1;2H" backward-kill-line
bindkey "^[[F"  end-of-line
bindkey "^[[3~" delete-char
