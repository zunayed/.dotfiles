#!/bin/sh

GREEN='\033[1;32m'
NC='\033[0m' # No Color
INFO=$GREEN[INFO]$NC

# Editor
case "$(uname -s)" in

	Darwin)
		echo -e '$INFO Mac OS X'
		alias vim='mvim -v'
		export VISUAL='mvim -v'
		;;

	Linux)
		echo -e "$INFO Linux capslock setup"
		# remap capslock to control
		setxkbmap -option ctrl:nocaps
		export VISUAL='vim'
		;;

	*)
		echo -e '$INFO other OS'
		;;
esac

export EDITOR="$VISUAL"
export TERM=xterm-256color
export HISTSIZE=
export HISTFILESIZE=

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

alias l='ls -lah'
alias gs='git status'
alias gl='git log'
alias gp='git pull -r'
alias pyserve='python -m SimpleHTTPServer 8001'
alias frelease='git pull -r && fab run_tests && fab release'
alias pv='workon portal'
alias dc='docker-compose'
# alias td='sudo /spare/local/projects/docker-dev/tdocker'
alias td='sudo /spare/local/projects/go_projects/src/docker-dev/tdocker_go'
alias docker='sudo docker'
alias k8='~/bin/kubectl'

# Virtualenvwrapper
export PATH="/.pyenv/versions/2.7.12/bin/:$PATH"
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export WORKON_HOME=/spare/local/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source ~/.local/bin/virtualenvwrapper.sh

# portal
export DJANGO_SETTINGS_MODULE=towerportal.settings.development

# for npm modules
export PATH="./node_modules/.bin:$PATH"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# go for ubuntu desktop
if [[ `hostname` == "zaliubuntu.laf.tower-research.com" ]]
then
	echo -e "$INFO Running ubuntu desktop specific commands"

	export GOROOT=/spare/local/go_install
	export GOPATH=/spare/local/projects/go_projects
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
	echo -e "$INFO Setting GOROOT = $GOROOT"
	echo -e "$INFO Setting GOPATH = $GOPATH"
fi

# get current status of git repo
function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# get git autocompletion
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

export PS1="\[\033[38;5;14m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] @ \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;41m\]\H\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] in \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[\e[35;0m\]\$(parse_git_branch)\[\e[0m\] [\t] \n\[$(tput bold)\]>\[$(tput sgr0)\]>> \[$(tput sgr0)\]"
