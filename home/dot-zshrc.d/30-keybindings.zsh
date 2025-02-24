#!/bin.zsh
bindkey -v
export KEYTIMEOUT="1"
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# ⌥ + Left / Right (Jump by word)
bindkey "^[b" backward-word   # ⌥ + ←
bindkey "^[f" forward-word    # ⌥ + →

# ⌘ + Left / Right (Move to start/end of line)
bindkey "^A" beginning-of-line  # ⌘ + ←
bindkey "^E" end-of-line        # ⌘ + →

# Search history with arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Edit command in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
