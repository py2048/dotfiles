#!/usr/bin/env bash

! [ -d ~/.local/bin ] && mkdir -p ~/.local/bin && chmod 755 ~/.local/bin

for f in $(ls | grep -v 'install\.sh' | grep -Pv '^_'); do
    chmod 755 $f
    f_rp=$(realpath $f)
    ln -sfn "$f_rp" ~/.local/bin
done
echo Symlinked scripts to "$HOME/.local/bin"

(cd ./run ; ./install.sh)
