time="%{$fg_bold[magenta]%}%*"
user="%{$fg_bold[magenta]%}%n@%m"
ret_status="%(?:%{$fg_bold[green]%}λ:%{$fg_bold[red]%}λ) "
arrow="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜) "
vim_ins_mode="%{$fg_bold[cyan]%}[INSERT]"
vim_cmd_mode="%{$fg_bold[green]%}[NORMAL]"
vim_mode=$vim_ins_mode
adn_directory="%{$fg[cyan]%}%c "

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

PROMPT='${adn_directory}$(adn::jobs)$(adn::check_git_prompt_info)$(adn::virtualenv_info)
${ret_status}${arrow}%{$reset_color%}'

RPROMPT='%{$(echotc UP 1)%}${vim_mode} ${time}%{$reset_color%}%{$(echotc DO 1)%}'

# Git sometimes goes into a detached head state. git_prompt_info doesn't
# return anything in this case. So wrap it in another function and check
# for an empty string.
adn::check_git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -z $(git_prompt_info 2> /dev/null) ]]; then
            echo "%{$fg[blue]%}detached-head%{$reset_color%}) [$(git_prompt_status)] "
        else
            echo "$(git_prompt_info 2> /dev/null) $(git_prompt_status) "
        fi
    else
        echo ""
    fi
}

# Show icon if there's a working jobs in the background
adn::virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "%{$fg_bold[white]%}🐍 $venv "
}

# SpaceShip - Show icon if there's a working jobs in the background
adn::jobs() {
  local jobs_amount=$( (jobs) | wc -l )

  [[ $jobs_amount -gt 0 ]] || return

  echo "%{$fg_bold[red]%}& "
}

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}\ue0a0 %{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_STATUS_PREFIX="%{$fg_bold[green]%}["
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"
