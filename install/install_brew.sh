#!/bin/bash

fancy_echo "checking for brew and cask..."

if [ -z `which brew` ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
    append_to_shell_config_files 'export PATH="/usr/local/bin:$PATH"' 1
    export PATH="/usr/local/bin:$PATH"
fi

brew update && brew upgrade
