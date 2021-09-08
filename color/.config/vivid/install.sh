#!/usr/bin/env zsh
tmp_location=${TMPDIR:-/tmp/}
target=$PWD
cd $tmp_location
[ -d "$tmp_location/vivid" ] && rm -rf "$tmp_location/vivid"
git clone https://github.com/sharkdp/vivid.git
mv $tmp_location/vivid/themes/*.yml "$target"
