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

function get_os() {
    local OS=unknown
    if [ "$(uname)" = "Darwin" ]; then
        OS=mac
    elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
        OS=linux
    fi

    echo $OS
}






