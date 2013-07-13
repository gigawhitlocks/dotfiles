# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"
DEFAULT_USER="ian"

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux pip python github gitfast git-extras cabal) 

source $ZSH/oh-my-zsh.sh
export EDITOR=gvim

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/java/bin:/opt/java/db/bin:/opt/java/jre/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/ian/.gem/ruby/1.8/bin:/opt/nginx/sbin:/home/ian/.bash_it/plugins/available/todo:/home/ian/.cabal/bin

zstyle ':completion:*' menu select
source /usr/share/doc/pkgfile/command-not-found.zsh
compdef -d git

autoload -U compinit
compinit

alias relay='ssh ian@relay.theknown.net'
alias lore='ssh iwhitloc@lore.cs.purdue.edu'
alias sslab='ssh iwhitloc@sslab01.cs.purdue.edu'
alias enclavesaws='ssh -i ~/.ssh/enclaves.pem ubuntu@54.218.44.14'
alias quickhttpd='python2 -m SimpleHTTPServer 9000'
