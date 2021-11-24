#!/usr/bin/env bash

VERSION="1.18.1"

function install () {
  cd ~
  wget https://github.com/janet-lang/janet/releases/download/v${VERSION}/janet-v${VERSION}-linux-x64.tar.gz
  tar zxvf janet-v${VERSION}-linux-x64.tar.gz
  sudo mv janet-v${VERSION}-linux janet
  sudo mv janet /opt/janet
  sudo rm janet-v${VERSION}-linux-x64.tar.gz

  git clone --depth=1 https://github.com/janet-lang/jpm.git
  cd jpm
  sudo janet bootstrap.janet

  printf "\n\n"
  janet --version
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi
