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

PROMPT='${adn_directory}$(adn::jobs)$(spaceship::git_branch)$(spaceship::git_status)$(adn::virtualenv_info)$(adn::aws)
${ret_status}${arrow}%{$reset_color%}'

RPROMPT='%{$(echotc UP 1)%}${vim_mode} ${time}%{$reset_color%}%{$(echotc DO 1)%}'

# Show icon if there's a working jobs in the background
adn::virtualenv_info(){
    local venv
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

# Shows current aws role and if it has expire
adn::aws() {
  [[ -n "${AWS_ROLE}" ]] || return

  local color="%{$fg_bold[white]%}"

  if [[ $(date +"%s") -ge ${AWS_SESSION_EXPIRE} ]]
  then
    color="%{$fg_bold[red]%}"
  fi
  echo "${color}☁️  ${AWS_ROLE} "
}

#
# Git status
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_STATUS_SHOW="true"
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_STATUS_COLOR="%{$fg_bold[red]%}"
SPACESHIP_GIT_STATUS_UNTRACKED="%{$fg_bold[cyan]%}?"
SPACESHIP_GIT_STATUS_ADDED="%{$fg_bold[green]%}+"
SPACESHIP_GIT_STATUS_MODIFIED="%{$fg_bold[blue]%}!"
SPACESHIP_GIT_STATUS_RENAMED="%{$fg_bold[yellow]%}»"
SPACESHIP_GIT_STATUS_DELETED="%{$fg_bold[red]%}-"
SPACESHIP_GIT_STATUS_STASHED="%{$fg_bold[cyan]%}$"
SPACESHIP_GIT_STATUS_UNMERGED="%{$fg_bold[magenta]%}="
SPACESHIP_GIT_STATUS_AHEAD="%{$fg_bold[magenta]%}⇡"
SPACESHIP_GIT_STATUS_BEHIND="%{$fg_bold[magenta]%}⇣"
SPACESHIP_GIT_STATUS_DIVERGED="%{$fg_bold[red]%}⇕"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# We used to depend on OMZ git library,
# But it doesn't handle many of the status indicator combinations.
# Also, It's hard to maintain external dependency.
# See PR #147 at https://git.io/vQkkB
# See git help status to know more about status formats
spaceship::git_status() {
  [[ $SPACESHIP_GIT_STATUS_SHOW == false ]] && return

  command git rev-parse --is-inside-work-tree &>/dev/null || return

  local INDEX git_status=""

  INDEX=$(command git status --porcelain -b 2> /dev/null)

  # Check for untracked files
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNTRACKED$git_status"
  fi

  # Check for staged files
  if $(echo "$INDEX" | command grep '^A[ MDAU] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^UA' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  fi

  # Check for modified files
  if $(echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_MODIFIED$git_status"
  fi

  # Check for renamed files
  if $(echo "$INDEX" | command grep '^R[ MD] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_RENAMED$git_status"
  fi

  # Check for deleted files
  if $(echo "$INDEX" | command grep '^[MARCDU ]D ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_DELETED$git_status"
  elif $(echo "$INDEX" | command grep '^D[ UM] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_DELETED$git_status"
  fi

  # Check for stashes
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    git_status="$SPACESHIP_GIT_STATUS_STASHED$git_status"
  fi

  # Check for unmerged files
  if $(echo "$INDEX" | command grep '^U[UDA] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^AA ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^DD ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^[DA]U ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNMERGED$git_status"
  fi

  # Check whether branch is ahead
  local is_ahead=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    is_ahead=true
  fi

  # Check whether branch is behind
  local is_behind=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*behind' &> /dev/null); then
    is_behind=true
  fi

  # Check wheather branch has diverged
  if [[ "$is_ahead" == true && "$is_behind" == true ]]; then
    git_status="$SPACESHIP_GIT_STATUS_DIVERGED$git_status"
  else
    [[ "$is_ahead" == true ]] && git_status="$SPACESHIP_GIT_STATUS_AHEAD$git_status"
    [[ "$is_behind" == true ]] && git_status="$SPACESHIP_GIT_STATUS_BEHIND$git_status"
  fi

  if [[ -n $git_status ]]; then
    # Status prefixes are colorized
    echo "$SPACESHIP_GIT_STATUS_COLOR$SPACESHIP_GIT_STATUS_PREFIX$git_status$SPACESHIP_GIT_STATUS_SUFFIX "
  fi
}

SPACESHIP_GIT_BRANCH_SHOW="true"
SPACESHIP_GIT_BRANCH_PREFIX="%{$fg_bold[white]%}\ue0a0"
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_BRANCH_COLOR="%{$fg_bold[magenta]%}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship::git_branch() {
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return

  local git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return

  git_current_branch="${git_current_branch#heads/}"
  git_current_branch="${git_current_branch/.../}"

  echo "$SPACESHIP_GIT_BRANCH_PREFIX"\
  "$SPACESHIP_GIT_BRANCH_COLOR${git_current_branch}"\
  "$SPACESHIP_GIT_BRANCH_SUFFIX"
}
