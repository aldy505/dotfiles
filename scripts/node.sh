#!/usr/bin/env bash

function install () {
  echo "installing node js"
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
  node-update
}

function uninstall () {
  echo "uninstalling node js"
  sudo rm -rf $ME/.fnm
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi
