#!/bin/zsh
#export MISE_ENV_CACHE=1
if command -v mise >/dev/null 2>&1; then
	eval "$(mise activate zsh --shims)"
fi
