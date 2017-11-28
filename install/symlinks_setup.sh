#!/bin/sh

echo "setting up symlinks..."

set +e

DOTFILES_DIR=$HOME/config/dotfiles


for FILE in zshrc bashrc tmux.conf
do
    mv "$HOME/.$FILE" "$HOME/.$FILE.old" 2>/dev/null
    ln -s "$DOTFILES_DIR/shell/$FILE" "$HOME/.$FILE"
done


mv "$HOME/.gitconfig" "$HOME/.gitconfig.old" 2>/dev/null
ln -s "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

mv "$HOME/.gitignore_global" "$HOME/.gitignore_global.old" 2>/dev/null
ln -s "$DOTFILES_DIR/gitignore_global" "$HOME/.gitignore_global"
mv "$HOME/.git_template" "$HOME/.git_template.old" 2>/dev/null
ln -s "$DOTFILES_DIR/gitmessage" "$HOME/.git_template"

git config --global core.excludesfile ~/.gitignore_global

mv -f "$HOME/.emacs.d" "$HOME/.emacs.d.old" 2>/dev/null
ln -s "$DOTFILES_DIR/emacs" "$HOME/.emacs.d"


if [ ! -d "$HOME/bin" ]; then
    mkdir bin
    ln -s "$DOTFILES_DIR/bin" "$HOME/bin"
fi
