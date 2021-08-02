#!/bin/bash

ME="/home/$(whoami)"
CFG="${ME}/.config"
DOTFILES="${ME}/dotfiles"
BINDIR="${ME}/dotfiles/bin"

echo "I'm assuming you're doing a fresh install. Send a SIGTERM anytime you like."

sudo apt install -y curl wget openssl tar unzip git
sudo apt-get install editorconfig

sudo chmod -R 755 ./scripts

if test ! $(which fnm); then
  ./scripts/node.sh install
fi

if test ! $(which go); then
  ./scripts/go.sh install
fi

if test ! $(which julia); then
  ./scripts/julia.sh install
fi

if test ! $(which nvim); then
  ./scripts/neovim.sh install
fi