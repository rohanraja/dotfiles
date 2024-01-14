# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \
	nixpkgs.zoxide \
	nixpkgs.direnv

# stow dotfiles
stow nvim
stow git
stow tmux
stow zsh
stow bin

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle <~/.zsh_plugins.txt >~/.zsh_plugins.sh

# install neovim plugins
# nvim --headless +PlugInstall +qall

# Use kitty terminal on MacOS
# [ $(uname -s) = 'Darwin' ] && stow kitty
#

###############################################################################
# Install tpm (tmux plugin manager)
###############################################################################

rm -rf "${HOME}/.tmux/plugins/tpm"
git clone --depth 1 https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"

###############################################################################
# Install tmux plugins
###############################################################################

printf "\n\nInstalling tmux plugins...\n"

export TMUX_PLUGIN_MANAGER_PATH="${HOME}/.tmux/plugins"
"${HOME}/.tmux/plugins/tpm/bin/install_plugins"
