# update brew
brew update && brew upgrade

# update emacs packages
cd ~/.emacs.d
cask upgrade-cask
cask update
cd -

# MISSING: update npm/node

# MISSING: update rubies
