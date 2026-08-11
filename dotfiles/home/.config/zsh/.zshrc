#!/bin/zsh
if [ -f "$ZDOTDIR/.zshrc.local" ]; then
  \. "$ZDOTDIR/.zshrc.local"
fi

for file in $ZDOTDIR/.zshrc.d/*.zsh; do
  \. "$file"
done

# pnpm
export PNPM_HOME="/Users/balintant/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
