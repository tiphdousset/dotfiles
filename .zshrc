# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/tiphaniedousset/.oh-my-zsh"
DISABLE_MAGIC_FUNCTIONS=true
export PATH=$HOME/.local/bin:$PATH

source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
    echo "creating zgen save..."
    zgen oh-my-zsh # oh-my-zsh default settings
    zgen load rupa/z # jump to most used directories
    zgen load dottr/dottr
    zgen load denysdovhan/spaceship-prompt spaceship
    zgen load joel-porquet/zsh-dircolors-solarized.git
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-syntax-highlighting # order is important (https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file)
    # zgen load jeffreytse/zsh-vi-mode
    zgen load kutsan/zsh-system-clipboard
    zgen load b4b4r07/zsh-vimode-visual
    zgen save
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey "^?" backward-delete-char

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# SPACESHIP_PROMPT_ORDER=(
#   user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   docker        # Docker section
#   aws           # Amazon Web Services section
#   venv          # virtualenv section
#   terraform     # Terraform workspace section
#   line_sep      # Line break
#   vi_mode       # Vi-mode indicator
# )

SPACESHIP_BATTERY_SHOW="charged"
SPACESHIP_DIR_TRUNC=0
SPACESHIP_PROMPT_ORDER=(
  # time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  # exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  # jobs          # Background jobs indicator
  # exit_code     # Exit code section
  # char          # Prompt character
  )

SPACESHIP_GIT_STATUS_STASHED=""

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-vimode-visual)

# Allow the use of the z plugin to easily navigate directories
# . /usr/local/etc/profile.d/z.sh

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.zshrc.vimode
RPROMPT='${MODE_INDICATOR}'

source ~/.bashrc

# revert search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload zmv

function aws-sync() {
    res=$(cdk-sso-sync $1 2>&1)
    if [ "$?" -eq 1 ]
    then
        aws sso login --profile $1
        cdk-sso-sync $1
    fi
}

function aws-profile() {
  local cache="$HOME/.aws-profile.cache"
  local command=$1
  case "$command" in
    list)
      if [ ! -f "$cache" ]; then aws configure list-profiles > "$cache" ; fi
      cat $cache | grep --color=always "^\|$AWS_PROFILE"
      ;;
    cache)
      aws configure list-profiles > "$cache"
      cat $cache | grep --color=always "^\|$AWS_PROFILE"
      ;;
    show-cache)
      cat $cache
      ;;
    account)
      aws sts get-caller-identity | jq -rc '.Account'
      ;;
    set)
      local profile=$2
      unset AWS_PROFILE
      unset AWS_ACCOUNT
      unset AWS_REGION
      export AWS_PROFILE=$profile
      local account=$(aws configure get account)
      if [ "$account" = "" ]
      then 
        echo "configured profile '$profile' hasn't got an account id"
        echo "consider adding it with 'aws configure set account $(aws-profile account)'"
      else
        export AWS_ACCOUNT=$account
      fi
      local region=$(aws configure get region)
      export AWS_REGION=$region
      if [ ! -f "$cache" ]; then aws configure list-profiles > "$cache" ; fi
      cat $cache | grep --color=always "^\|$AWS_PROFILE"
      # aws-sync $profile
      ;;
    env)
      env | grep AWS
      ;;
    *)
      echo "Usage: aws-profile <cmd>"
      echo "Possible <cmd>:"
      echo "  list              list configured profiles in aws cli"
      echo "  set <profile>     set the given <profile>"
      echo "  account           account from sts caller identity"
      echo "  env               list AWS current env variable values"
      echo "  cache             cache profiles from cli to disk"
      echo "  show-cache        same as list but without coloring"
      ;;
  esac
}
_aws-profile() {
  type aws-profile > /dev/null || return -1
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts='list set env help cache'
  if [[ "${prev}" == 'set' ]]
  then
    opts=$(aws-profile show-cache)
  fi
  if [[ ${cur} == * ]]
  then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _aws-profile aws-profile

eval "$(direnv hook zsh)" # load env vars depending on directory

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/tiphaniedousset/.sdkman"
[[ -s "/Users/tiphaniedousset/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/tiphaniedousset/.sdkman/bin/sdkman-init.sh"


# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
