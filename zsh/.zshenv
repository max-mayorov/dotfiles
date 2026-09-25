
eval "$(/opt/homebrew/bin/brew shellenv)"

# If .zshenv.local exists, source it
local_zshenv="~/.zshenv.local"
test -e "$local_zshenv" && source "$local_zshenv"
