#!/usr/bin/env zsh

# If argument is provided, read from the file
if test -n "$1"; then
    tmsf="$1"
# If stdin is provided, read from stdin
elif test ! -t 0; then
    tmsf=/dev/stdin
# Else read from file gdl.txt
else
    tmsf=tms.txt
fi

# Read from every lines
while IFS= read -r line; do
    # Check if line is a url, then conevert to id

    transmission-remote -a "$line"
done < <(grep . $tmsf) # Replace , with \n, then remove all blank space
