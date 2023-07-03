#!/usr/bin/env zsh
ABSPATH=$(realpath $1)
BASENAME=$(basename ${ABSPATH})

ffmpeg -i "$ABSPATH" -codec copy "${BASENAME}.mp4"
