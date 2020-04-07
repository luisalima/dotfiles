#!/bin/bash

fancy_echo "installing shell tools..."

install tmux
if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
install reattach-to-user-namespace
pip install psutil

install zsh-syntax-highlighting
append_to_shell_config_files 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' 1
install fzf
if [ ! -e "$HOME/.fzf.zsh" ]; then
    /usr/local/opt/fzf/install
fi
install zsh-history-substring-search
append_to_shell_config_files 'source /usr/local/opt/zsh-history-substring-search/share/zsh-history-substring-search/zsh-history-substring-search.zsh'
append_to_shell_config_files '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'
install findutils
install the_silver_searcher # ag
install source-highlight
install diff-so-fancy
install emojify
install wget

install autojump
