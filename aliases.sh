# SHORTCUTS

alias c='clear'
alias s='sudo'
alias h='history | ag'
alias p='ps aux | ag'
alias f='find . | ag'
alias prt="lsof -i"
alias lk="ll -S | less"
alias kl="ll -t | less"
alias pi='pip install'
alias ni='npm install --save'
alias in='ipython notebook'



# OSX Shortcuts
alias bi='brew install'

# Linux Shortcuts
alias ai='sudo apt-get install'
alias au='sudo apt-get update'

# UTILITY

alias ccat='pygmentize -g'
alias youdl='cd ~/code/youtube_downloader/'
alias res="source ~/.zshrc"
alias httpserver="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"

# OLD ONES

alias algohttp_8118='ssh -L 8118:localhost:8118 root@www.algomuse.com:443'
alias xeon_8000='ssh -L 8001:localhost:8000 rohanr@10.5.30.194'
alias algosocks_2222='ssh -L 2222:localhost:22 root@www.algomuse.com:443'
alias algoredis='ssh -R 6380:localhost:6379 root@www.algomuse.com:443'
alias gopath='cd /Users/rohanraja/code/go/lang/src/github.com/rohanraja/'
alias pnbrowse='open -n -a /Applications/Google\ Chrome.app --args --proxy-server=http://localhost:8118 --proxy-bypass-list="localhost" --profile-directory="pndl"'
alias urlsadds='python ~/scripts/tmp/UrlExtract.py'
alias youvideos='cd /Volumes/BackSSD/Users/rohanraja/you_downloads/youvideos'
alias pndl='/Volumes/Fireice/Users/rohanraja/Downloads/pndls'

alias xlrn="mux stop xlearn2; mux xlearn2"


function dockrun()
{
 docker run -it $1 /bin/sh
}

function singLn()
{
  perl -pe 's/\n/ \\n/ unless eof' $1 | pbcopy
}

source ~/.zsh/tmuxinator.zsh

# Rails
alias cucu='bundle exec cucumber'
alias cuc='bundle exec cucumber ${FEAT}'
alias dbmig='bundle exec rake db:migrate; bundle exec rake db:migrate RAILS_ENV=test'
alias dbreset='bundle exec rake db:reset; bundle exec rake db:reset RAILS_ENV=test; bundle exec rake restart'
alias resq='bundle exec rake environment resque:work QUEUE=CODE_RUN_EVENTS'

# Dot net
alias dr='dotnet run'
