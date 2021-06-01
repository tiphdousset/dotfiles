# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export VISUAL="nvim"
export EDITOR="$VISUAL"
# export PAGER=/usr/bin/vimpager
# PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH="/usr/lib/jvm/java-8-openjdk/bin:$PATH"
export PATH="/Users/tiphanie/Library/Python/2.7/bin:$PATH"
export PATH="/usr/local/Cellar/ruby/2.6.5/bin:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
# /usr/local/opt/ruby/bin:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export ELM_DEBUGGER=false
export PATH="/Users/tiphaniedousset/Projects/Private/flutter/bin:$PATH"
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
export PKG_CONFIG_PATH="/usr/local/Cellar/imagemagick/7.0.8-68/lib/pkgconfig:$PKG_CONFIG_PATH"

# Memo
# htop or atop to see CPU

# Aliases

### Hivemind ###

## Payone ##
PAYONE="~/Projects/Hivemind/PAYONE"
alias pay="cd $PAYONE"
alias tim="cd $PAYONE/cbis-tim-data/"
alias om="cd $PAYONE/cbis-omnichannel/"
alias dli="cd $PAYONE/cbis-data-lake-ingest/"
alias omt="cd $PAYONE/cbis-datalake-omnichannel-testing"
alias sdp="cd $PAYONE/cbis-sdp-services"
# alias oc="openconnect-route53-vpn-splitter -u <VPN-USER> -p <AWS_PROFILE>"  #first password is for your system, then vpn password
oc(){ openconnect-route53-vpn-splitter -u "$1" -p "$2"; } # $1 <VPN-USER> $2 <AWS_PROFILE>

## Hagebau ##
alias ga_kafka="ssh -i ~/.ssh/hagebau/hbp-master -N -L 9001:kafka-manager.production.internal-service:9000 ubuntu@bastion.production.data-platform.hagebaudata.com"
alias ga_postgres="ssh -i ~/.ssh/hagebau/hbp-master -N -L 5433:data-platform-production-marketsdata.cj7uoem9t1wj.eu-west-1.rds.amazonaws.com:5432 ubuntu@bastion.production.data-platform.hagebaudata.com"


HIVEMIND="~/Projects/Hivemind/"
alias hiv="cd $HIVEMIND"
alias ha="cd $HIVEMIND/Hagebau/"
alias ga="cd $Hivemind/ga-aggregations/"
alias docc="docker-compose"
alias doc="docker"
alias aws-ec2-describe-instances="aws ec2 describe-instances | jq -c '.Reservations[].Instances[] | {InstanceId, AvailabilityZone: .Placement.AvailabilityZone, Name: (.Tags | if . then . | from_entries | .Name else null end) , State: .State.Name, PublicDnsName}'"
alias dockerStop="docker stop $(docker ps -a -q)"


function aws-ec2-instance-connect-send-ssh-public-key() {
  local byname=${1:-cbis.cicd.bastion}
  echo "try to find instance for $byname"
  local key="$(cat ~/.ssh/id_rsa.pub)"
  local user="ec2-user"
  local json=`aws-ec2-describe-instances | jq -c \
    --arg byname "$byname" \
    --arg user "$user" \
    --arg key "$key" \
    'select(.Name == $byname) | select(.State == "running") | {InstanceId, AvailabilityZone, InstanceOSUser: "\($user)", SSHPublicKey: "\($key)"}'
  `
  echo "found: $json"
  aws ec2-instance-connect send-ssh-public-key --cli-input-json $json
}

function exportStaging() {
    export USER_POOL_ID=eu-west-1_2CjdSL4D0
    export USER_POOL_WEB_CLIENT_ID=3c71riu4mnr7takur3isk1h9cg
    export API_BASE_URL=https://9b9t0h4385.execute-api.eu-west-1.amazonaws.com/prod
    export ENVIRONMENT=staging
}

function exportDev() {
    export USER_POOL_ID=eu-west-1_ZbWfae2U0 
    export USER_POOL_WEB_CLIENT_ID=31lr91d13vsdp2hu1dajmoimo1
    export API_BASE_URL=https://v59otf5g9e.execute-api.eu-west-1.amazonaws.com/prod
    export ENVIRONMENT=dev
}

# dotfile management
DOTFILES_GIT='GIT_DIR=$HOME/Projects/Private/dotfiles GIT_WORK_TREE=$HOME'
alias gitd="$DOTFILES_GIT git -c core.excludesfile=~/.gitignore-dotfiles"
alias vv='vi ~/.vimrc'
alias vb='vi ~/.bashrc'
alias vg='vi ~/.gitconfig'
alias vz='vi ~/.zshrc'
alias rz='zsh' # reload zshell
alias rb='bash' # reload bash

### listo ###
PRIVATE="~/Projects/Private"
alias listo="cd $PRIVATE/listo"

### divers ###
alias pr="cd ~/Projects/Private"
alias dw="cd ~/Downloads/"
alias vi=$EDITOR
alias vim=$EDITOR
alias downbr0='ip link set br0 down'
alias delbr0='brctl delbr br0'
alias on='ping -c 8.8.8.8 -W 5 && ping -c 1 google.com -W 5'
alias ssh='TERM=xterm-256color ssh'
# alias ls='ls --color=auto'
alias ll='ls -lh' # human readable
alias l='ls -lh' # human readable
alias la='ls -la'
alias db='x nemo /home/tiphanie/Dropbox'
alias spotify='x spotify'
alias w='networkmanager_dmenu'
alias cfg='cd ~/.config/'
alias ..="cd .."
alias android='android-studio'
alias chromium='x chromium --disable-web-security'
alias n='x nemo'
alias disk="lsblk -f"
alias diskl="sudo fdisk -l" # Displays all partitions
alias p="pavucontrol" # sound setting
alias tpowersave="iw wlp1s0 get power_save"
alias setpowersave="sudo iw wlp1s0 set power_save"
# alias s="x chromium --app-id=bikioccmkafdpakkkcpdbppfkghcmihk"
alias hc="herbstclient"
alias monitor="hc detect_monitors; hc reload"
alias fr="setxkbmap fr"
alias neo="setxkbmap de neo"

# fzf over all files in git repo
v() {
    (
        cd-git-root > /dev/null
        file="$(fzf --query="$(echo $@ | tr ' ' '\ ' )")"
        [[ -n $file ]] && $EDITOR "$file"
    );
}

cd-git-root () {
	dir=$(git rev-parse --show-toplevel 2> /dev/null) 
	if [[ $? != 0 ]]
	then
		printf 'Not a git repository\n'
		return 1
	fi
	builtin cd "$dir"
}

alias grep="grep --color=auto" # always highlight the search element

### Birthday project ###
alias cda="cd ~/tentaine/anniversaire"
alias anniv="cd ~/tentaine/anniversaire; sbt dev"
alias mmv='noglob zmv -W'

### Database ###
# First start docker (systemctl start docker)
# Then start the server for the DB (docker run -p 5432:5432 postgres:11.1)
# Then either start the GUI (pgadmin4) or connect via command line (psql -U postgres -p 5432 -h localhost)

### psql ###
# \d to show the tables
# then nromal sql command can be used for example: select * from guests;

### How to make a backup from hd1 to hd2 ###
# the option --delete will delete in the destination folder all the files/folders that are not present in the source folder
# lsblk #to know where hd1 and hd2 are
# pmount sdb1 #mount sdb1 to /run/..../media/sdb1
# pmount sdbc1 #mount sdc1 to /media/sdc1
# rsync -ahP --delete /media/sdb1/ /media/sdc1/backup ; po #copy the content of hd1 to hd2 and then switch off the computer
# rsync -ahP --delete --backup --backup-dir=../backupdir /media/sdb1/ /media/sdc1/backup ; po #copy the content of hd1 to hd2 and then switch off the computer
# du -sh /media/sdc1 #show the size of sdc1


### yaourt / pacman ###
alias y='yaourt'
alias yu='yaourt -Syua --devel --noconfirm' 
alias yub='yaourt -Syu --noconfirm' 
alias yuc='yaourt -Syua --devel' 
alias yr='yaourt -Rs' # desinstall a package
alias ys='yaourt -S' # install
alias yss='yaourt -S --noconfirm' # install
alias yu='yaourt -Syy' # update
alias yi='yaourt -Qi' # package info
alias yb='yaourt -Sb' # build package
alias yo='yaourt -Qo' # package for command
alias yl='yaourt -Ql' # list files for package
alias ye='yaourt -Qe --date' # list installed packages

### CookForCouch Project ###
alias cfc="cd /home/tiphanie/CookForCouch"
alias translationde="sudo chmod -R 777 /home/tiphanie/CookForCouch/app/cache/ && cfc && app/console translation:update --force --output-format=yml de CCFrontendBundle && app/console translation:update --force --output-format=yml de app"
alias translationfr="sudo chmod -R 777 /home/tiphanie/CookForCouch/app/cache/ && cfc && app/console translation:update --force --output-format=yml fr CCFrontendBundle && app/console translation:update --force --output-format=yml fr app"
alias translationen="sudo chmod -R 777 /home/tiphanie/CookForCouch/app/cache/ && cfc && app/console translation:update --force --output-format=yml en CCFrontendBundle && app/console translation:update --force --output-format=yml en app"
alias cc="sudo rm -rf /home/tiphanie/CookForCouch/app/cache/*"
alias assets="cfc && app/console assets:install"

### Online CookForCouch ###
alias sshtip="ssh tiph@cookforcouch.com"
#cd /var/www/CookForCouch
# sudo su
# git pull
# app/console assets:install
# app/console doctrine:schema:update —force
# app/console cache:clear --env=prod
# chmod -R 777 app/cache/
# chmod -R 777 app/logs/
# connect to online DB: mysql -u root -p
# show databases; use cookforcouch; show tables;


### systemctl ###
# to reinstall mysql: rm -rf /var/lib/mysql and rm /etc/mysql
## dropbox and syncthing als user with: systemctl --user start
alias start="systemctl start" #use: start mysqld
alias restart="systemctl restart" #use: restart httpd (stands for apache) 
alias stop="systemctl stop" 
alias status="systemctl status"
# as user
alias startu="systemctl --user start"
alias restartu="systemctl --user restart" 
alias stopu="systemctl --user stop" 
alias statusu="systemctl --user status"

# Raspbery pi
alias sshpi="ssh -p 33500 pi@tiph.ddns.net" #mangoPi23

# PHP
alias phpu="phpunit -c phpunit.xml" #start all php unit tests

# fzf fuzzy file finder
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS="-x -m --ansi --exit-0 --select-1" # extended match and multiple selections

#SBT configuration
export SBT_OPTS="-Xmx8G"

#
#='[\u@\h \W]\$ ' #u for user (tiphanie) and h for host (mango)
# export PS1="[\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]]$ "

# Pacman
alias pacmanrm="sudo rm /var/lib/pacman/db.lck" #if the error 'pacman is alreadw in use" occurs

# Ssh port forwarding
sshforward() {
    # usage: sshforward host remoteport [localport]
    REMOTEHOST=$1
    REMOTELOCALPORT=$2
    LOCALPORT=${3:-$2}
    ssh -NL ${LOCALPORT}:localhost:${REMOTELOCALPORT} ${REMOTEHOST}
}

# Jump to recently used directories
# [[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh


# bash function
# Example 'x nemo' will start the file manager and close the terminal from where the command was entered
x(){
	($@)&
	exit
};

# Git branch in prompt.

parse_git_branch() {

	    \git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

};


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
