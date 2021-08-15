#!/usr/bin/env bash

function install () {
  sudo ~
  curl -O https://download.clojure.org/install/linux-install-1.10.3.943.sh
  chmod +x linux-install-1.10.3.943.sh
  sudo ./linux-install-1.10.3.943.sh
  
  wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
  sudo chmod +x lein
  sudo mv lein /usr/bin
  
  sudo lein
  
  sudo rm linux-install-1.10.3.943.sh
}

if [ "$1" == "install" ]; then
  if test ! $(which java); then
    ./java.sh install
  fi
  install
elif [ "$1" == "uninstall" ] || [ "$1" == "remove" ]; then
  uninstall
else
  echo "please specify args with install or uninstall"
fi