#!/bin/zsh
if [ -f "$ZDOTDIR/.zshrc.local" ]; then
  \. "$ZDOTDIR/.zshrc.local"
fi

for file in $ZDOTDIR/.zshrc.d/*.zsh; do
  \. "$file"
done
