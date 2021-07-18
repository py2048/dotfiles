#!/usr/bin/env zsh


for f in "$@"; do
    i=$(mkvmerge -i "$f" | grep subtitles | cut -b 10)
    mkvextract tracks "$f" ${i}:"${f%.*}.ass"
done
