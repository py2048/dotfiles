#!/usr/bin/env bash

[ "$OS_NAME" = "MacOS" ] || exit 0

RPC_SECRET=$(<~/.cache/aria2/rpc-secret)

sed -E -e "s|<HOME>|${HOME}|g" -e "s|<rpc-secret>|${RPC_SECRET}|g" aria2_macos.plist > homebrew.mxcl.aria2.plist

ln -s $(realpath homebrew.mxcl.aria2.plist) /usr/local/Cellar/aria2/*/



