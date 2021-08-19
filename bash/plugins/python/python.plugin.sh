#!/usr/bin/env bash
 
export WORKON_HOME=$HOME/.virtualenvs
mkdir -p $WORKON_HOME

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv

source $HOME/.local/bin/virtualenvwrapper.sh