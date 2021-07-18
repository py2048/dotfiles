#!/usr/bin/env zsh
youtube-dl -f bestvideo+bestaudio $(pbpaste | cut -d'&' -f 1) --external-downloader aria2c --external-downloader-args "-x 8 -s 8 -k 1M"
