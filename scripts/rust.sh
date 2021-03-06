#!/usr/bin/env bash

function install () {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	printf "\n\n"
	rustc --version
	cargo --version
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
