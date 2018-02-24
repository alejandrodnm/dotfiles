local user="%{$fg_bold[white]%}%n@%m"
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p ${user}  %{$fg[cyan]%}%c $(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}\ue0a0 %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[cyan]%} [% NORMAL]% %{$reset_color%}"
