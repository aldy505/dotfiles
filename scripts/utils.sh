#!/bin/bash

function install_exa () {
  EXA_VERSION="0.10.1"
  wget https://github.com/ogham/exa/releases/download/v$EXA_VERSION/exa-linux-x86_64-v$EXA_VERSION.zip
  unzip exa-linux-x86_64-v$EXA_VERSION.zip -d exa
  sudo mv exa/bin/exa /usr/local/bin/exa
  rm exa-linux-x86_64-v$EXA_VERSION.zip
  rm -rf exa
}

function install_bat () {
  BAT_VERSION="0.18.2"
  wget https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb
  sudo dpkg -i bat_0.18.2_amd64.deb
  rm bat_${BAT_VERSION}_amd64.deb
}

if [ "$1" == "install" ]; then
  if [ "$2" == "bat" ]; then
    install_bat
  elif [ "$2" == "exa" ]; then
    install_exa
  else
    install_exa
    install_bat
  fi
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi