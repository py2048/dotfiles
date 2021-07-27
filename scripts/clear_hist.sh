#!/usr/bin/env zsh
HISTFILE=$ZDOTDIR/.zsh_history
tac $HISTFILE | awk '!seen[$0]++' | tac | sponge $HISTFILE
