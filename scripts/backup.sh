#!/usr/local/bin/zsh
cd ~/Documents/Backup
ABSPATH=$(realpath $1)
BASENAME=$(basename ${ABSPATH})
cp -R $ABSPATH $BASENAME
