#!/bin/bash

fancy_echo "installing editors..."

brew tap daviderestivo/emacs-head
brew install emacs-head@28 --with-cocoa

install_or_update cask  # this is a different cask! Emacs cask
