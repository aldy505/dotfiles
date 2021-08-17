#!/usr/bin/env bash

VERSION="5.4.3"

function install () {
  cd ~
  wget https://www.lua.org/ftp/lua-$VERSION.tar.gz
  sudo tar zxf lua-$VERSION.tar.gz
  cd lua-$VERSION
  sudo make
  sudo make install
  cd ~
  sudo rm -rf lua-$VERSION
  sudo rm lua-$VERSION.tar.gz
  printf "\n"
  lua -v
}

function uninstall () {
  sudo rm -rf /usr/local/bin/lua
  sudo rm -rf /usr/local/lib/lua
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi