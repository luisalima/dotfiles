# this approach breaks cd, I'm still trying to find a better
# solution.

# see https://gist.github.com/airtonix/9925531 for another approach.
# http://stackoverflow.com/questions/9679932/how-to-use-package-installed-locally-in-node-modules

# cd() {
#   if [[ -e node_modules ]]
#   then
#       echo "node project detected, adding $(npm bin) to PATH"
#       export PATH=$(npm bin):$PATH
#   fi
#   builtin cd "$1"
# }

export PATH="$HOME/.nodenv/bin:$PATH"
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

