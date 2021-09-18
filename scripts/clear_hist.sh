#!/usr/bin/env zsh
HISTFILE=$HOME/.cache/zsh_history
tac $HISTFILE | awk '!seen[$0]++' | tac | sponge $HISTFILE
