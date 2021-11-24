#!/usr/bin/env bash

VERSION="3.9.6"

function install () {
  cd ~
  curl -O https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
  sudo tar -xvzf Python-${VERSION}.tgz
  cd Python-${VERSION}
  ./configure \
    --prefix=/opt/python/${VERSION} \
    --enable-shared \
    --enable-ipv6 \
    LDFLAGS=-Wl,-rpath=/opt/python/${VERSION}/lib,--disable-new-dtags
  make
  sudo make install

  cd ~
  curl -O https://bootstrap.pypa.io/get-pip.py
  sudo /opt/python/${VERSION}/bin/python3 get-pip.py

  sudo rm Python-${VERSION}.tgz
  sudo rm -rf Python-${VERSION}
  sudo rm get-pip.py

  printf "\n\n"
  python3 --version
}

if [ "$1" == "install" ]; then
	install
# elif [ "$1" == "uninstall" ]; then
# 	uninstall
else
	echo "Only install and uninstall"
fi
