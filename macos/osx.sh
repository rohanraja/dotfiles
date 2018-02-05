#!/bin/bash

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


brew install caskroom/cask/brew-cask

brew install $(cat packages.txt)
brew cask install $(cat caskpackages.txt)


cd ~
git clone https://github.com/rohanraja/dotfiles.git
cd dotfiles
sh ./install.sh

echo "source ~/dotfiles/zshrc" >> ~/.zshrc

vim -c "VundleInstall"


# Install These also:
# 1. Trello
# 2. Microsoft Remote Desktop
# 3. XCode
# 4. Anaconda Python
# 5. Run Youdl on startup


