#!/bin/zsh
ZSHSTUFF_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zshstuff"
ZNAP_UPDATE_FILE="$ZSHSTUFF_DIR/.znap_last_update"

# TODO: Temporary for migration
[[ -d ~/.zshstuff ]] && mv ~/.zshstuff "$ZSHSTUFF_DIR"
[[ -f ~/.znap_last_update ]] && mv ~/.znap_last_update "$ZNAP_UPDATE_FILE"

# Download Znap, if it's not there yet.
# https://github.com/marlonrichert/zsh-snap
[[ -r "$ZSHSTUFF_DIR/znap/znap.zsh" ]] ||
  git -c maintenance.auto=false clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git "$ZSHSTUFF_DIR/znap"
source "$ZSHSTUFF_DIR/znap/znap.zsh"

# Avoid automatic git maintenance
zstyle ':znap:*:*' git-maintenance off

# Auto-Update znap plugins
if [[ ! -f $ZNAP_UPDATE_FILE ]] || [[ $(find $ZNAP_UPDATE_FILE -mtime +7) ]]; then
  znap pull && touch $ZNAP_UPDATE_FILE
fi
