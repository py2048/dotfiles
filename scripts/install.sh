#!/bin/sh
mkdir -p ~/.local/bin
chmod 755 ~/.local/bin
for f in $(ls | grep -v 'install.sh'); do
    set -x
    chmod 755 $f
    ln -s $(realpath $f) ~/.local/bin
done
