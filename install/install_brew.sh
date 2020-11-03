#!/bin/bash

fancy_echo "checking for brew and cask..."

if not_installed 'brew'; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew tap homebrew/cask
    append_to_shell_config_files 'export PATH="/usr/local/bin:$PATH"' 1
    export PATH="/usr/local/bin:$PATH"
fi

brew update && brew upgrade
