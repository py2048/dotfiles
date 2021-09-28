#!/usr/bin/env zsh
tac $HISTFILE | awk '!seen[$0]++' | tac | sponge $HISTFILE
