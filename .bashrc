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
if which lesspipe > /dev/null; then
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
if which gdircolors >/dev/null; then
    test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
elif which dircolors >/dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# colorful grep too (but I use `ack` ususally)
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /opt/local/etc/bash_completion ] && ! shopt -oq posix; then
    . /opt/local/etc/bash_completion
elif [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

. .bash_git_prompt
. .bash_git_cmd
PROMPT_COMMAND=_git_prompt_color

if [ `uname` == "Darwin" ]; then
    export PATH=/usr/local/bin:$PATH
fi

if [ `uname` == "SunOS" ]; then
    if [ -d /opt/local/share/lib/terminfo ]; then
        export TERMINFO=/opt/local/share/lib/terminfo
    fi
fi

if [ -d $HOME/slashjoin/node/bin ]; then
    export PATH=$HOME/slashjoin/node/bin:$HOME/slashjoin/node_modules/.bin:$PATH
fi

if [ `uname -n` == 'snv_121' ]; then
    alias man='GROFF_NO_SGR= TCAT="less -s" TROFF="groff -Tascii" man -t'
    export PATH=/opt/local/gcc44/bin:$PATH
fi

if [ `uname` == "SunOS" ]; then
  export PATH=$PATH:/usr/local/bin
fi
