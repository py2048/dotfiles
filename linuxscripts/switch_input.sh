#!/usr/bin/env bash

# input_en="xkb:us::eng"
input_en="BambooUs"
input_vn="Bamboo"

ibus_input=$(ibus engine)
if [ "$ibus_input" = "$input_en" ]; then
    ibus engine "$input_vn"
elif [ "$ibus_input" = "$input_vn" ]; then
    ibus engine "$input_en"
fi
