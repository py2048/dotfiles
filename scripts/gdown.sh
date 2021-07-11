#!/usr/local/bin/zsh
ggID=$1
ggURL='https://drive.google.com/uc?export=download'
filename="$(curl -sc /tmp/gcokie "${ggURL}&id=${ggID}" | grep -o '="uc-name.*</span>' | sed 's/.*">//;s/<.a> .*//')"
getcode="$(awk '/_warning_/ {print $NF}' /tmp/gcokie)"
aria2c --load-cookies=/tmp/gcokie "${ggURL}&confirm=${getcode}&id=${ggID}" -o "${filename}"
