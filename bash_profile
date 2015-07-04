
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*



alias digio='ssh root@www.algomuse.com:443'

alias ll='ls -lGh'
alias llsearch='ls -lGh | grep'
alias lll='du -skh * | sort -n'

alias socks_proxy='ssh -L 1080:localhost:2080 root@www.algomuse.com:443'
alias socks_proxy_done='ssh -D 1080 root@www.algomuse.com:443'
alias ssh_digio_forward='ssh -L 2222:localhost:22 root@www.algomuse.com:443'
alias digio_forward='ssh -L 2222:localhost:22 root@www.algomuse.com:443'
alias adb='"/Applications/Android Studio2.app/Contents/sdk/platform-tools/adb"'
alias octave='"/usr/local/octave/3.8.0/bin/octave" -q '
alias resurrect='"/Users/rohanraja/Documents/bashscripts/tmux_resurrect"'

alias ec2connect='ssh -i ~/.ssh/email_server.pem -l ubuntu ec2-54-149-27-32.us-west-2.compute.amazonaws.com'

function corkScrewAlgomuse()
{
	ssh www.algomuse.com -p 443 -o "ProxyCommand /Users/rohanraja/.ssh/corkscrew 10.3.100.208 8080 www.algomuse.com 443"
}
function lime(){
	
	if [ "$1" == "" ] 
	then 
		open . -a /Applications/Sublime\ Text\ 2.app
	else
		open $1 -a /Applications/Sublime\ Text\ 2.app
	fi              
}

function insert_host()
{
	if grep -Fwq "$1" /etc/hosts
	then 
		echo "Already Added"; 
		tail -n 5 /etc/hosts

	else 

		echo "127.0.0.1 $1" >> /etc/hosts; 
		echo "Sucessfully Added!"; 
		tail -n 5 /etc/hosts


	fi
}


function ngrestart()
{
	#sudo /opt/nginx/sbin/nginx -s stop
	#sudo /opt/nginx/sbin/nginx

	sudo /opt/nginx/sbin/nginx -s reload
	echo "Restarting NGINX..."
}

function ngstart()
{
	#sudo /opt/nginx/sbin/nginx -s stop
	#sudo /opt/nginx/sbin/nginx

	sudo /opt/nginx/sbin/nginx
	echo "Starting NGINX..."
}

function rbsh()
{
	source ~/.bash_profile ;
}


function start_ssl()
{
	thin start --ssl --ssl-verify --ssl-key-file server.key --ssl-cert-file server.crt 

}

function pushchanges()
{
	git add .
	git commit -m "$1"
	git push live master
}
function pyhttp(){
	
	if [ "$1" == "" ] 
	then 
		python -m SimpleHTTPServer
	else
		cd $1 ; python -m SimpleHTTPServer
	fi              
}

##
# Your previous /Users/rohanraja/.bash_profile file was backed up as /Users/rohanraja/.bash_profile.macports-saved_2015-06-27_at_22:58:39
##

# MacPorts Installer addition on 2015-06-27_at_22:58:39: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

HISTFILESIZE=10000000
stty -ixon

