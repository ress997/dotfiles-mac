#!/usr/bin/zsh

# Command Line Tools for Xcode インストール
sudo xcode-select --install

# Rosetta2 インストール
#if [[ $(uname -m) == arm64 && ! -f /Library/Apple/System/Library/LaunchDaemons/com.apple.oahd.plist ]];then
sudo softwareupdate --install-rosetta --agree-to-license
#fi

# dotfile setup

# Homebrew {{{
if (( $+commands[brew] )); then
	# Install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

exec zsh -l

## base
brew install git
brew install go
brew install mas
brew install neovim --HEAD
brew install zsh
## base-devel
brew install bat
brew install exa
brew install fd
brew install fzy
brew install ghq
brew install git-delta
brew install ripgrep
brew install sd
brew tap beeftornado/rmtree

## cask
brew tap homebrew/cask
brew install alfred
brew install appcleaner
brew install cmd-eikana
brew install discord
brew install google-chrome
### Game
brew install minecraft
brew install poi
### Dev
brew install iterm2
brew install visual-studio-code

## Font
brew tap homebrew/cask-fonts
brew install font-cica
brew install font-hackgen
brew install font-hackgen-nerd

## mas
mas install 425424353 # The Unarchiver
mas install 441258766 # Magnet
mas install 1333542190 # 1Password 7
### SNS
mas install 1482454543 # Twitter
mas install 485812721 # TweetDeck
mas install 1378283354 # Whalebird
### Dev
mas install 1475387142 # Tailscale
mas install 1295203466 # Microsoft Remote Desktop
# }}}

# ネットワークドライブで.DS_Store を作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# USBドライブで.DS_Store を作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
killall Finder

# スクリーンショットの保存先を ~/Pictures/SS に変更
mkdir -p ~/Pictures/SS
defaults write com.apple.screencapture location ~/Pictures/SS
# スクリーンショットのファイル名からスクリーンショットを削除
defaults write com.apple.screencapture name ""
# スクリーンショットの保存形式を png に変更
defaults write com.apple.screencapture type png
# スクリーンショットに影を含めない
defaults write com.apple.screencapture disable-shadow -bool true
killall SystemUIServer

# LaunchPad 初期化
defaults write com.apple.dock ResetLaunchPad -bool true
killall Dock
