time="%{$fg_bold[red]%}%*%{$reset_color%}"
user="%{$fg_bold[white]%}%n@%m"
ret_status="%(?:%{$fg_bold[green]%}λ:%{$fg_bold[red]%}λ)"
arrow="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)"
vim_ins_mode="%{$fg[cyan]%}[INSERT]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[NORMAL]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

PROMPT='
${ret_status} ${arrow} ${user} %{$fg[cyan]%}%c $(git_prompt_info) %{$reset_color%}
${ret_status} ${arrow} '

RPROMPT='%{$(echotc UP 1)%}${vim_mode} ${time}%{$(echotc DO 1)%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}\ue0a0 %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
