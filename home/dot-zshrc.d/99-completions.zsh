#!/bin/zsh
autoload -Uz compinit
autoload -U add-zsh-hook

if [[ -z "$ZSH_COMPDUMP" ]]; then
  ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"
fi

if [[ ! -f "$ZSH_COMPDUMP.zwc" || "$ZSH_COMPDUMP" -nt "$ZSH_COMPDUMP.zwc" ]]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit -C -d "$ZSH_COMPDUMP"
fi

# include hidden files in completions
setopt globdots

znap source zsh-users/zsh-completions
