#!/usr/bin/env bash

DL_DIR="${1:-.}"
cd "$DL_DIR"

# URL="$(xsel -b)"
URL="$(copyq clipboard)"

# notify-send "$DL_DIR" "$URL"

noti-send() {
    notify-send -a aria2c -i browser-download-symbolic "$@"
}

# Check is URL is valid
# https://stackoverflow.com/a/3184819
regex='(https?|ftp|file)://[-[:alnum:]\+&@#/%?=~_|!:,.;]*[-[:alnum:]\+&@#/%=~_|]'
if [[ $URL =~ $regex ]]
then 
    # Start download
    noti-send "Downloading" "$URL"
    a2log="$(/usr/bin/aria2c "$URL")"

    # Get the line in aria2c output
    _line1=$(grep -n 'Download Results' <<< "$a2log" | cut -f1 -d:)
    # Get the path of downloaded file, 4 line after $_line1
    dlfile="$(tail -n +${_line1} <<< "$a2log" | head -n 4 | tail -n 1 | cut -f4 -d'|')"

    # End notification
    noti-send "Download successful" "$dlfile"
else
    # Failed notification
    noti-send "Download failed" "Link not valid: $URL"
fi
