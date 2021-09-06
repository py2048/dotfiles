#!/usr/bin/env zsh
fd . -e app -d 2 /System/Applications /System/Library/CoreServices /Applications | choose | xargs -I {} open '{}'
