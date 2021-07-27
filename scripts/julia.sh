#!/bin/bash

MINOR="1.6"
VERSION="1.6.2"

function install () {
  echo "installing julia"
  cd ~
  wget https://julialang-s3.julialang.org/bin/linux/x64/$MINOR/julia-$VERSION-linux-x86_64.tar.gz
  tar zxvf julia-$VERSION-linux-x86_64.tar.gz
  mv julia-$VERSION julia
  sudo mv julia /opt/julia
  rm julia-$VERSION-linux-x86_64.tar.gz
}

function uninstall () {
  echo "uninstalling julia"
  sudo rm -rf ~/.julia
  sudo rm -rf /opt/julia
}

# function help () {
# coming soon
# }

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi
