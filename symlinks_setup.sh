#!/bin/sh

set -e 

DOTFILES_DIR=$HOME/code/dotfiles

for FILE in profile zshrc bashrc gitconfig
do
    mv $HOME/.$FILE $HOME/.$FILE.old
    ln -s $DOTFILES_DIR/$FILE $HOME/.$FILE 
done

if [ -d $HOME/.emacs.d ]; then
    rm -rf $HOME/.emacs.d.old
    mv $HOME/.emacs.d $HOME/.emacs.d.old
fi
ln -s $DOTFILES_DIR/emacs $HOME/.emacs.d

if [ ! -d $HOME/bin ]; then
    mkdir bin
    ln -s $DOTFILES_DIR/bin $HOME/bin
fi

if [ ! -e $HOME/.oh-my-zsh/themes/fino-luisa.zsh-theme ]; then
    ln -s $DOTFILES_DIR/fino-luisa.zsh-theme $HOME/.oh-my-zsh/themes/fino-luisa.zsh-theme
fi