#!/usr/bin/env bash

# prerequisites
# https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites

# VERSION=v0.6.0

git clone https://github.com/neovim/neovim.git $HOME/Apps/neovim
# git clone https://github.com/neovim/neovim/tree/${VERSION} $HOME/Apps/neovim


cd $HOME/Apps/neovim
git pull
git submodule update --init --recursive

git checkout stable

make CMAKE_BUILD_TYPE=Release
make CMAKE_INSTALL_PREFIX=$HOME/.local install

