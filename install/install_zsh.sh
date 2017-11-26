#!/bin/bash

fancy_echo "installing zsh and pure-prompt..."

brew_install zsh zsh-completions
npm install --global pure-prompt
chsh -s /bin/zsh
