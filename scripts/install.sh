#!/usr/bin/env bash

[ "$1" = "all" ] && (cd ./run ; ./install.sh)

! [ -d ~/.local/bin ] && mkdir -p ~/.local/bin && chmod 755 ~/.local/bin

for f in $(find . -maxdepth 1 -type f -not -name .gitignore); do
    chmod 755 $f
    f_rp=$(realpath $f)
    ln -sfn "$f_rp" ~/.local/bin
done
echo Symlinked scripts to "$HOME/.local/bin"

