
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=/opt/homebrew/share/google-cloud-sdk/bin:"$PATH"

# If .zshenv.local exists, source it
local_zshenv="$HOME/.zshenv.local"
test -e "$local_zshenv" && source "$local_zshenv"
