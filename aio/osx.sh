#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install caskroom/cask/brew-cask

brew install $(cat packages.txt)
brew cask install $(cat caskpackages.txt)

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cd ~
git clone https://github.com/rohanraja/dotfiles.git
cd dotfiles
sh ./install.sh

echo "source ~/dotfiles/zshrc" >> ~/.zshrc

vim -c "VundleInstall"
