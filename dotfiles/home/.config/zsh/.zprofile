#!/bin/zsh
if [ -f "$ZDOTDIR/.zprofile.local" ]; then
  \. "$ZDOTDIR/.zprofile.local"
fi

for file in $ZDOTDIR/.zprofile.d/*.zsh; do
  \. "$file"
done
