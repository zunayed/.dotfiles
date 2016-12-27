#!/bin/sh

# Go Stuff
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin

# Editor
case "$(uname -s)" in

   Darwin)
    echo 'Mac OS X'
    alias vim='mvim -v'
    export VISUAL='mvim -v'
     ;;

   Linux)
    echo 'Linux capslock setup'
    # remap capslock to control
    setxkbmap -option ctrl:nocaps
    export VISUAL='vim'
     ;;

   *)
     echo 'other OS'
     ;;
esac

export EDITOR="$VISUAL"

alias gs='git status'
alias gl='git log'
alias git pull='git pull -r'
alias pyserve='python -m SimpleHTTPServer 8001'
alias frelease='git pull -r && fab code_style:parallel=True && fab run_tests && fab release'
alias pv='workon portal_2.7'
alias dc='docker-compose'


# for npm modules
export PATH="./node_modules/.bin:$PATH"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# SSH passkey
if [[ `hostname` == "zalilinux.laf.tower-research.com" && `whoami` != "root" ]]
then
        agent_cnt=`pgrep -u \`whoami\` ssh-agent|wc -l`
        if [ $agent_cnt -gt 1 ]
        then
                pkill -u `whoami` ssh-agent
                rm -rf /tmp/ssh-*
                eval $(ssh-agent)
        elif [ $agent_cnt -eq 0 ]
        then
        rm -rf /tmp/ssh-*
        eval $(ssh-agent)
        fi
export SSH_AUTH_SOCK=`ls -l /tmp/ssh-*/agent.*|awk '$3 == "zali" {print $9}'`
export SSH_AGENT_PID=`pgrep -u \`whoami\` ssh-agent`
fi

export TERM=xterm-256color

# go for ubuntu desktop
if [[ `hostname` == "zaliubuntu.laf.tower-research.com" ]]
then
	export GOROOT=/spare/local/go/
	export PATH=$PATH:$GOROOT/bin
fi

# grab bash_profile (machine specific)
source ~/.bash_profile
