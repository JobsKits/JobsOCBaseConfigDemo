#!/usr/bin/env zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install cocoapods
brew install openjdk
brew install jenv
brew install rbenv
brew install flutter
brew install fvm
brew install git git-lfs wget jq
brew install swiftlint
brew install xcbeautify

brew cleanup
