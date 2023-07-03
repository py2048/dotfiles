#!/usr/bin/env bash
/usr/bin/tint2 &
sleep 0.5

# wmctrl -r tint2 -b add,above
# wmctrl -r xfce4-panel -b add,below
# [ $? -eq 0 ] && echo success || echo failed

win_tint2="$(wmctrl -lG | grep -P 'tint2$')"

# echo $win_tint2

while read win_id _ xpos ypos width height _
do
    if [ "$xpos" = "0" ] && [ "$ypos" = "0" ]; then
        wmctrl -ir $win_id -e 0,40,0,${width},${height}
    fi
done <<<"$win_tint2"
