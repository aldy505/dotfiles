#!/usr/bin/env bash

function install () {
  curl -fsSL https://crystal-lang.org/install.sh | sudo bash
  sudo apt-get update
  sudo apt-get install -y crystal libssl-dev libxml2-dev libyaml-dev libgmp-dev libz-dev 
}

function uninstall () {
  sudo apt-get remove -y crystal 
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi
