#!/bin/bash

VERSION="1.16.6"

function install () {
  echo "installing go"
  wget https://golang.org/dl/go$VERSION.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz
  rm go$VERSION.linux-amd64.tar.gz
  sudo rm $HOME/.config/go/env
  ln -s $HOME/dotfiles/go/env $HOME/.config/go/env
}

function uninstall () {
  echo "uninstalling go"
  sudo rm -rf /usr/local/go
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi
