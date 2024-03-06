#!/usr/bin/env bash

/opt/homebrew/bin/brew bundle --file=$DOTFILES_HOME/os/install/mac/Brewfile


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa
