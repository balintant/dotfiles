#!/bin/zsh

# Colors
autoload -U colors && colors

# Enable prompt substitution
setopt PROMPT_SUBST

# Git status for prompt
git_prompt_status() {
  local branch=$(git branch --show-current 2> /dev/null)
  [[ -z $branch ]] && return
  echo -ne "%F{green}${branch}%f"
  local git_status=$(git status -s 2> /dev/null)
  [[ -n $git_status ]] && echo -ne "%F{yellow}⚡%f"
  echo -ne " "
}

# Prompt setup - similar to pygmalion style
PROMPT='%F{magenta}%n%f%F{cyan}@%f%F{yellow}%m%f%F{red}:%f%F{cyan}%~%f%F{red}|%f$(git_prompt_status)%F{cyan}⇒%f  '
