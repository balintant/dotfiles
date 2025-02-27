#!/bin/zsh
BREW_UPDATE_FILE=~/.brew_last_update
BREW_REFRESH_FILE=~/.brew_last_refresh

if command -v /opt/homebrew/bin/brew >/dev/null 2>&1; then
  if [[ ! -f $BREW_REFRESH_FILE ]] || [[ $(find $BREW_REFRESH_FILE -mtime +7) ]]; then
    echo -ne "Updating Homebrew..."
    brew update --auto-update >/dev/null 2>&1 && touch $BREW_REFRESH_FILE
    echo -ne "\r                    \r"
  fi
  if [[ ! -f $BREW_UPDATE_FILE ]] || [[ $(find $BREW_UPDATE_FILE -mtime +7) ]]; then
    echo -ne "Checking for Homebrew updates..."
    OUTDATED=$(brew outdated)
    if [[ -n "$OUTDATED" ]]; then
      echo -ne "\r⛔️ Homebrew is outdated.        \n"
    else
      echo -ne "\r✅ Homebrew is up to date.      \n"
      touch $BREW_UPDATE_FILE
    fi
  fi
fi
