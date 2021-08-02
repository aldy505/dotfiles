#!/bin/bash

function install () {
  curl https://getmic.ro | bash
  sudo mv micro /usr/bin
  ln -s $HOME/dotfiles/micro/settings.json $HOME/.config/micro/settings.json
  ln -s $HOME/dotfiles/micro/bindings.json $HOME/.config/micro/bindings.json
  mkdir ~/.config/micro/colorschemes
  ln -s $HOME/dotfiles/micro/colorschemes/night-owl.micro $HOME/.config/micro/colorschemes/night-owl.micro
  ln -s $HOME/dotfiles/micro/colorschemes/light-owl.micro $HOME/.config/micro/colorschemes/light-owl.micro
  micro -plugin install editorconfig
  micro -plugin install filemanager
  micro -plugin install go
}

function uninstall () {
  sudo rm /usr/bin/micro
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi