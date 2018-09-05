#!/bin/sh

# If not running interactively, don't do anything
# Using echo in a .bashrc will break scp, as scp expects
# to see its protocol data over the stdin/stdout channels.
case $- in
    *i*) ;;
    *) return;;
esac

GREEN='\033[1;32m'
NC='\033[0m' # No Color
INFO=$GREEN[INFO]$NC

echo -e "$INFO ----- Zunayed Ali .bashrc ----"

# get current status of git repo
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# get git autocompletion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

export PS1="\[\033[38;5;14m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] @ \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;41m\]\H\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] in \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[\e[35;0m\]\$(parse_git_branch)\[\e[0m\] [\t] \n\[$(tput bold)\]>\[$(tput sgr0)\]>> \[$(tput sgr0)\]"


case "$(uname -s)" in

    Darwin)
        echo -e "$INFO Mac OS X"
        alias vim='nvim'
        export VISUAL='nvim'
        export EDITOR='vim'
        ;;

    Linux)
        echo -e "$INFO Running capslock/ctrl swap"
        # remap capslock to control
        if hash setxkbmap 2>/dev/null; then
            setxkbmap -option ctrl:nocaps
        fi
        export VISUAL='vim'
        ;;

    *)
        echo -e '$INFO other OS'
        ;;
esac

export TERM=xterm-256color
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# ... and ignore same successive entries.
export HISTCONTROL=ignoreboth

alias l='ls -lahG'
alias gs='git status .'
alias gp='git pull -r'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit ."
alias docker='sudo docker'
alias pyserve='python -m SimpleHTTPServer 8001'
alias gopro='cd $GOPATH/src'
alias rdev='ssh dev.buzzfeed.io'
alias gsync='gdrive sync upload ~/Notes/ 131qUQsDKlniZed3bKnIENiw2xTCctJ9o'
alias cat='bat'

# set vi mode for bash
set -o vi

# mac laptop
if [[ `hostname` == "Zunayeds-MacBook-Pro.local" ]]
then
    echo -e "$INFO Running mac desktop specific commands"
    export GOROOT=/usr/local/go/
    export GOPATH=/Users/zunayedali/projects/go_projects
    export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
    echo -e "$INFO Setting GOROOT = $GOROOT"
    echo -e "$INFO Setting GOPATH = $GOPATH"
fi

echo -e "$INFO ----- End .bashrc ----"
