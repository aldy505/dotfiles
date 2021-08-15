#!/usr/bin/env bash

VERSION="16.0.2"

function install () {
  cd ~
  wget https://download.java.net/java/GA/jdk${VERSION}/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-${VERSION}_linux-x64_bin.tar.gz
  wget https://download.java.net/java/GA/jdk${VERSION}/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-${VERSION}_linux-x64_bin.tar.gz.sha256
  sha256sum openjdk-${VERSION}_linux-x64_bin.tar.gz
  sudo tar xvf openjdk-${VERSION}_linux-x64_bin.tar.gz
  sudo mv jdk-$VERSION /opt/java
  sudo rm openjdk-${VERSION}_linux-x64_bin.tar.gz
  sudo rm openjdk-${VERSION}_linux-x64_bin.tar.gz.sha256
}

if [ "$1" == "install" ]; then
  install
# elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
#   uninstall
else
  echo "please specify args with install or uninstall"
fi
