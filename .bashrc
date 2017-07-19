#!/bin/sh

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

# nodejs version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

case "$(uname -s)" in

    Darwin)
        echo -e "$INFO Mac OS X"
        # alias vim='mvim -v'
        # export VISUAL='mvim -v'
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

alias l='ls -lah'
alias gs='git status'
alias gl='git log'
alias gp='git pull -r'
alias docker='sudo docker'

# Tower specific
alias pyserve='python -m SimpleHTTPServer 8001'
alias frelease='git pull -r && fab run_tests && fab release'
alias pv='workon portal'
alias dc='docker-compose'
alias gpro='cd $GOPATH/src'
alias kb='~/bin/kubectl'
alias prod='ssh towerportal@systemsweb1.newark'
alias sysdev='ssh sysdev@sysdev1.newark'

# mac laptop
if [[ `hostname` == "Zunayeds-MacBook-Pro.local" ]]
then
    echo -e "$INFO Running mac desktop specific commands"
    export GOROOT=/usr/local/go/
    export GOPATH=/Users/zunayedali/projects/go_projects
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
    echo -e "$INFO Setting GOROOT = $GOROOT"
    echo -e "$INFO Setting GOPATH = $GOPATH"
fi

if [[ `hostname` == "zalilinux.ny.tower-research.com" ]]
then
    # proxy to connect externally
    echo -e "$INFO Setting proxy to newark"
    export http_proxy='http://proxy.newark.tower-research.com:3128/'
    export https_proxy='http://proxy.newark.tower-research.com:3128/'
    export ftp_proxy='http://proxy.newark.tower-research.com:3128/'
    export no_proxy="tower-research.com"

    echo -e "$INFO Running ubuntu desktop specific commands"
    export GOROOT=/spare/local/go_install
    export GOPATH=/spare/local/projects/go_projects
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
    echo -e "$INFO Setting GOROOT = $GOROOT"
    echo -e "$INFO Setting GOPATH = $GOPATH"

    alias td='sudo /spare/local/projects/go_projects/src/tdocker/tdocker'
    alias tdnew='sudo /spare/local/projects/go_projects/src/tdocker/tdocker run -f -qa -n -p 8000:8000 -p 8001:8001 sysdev-pythondev'
    alias tdp='sudo /spare/local/projects/go_projects/src/tdocker/tdocker attach sysdev-pythondev'
    alias tdev='cd $GOPATH/src/tdocker'
    alias windows='xfreerdp /w:1920 /h:1080 /d:windows /u:zali /cert-ignore +clipboard /v:rdsewr.windows.tower-research.com'
fi

# container env
if [[ `hostname` == "tdocker-sysdev-pythondev-zali" ]]
then
    echo -e "$INFO Running  desktop specific commands"
    export GOROOT="/usr/local/go"
    export GOPATH="/spare/local/projects/go_projects"
    export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
    echo -e "$INFO Setting GOROOT = $GOROOT"
    echo -e "$INFO Setting GOPATH = $GOPATH"

    # virtualenvwrapper script
    WRAPPER_SCRIPT="/usr/local/bin/virtualenvwrapper.sh"
    echo -e "$INFO Sourcing $WRAPPER_SCRIPT"
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
    export WORKON_HOME=/spare/local/projects/.virtualenvs
    source $WRAPPER_SCRIPT
    # export PATH="/spare/local/projects/.pyenv/versions/2.7.12/bin/:$PATH"
    # export PATH="/apps/nttech/zali/.local/bin/:$PATH"

    # portal
    export DJANGO_SETTINGS_MODULE=towerportal.settings.development

    # for npm modules
    export PATH="./node_modules/.bin:$PATH"
fi

echo -e "$INFO ----- End .bashrc ----"
