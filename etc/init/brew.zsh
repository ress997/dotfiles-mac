#!/usr/bin/env zsh

# GNU command
brew install coreutils
brew install gawk
brew install gnu-sed
brew install grep

# system command
brew install curl
brew install git
brew install tmux
brew install wget
brew install zsh

brew install neovim
#brew install neovim --HEAD
# https://github.com/neovim/pynvim をインストール
#brew install python
#pip3 install -U pynvim

brew install n
brew install yarn --without-node

brew tap homebrew/cask
# App
brew cask install clipy
brew cask install google-chrome
brew cask install hyperswitch
brew cask install macs-fan-control

# Quick Look
brew cask install qlimagesize
brew cask install qlmarkdown
brew cask install webpquicklook

# Font
brew cask install font-cica
