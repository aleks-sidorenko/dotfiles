#!/usr/bin/env bash

export DOTFILES_HOME="${HOME}/.dotfiles"

# Install pre-requistics 
sudo apt update
sudo apt upgrade
sudo apt install -y curl wget git

# Install powerline fonts https://github.com/powerline/fonts

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
#sudo apt install -y fonts-powerline
#sudo fc-cache -f -v

sudo pip install dotfiles


# Download dotfiles
git clone --recursive https://github.com/aleks-sidorenko/dotfiles.git $DOTFILES_HOME

# Install oh-my-bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"



# Sync dotfiles
dotfiles --sync -C $DOTFILES_HOME/dotfilesrc


# Install vim & plugins
sudo apt install -y vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa


# Install tmux & plugins
sudo apt install -y tmux


# Tools
sudo apt install -y htop iftop docker.io
sudo pip3 install thefuck

# SDK
sudo apt install -y openjdk-11-jdk

# IDE
sudo snap install code --classic
sudo snap install intellij-idea-community --classic

# Messengers
sudo snap install slack --classic
sudo snap install viber-unofficial
sudo snap install telegram-desktop

