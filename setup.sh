#!/bin/bash

ME="/home/$(whoami)"
CFG="$(ME)/.config"
DOTFILES="$(ME)/dotfiles"
BINDIR="$(ME)/dotfiles/bin"

echo "I'm assuming you're doing a fresh install. Send a SIGTERM anytime you like."



if test ! $(which fnm); then
  echo "Installing fnm"
  /bin/sh curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
  $(ME)/.fnm/fnm fnm install lts
fi

if test ! $(which go); then
  echo "Installing go"
  /bin/sh wget https://golang.org/dl/go1.16.6.linux-amd64.tar.gz
fi