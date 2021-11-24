#!/usr/bin/env bash

VERSION="16.0.2"

function install () {
  cd ~
  wget https://download.java.net/java/GA/jdk${VERSION}/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-${VERSION}_linux-x64_bin.tar.gz
  wget https://download.java.net/java/GA/jdk${VERSION}/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-${VERSION}_linux-x64_bin.tar.gz.sha256
  sha256sum openjdk-${VERSION}_linux-x64_bin.tar.gz
  sudo tar xvf openjdk-${VERSION}_linux-x64_bin.tar.gz
  sudo mv jdk-${VERSION} /opt/java
  sudo rm openjdk-${VERSION}_linux-x64_bin.tar.gz
  sudo rm openjdk-${VERSION}_linux-x64_bin.tar.gz.sha256
}

function install_alt () {
  cd ~
  sudo apt-get install openjdk-11-jre openjdk-11-jdk
  printf "\n\n"
  java --version
  printf "\n"
  javac --version
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "install_alt" ]; then
  install_alt
# elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
#   uninstall
else
  echo "please specify args with install or uninstall"
fi
