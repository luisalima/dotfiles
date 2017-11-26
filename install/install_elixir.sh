#!/bin/bash

fancy_echo "installing erlang/elixir..."

brew_install elixir
mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
