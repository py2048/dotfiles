#!/usr/bin/env bash

ln -sf "$PWD/dell3561.kbd" "$(dirname $PWD)/config.kbd"

sed "s/<user>/$USER/g" ./start.sh > ../start.sh
chmod +x ../start.sh
sed "s/<user>/$USER/g" ../kbd.service > $HOME/.config/systemd/user/kbd.service

