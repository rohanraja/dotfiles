cd ~/dotfiles
sh ./install.sh


setxkbmap -layout us -option ctrl:nocaps

echo "source ~/dotfiles/zshrc" >> ~/.zshrc

vim -c "VundleInstall"
