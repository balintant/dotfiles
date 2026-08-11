#!/bin/zsh
MISE_UPDATE_FILE=~/.mise_last_update

#export MISE_DEBUG=1
#export MISE_TRACE=1

if command -v mise >/dev/null 2>&1; then
	eval "$(mise activate zsh)"
	alias mx="mise x --"
	if [[ ! -f $MISE_UPDATE_FILE ]] || [[ $(find $MISE_UPDATE_FILE -mtime +28) ]]; then
		echo -ne "Checking for Mise updates..."
		mise update >/dev/null 2>&1
		OUTDATED=$(mise outdated >/dev/null 2>&1)
		if [[ -n "$OUTDATED" ]]; then
			echo -ne "\r⛔️ Mise is outdated.        \n"
		else
			echo -ne "\r✅ Mise is up to date.      \n"
			touch $MISE_UPDATE_FILE
		fi
	fi
fi
