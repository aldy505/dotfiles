#!/usr/bin/env bash

VERSION="1.19.2"

function install () {
  cd ~
  wget https://github.com/janet-lang/janet/archive/refs/tags/v${VERSION}.tar.gz
  tar zxvf v${VERSION}.tar.gz
  cd janet-${VERSION}
  sudo make
  sudo make test
  sudo mv -v build bin
  cd ~
  sudo mv -v janet-${VERSION} /opt/janet
  sudo rm v${VERSION}.tar.gz
  sudo rm -rf janet-${VERSION}
  sudo ln -s /opt/janet/bin/janet /usr/local/bin/janet

  git clone --depth=1 https://github.com/janet-lang/jpm.git
  cd jpm
  sudo /opt/janet/bin/janet bootstrap.janet

  cd ~
  sudo rm -rf jpm

  printf "\n\n"
  janet -v
}

function uninstall () {
  echo "uninstalling janet"
  sudo rm -rf /opt/janet
  sudo rm /usr/local/bin/jpm
  sudo rm /usr/local/bin/janet
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi
