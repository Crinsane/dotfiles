# Launch starship
eval "$(starship init zsh)"

# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles


## Update paths

# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="/usr/local/sbin:$PATH"

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

	autoload -Uz compinit
	compinit
fi

# Functions
function md() {
	mkdir -p "$@" && cd "$@"
}

## Set aliases

# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias week='date +%V'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# Laravel
alias artisan="php artisan"

# PHP
# alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"

# JS

# Git
alias nah="git reset --hard && git clean -df"
alias wip="git add . && git commit -m 'WIP [skip-ci]'"
alias conflicts="git diff --name-only --diff-filter=U"

# Servers
alias web="ssh forge@68.183.0.160"
alias gitlab='ssh matas@gitlab.matas.nl'
alias gitlab-ci='ssh matas@gitlab-ci.matas.nl'
alias gitlab2-ci='ssh matas@192.168.42.240'
alias review='ssh matas@staging.intranet.matasbv.local'
alias sentry='ssh matas@sentry.matas.nl'
alias queue='ssh matas@192.168.41.2'
alias testok='ssh matas@192.168.41.4'
alias intranet='ssh matas@192.168.41.5'
alias redis='ssh matas@192.168.42.100'
alias database='ssh matas@192.168.42.101'
alias extranet='ssh matas@10.0.2.4'
alias intranet-staging='ssh matas@192.168.42.121'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
