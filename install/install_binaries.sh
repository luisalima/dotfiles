#!/bin/bash

fancy_echo "installing other binaries..."

BINARIES=('google-chrome' slack sourcetree gpgtools sketch rescuetime macdown dropbox postman skype kindle send-to-kindle)
for BINARY in "${BINARIES[@]}"
do
    brew cask install $BINARY
done
