#!/usr/bin/env bash
tmpfile=$(mktemp --tmpdir="$PWD")
trap "rm -f $tmpfile" 0 2 3 15

oldlink="$(readlink "$1")"
echo "$oldlink" > "$tmpfile"
nvim "$tmpfile"
newlink=$(<"$tmpfile")

[ "$oldlink" = "$newlink" ] || ln -sf "$newlink" "$1"
