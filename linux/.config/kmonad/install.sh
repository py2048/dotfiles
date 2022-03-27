#!/usr/bin/env bash

ln -sf dell3561.kbd config.kbd

sed "s/<user>/$USER/g" start0.sh > start.sh
chmod +x start.sh
sed "s/<user>/$USER/g" kbd.service > $HOME/.config/systemd/user/kbd.service

