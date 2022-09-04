#!/usr/bin/env bash

cleanup() {
    [ -n "$(jobs -pr)" ] && kill $(jobs -pr)
    rm $logfile
    # exit 1
}

send() {
    [ -z "$1" ] && str="$(xsel -b)" || str="$1"
    qrencode "$str" -o - | convert -resize 400x400 - - | display
}

recv() {
    logfile=$HOME/.cache/qrclip.log
    zbarcam &> $logfile &

    while ! [ -s "$logfile" ]; do
        sleep 0.2
        # echo re
    done

    _str=$(<$logfile)
    str=$(<<<"$_str" sd '^QR-Code:' '' | sd '\n\x07\n$' '')
    echo $str
    xsel -b <<<"$_str"
    # xsel -b <<<"$str"
    notify-send -i /usr/share/icons/Papirus-Dark/128x128/apps/xclipboard.svg "$str" "Copied to clipboard"
    cleanup

}

case "$1" in
    r | -r | --recieve)
        recv
        ;;
    s | -s | --send)
        shift
        send "$@"
        ;;
    *)
        send
        ;;

esac
