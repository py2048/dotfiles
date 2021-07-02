#!/bin/sh
for f in $(ls | grep -v 'scp_install.sh'); do
    set -x
    chmod 755 $f
    ln -s $(realpath $f) ~/.local/bin
done
