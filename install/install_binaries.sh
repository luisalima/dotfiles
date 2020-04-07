#!/bin/bash

fancy_echo "installing other binaries..."

BINARIES=('google-chrome' slack sketch dropbox postman skype kindle send-to-kindle)
for BINARY in "${BINARIES[@]}"
do
    brew cask install $BINARY
done
