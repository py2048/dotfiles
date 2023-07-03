#!/usr/bin/env zsh

ABSPATH=$(realpath $1)
BASENAME=$(basename ${ABSPATH})

cd ~/Documents/Backup

if [ -f "$ABSPATH" ]; then
    cp -R $ABSPATH $BASENAME
elif [ -d "$ABSPATH" ]; then
    echo "tar cf - $ABSPATH | 7z a -si $BASENAME.tar.7z"
    tar cvf - "$ABSPATH" | 7z a -si "$BASENAME".tar.7z
fi
