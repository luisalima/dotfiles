#!/bin/bash

fancy_echo "installing ml tools..."

brew_install scala
pip install cql
pip install jupyter
brew_install cassandra
brew_install sbt

FILENAME="spark-2.2.0-bin-hadoop2.7.tgz"
URL="http://mirrors.up.pt/pub/apache/spark/spark-2.2.0/$FILENAME"

wget "$URL" && \
    sudo tar xvf "$FILENAME" -C /usr/local && \
    sudo mv /usr/local/spark-* /usr/local/spark && \
    sudo chown -R "$(whoami)" /usr/local/spark && \
    rm -rf "$FILENAME"

append_to_shell_config_files 'export SPARK_HOME=/usr/local/spark'
append_to_shell_config_files 'export PATH=/usr/local/spark/bin:$PATH'
