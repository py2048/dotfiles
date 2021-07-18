#!/usr/bin/env zsh

# If argument is provided, read from the file
if test -n "$1"; then
    gdlf="$1"
# If stdin is provided, read from stdin
elif test ! -t 0; then
    gdlf=/dev/stdin
# Else read from file gdl.txt
else
    gdlf=gdl.txt
fi

# Read from every lines
while IFS= read -r line; do
    # Check if line is a url, then conevert to id
    if [[ $line == *"drive.google.com"* ]]; then
        uid=${line%/*}
        id=${uid##*/}
    else
        id=$line
    fi
    gdown --id "$id" 
done < <(tr , '\n' < "$gdlf" | grep .) # Replace , with \n, then remove all blank space
