#!/bin/bash

function install () {
  git clone https://github.com/justinmeza/lci.git
  cd lci
  cmake .
  make
  sudo make install
  cd ..
  rm -rf lci
}

function uninstall () {
  rm -rf /usr/local/bin/lci
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi