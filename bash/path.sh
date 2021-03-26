#!/usr/bin/env bash

# XDG Base Directory specification https://wiki.archlinux.org/index.php/XDG_Base_Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop
export XDG_CONFIG_DIRS=/etc/xdg


# Dotfiles home directory
export DOTFILES_HOME=${HOME}/.dotfiles


# Java
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"



# Path

# Binary paths
export PATH=${HOME}/.local/bin:/usr/local/bin:/sbin:${PATH}
# Java path
export PATH=${JAVA_HOME}/bin:${PATH}



# GNU coreutils paths
export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
export PATH=/usr/local/opt/make/libexec/gnubin:${PATH}
export MANPATH=/usr/local/opt/make/libexec/gnuman:${MANPATH}
export PATH=/usr/local/opt/findutils/libexec/gnubin:${PATH}
export MANPATH=/usr/local/opt/findutils/libexec/gnuman:${MANPATH}