#!/usr/bin/env bash


# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Make vim the default editor
export EDITOR="vim"


# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X";

# Compilation flags
export ARCHFLAGS="-arch x86_64"

#
# History
#

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Clear console on exit.:q
[ "$SHLVL" = 1 ] \
    && clear &> /dev/null

# https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)

export OS=$(get_os)
