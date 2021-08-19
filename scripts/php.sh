#!/usr/bin/env bash

function install () {
  cd ~
  sudo apt-get install -y php php-mbstring php-json php-imap php-bz2 php-fpm php-curl php-cgi php-cli php-mysql php-pgsql
  sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  sudo php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  sudo php composer-setup.php
  sudo php -r "unlink('composer-setup.php');"
  sudo mv composer.phar /usr/local/bin/composer
  printf "\n\n"
  php --version
  composer --version
}

function uninstall () {
  sudo rm /usr/local/bin/composer
  sudo apt-get remove -y php*
}

if [ "$1" == "install" ]; then
	install
elif [ "$1" == "uninstall" ]; then
	uninstall
else
	echo "Only install and uninstall"
fi