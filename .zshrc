#
# STASH NOTE: prefer setting pure env vars in .zshenv
# STASH NOTE: prefer non-interactive shell things in .zprofile
# 

# Turn off shared history across terminals on this machine
unsetopt SHARE_HISTORY
setopt nosharehistory

if [ -f ~/.sh_aliases ]; then
	. ~/.sh_aliases
fi

if alias gpu >/dev/null; then
	unalias gpu
fi
. ~/.sh_git_cmd

if [ -e ~/.zshrc.local ]; then
	. ~/.zshrc.local
fi

if [[ -z "$NO_STARSHIP" ]]; then
	eval "$(starship init zsh)"
fi


bindkey -v
bindkey '^R' history-incremental-search-backward
