#!/usr/local/bin/zsh
if [[ $(pwd) == "/Users/minhquandoan" ]]; then
    cd ~/Downloads
fi

youtube-dl -f bestvideo+bestaudio --write-auto-sub $(pbpaste | cut -d'&' -f 1) \
--external-downloader aria2c --external-downloader-args "-x 8 -s 8 -k 1M"
