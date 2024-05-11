#!/usr/bin/env bash

tmpfile="$(mktemp --tmpdir="$PWD")"
trap "rm -f $tmpfile" 0 2 3 15

readarray -t fs_o < <(find . -maxdepth 1 ! -name "$(basename "$tmpfile")" | sed '1d' | sort)

printf "%s\n" "${fs_o[@]}" > "$tmpfile"

nvim "$tmpfile"
readarray -t fs_r < "$tmpfile"

for i in "${!fs_o[@]}"; do
    [ "${fs_o[i]}" = "${fs_r[i]}" ] || mv "${fs_o[i]}" "${fs_r[i]}"
done
rm "$tmpfile"
