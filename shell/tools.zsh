#!/usr/bin/env bash


function dotfiles_update() {
    cwd=$(pwd)
    cd $DOTFILES_HOME
    
    echo "Updating dotfiles"
    git pull --rebase --stat origin master
    
    echo "Syncing dotfiles"
    dotfiles --sync

    cd $cwd

    source $HOME/.zshrc
}

