alias c='clear'
alias s='sudo'
alias h='history | ag'
alias p='ps aux | ag'
alias f='find . | ag'
alias prt="lsof -i"
# list files sorted by size
alias lk="ll -S | less"
# list files sorted by date
alias kl="ll -t | less"
alias pi='pip install'
alias ni='npm install --save'
alias in='ipython notebook'

# OSX Shortcuts
alias bi='brew install'

# Linux Shortcuts1
alias ai='sudo apt-get install'
alias au='sudo apt-get update'

# UTILITY

alias ccat='pygmentize -g'
alias res="source ~/.zshrc"
alias httpserver="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"

function dockrun() {
	docker run -it $1 /bin/sh
}

function singLn() {
	perl -pe 's/\n/ \\n/ unless eof' $1 | pbcopy
}

# Dot net
alias dr='dotnet run'

# Copy pwd to clipboard
alias cpwd='pwd | pbcopy'

export EDITOR='nvim'
