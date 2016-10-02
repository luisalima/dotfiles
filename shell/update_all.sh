# update brew
brew update && brew upgrade

# update emacs packages
cd ~/.emacs.d
cask upgrade-cask
cask update
cd -

# update atom packages
apm update

# MISSING: update npm/node

# MISSING: update rubies
