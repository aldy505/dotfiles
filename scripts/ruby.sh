#!/usr/bin/env bash

VERSION="3.1.0"
MINOR="3.1"

function install () {
    cd ~
    wget https://cache.ruby-lang.org/pub/ruby/${MINOR}/ruby-${VERSION}.tar.gz
    tar -xvzf ruby-${VERSION}.tar.gz
    cd ruby-${VERSION}
    ./configure
    make
    sudo make install
    cd ~
    rm ruby-${VERSION}.tar.gz
    rm -rf ruby-${VERSION}

    printf "\n\n"
    ruby --version
}

if [ "$1" == "install" ]; then
	install
# elif [ "$1" == "uninstall" ]; then
# 	uninstall
else
	echo "Only install"
fi
