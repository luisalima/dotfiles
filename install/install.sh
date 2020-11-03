#!/bin/bash

# my laptop provisioning script
# inspired by thoughtbot's https://github.com/thoughtbot/laptop
# warning, some parts are shamelessly stolen...

set -e

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

append_to_shell_config_files() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"
  zshrc="$HOME/.zshrc"
  bash_profile="$HOME/bash_profile"

  for FILE in $zshrc $bash_profile
  do
      if ! grep -Fqs "$text" "$FILE"; then
          if [ "$skip_new_line" -eq 1 ]; then
	      printf "%s\n" "$text" >> "$FILE"
          else
	      printf "\n%s\n" "$text" >> "$FILE"
          fi
      fi
  done
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"
  else
    gem install "$@"
    rbenv rehash
  fi
}

find_latest_ruby() {
  rbenv install -l | grep -v - | tail -1 | sed -e 's/^ *//'
}

find_latest_node() {
  nodenv install -l | gxargs -n 1 | grep '^[0-9]\+.[0-9]\+.[0-9]\+' | tail -n 1
}

not_installed() {
    [ -z "$(which "$1")" ]
}

get_os() {
    uname -s
}

install_or_update() {
    if $(not_installed "$1"); then
        if [ $(get_os) = 'Darwin' ]; then
            brew install "$1"
        fi
    else
        if [ $(get_os) = 'Darwin' ]; then
            brew upgrade "$1" || echo "$1 was not installed via brew"
        fi
    fi
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

fancy_echo "Detected $(get_os) system"

if [ $(get_os) = 'Darwin' ]; then
    source $DIR/install_xcode.sh
    source $DIR/install_brew.sh
fi

source $DIR/install_python.sh
source $DIR/install_shell_tools.sh
source $DIR/install_editors.sh
source $DIR/install_rubies.sh
source $DIR/install_node.sh
source $DIR/symlinks_setup.sh
source $DIR/install_zsh.sh

# golang
brew install golang
GO111MODULE=on go get golang.org/x/tools/gopls@latest
