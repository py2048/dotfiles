#!/usr/bin/env bash

ibus_input=$(ibus engine)
if [ "$ibus_input" = "xkb:us::eng" ]; then
    ibus engine Bamboo
elif [ "$ibus_input" = "Bamboo" ]; then
    ibus engine xkb:us::eng
fi
