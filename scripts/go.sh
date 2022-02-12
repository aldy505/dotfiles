#!/usr/bin/env bash

VERSION="1.17.7"

function install () {
  echo "installing go"
  cd ~
  wget https://golang.org/dl/go${VERSION}.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf go${VERSION}.linux-amd64.tar.gz
  sudo rm go${VERSION}.linux-amd64.tar.gz
  sudo rm -rf ${HOME}/.config/go
  sudo mkdir ${HOME}/.config/go
  sudo ln -s ${DOTFILES_PATH}/go/env ${HOME}/.config/go/env
  printf "\n\n"
  go version
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
