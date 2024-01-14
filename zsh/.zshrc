# If you come from bash you mi

export PATH=$HOME/.local/bin:$PATH
# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

if [ -e ~/.zshrc.local ]; then source ~/.zshrc.local; fi
if [ -e ~/.zsh_plugins.sh ]; then source ~/.zsh_plugins.sh; fi

eval "$(zoxide init zsh)"

# Check if the .passKey file exists
if [ -e ~/.passKey ]; then
    # Read the contents of the file into the passKey variable
    passKey=$(cat ~/.passKey)
else
    # .passKey file not found, handle the case accordingly
    echo "Error: .passKey file not found."
fi

export passKey  # Export the variable to make it available to subshells
