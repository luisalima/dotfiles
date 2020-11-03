#!/bin/bash

fancy_echo "installing or updating shell tools..."

install_or_update tmux
if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
install_or_update reattach-to-user-namespace
# pip3 install psutil

install_or_update zsh-syntax-highlighting
append_to_shell_config_files 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' 1
install_or_update fzf
if [ ! -e "$HOME/.fzf.zsh" ]; then
    /usr/local/opt/fzf/install
fi
install_or_update zsh-history-substring-search
append_to_shell_config_files 'source /usr/local/opt/zsh-history-substring-search/share/zsh-history-substring-search/zsh-history-substring-search.zsh'
append_to_shell_config_files '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'
install_or_update findutils
install_or_update the_silver_searcher # ag
install_or_update source-highlight
install_or_update diff-so-fancy
install_or_update emojify
install_or_update wget

install_or_update autojump
