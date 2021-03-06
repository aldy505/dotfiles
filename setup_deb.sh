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
  sudo ln -s ${DOTFILES_PATH}/gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
}

sudo chmod -R 755 ./scripts
sudo chmod -R 755 ./bin
sudo mkdir /opt/bin

if [[ $(cat /etc/issue) = *"Ubuntu"* ]]; then
  sudo apt update
  sudo apt upgrade -y
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt update
  sudo apt install -y curl wget openssl tar unzip git rlwrap ssh editorconfig gpg build-essential libffi-dev libgdbm-dev libsqlite3-dev libssl-dev zlib1g-dev
  set_symlink
elif [[ $(cat /etc/issue) = *"Debian"* ]]; then
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get install -y curl wget openssl tar unzip rlwrap ssh editorconfig gpg build-essential libffi-dev libgdbm-dev libsqlite3-dev libssl-dev zlib1g-dev
  sudo apt-get install -y libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext
  ./scripts/git.sh install
  set_symlink
else
  echo "you will need to install curl, wget, openssl, gpg, and other stuff yourself"
fi

./scripts/python.sh install

./scripts/node.sh install

./scripts/go.sh install

./scripts/julia.sh install

./scripts/rust.sh install

#./scripts/java.sh install_alt

./scripts/micro.sh install

./scripts/utils.sh install

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

printf "\n\nCompleted\!\nNow do:\n        source ~/.bashrc\n\n"