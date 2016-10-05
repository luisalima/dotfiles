fancy_echo "installing editors..."

brew install emacs
brew install cask  # this is a different cask! Emacs cask

brew cask install atom
NUCLIDE_RECOMMENDED_PLUGINS=(nuclide tool-bar haskell-grammar highlight-selected language-babel language-ini language-ocaml language-swift language-thrift merge-conflicts sort-lines)
OTHER_ATOM_PLUGINS=(todo-show autoclose-html pigments auto-detect-indentation atom-beautify file-icons)
ATOM_LINTERS=(linter linter-eslint)
ALL_ATOM_PLUGINS=("${NUCLIDE_RECOMMENDED_PLUGINS[@]}" "${OTHER_ATOM_PLUGINS[@]}" "${ATOM_LINTERS[@]}")

for PLUGIN in "${ALL_ATOM_PLUGINS[@]}"
do
    if [ ! -d $HOME/.atom/packages/$PLUGIN ]; then
	apm install $PLUGIN
    else
	echo "$PLUGIN for atom is already installed"
    fi
done
