#!/bin/bash

function install () {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

function uninstall () {
	rustup self uninstall
}

if [ "$1" == "install" ]; then
	install
elif [ "$1" == "uninstall" ]; then
	uninstall
else
	echo "Only install and uninstall"
fi
