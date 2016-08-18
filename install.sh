#!/bin/sh

# my laptop provisioning script
# inspired by thoughtbot's https://github.com/thoughtbot/laptop
# warning, some parts are shamelessly stolen...

set -e 

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

append_to_shell_config_files() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"
  zshrc="$HOME/.zshrc"
  bash_profile="$HOME/bash_profile"

  for FILE in $zshrc $bash_profile
  do
      if ! grep -Fqs "$text" "$FILE"; then
	  if [ "$skip_new_line" -eq 1 ]; then
	      printf "%s\n" "$text" >> "$FILE"
	  else
	      printf "\n%s\n" "$text" >> "$FILE"
	  fi
      fi
  done
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"
  else
    gem install "$@"
    rbenv rehash
  fi
}

find_latest_ruby() {
  rbenv install -l | grep -v - | tail -1 | sed -e 's/^ *//'
}

find_latest_node() {
  nodenv install -l | gxargs -n 1 | grep '^[0-9]\+.[0-9]\+.[0-9]\+' | tail -n 1
}

# ------------------------------------ #
fancy_echo "checking for xcode..."

if [ -z `xcode-select -p` ]; then
    fancy_echo "installing xcode..."
    xcode-select --install
fi


# ------------------------------------ #
fancy_echo "checking for brew and cask..."

if [ -z `which brew` ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
    append_to_shell_config_files 'export PATH="/usr/local/bin:$PATH"' 1
    export PATH="/usr/local/bin:$PATH"
fi
brew update

# ------------------------------------ #
fancy_echo "installing shell tools..."

brew cask install iterm2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install tmux
brew install zsh-syntax-highlighting
append_to_shell_config_files 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' 1
brew install fzf
if [ ! -e $HOME/.fzf.zsh ]; then
    /usr/local/opt/fzf/install
fi
brew install zsh-history-substring-search
append_to_shell_config_files 'source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh'
append_to_shell_config_files '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh'
brew install findutils
brew install the_silver_searcher

# ------------------------------------ #
fancy_echo "installing editors..." 
brew install emacs
brew cask install atom
NUCLIDE_RECOMMENDED_PLUGINS=(nuclide tool-bar)
OTHER_ATOM_PLUGINS=()
ALL_ATOM_PLUGINS=("${NUCLIDE_RECOMMENDED_PLUGINS[@]}" "${OTHER_ATOM_PLUGINS[@]}")
for PLUGIN in $ALL_ATOM_PLUGINS
do
    if [ ! -d $HOME/.atom/packages/$PLUGIN ]; then
	apm install $PLUGIN
    fi
done

# ------------------------------------ #
fancy_echo "installing rubies..." 
brew install rbenv

ruby_version="$(find_latest_ruby)"
# shellcheck disable=SC2016
append_to_shell_config_files 'eval "$(rbenv init - --no-rehash)"' 1
eval "$(rbenv init -)"

if ! rbenv versions | grep -Fq "$ruby_version"; then
  RUBY_CONFIGURE_OPTS=--with-openssl-dir=/usr/local/opt/openssl rbenv install -s "$ruby_version"
fi

rbenv global "$ruby_version"
rbenv shell "$ruby_version"
gem update --system
gem_install_or_update 'bundler'

# ------------------------------------ #
fancy_echo "installing useful gems..." 
gem install tmuxinator
tmuxinator doctor

# ------------------------------------ #
fancy_echo "installing node..."
brew install nodenv
append_to_shell_config_files 'export PATH="$HOME/.nodenv/bin:$PATH"'
append_to_shell_config_files 'eval "$(nodenv init -)"'
node_version="$(find_latest_node)"

if ! nodenv versions | grep -Fq "$node_version"; then
  nodenv install $node_version
  nodenv global $node_version
  nodenv rehash
fi

# ------------------------------------ #
fancy_echo "installing react native..."
brew install watchman
npm install -g react-native-cli

# ------------------------------------ #
fancy_echo "installing heroku stuffs..."
brew install "heroku-toolbelt"

# ------------------------------------ #
fancy_echo "installing other binaries..."

BINARIES=(google-chrome slack gpgtools sketch rescuetime macdown dropbox)
for BINARY in $BINARIES
do
    brew cask install $BINARY
done


# ----- TBD ----- #
# ------------------------------------ #
fancy_echo "erlang/elixir: TBD"

# ------------------------------------ #
fancy_echo "haskell & stack: TBD"

# ------------------------------------ #
fancy_echo "postgres.app: TBD"

# ------------------------------------ #
fancy_echo "java: TBD"
