
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
alias git="gitdotfiles git"
alias gitb="gitdotfiles git branch"
alias gits="gitdotfiles git status"
alias gitl="gitdotfiles git log"
alias gitc="gitdotfiles git commit -m"
alias gita="gitdotfiles git add"
alias gitm="gitdotfiles git merge"
alias gitch="gitdotfiles git checkout"
#alias gitpl="gitdotfiles git pull"
#alias gitps="gitdotfiles git push"

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

};

gitdotfiles(){
	if [ "$(pwd)" == "$HOME" ] || [ "$(pwd)" == "/home/tiphanie/.config" ]; then
        	GIT_DIR=~/dotfiles GIT_WORK_TREE=~ $@
	else
		$@
	fi
}


