#!/bin/bash

fancy_echo "installing shell tools..."

brew_install tmux
if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
brew_install reattach-to-user-namespace
pip install psutil
# uncomment the following lines if you want powerline fonts
# (
#     git clone https://github.com/powerline/fonts
#     source fonts/install.sh
#     rm -rf fonts
# )
# note that we need to configure the non-ascii font in iterm2 to one of the patched fonts for powerline above

brew_install zsh-syntax-highlighting
append_to_shell_config_files 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' 1
brew_install fzf
if [ ! -e "$HOME/.fzf.zsh" ]; then
    /usr/local/opt/fzf/install
fi
brew_install zsh-history-substring-search
append_to_shell_config_files 'source /usr/local/opt/zsh-history-substring-search/share/zsh-history-substring-search/zsh-history-substring-search.zsh'
append_to_shell_config_files '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'
brew_install findutils
brew_install the_silver_searcher # ag
brew_install source-highlight
brew_install diff-so-fancy
brew_install emojify
brew_install wget
