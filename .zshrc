# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/bin:/usr/bin/git:/usr/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/luis/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()#(status command_execution_time time)

#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# nvm 
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')

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

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-nvm zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshconfig="nvim ~/.zshrc"
#alias pbcopy="cat >/dev/clipboard"
#alias pbpaste="cat /dev/clipboard"
alias work="cd ~/Workspace/Git/Gitlab"
alias ll="ls -a1"
alias de="cd ~/Desktop"
alias sz="source ~/.zshrc"
alias pg="echo 'Pinging duckduckgo' && ping duckduckgo.com"
alias -- -="cd -"
alias rmds="find . -type f -name '*.DS_Store' -ls -delete"

# code related
alias c="tmuxifier load-session work"
alias r="tmuxifier load-session remote"

# git aliases
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gcb="git checkout -b"
alias rmn="rm -rf node_modules"

# custom functions
mg () { mkdir "$@" && cd "$@" || exit; }

gcu() {
  if [ -z "$1" ]; then
    echo "Error: Please specify the branch you want to switch to before deleting the current local branch.\n"
    echo "Usage: gcu <destination-branch>"
    echo "Protected branches: main | master | staging | development"
    return 1
  fi

  local destination_branch=$1
  local branch_to_delete
  branch_to_delete=$(git branch --show-current)

  if [ "$destination_branch" = "$branch_to_delete" ]; then
    echo "Error: Destination and current branch are the same ('$destination_branch'). Aborting."
    return 1
  fi

  case "$branch_to_delete" in
    main|master|staging|development)
      echo "Error: Cannot clean up protected branch '$branch_to_delete'."
      return 1
      ;;
  esac

  echo "Switching to '$destination_branch' to delete '$branch_to_delete'..."
  git checkout "$destination_branch" && git fetch -p && git pull && git branch -D "$branch_to_delete"
}

source /Users/luis/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#source /Users/luis/perl5/perlbrew/etc/bashrc

# fzf
source <(fzf --zsh)

export FZF_DEFAULT_OPTS='--no-height --no-reverse'

# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"

eval "$(tmuxifier init -)"
