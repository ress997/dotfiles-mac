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

## Gen Brewfile {{{
cat <<EOF > ~/.Brewfile
tap "beeftornado/rmtree"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-fonts"
tap "homebrew/core"
brew "bat"
brew "exa"
brew "fd"
brew "fzy"
brew "ghq"
brew "git"
brew "git-delta"
brew "go"
brew "mas"
brew "neovim", args: ["HEAD"]
brew "ripgrep"
brew "sd"
brew "zsh"
cask "alfred"
cask "appcleaner"
cask "cmd-eikana"
cask "discord"
cask "font-cica"
cask "font-hackgen"
cask "font-hackgen-nerd"
cask "google-chrome"
cask "iterm2"
cask "minecraft"
cask "poi"
cask "visual-studio-code"
mas "1Password 7", id: 1333542190
mas "Magnet", id: 441258766
mas "Microsoft Remote Desktop", id: 1295203466
mas "Tailscale", id: 1475387142
mas "The Unarchiver", id: 425424353
mas "TweetDeck", id: 485812721
mas "Twitter", id: 1482454543
mas "Whalebird", id: 1378283354
EOF

brew bundle --global
# }}}

## nextword
open https://github.com/high-moctane/nextword-data/archive/large.tar.gz
go install github.com/high-moctane/nextword@latest
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
