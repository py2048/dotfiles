#!/usr/bin/env bash

trap '[ -n "$(jobs -pr)" ] && kill $(jobs -pr); rm $logfile; exit 1' SIGINT SIGTERM

logfile=$HOME/.cache/wormhole.log
sendfile=false
[ "$1" = "-f" ] && sendfile=true && shift

[ -z "$1" ] && str="$(xsel -b)" || str="$1"

rm -f $logfile
if $sendfile; then
    wormhole-william send --qr "$str" &> $logfile &
else
    wormhole-william send --qr --text "$str" &> $logfile &
fi

while [ "$(wc -l < $logfile)" -lt '2' ]; do
    sleep 0.2
    # echo re
done

wcode=$(grep -oP '\d+(-\w+)+$' < $logfile)
echo $wcode
code="wormhole:ws://relay.magic-wormhole.io:4000/v1?code=${wcode}"
echo $code
qrencode "$code" -o - | convert -resize 400x400 - - | display

wait
rm $logfile
