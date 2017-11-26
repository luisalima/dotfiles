When setting up a new laptop, I need to do the following by hand:

# copy ssh keys and configuration
scp -r lu@$OLD_LAPTOP_IP:.ssh $HOME

# configure the non-ascii font in iterm2 to one of the patched fonts for powerline
# so that powerline for tmux works
