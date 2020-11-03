#!/bin/bash

fancy_echo "installing node..."
install_or_update nodenv
append_to_shell_config_files 'export PATH="$HOME/.nodenv/bin:$PATH"'
append_to_shell_config_files 'eval "$(nodenv init -)"'
node_version="$(find_latest_node)"

if ! nodenv versions | grep -Fq "$node_version"; then
  nodenv install $node_version
fi

nodenv global $node_version
nodenv rehash
