#!/usr/bin/env zsh
for i in *.wav; do
    abspath=$(realpath ${i})
    f=$(basename ${abspath})
    base="${f%.*}"
    sox "$f" "${base}.flac"
done

if [ ! -d "flac" ]; then
    mkdir flac
fi
mv *.flac ./flac
