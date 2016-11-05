#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install caskroom/cask/brew-cask

brew cask install \
  google-chrome \
  iterm2 \
  dropbox \
  alarm-clock \
  omnidisksweeper \
  smcfancontrol \
  freefilesync \

brew install \
  homebrew/fuse/ntfs-3g \
  tmux \
  vim --with-python3 \
  git \
  zsh \
  curl \
  wget \
  htop \
  nmap \


sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cd ~
git clone https://github.com/rohanraja/dotfiles.git
cd dotfiles
sh ./install.sh

echo "source ~/dotfiles/zshrc" >> ~/.zshrc

vim -c "VundleInstall"
