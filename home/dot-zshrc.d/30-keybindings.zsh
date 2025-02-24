#!/bin.zsh

# ⌥ + Left / Right (Jump by word)
bindkey "^[b" backward-word   # ⌥ + ←
bindkey "^[f" forward-word    # ⌥ + →

# ⌘ + Left / Right (Move to start/end of line)
bindkey "^A" beginning-of-line  # ⌘ + ←
bindkey "^E" end-of-line        # ⌘ + →

# Search history with arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
