#!/bin/bash

VERSION="v0.5.0"

function install () {
  wget https://github.com/neovim/neovim/releases/download/$VERSION/nvim.appimage
  wget https://github.com/neovim/neovim/releases/download/$VERSION/nvim.appimage.sha256sum
  sha256sum nvim.appimage
  sudo chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
  sudo mv ./squashfs-root/usr/bin/nvim /usr/bin/nvim
  sudo mv ./squashfs-root/usr/lib/nvim /usr/lib/nvim
  sudo mv ./squashfs-root/usr/share /usr
  sudo rm nvim.appimage.sha256sum
  sudo rm -rf nvim.appimage
  sudo rm -rf squashfs-root
  mkdir $HOME/.config/nvim
  ln -s $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
}

function uninstall () {
  sudo rm /usr/bin/nvim
  sudo rm -rf /usr/lib/nvim
  sudo rm -rf /usr/share/nvim
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi
