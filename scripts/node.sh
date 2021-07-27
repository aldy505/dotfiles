#!/bin/bash

function install () {
  echo "installing node js"
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
  $ME/.fnm/fnm fnm install lts
  npm i -g yarn pnpm npm-check-updates np add-gitignore commitizen
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
