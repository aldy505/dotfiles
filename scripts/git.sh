#!/usr/bin/env bash

VERSION="2.35.2"

function install () {
  cd ~
  wget https://github.com/git/git/archive/refs/tags/v${VERSION}.zip
  sudo unzip v${VERSION}.zip
  cd git-${VERSION}
  sudo make prefix=/usr/local all
  sudo make prefix=/usr/local install
  cd ~
  sudo rm -rf git-${VERSION}
  sudo rm v${VERSION}.zip
  printf "\n\n"
  git --version
}

function uninstall () {
  sudo rm /usr/local/bin/git
}

function setup () {
  echo "create a ssh key"
  echo "gimme your email: "
  read EMAIL
  ssh-keygen -t rsa -C $EMAIL

  echo "create a gpg key"
  gpg --full-generate-key
  gpg --list-secret-keys --keyid-format=long
  echo "enter the secret on sec rsa4096/THIS PART: "
  read SECRETKEY
  gpg --armor --export $SECRETKEY
  git config --global user.signingkey $SECRETKEY

  echo "now go to the .ssh directory, copy the contents of the id_rsa.pub to github"
  echo "then copy the public key block above also to github"
  echo "link to speed up everything: https://github.com/settings/keys"
}

if [ "$1" == "install" ]; then
  install
elif [ "$1" == "setup" ]; then
  setup
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi
