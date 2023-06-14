# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="suvash"
# ZSH_THEME="dpoggi"
# ZSH_THEME="macovsky-ruby"
# ZSH_THEME="junkfood"
# ZSH_THEME="norm"
ZSH_THEME="lukerandall"
# ZSH_THEME="amuse"
# ZSH_THEME="arrow"
# ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions history-substring-search vi-mode)

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
. $HOME/.asdf/asdf.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump//etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
export PATH="$PATH:$HOME/Library/Python/2.7/bin"
export PATH="$PATH:$GOROOT/bin" # Add $GOPATH/bin to PATH for scripting
export GOPATH="$HOME/go"
export PATH=$PATH:/$GOPATH/bin

# git
alias git-pl='git pull origin'
alias git-ps='git push origin'
alias git-s='git status'
alias git-cp='git cherry-pick'
alias git-c='git checkout'
alias git-cm='git checkout master'
alias git-nb='git checkout -b'
alias git-rb='git rebase'
alias git-rbm='git rebase master'
alias git-rs='git reset --soft'
alias git-rh='git reset --hard'
alias git-b='git branch'
alias git-ba='git branch -a'
alias git-m='git merge'
alias git-fa='git fetch -a'
alias git-ca='git commit --amend'
alias git-l='git log'
alias git-ud='git checkout develop && git pull origin develop;'
alias git-so='git remote show origin'

# capistrano
alias cap-bd='cap backup deploy'
alias cap-sd='cap staging deploy'
alias cap-dd='cap develop deploy'
alias cap-pd='cap production deploy'

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

# system commands
alias grep-a='grep -A 10'
alias grep-b='grep -B 10'
alias find-file='find . -type f -iname '
alias jd='java -jar ~/Downloads/JDownloader/JDownloader.jar'
# Use powerline
# if [[ -r /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
  # source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
# fi

# load ssh aliases
emulate sh
if [[ -a "$HOME/.zsh_ssh_aliases" ]]; then
  source "$HOME/.zsh_ssh_aliases"
fi
if [[ -a "$HOME/.profile" ]]; then
  source "$HOME/.profile"
fi
emulate zsh


# alias mysql=/usr/local/mysql/bin/mysql
# alias mysqladmin=/usr/local/mysql/bin/mysqladmin
# alias vim=/usr/local/bin/nvim
export PATH="/usr/local/opt/libxml2/bin:$PATH"

source ~/.bin/tmuxinator.zsh

LFCD="$GOPATH/src/github.com/gokcehan/lf/etc/lfcd.sh"  # source
LFCD="~/.config/lf/lfcd.sh"                            # pre-built binary
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# Flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH="$PATH:${HOME}/Development/flutter/bin"

# Android
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# depot_tools
export PATH=$PATH:~/build/depot_tools

# Cached builds for electron app
export GIT_CACHE_PATH="${HOME}/.git_cache"

export SCCACHE_BUCKET="electronjs-sccache"
export SCCACHE_TWO_TIER=true

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias rm='trash-put'

eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andrew/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/andrew/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andrew/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/andrew/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

alias vim='nvim'
export PATH="/usr/local/opt/llvm/bin:$PATH"
eval "$(~/.rbenv/bin/rbenv init - zsh)"
