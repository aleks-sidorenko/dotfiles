#!/usr/bin/env bash

export DOTFILES_HOME="${HOME}/.dotfiles"
SHELL_HOME="${HOME}/.shell"
GIT_REPO=aleks-sidorenko/dotfiles
GIT_BRANCH=multios


if [ "$(uname)" = "Darwin" ]; then
    OS=macos
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    OS=linux
else
    echo "Your OS is not supported!"
fi

echo "Installing OS prerequiestics for $OS"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/$GIT_REPO/$GIT_BRANCH/os/$OS/pre-install.sh)"

chsh -s $(which zsh)

# Clone dotfiles
if [ ! -d "$DOTFILES_HOME" ]; then
    echo "Cloning dotfiles to $DOTFILES_HOME"
    git clone -b $GIT_BRANCH --recursive https://github.com/$GIT_REPO.git $DOTFILES_HOME

fi

# Install oh-my-zsh
if [ ! -d "$OZH" ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh);exit"
fi



echo "Coping OS specific shell files for $OS"
yes | cp -rf $DOTFILES_HOME/os/$OS/shell/* cp $DOTFILES_HOME/shell

sh -c "$(curl -fsSL https://raw.githubusercontent.com/$GIT_REPO/$GIT_BRANCH/os/$OS/path.sh)"


# Sync dotfiles
echo "Syncing dotfiles"
dotfiles --sync --force -C $DOTFILES_HOME/dotfilesrc


echo "Installing OS post packages for $OS"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/$GIT_REPO/$GIT_BRANCH/os/$OS/post-install.sh)"
