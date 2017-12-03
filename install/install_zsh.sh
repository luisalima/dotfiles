#!/bin/bash

fancy_echo "installing zsh and pure-prompt..."

brew_install zsh zsh-completions
npm install --global pure-prompt
if [ ! "$SHELL" = '/bin/zsh' ]; then
    chsh -s /bin/zsh
fi
