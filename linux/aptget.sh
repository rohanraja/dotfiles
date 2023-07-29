sudo apt-get install -y \
  tmux \
  git \
  zsh \
  curl \
  wget \
  python-pip \
  silversearcher-ag \
  htop \
  nmap \
  tig \
  vlc \
  ranger \
  openssh-server \


sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cd ~
git clone https://github.com/rohanraja/dotfiles.git
cd dotfiles
sh ./install.sh


setxkbmap -layout us -option ctrl:nocaps

echo "source ~/dotfiles/zshrc" >> ~/.zshrc

vim -c "VundleInstall"
