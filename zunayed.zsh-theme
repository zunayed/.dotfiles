local ret_status="%(?:%{$rg_bold[green]%}λ:%{$fg_bold[red]%}λ%s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[green]%}%c %{$fg_bold[green]%}$(git_prompt_info)%{$fg_bold[green]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
