#!/usr/bin/env bash

VERSION="1.17.6"

function install () {
  echo "installing go"
  cd ~
  wget https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz
  echo "231654bbf2dab3d86c1619ce799e77b03d96f9b50770297c8f4dff8836fc8ca2" > go${VERSION}.linux-amd64.tar.gz.sha256
  # sha256sum -c go${VERSION}.linux-amd64.tar.gz.sha256
  sudo tar -C ${HOME}/go -xzf go${VERSION}.linux-amd64.tar.gz
  sudo rm go${VERSION}.linux-amd64.tar.gz
  sudo rm go${VERSION}.linux-amd64.tar.gz.sha256
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
