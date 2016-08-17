#!/bin/sh

set -e 

DOTFILES_DIR=$HOME/code/dotfiles

for FILE in profile zshrc bashrc 
do
    ln -s $DOTFILES_DIR/$FILE $HOME/.$FILE 
done