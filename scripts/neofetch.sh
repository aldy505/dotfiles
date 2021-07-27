#!/bin/bash

VERSION="7.1.0"

function install () {
  sudo apt install -y w3m
  wget https://github.com/dylanaraps/neofetch/archive/refs/tags/${VERSION}.zip
  unzip ${VERSION}.zip
  rm $VERSION.zip
  cd neofetch-$VERSION
  sudo make install
  cd ..
  rm -rf neofetch-$VERSION
  sudo rm $HOME/.config/neofetch/config.conf
  ln -s $HOME/dotfiles/neofetch/config.conf $HOME/.config/neofetch/config.conf
}

function uninstall () {
  sudo rm -rf /usr/bin/neofetch
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi