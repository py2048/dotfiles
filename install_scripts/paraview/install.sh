#!/bin/sh

mkdir -p ~/.local/share/applications
mkdir -p ~/.local/share/mime/packages

sudo ln -sf ~/Apps/ParaView*/bin/paraview /usr/local/bin/paraview

cp ./paraview.desktop ~/.local/share/applications/paraview.desktop

cp ./x-paraview.xml ~/.local/share/mime/packages/x-paraview.xml

update-desktop-database ~/.local/share/applications
update-mime-database    ~/.local/share/mime
