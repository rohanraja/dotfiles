sudo apt-get install -y \
  tmux \
  vim-gnome \
  git \
  zsh \
  curl \
  wget \
  python-pip \
  silversearcher-ag \
  htop \
  nmap \
  openssh-server \
  nautilus-open-terminal \


sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cd ~
git clone https://github.com/rohanraja/dotfiles.git
cd dotfiles
sh ./install.sh


setxkbmap -layout us -option ctrl:nocaps

vim -c "VundleInstall"
