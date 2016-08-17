#!/bin/sh

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


# ------------------------------------ #
# install xcode
xcode-select --install

# ------------------------------------ #
# install homebrew and cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew tap caskroom/cask
append_to_shell_config_files 'export PATH="/usr/local/bin:$PATH"' 1
export PATH="/usr/local/bin:$PATH"

exit

# ------------------------------------ #
# install shell tools
brew cask install iterm2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install tmux

# ------------------------------------ #
# editors
brew install emacs
brew cask install atom

# ------------------------------------ #
# rubies
brew install rbenv

ruby_version="$(find_latest_ruby)"
# shellcheck disable=SC2016
append_shell_config_files 'eval "$(rbenv init - --no-rehash)"' 1
eval "$(rbenv init -)"

if ! rbenv versions | grep -Fq "$ruby_version"; then
  RUBY_CONFIGURE_OPTS=--with-openssl-dir=/usr/local/opt/openssl rbenv install -s "$ruby_version"
fi

rbenv global "$ruby_version"
rbenv shell "$ruby_version"
gem update --system
gem_install_or_update 'bundler'

# gems
gem install tmuxinator

# erlang / elixir

# node
brew install nodenv
append_to_shell_config_files 'export PATH="$HOME/.nodenv/bin:$PATH"'
append_to_shell_config_files 'eval "$(nodenv init -)"'

# react native
brew install watchman
npm install -g react-native-cli

# haskell
# TBD

# postgres
# TBD (postgres.app)

# ------------------------------------ #
# binaries

for BINARY in google-chrome slack gpgtools sketch rescuetime macdown dropbox
do
    brew cask install $BINARY
done
# missing binary in cask: postgres.app
