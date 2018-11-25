# these are common configurations that I like to keep
# between bash and zsh.

export DOTFILES_DIR=$HOME/config/dotfiles

# this is meant for keeping sensitive environment variables.
if [[ -a "./env.sh" ]]
then
    source ./env.sh
fi

# some specific commands config.
alias ls='ls -aG'
alias st='stree'
alias sourcetree='stree'

LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS

# all other configs are organized before I go nuts :)
source "$DOTFILES_DIR/shell/encoding_config.sh"
source "$DOTFILES_DIR/shell/path_config.sh"
source "$DOTFILES_DIR/shell/editor_config.sh"
source "$DOTFILES_DIR/shell/rbenv_config.sh"
source "$DOTFILES_DIR/shell/nodenv_config.sh"
source "$DOTFILES_DIR/shell/git_config.sh"

export ALTERNATE_EDITOR=""
alias emacs='emacsclient -t'
alias e='emacs'

alias gwip='git add -A; git commit -n -m "--wip-- [skip ci]"'

eval "$(rbenv init - --no-rehash)"
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

 [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
