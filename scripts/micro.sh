#!/usr/bin/env bash

function install () {
  curl https://getmic.ro | bash
  sudo mv micro /usr/bin
  sudo rm $HOME/.config/micro/settings.json
  sudo rm $HOME/.config/micro/bindings.json
  sudo ln -s ${DOTFILES_PATH}/micro/settings.json $HOME/.config/micro/settings.json
  sudo ln -s ${DOTFILES_PATH}/micro/bindings.json $HOME/.config/micro/bindings.json
  sudo mkdir $HOME/.config/micro/colorschemes
  sudo ln -s ${DOTFILES_PATH}/micro/colorschemes/night-owl.micro $HOME/.config/micro/colorschemes/night-owl.micro
  sudo ln -s ${DOTFILES_PATH}/micro/colorschemes/light-owl.micro $HOME/.config/micro/colorschemes/light-owl.micro
  micro -plugin install editorconfig
  micro -plugin install filemanager
  micro -plugin install go
  micro -plugin install wakatime
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
