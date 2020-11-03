#!/bin/bash

fancy_echo "installing zsh and pure-prompt..."

install_or_update zsh zsh-completions
npm install --global pure-prompt
if [ ! "$SHELL" = '/bin/zsh' ]; then
    chsh -s /bin/zsh
fi
