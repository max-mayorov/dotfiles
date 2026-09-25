#!/usr/bin/env zsh

echo "Starting setup"

# Install xcode cli
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
   test -d "${xpath}" && test -x "${xpath}" ; then
   echo "Skipping XCode CLI install already installed"
else
   echo "Installing XCode CLI"
   xcode-select --install
fi

# Install Zap
ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
if [[ -d "$ZAP_DIR" ]]; then
    echo "Skipping Zap install; already installed at $ZAP_DIR"
else
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
fi

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else 
    echo "Skipping homebrew, already installed"
fi

# Update homebrew recipes
echo "Updating homebrew"
brew update

PACKAGES=(
    atuin
    bat
    cmake
    eza
    fnm
    fzf
    humanlog
    jq
    mas
    ngrok
    python-setuptools
    python@3
    ripgrep
    stow
    uv
    yq
    zoxide
)
echo "Installing packages..."
brew install ${PACKAGES[@]} -q

echo "Installing cask..."
CASKS=(
   appcleaner
   fork
   gcloud-cli
   ghostty
   google-cloud-sdk
   grandperspective
   lastpass
   notion
   vivaldi
   windows-app
)
echo "Installing cask apps..."
brew install --cask ${CASKS[@]} -q

echo "Configuring OS..."
# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "Macbook setup completed!"
