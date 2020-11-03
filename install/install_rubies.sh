#!/bin/bash

fancy_echo "installing rubies..."
install_or_update rbenv

ruby_version="$(find_latest_ruby)"
# shellcheck disable=SC2016
append_to_shell_config_files 'eval "$(rbenv init - --no-rehash)"' 1
eval "$(rbenv init -)"

if ! rbenv versions | grep -Fq "$ruby_version"; then
  RUBY_CONFIGURE_OPTS=--with-openssl-dir=/usr/local/opt/openssl rbenv install -s "$ruby_version"
fi

rbenv global "$ruby_version"
rbenv shell "$ruby_version"
gem update --system
gem_install_or_update 'bundler'
