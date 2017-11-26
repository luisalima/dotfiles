#!/bin/bash

fancy_echo "installing ml tools..."

brew_install scala
export PATH=/usr/local/scala/bin:$PATH
pip install cql
pip install jupyter
brew_install cassandra
