#!/bin/bash

fancy_echo "checking for xcode..."

if [ -z `xcode-select -p` ]; then
    fancy_echo "installing xcode..."
    xcode-select --install
fi
