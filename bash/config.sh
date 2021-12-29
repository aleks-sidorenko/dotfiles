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

# Shell prompt based on the Solarized Dark theme.
# Screenshot: http://i.imgur.com/EkEtphC.png
# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles
# iTerm → Profiles → Text → use 13pt Monaco with 1.1 vertical spacing.
# vim: set filetype=sh :
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM='gnome-256color';
elif infocmp rxvt-unicode-256color >/dev/null 2>&1; then
    export TERM='rxvt-unicode-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM='xterm-256color';
fi;


# Autorun tmux
# Make sure that (1) tmux exists on the system, (2) we're in an interactive shell, and (3) tmux doesn't try to run within itself
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux
fi

#
# History
#

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


# Docker
export DOCKER_HOST=unix:///var/run/docker.sock


# Clear console on exit.
[ "$SHLVL" == 1 ] \
    && clear &> /dev/null
