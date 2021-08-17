#!/usr/bin/env bash

function install_exa () {
  EXA_VERSION="0.10.1"
  cd ~
  wget https://github.com/ogham/exa/releases/download/v$EXA_VERSION/exa-linux-x86_64-v$EXA_VERSION.zip
  unzip exa-linux-x86_64-v$EXA_VERSION.zip -d exa
  sudo mv exa/bin/exa /opt/bin
  sudo rm exa-linux-x86_64-v$EXA_VERSION.zip
  sudo rm -rf exa
  printf "\n\n"
  exa --version
}

function install_bat () {
  BAT_VERSION="0.18.2"
  cd ~
  wget https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb
  sudo dpkg -i bat_0.18.2_amd64.deb
  sudo rm bat_${BAT_VERSION}_amd64.deb
  sudo mv /usr/bin/bat /opt/bin
  printf "\n\n"
  bat --version
}

function install_curlie () {
  CURLIE_VERSION="1.6.0"
  cd ~
  wget https://github.com/rs/curlie/releases/download/v${CURLIE_VERSION}/curlie_${CURLIE_VERSION}_linux_amd64.tar.gz
  sudo tar -zxvf curlie_${CURLIE_VERSION}_linux_amd64.tar.gz curlie
  sudo mv curlie /opt/bin
  sudo rm curlie_${CURLIE_VERSION}_linux_amd64.tar.gz
}

function install_neofetch () {
  NEOFETCH_VERSION="7.1.0"
  cd ~
  wget https://github.com/dylanaraps/neofetch/archive/refs/tags/$NEOFETCH_VERSION.tar.gz
  sudo tar -zxvf $NEOFETCH_VERSION.tar.gz
  cd neofetch-$NEOFETCH_VERSION
  sudo make install
  cd ~
  sudo rm -rf $HOME/.config/neofetch
  sudo mkdir $HOME/.config/neofetch
  sudo ln -s ${DOTFILES_PATH}/neofetch/config.conf $HOME/.config/neofetch/config.conf
  sudo rm $NEOFETCH_VERSION.tar.gz
  sudo rm -rf neofetch-$NEOFETCH_VERSION
  printf "\n\n"
  neofetch --version
}

function install_fd () {
  FD_VERSION="8.2.1"
  cd ~
  wget https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd_${FD_VERSION}_amd64.deb
  sudo dpkg -i fd_${FD_VERSION}_amd64.deb
  sudo rm fd_${FD_VERSION}_amd64.deb
  sudo mv /usr/bin/fd /opt/bin
  printf "\n\n"
  fd --version
}

function install_fzf () {
  FZF_VERSION="0.27.2"
  cd ~
  wget https://github.com/junegunn/fzf/releases/download/${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz
  sudo tar -zxvf fzf-${FZF_VERSION}-linux_amd64.tar.gz
  sudo mv fzf /opt/bin
  sudo rm fzf-${FZF_VERSION}-linux_amd64.tar.gz
}

if [ "$1" == "install" ]; then
  if [ "$2" == "bat" ]; then
    install_bat
  elif [ "$2" == "exa" ]; then
    install_exa
  elif [ "$2" == "curlie" ]; then
    install_curlie
  elif [ "$2" == "neofetch" ]; then
    install_neofetch
  else
    install_exa
    install_bat
    install_curlie
    install_neofetch
    install_fd
    install_fzf
  fi
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi
