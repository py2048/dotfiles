#!/bin/sh

! [ -d ~/.local/bin ] && mkdir -p ~/.local/bin && chmod 755 ~/.local/bin

for f in $(ls | grep -v 'install.sh'); do
    chmod 755 $f
    f_rp=$(realpath $f)
    ln -sfn "$f_rp" ~/.local/bin
done
echo Symlinked macscripts to "$HOME/.local/bin"
