eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ -d ~/.pyenv && -z "$NO_PYENV" ]]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	export PYENV_VIRTUALENV_DISABLE_PROMPT=1
	eval "$(pyenv init --path)"
	eval "$(pyenv virtualenv-init -)"
fi
if [[ -n "$NO_PYENV" && -n "$PYENV_ROOT" ]]; then
	local pbin="$PYENV_ROOT/bin"
	export PATH="${PATH//(:|)$pbin/}"
	local pshims="$PYENV_ROOT/shims"
	export PATH="${PATH//(:|)$pshims/}"
	unset PYENV_ROOT
fi

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
