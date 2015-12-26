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
    echo 'Linux'
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
