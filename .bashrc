
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#battery
acpi
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export VISUAL="vim"
export PAGER=/usr/bin/vimpager

#Aliases divers
alias ssh='TERM=xterm-256color ssh'
alias god="ssh godzilla"
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias db='x nemo /home/tiphanie/Dropbox'
alias spotify='x spotify'
alias w='nmcli_dmenu'
alias cfg='cd .config/'
alias vi=vim
alias stop='poweroff'
alias meteo='wego'
alias ..="cd .."
alias dbcfc="mysql -h 212.47.241.162 -u root -p"
alias status='sudo systemctl status'
alias find="find -iname" #find filename
alias android='android-studio'
alias chromium='x chromium --disable-web-security'
alias n='x nemo'
alias disk="lsblk -f"
alias diskl="sudo fdisk -l"

### yaourt / pacman ###
alias y='yaourt'
alias yu='yaourt -Syua --devel --noconfirm' 
alias yub='yaourt -Syu --noconfirm' 
alias yuc='yaourt -Syua --devel' 
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
alias gitd="gitdotfiles git diff"
alias gitsu="gitdotfiles git status -uno" #do not show untracked files
alias gitl="gitdotfiles git log"
alias gitc="gitdotfiles git commit -m"
alias gita="gitdotfiles git add"
alias gitmm="gitdotfiles git merge master"
alias gitch="gitdotfiles git checkout"
alias gitpl="gitdotfiles git pull"
alias gitps="gitdotfiles git push"
# # git stash - git apply

### CookForCouch ###
alias cfc="cd /home/tiphanie/CookForCouch"
alias translationde="cfc && app/console translation:update --force --output-format=yml de CCFrontendBundle"
alias translationfr="cfc && app/console translation:update --force --output-format=yml fr CCFrontendBundle"
alias translationen="cfc && app/console translation:update --force --output-format=yml en CCFrontendBundle"
alias cc="rm -rf /home/tiphanie/CookForCouch/app/cache/*"
alias assets="cfc && app/console assets:install"

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

	    \git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

};

#TODO:check gitc problem with ""
gitdotfiles(){
	if [ "$(pwd)" == "$HOME" ] || [ "$(pwd)" == "/home/tiphanie/.config" ]; then
		GIT_DIR=~/dotfiles GIT_WORK_TREE=~ $@
	else
		$@	
	fi
}


