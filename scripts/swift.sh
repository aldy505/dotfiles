#!/usr/bin/env bash

VERSION="5.6.2"

function install () {
    cd ~
    wget https://download.swift.org/swift-${VERSION}-release/ubuntu2004/swift-${VERSION}-RELEASE/swift-${VERSION}-RELEASE-ubuntu20.04.tar.gz
    tar -xvzf swift-${VERSION}-RELEASE-ubuntu20.04.tar.gz
    sudo mv -v swift-${VERSION}-RELEASE-ubuntu20.04 /opt/swift
    wget -q -O - https://swift.org/keys/all-keys.asc | sudo gpg --import -
    printf "\n\n"
    swift --version
}