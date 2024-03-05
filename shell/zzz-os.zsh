#!/usr/bin/env bash

# source os specific stuff
for f in $DOTFILES_HOME/os/shell/$(get_os); do source $f; done