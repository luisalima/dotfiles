#!/bin/bash

fancy_echo "installing zsh and pure-prompt..."

brew install zsh zsh-completions
npm install --global pure-prompt
brew install zplug
