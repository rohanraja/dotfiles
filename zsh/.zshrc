# If you come from bash you mi
eval "$(zoxide init zsh)"

# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

if [ -e ~/.zshrc.local ]; then source ~/.zshrc.local; fi
if [ -e ~/.zsh_plugins.sh ]; then source ~/.zsh_plugins.sh; fi

