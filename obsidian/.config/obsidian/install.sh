#!/bin/sh

src_dir=$(dirname $0)
src=$(realpath $src_dir/*.json $src_dir/themes)
target="$(realpath "$1")"

for i in $src; do
    o_cfg="$target/$(basename $i)"
    [ -f "$o_cfg" ] && rm "$o_cfg"
    [ -d "$o_cfg" ] && rm -r "$o_cfg"
    ln -s "$i" "$target"
done
