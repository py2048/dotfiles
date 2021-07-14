#!/bin/sh

[ -z "$1" ] && gdlf="gdl.txt" || gdlf="$1"

while IFS= read -r line; do
    uid=${line%/*}
    gdown --id "${uid##*/}" 
done < "$gdlf"
