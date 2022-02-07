#!/usr/bin/env bash

usage() {
	cat <<USAGE
Search and download anime from subplease.org

Usage: $(basename $0) [OPTIONS]

Options:
  r, -r, --recent               Search for recent epsisodes
  s, -s, --search               Search anime by name
  -h, --help                    Print Usage 
USAGE
}

open_magent() {
	command -v open >/dev/null && OP="open" || OP="xdg-open"
	$OP $(</dev/stdin)
}

# Get list of recent shows
recent() {
	# Get response from subplease api
	local res=$(curl -s 'https://subsplease.org/api/?f=latest&tz=Asia/Saigon')
	# Choose epsisode
	local show=$(jq -r 'keys_unsorted | .[]' <<<$res | fzf --header 'RECENT EPISODES:' --reverse)
	[ -z "$show" ] && exit
	# Open magnet
	echo $res | jq -r ".[\"$show\"].downloads[] | select( .res == \"1080\") | .magnet" | open_magent
}

search() {
	:
}

case $1 in

    r | -r | --recent)
        recent
        ;;

    s | -s | --search)
        search
        ;;

    -h | --help)
        usage
        ;;

    *)
        recent
        ;;
esac
