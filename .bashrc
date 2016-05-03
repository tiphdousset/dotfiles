
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#battery
acpi
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export VISUAL="vim"

#Aliases divers
alias ls='ls --color=auto'
alias ll='ls -l'
alias db='x nemo /home/tiphanie/Dropbox'
alias spotify='x spotify'
alias wifi='sudo wifi-menu'
alias cfg='cd .config/'
alias vi=vim
alias stop='poweroff'
alias meteo='wego'
alias ..="cd .."
alias dbcfc="mysql -h 212.47.241.162 -u root -p"
alias cfc="cd /home/tiphanie/CookForCouch"
alias status='sudo systemctl status'
alias find="find -iname" #find filename
alias android='android-studio'
alias chromium='x chromium --disable-web-security'

### yaourt / pacman ###
alias yu='yaourt -Syua --devel --noconfirm' 
alias yub='yaourt -Syu --noconfirm' 
alias yuc='yaourt -Syua --devel' 
alias y='yaourt'
alias yr='yaourt -Rs' #desinstall a package
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
alias gitl="git log"
alias gitc="git commit -m"
alias gita="git add"
alias gitm="git merge"
alias gitch="git checkout"
#alias gitpl="git pull"
#alias gitps="git push"

### apache ###
alias apache-start="systemctl start httpd.service"
alias apache-stop="systemctl stop httpd.service"

### mysql ###
alias mysql-start="systemctl start mysqld.service"
alias mysql-stop="systemctl stop mysqld.service"

#PS1='[\u@\h \W]\$ ' #u for user (tiphanie) and h for host (mango)
export PS1="[\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]]$ "


#bash function
#Example 'x nemo' will start the file manager and close the terminal from where the command was entered
x(){
	($@)&
	exit
};

# Git branch in prompt.

parse_git_branch() {

	    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

    }



