#!/bin/sh

[ -d ~/.local/bin ] || mkdir -p ~/.local/bin && chmod 755 ~/.local/bin

for f in $(ls | grep -v 'install.sh'); do
    set -x
    chmod 755 $f
    f_rp=$(realpath $f)
    [ -f "$f_rp" ] || ln -s "$f_rp" ~/.local/bin
done
