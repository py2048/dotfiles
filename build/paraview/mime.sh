#!/usr/bin/env bash

mkdir -p ~/.local/share/mime/packages
cp ./x-paraview.xml ~/.local/share/mime/packages/x-paraview.xml
update-mime-database    ~/.local/share/mime
