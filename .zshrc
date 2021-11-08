# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.8
source /home/linuxbrew/.linuxbrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fuzzy search shel
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias l='ls -lahG'
alias gs='git status .'
alias gp='git pull -r'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit ."
# alias docker='sudo docker'
alias pyserve='python -m SimpleHTTPServer 8001'
# alias gopro='cd $GOPATH/src'
# alias gsync='gdrive sync upload ~/Notes/ 131qUQsDKlniZed3bKnIENiw2xTCctJ9o'
alias cat='bat'

# set vi mode for bash
set -o vi

export VISUAL='nvim'
export EDITOR='nvim'
