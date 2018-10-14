#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Figure out if this works...
xcode-select --install

brew cask install gpgtools
brew install fzf
brew install go
brew install google-java-format
brew install jq
brew install maven
brew install stow
brew install tmux
