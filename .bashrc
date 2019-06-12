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
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export ELM_DEBUGGER=false

# Memo
# htop or atop to see CPU

# Aliases

### Hivemind ###
alias ti="cd ~/Projects/Hivemind/bspayone/cbis-tim-data/"
alias om="cd ~/Projects/Hivemind/bspayone/cbis-omnichannel/"
alias pr="cd ~/Projects/"
alias cdd="cd ~/Downloads/"

# dotfile management
DOTFILES_GIT='GIT_DIR=$HOME/Projects/dotfiles GIT_WORK_TREE=$HOME'
alias dgit="$DOTFILES_GIT git -c core.excludesfile=~/.gitignore-dotfiles"

### divers ###
alias vi=$EDITOR
alias vim=$EDITOR
alias downbr0='ip link set br0 down'
alias delbr0='brctl delbr br0'
alias on='ping -c 8.8.8.8 -W 5 && ping -c 1 google.com -W 5'
alias ssh='TERM=xterm-256color ssh'
# alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias db='x nemo /home/tiphanie/Dropbox'
alias spotify='x spotify'
alias w='networkmanager_dmenu'
alias cfg='cd ~/.config/'
alias meteo='wego'
alias ..="cd .."
alias dbcfc="mysql -h 212.47.241.162 -u root -p"
alias android='android-studio'
alias chromium='x chromium --disable-web-security'
alias n='x nemo'
alias disk="lsblk -f"
alias diskl="sudo fdisk -l" # Displays all partitions
alias p="pavucontrol" # sound setting
alias getpowersave="iw wlp1s0 get power_save"
alias setpowersave="sudo iw wlp1s0 set power_save"
alias s="x chromium --app-id=bikioccmkafdpakkkcpdbppfkghcmihk"
alias hc="herbstclient"
alias monitor="hc detect_monitors; hc reload"
alias fr="setxkbmap fr"
alias neo="setxkbmap de neo"
alias v='vi $(fzf)'
alias vv='vi ~/.vimrc'

### Birthday project ###
alias a="cd ~/tentaine/anniversaire"
alias anniv="cd ~/tentaine/anniversaire; sbt dev"
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

### git ###
alias gitb="git branch"
alias gits="git status"
alias gitsu="git status -uno" #do not show untracked files
alias gitds="git diff --staged" #in case we want to make a diff of a file already staged
alias gitd="git diff" 
alias gitl="git log"
alias gitc="git commit -m"
alias gita="git add"
alias gitmm="git merge master"
alias gitch="git checkout"
alias gitpl="git pull --rebase"
alias gitps="git push"
alias gitll="git log --oneline --all --graph --decorate" #show git log with a graph

### CookForCouch ###
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
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
export FZF_DEFAULT_OPTS="-x -m --ansi --exit-0 --select-1" # extended match and multiple selections

#
#='[\u@\h \W]\$ ' #u for user (tiphanie) and h for host (mango)
export PS1="[\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]]$ "

# Pacman
alias pacmanrm="sudo rm /var/lib/pacman/db.lck" #if the error 'pacman is alreadw in use" occurs

# Jump to recently used directories
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh


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
