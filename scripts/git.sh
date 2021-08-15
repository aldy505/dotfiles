#!/usr/bin/env bash

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

echo "now go to the .ssh directory, copy the contents of the id_rsa.pub to github"
echo "then copy the public key block above also to github"
echo "link to speed up everything: https://github.com/settings/keys"