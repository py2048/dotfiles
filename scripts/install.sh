#!/bin/sh

set -x
[ -d ~/.local/bin ] || mkdir -p ~/.local/bin && chmod 755 ~/.local/bin
set +x

# for f in $(ls | grep -v 'install.sh'); do
#     chmod 755 $f
#     f_rp=$(realpath $f)
#     [ -f "$f_rp" ] || ln -s "$f_rp" ~/.local/bin && echo Symlinked: "$HOME/.local/bin/$f"
# done
