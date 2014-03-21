# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="fino"
TERM='xterm-256color'

alias emacs="/usr/local/opt/emacs/bin/emacs"
alias emacsclient='/usr/local/opt/emacs/bin/emacsclient'
export EDITOR='emacsclient'
export ALTERNATE_EDITOR=""

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/MacGPG2/bin:/usr/texbin:/opt/local/bin:/opt/local/sbin:/opt/bin:/opt/local/bin/

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias rspec='nocorrect rspec'
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"

source $ZSH/oh-my-zsh.sh
source ./env.sh
