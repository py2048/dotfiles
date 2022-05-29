#!/usr/bin/env zsh
cd ~/Documents/Backup
ABSPATH=$(realpath $1)
BASENAME=$(basename ${ABSPATH})
if [ -f "$1" ]; then
    cp -R $ABSPATH $BASENAME
elif [ -d "$1" ]; then
    echo "tar cf - $ABSPATH | 7z a -si $BASENAME.tar.7z"
    tar cvf - "$ABSPATH" | 7z a -si "$BASENAME".tar.7z
fi
