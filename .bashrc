# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# vi line editing mode
set -o vi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
HISTIGNORE="&:[bf]g:jobs:exit"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
if which lesspipe >/dev/null 2>&1; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

# Enable color support of ls
if [ `uname` == 'Darwin' ]; then
    export CLICOLOR=1
    if [ -x /usr/local/bin/gls ]; then
        # brew install coreutils to get gls
        alias ls='/usr/local/bin/gls --color=auto'
    fi
else
    alias ls='ls --color=auto'
fi

# read in .dircolors or just use the default
if which gdircolors >/dev/null 2>&1; then
    test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
elif which dircolors >/dev/null 2>&1; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f .sh_aliases ]; then
    . .sh_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /opt/local/etc/bash_completion ] && ! shopt -oq posix; then
    . /opt/local/etc/bash_completion
elif [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ `uname` == "Darwin" ]; then
  # homebrew bash completion
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
fi

# after homebrew so the custom prompt applies
if [ "$USER" != "vagrant" ]; then
  . .bash_git_prompt
  PROMPT_COMMAND=_git_prompt_color
fi

if [ -f .sh_git_cmd ]; then
    . .sh_git_cmd
fi

if [ `uname` == "Darwin" ]; then
    export PATH=/usr/local/sbin:/usr/local/bin:$PATH
    ulimit -n 1024
fi

if [ `uname` == "SunOS" ]; then
    if [ -d /opt/local/share/lib/terminfo ]; then
        export TERMINFO=/opt/local/share/lib/terminfo
    fi
fi

if [ `uname -n` == 'snv_121' ]; then
    alias man='GROFF_NO_SGR= TCAT="less -s" TROFF="groff -Tascii" man -t'
    export PATH=/opt/local/gcc44/bin:$PATH
fi

if [ `uname` == "SunOS" ]; then
    export PATH=$PATH:/usr/local/bin
fi

# Node Version Manager
if [ -e ~/.nvm/nvm.sh ]; then
    . ~/.nvm/nvm.sh
    nvm use default > /dev/null
fi

# Go Version Manager
if [ -e ~/.gvm/scripts/gvm ]; then
  . ~/.gvm/scripts/gvm
fi

if [ -e ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
