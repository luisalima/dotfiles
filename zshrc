source $HOME/.profile

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="fino-luisa"
TERM='xterm-256color'

export EDITOR='emacsclient'
export ALTERNATE_EDITOR="emacs"

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
plugins=(git mercurial rbenv cabal)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# export RBENV_ROOT='/opt/boxen/rbenv'
eval "$(rbenv init -)"

alias rspec='nocorrect rspec'

source $ZSH/oh-my-zsh.sh
if [[ -a "./env.sh" ]]
then
    source ./env.sh
fi

source ~/.bin/tmuxinator.zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export JAVA_HOME="$(/usr/libexec/java_home)"

export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'



# export NVM_DIR="/Users/lu/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# no idea why this is needed, but if it stays it will be 2.0 which leads to lots of mess
unset RBENV_VERSION

if [ $((`date "+%d"`%5)) -eq 0 ]
then
    echo "RUNNING UPDATES!..."
    echo "updating brew..."
    brew update && brew upgrade
    LATEST_STABLE_RUBY=`rbenv install -l | grep -v - | tail -1`
    echo $LATEST_STABLE_RUBY | xargs rbenv install
    echo $LATEST_STABLE_RUBY | xargs rbenv global
    gem update bundler
    #nvm ls-remote
    #nvm install `nvm ls-remote | tail -n 1`
fi

man $(ls /usr/bin | gshuf -n 1) | cat

export CLASSPATH=$CLASSPATH:$HOME/bin/postgresql-9.4.1208.jre6.jar

alias ls='ls -a'

if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
npm use global

# added by travis gem
[ -f /Users/lu/.travis/travis.sh ] && source /Users/lu/.travis/travis.sh

cd() {
  if [[ -e node_modules ]]
  then
      echo "node project detected, adding $(npm bin) to PATH"
      export PATH=$(npm bin):$PATH
  fi
  builtin cd "$1"
}
