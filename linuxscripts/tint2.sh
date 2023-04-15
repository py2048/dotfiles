#!/usr/bin/env bash
/usr/bin/tint2 &
sleep 0.5
# wmctrl -r tint2 -b add,above
wmctrl -r xfce4-panel -b add,below
[ $? -eq 0 ] && echo success || echo failed

