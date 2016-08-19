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

