#!/usr/bin/env bash

MINOR="1.7"
VERSION="1.7.2"

function install () {
  echo "installing julia"
  cd ~
  wget https://julialang-s3.julialang.org/bin/linux/x64/${MINOR}/julia-${VERSION}-linux-x86_64.tar.gz
  tar zxvf julia-${VERSION}-linux-x86_64.tar.gz
  sudo mv julia-${VERSION} julia
  sudo mv julia /opt/julia
  sudo rm julia-${VERSION}-linux-x86_64.tar.gz
  printf "\n\n"
  julia --version
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
