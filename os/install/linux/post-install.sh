#!/usr/bin/env bash

# Install pre-requistics 


# Install vim & plugins
sudo apt install -y vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa


# Install tmux & plugins
sudo apt install -y tmux


# Tools
sudo apt install -y htop iftop docker.io xclip
sudo pip3 install thefuck

# SDK
#sudo apt install -y openjdk-11-jdk

# IDE
sudo snap install code --classic

# Symlink vs code settings since dotfiles doesn't support nested packages for now
echo "Configuring VSCode"
VSCODE_CONFIG_HOME=$HOME/.config/Code/User
mkdir -p $VSCODE_CONFIG_HOME
ln -s $DOTFILES_HOME/vscode/settings.json $VSCODE_CONFIG_HOME/settings.json


#sudo snap install intellij-idea-community --classic

# Messengers
#sudo snap install slack --classic
#sudo snap install viber-unofficial
#sudo snap install telegram-desktop

