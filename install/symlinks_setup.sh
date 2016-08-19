#!/bin/sh

DOTFILES_DIR=$HOME/code/dotfiles

for FILE in zshrc bashrc
do
    mv $HOME/.$FILE $HOME/.$FILE.old 2>/dev/null
    ln -s $DOTFILES_DIR/shell/$FILE $HOME/.$FILE 
done


mv $HOME/.gitconfig $HOME/.gitconfig.old 2>/dev/null
ln -s $DOTFILES_DIR/gitconfig $HOME/.gitconfig


mv -f $HOME/.emacs.d $HOME/.emacs.d.old 2>/dev/null
ln -s $DOTFILES_DIR/emacs $HOME/.emacs.d


if [ ! -d $HOME/bin ]; then
    mkdir bin
    ln -s $DOTFILES_DIR/bin $HOME/bin
fi

rm -f $HOME/.oh-my-zsh/themes/fino-luisa.zsh-theme 2>/dev/null
ln -s $DOTFILES_DIR/shell/fino-luisa.zsh-theme $HOME/.oh-my-zsh/themes/fino-luisa.zsh-theme

