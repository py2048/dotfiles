#!/usr/bin/env bash

mkdir -p ~/.local/share/mime/packages
cp ./x-vesta.xml ~/.local/share/mime/packages/x-vesta.xml
update-mime-database    ~/.local/share/mime
