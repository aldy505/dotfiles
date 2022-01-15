#!/usr/bin/env bash

ME="/home/$(whoami)"
CFG="${ME}/.config"
DOTFILES="${ME}/dotfiles"
BINDIR="${ME}/dotfiles/bin"

sudo -v

echo "I'm assuming you're doing a fresh install. Send a SIGTERM anytime you like."

# Set dotfiles path
DOTFILES_PATH=$(pwd)

function set_symlink () {
  sudo rm $HOME/.bashrc
  sudo ln -s ${DOTFILES_PATH}/bash/.bashrc $HOME/.bashrc
  echo "export DOTFILES_PATH=$(pwd)" >> $HOME/.bashrc
  sudo rm $HOME/.bash_logout
  sudo ln -s ${DOTFILES_PATH}/bash/.bash_logout $HOME/.bash_logout
  sudo rm $HOME/.profile
  sudo ln -s ${DOTFILES_PATH}/bash/.profile $HOME/.profile
  sudo rm $HOME/.gitconfig
  sudo ln -s ${DOTFILES_PATH}/git/.gitconfig $HOME/.gitconfig
  sudo rm $HOME/.czcrc
  sudo ln -s ${DOTFILES_PATH}/git/.czrc $HOME/.czrc
}

sudo chmod -R 755 ./scripts
sudo chmod -R 755 ./bin
sudo mkdir /opt/bin

yes | sudo pacman -Syu
yes | sudo pacman -S gtk3 jdk gnupg gcc glibc boost rlwrap cmake icu unzip python2 python ca-certificates php protobuf rust rustup go julia-bin lua
yes | sudo pacman -S fd bat ripgrep fzf neofetch curlie duf exa
yes | sudo pacman -S visual-studio-code-bin mongodb-compass 7-zip brave-bin spotify protonvpn-gui authy cloudflare-warp-bin telegram-desktop-bin

set_symlink

./scripts/node.sh install
./scripts/micro.sh install